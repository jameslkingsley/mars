/*
 * Author: Kingsley
 * Creates a button control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlButton;
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

_ctrlButton = _display ctrlCreate ["MARS_gui_ctrlButton", _idc, _controlGroup];
_ctrlButton ctrlSetPosition _position;

if (isNil QEGVAR(editor,selection)) then {
    EGVAR(editor,selection) = [];
};

_text = [(EGVAR(editor,selection) call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));
_action = getText (_config >> "action");

_ctrlButton setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlButton setVariable [QGVAR(execReturnData), _action];

_ctrlButton ctrlSetText _text;
_ctrlButton buttonSetAction _action;

_ctrlButton ctrlCommit 0;

_ctrlButton