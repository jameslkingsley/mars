/*
 * Author: Kingsley
 * Creates an edit control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlEdit;
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

_altPos = [getNumber (_config >> "rows"), 1] select (isNull (_config >> "rows"));
_ctrlClassname = ["MARS_gui_ctrlEdit", "MARS_gui_ctrlEditMulti"] select (_altPos > 1);
_ctrlEdit = _display ctrlCreate [_ctrlClassname, _idc, _controlGroup];

if (_altPos < 1) then {
    MARS_LOGERROR_1("Rows cannot be less than 1 in %1. Resetting to 1.", _config);
    _altPos = 1;
};

_position set [3, (_altPos * (SIZE_M * GRID_H))];
_ctrlEdit ctrlSetPosition _position;

_text = [(EGVAR(editor,selection) call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));

_ctrlEdit ctrlSetText _text;

_ctrlEdit setVariable [QGVAR(editStartText), (ctrlText _ctrlEdit)];
_ctrlEdit setVariable [QGVAR(execExpression), false];
_ctrlEdit setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlEdit setVariable [QGVAR(execReturnData), ctrlText _ctrlEdit];

_ctrlEdit ctrlAddEventHandler ["KillFocus", {
    params ["_ctrl"];
    _startText = _ctrl getVariable [QGVAR(editStartText), ""];
    _nowText = ctrlText _ctrl;
    _ctrl setVariable [QGVAR(execExpression), (_startText != _nowText)];
    _ctrl setVariable [QGVAR(execReturnData), _nowText];
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