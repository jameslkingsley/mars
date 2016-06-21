/*
 * Author: Kingsley
 * Creates a vector control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlVector;
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

_ctrlVectorX = _display ctrlCreate ["MARS_gui_ctrlEdit", _idc, _controlGroup];
_ctrlVectorY = _display ctrlCreate ["MARS_gui_ctrlEdit", (_idc + 1), _controlGroup];
_ctrlVectorZ = _display ctrlCreate ["MARS_gui_ctrlEdit", (_idc + 2), _controlGroup];
_vectorControls = [_ctrlVectorX, _ctrlVectorY, _ctrlVectorZ];

_siblings = [];
_width = (_position select 2) / 3;
_labelX = (_position select 0);
_value = if (isArray (_config >> "value")) then {getArray (_config >> "value")} else {call compile getText (_config >> "value")};
_value = _value apply {if (_x isEqualType "") then {parseNumber _x} else {_x}};

{
    private _vectorCtrl = _x;
    private _labelClassname = format ["MARS_gui_ctrlButtonVector%1", (["X", "Y", "Z"] select _forEachIndex)];
    private _label = _display ctrlCreate [_labelClassname, -1, _controlGroup];
    _label ctrlSetText (["X", "Y", "Z"] select _forEachIndex);
    _siblings pushBack _label;

    _label ctrlSetPosition [
        _labelX,
        (_position select 1),
        (_position select 3),
        (_position select 3)
    ];

    _vectorCtrl ctrlSetPosition [
        ((_position select 0) + (_width * _forEachIndex) + (_position select 3)),
        (_position select 1),
        (_width - (_position select 3)),
        (_position select 3)
    ];

    _thisValue = _value select _forEachIndex;
    _vectorCtrl ctrlSetText str _thisValue;

    _vectorCtrl setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
    _vectorCtrl setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
    _vectorCtrl setVariable [QGVAR(vectorStartValue), _thisValue];
    _vectorCtrl setVariable [QGVAR(execExpression), false];
    _vectorCtrl setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
    _vectorCtrl setVariable [QGVAR(execReturnData), _thisValue];

    _vectorCtrl ctrlAddEventHandler ["KillFocus", {
        params ["_ctrl"];
        _startValue = _ctrl getVariable [QGVAR(vectorStartValue), 0];
        _nowValue = parseNumber (ctrlText _ctrl);
        _ctrl setVariable [QGVAR(execExpression), !(_startValue isEqualTo _nowValue)];
        _ctrl setVariable [QGVAR(execReturnData), _nowValue];
    }];

    {
        _x params ["_configEvent","_runtimeEvent"];
        if (!isNull (_config >> _configEvent)) then {
            _x ctrlAddEventHandler [_runtimeEvent, getText (_config >> _configEvent)];
        };
    } forEach [
        ["onSetFocus", "SetFocus"],
        ["onKillFocus", "KillFocus"],
        ["onKeyDown", "KeyDown"],
        ["onKeyUp", "KeyUp"]
    ];

    _labelX = _labelX + _width;
} forEach _vectorControls;

{_x ctrlCommit 0} forEach (_vectorControls + _siblings);

_vectorControls