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
#include "\z\mars\addons\common\macros.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_group", -1, [0]],
    ["_position", [0,0,0,0], [[]]]
];

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;

_ctrlMap = _display ctrlCreate ["MARS_gui_ctrlMap", _idc, _controlGroup];
_ctrlMapTemp = _display ctrlCreate ["MARS_gui_ctrlStaticBackground", _idc, _controlGroup];

_position set [3, (_position select 2)];
_ctrlMap ctrlSetPosition _position;
_ctrlMapTemp ctrlSetPosition _position;
_ctrlMapTemp ctrlSetBackgroundColor [1,0.5,0.25,1];

_startPosition = [call compile getText (_config >> "position"), getArray (_config >> "position")] select (isArray (_config >> "position"));

_ctrlMap ctrlMapAnimAdd [0, 0.1, _startPosition];
ctrlMapAnimCommit _ctrlMap;

_ctrlMap setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlMap setVariable [QGVAR(execReturnData), ""];

_ctrlMap ctrlCommit 0;
_ctrlMapTemp ctrlCommit 0;

mapAnimCommit;

systemChat format ["mapAnimDone: %1", mapAnimDone];

_ctrlMap