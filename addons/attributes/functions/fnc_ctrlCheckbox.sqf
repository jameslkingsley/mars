/*
 * Author: Kingsley
 * Creates a checkbox control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlCheckbox;
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

_ctrlCheckLabel = _display ctrlCreate ["MARS_gui_ctrlButtonCheckboxLabel", _idc, _controlGroup];
_ctrlCheck = _display ctrlCreate ["MARS_gui_ctrlCheckbox", (_idc + 1), _controlGroup];

_ctrlCheck ctrlSetPosition [
    (_position select 0),
    (_position select 1),
    (SIZE_L * GRID_W),
    (SIZE_L * GRID_H)
];

if (isNil QEGVAR(editor,selection)) then {
    EGVAR(editor,selection) = [];
};

_text = [(EGVAR(editor,selection) call compile getText (_config >> "textCode")), getText (_config >> "textPlain")] select (isNull (_config >> "textCode"));
_ctrlCheckLabel ctrlSetText _text;

_defaultChecked = [
    ([getNumber (_config >> "checked"), call compile getText (_config >> "checked")] select (isText (_config >> "checked"))),
    0
] select (isNull (_config >> "checked"));
_ctrlCheck cbSetChecked INT2BOOL(_defaultChecked);

_ctrlCheckLabel ctrlSetPosition [
    ((_position select 0) + (SIZE_L * GRID_W)),
    (_position select 1),
    ((_position select 2) - (SIZE_L * GRID_W)),
    (_position select 3)
];

_ctrlCheck ctrlAddEventHandler ["CheckedChanged", {
    params ["_ctrl", "_state"];
    _startState = _ctrl getVariable [QGVAR(checkStartState), 0];
    _ctrl setVariable [QGVAR(execExpression), (_startState != _state)];
    _ctrl setVariable [QGVAR(execReturnData), INT2BOOL(_state)];
}];

_ctrlCheckLabel setVariable [QGVAR(display), _display];
_ctrlCheckLabel setVariable [QGVAR(checkbox), _ctrlCheck];

_ctrlCheckLabel ctrlAddEventHandler ["MouseButtonUp", {
    params ["_control"];

    private _display = _control getVariable [QGVAR(display), displayNull];
    private _checkbox = _control getVariable [QGVAR(checkbox), controlNull];
    private _newState = !(cbChecked _checkbox);

    _checkbox cbSetChecked _newState;
    
    _startState = _checkbox getVariable [QGVAR(checkStartState), 0];
    _checkbox setVariable [QGVAR(execExpression), (_startState != BOOL2INT(_newState))];
    _checkbox setVariable [QGVAR(execReturnData), _newState];
}];

_ctrlCheck setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlCheck setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlCheck setVariable [QGVAR(siblings), [_ctrlCheckLabel]];
_ctrlCheck setVariable [QGVAR(checkStartState), BOOL2INT(cbChecked _ctrlCheck)];
_ctrlCheck setVariable [QGVAR(execExpression), false];
_ctrlCheck setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlCheck setVariable [QGVAR(execReturnData), cbChecked _ctrlCheck];

_ctrlCheckLabel ctrlCommit 0;
_ctrlCheck ctrlCommit 0;

_ctrlCheck