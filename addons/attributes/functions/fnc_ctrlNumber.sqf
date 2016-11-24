/*
 * Author: Kingsley
 * Creates a number control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlNumber;
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
private _display = GETUVAR(GVAR(interface),displayNull);
private _controlGroup = _display displayCtrl _group;
private _ctrlEdit = _display ctrlCreate ["MARS_gui_ctrlEdit", _idc, _controlGroup];

_ctrlEdit ctrlSetPosition _position;

if (isNil QEGVAR(editor,selection)) then {
    EGVAR(editor,selection) = [];
};

private _text = if (isNumber (_config >> "value")) then {getNumber (_config >> "value")} else {EGVAR(editor,selection) call compile getText (_config >> "value")};

_ctrlEdit ctrlSetText str _text;

_ctrlEdit setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlEdit setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlEdit setVariable [QGVAR(editStartText), ctrlText _ctrlEdit];
_ctrlEdit setVariable [QGVAR(execExpression), false];
_ctrlEdit setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlEdit setVariable [QGVAR(execReturnData), parseNumber (ctrlText _ctrlEdit)];

_ctrlEdit ctrlAddEventHandler ["KillFocus", {
    params ["_ctrl"];
    _startText = _ctrl getVariable [QGVAR(editStartText), ""];
    _nowText = ctrlText _ctrl;
    _ctrl setVariable [QGVAR(execExpression), (_startText != _nowText)];
    _ctrl setVariable [QGVAR(execReturnData), parseNumber _nowText];
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
