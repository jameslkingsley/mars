/*
 * Author: Kingsley
 * Creates a label control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlLabel;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_group", -1, [0]],
    ["_position", [0,0,0,0], [[]]]
];

TRACE_1("ctrlLabel", _this);

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;

_ctrlLabel = _display ctrlCreate ["MARS_gui_ctrlStructuredText", _idc, _controlGroup];

_ctrlLabel ctrlSetPosition _position;

if (isNil QEGVAR(editor,selection)) then {
    EGVAR(editor,selection) = [];
};

_text = [(EGVAR(editor,selection) call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));

_ctrlLabel setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlLabel setVariable [QGVAR(execReturnData), _text];

_ctrlLabel ctrlSetText _text;
_ctrlLabel ctrlCommit 0;

_ctrlLabel