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
#include "\z\mars\addons\common\macros.hpp"

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
_ctrlLabel = _display ctrlCreate ["MARS_gui_ctrlStructuredText", _idc, _controlGroup];

private _height = [getNumber (_config >> "height"), 1] select (isNull (_config >> "height"));
_position set [3, (_height * (SIZE_M * GRID_H))];

_ctrlLabel ctrlSetPosition _position;

if (isNil QEGVAR(editor,selection)) then {
    EGVAR(editor,selection) = [];
};

_text = [(EGVAR(editor,selection) call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));

_ctrlLabel setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlLabel setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlLabel setVariable [QGVAR(execReturnData), _text];

_ctrlLabel ctrlSetStructuredText parseText _text;
_ctrlLabel ctrlCommit 0;

_ctrlLabel
