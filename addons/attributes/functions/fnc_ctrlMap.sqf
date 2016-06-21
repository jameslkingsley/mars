/*
 * Author: Kingsley
 * Creates a map control
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: IDC <NUMBER>
 * 2: Group IDC <NUMBER>
 * 3: Position <ARRAY>
 *
 * Return Value:
 * Created control <CONTROL>
 *
 * Example:
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlMap;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_group", -1, [0]],
    ["_position", [0,0,0,0], [[]]],
    ["_labelIDC", -1, [0]]
];

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;

_ctrlButton = _display ctrlCreate ["MARS_gui_ctrlButton", _idc, _controlGroup];
_ctrlButton ctrlSetPosition _position;

_startPosition = [call compile getText (_config >> "position"), getArray (_config >> "position")] select (isArray (_config >> "position"));

if (_startPosition isEqualType objNull) then {
    _startPosition = getPosATL _startPosition;
};

if (count _startPosition != 3) then {
    _startPosition pushBack 0;
};

_ctrlButton setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlButton setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlButton setVariable [QGVAR(execReturnData), _startPosition];

_ctrlButton ctrlSetText "Choose Position";

_ctrlButton ctrlAddEventHandler ["MouseButtonClick", {
    _this spawn {
        disableSerialization;
        params ["_control"];
        uiNamespace setVariable [QGVAR(activeMapControlReceiver), _control];
        createDialog QGVAR(ctrlMapWindow);
    };
}];

_ctrlButton ctrlCommit 0;

_ctrlButton