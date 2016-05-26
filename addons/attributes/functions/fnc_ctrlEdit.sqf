/*
 * Author: Kingsley
 * Creates an edit control
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: IDC <NUMBER>
 * 2: Position <ARRAY>
 *
 * Return Value:
 * Created control <CONTROL>
 *
 * Example:
 * ["configFile >> 'SomeConfig'", 100, [0,0,0,0]] call mars_attributes_fnc_ctrlEdit;
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

// _categoryGroup = _display displayCtrl IDC_EDITATTRIBUTES_CATEGORIES;
_controlGroup = _display displayCtrl _group;

_ctrlEdit = _display ctrlCreate ["MARS_gui_ctrlEdit", _idc, _controlGroup];
_ctrlEdit ctrlSetPosition _position;

_text = [str (call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));

_ctrlEdit ctrlSetText _text;

_ctrlEdit setVariable [QGVAR(editStartText), (ctrlText _ctrlEdit)];
_ctrlEdit setVariable [QGVAR(execExpression), false];
_ctrlEdit setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];

_ctrlEdit ctrlAddEventHandler ["KillFocus", {
    params ["_ctrl"];
    _startText = _ctrl getVariable [QGVAR(editStartText), ""];
    _nowText = ctrlText _ctrl;
    _ctrl setVariable [QGVAR(execExpression), (_startText != _nowText)];
}];

{
    _x params ["_configEvent","_runtimeEvent"];
    if (!isNull (_config >> _configEvent)) then {
        _ctrlEdit ctrlAddEventHandler [_runtimeEvent, getText (_config >> _configEvent)];
    };
} forEach [
    ["onSetFocus", "SetFocus"],
    ["onKillFocus", "KillFocus"],
    ["onKeyDown", "KeyDown"],
    ["onKeyUp", "KeyUp"]
];

_ctrlEdit ctrlCommit 0;

_ctrlEdit