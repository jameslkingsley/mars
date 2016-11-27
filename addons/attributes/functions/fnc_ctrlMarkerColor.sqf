/*
 * Author: Kingsley
 * Creates a marker color combo box control
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: IDC <NUMBER>
 * 2: Group IDC <NUMBER>
 * 3: Position <ARRAY>
 *
 * Return Value:
 * Created control
 *
 * Example:
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlMarkerColor;
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

_ctrlCombo = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc, _controlGroup];
_ctrlCombo ctrlSetPosition _position;

_values = ("getNumber (_x >> 'scope') != 0" configClasses (configFile >> "CfgMarkerColors")) apply {configName _x};
_labels = ("getNumber (_x >> 'scope') != 0" configClasses (configFile >> "CfgMarkerColors")) apply {getText (_x >> "name")};
_selected = getText (_config >> "selected");
_evalSelected = (getNumber (_config >> "evalSelected")) > 0;

if (_evalSelected) then {
    _selected = call compile _selected;
};

{
    private _color = [getArray (configFile >> "CfgMarkerColors" >> _x >> "color")] call CFUNC(evalColor);
    _i = _ctrlCombo lbAdd (_labels select _forEachIndex);
    _ctrlCombo lbSetData [_i, _x];
    _ctrlCombo lbSetPicture [_i, "#(rgb,8,8,3)color(1,1,1,1)"];
    _ctrlCombo lbSetPictureColor [_i, _color];
    _ctrlCombo lbSetPictureColorSelected [_i, _color];
    if (_x == _selected) then {
        _ctrlCombo lbSetCurSel _i;
    };
} forEach _values;

// Add an extra dummy item to stop it from cutting off the last element in values
if (count _values > 10) then {
    _ctrlCombo lbAdd "";
};

_ctrlCombo setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlCombo setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlCombo setVariable [QGVAR(comboStartIndex), (lbCurSel _ctrlCombo)];
_ctrlCombo setVariable [QGVAR(execExpression), false];
_ctrlCombo setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlCombo setVariable [QGVAR(execReturnData), (_ctrlCombo lbData (lbCurSel _ctrlCombo))];

_ctrlCombo ctrlAddEventHandler ["LBSelChanged", {
    params ["_ctrl","_index"];
    _startIndex = _ctrl getVariable [QGVAR(comboStartIndex), -1];
    _ctrl setVariable [QGVAR(execExpression), (_index != _startIndex)];
    _ctrl setVariable [QGVAR(execReturnData), (_ctrl lbData (lbCurSel _ctrl))];
}];

{
    _x params ["_configEvent","_runtimeEvent"];
    if (!isNull (_config >> _configEvent)) then {
        _ctrlCombo ctrlAddEventHandler [_runtimeEvent, getText (_config >> _configEvent)];
    };
} forEach [
    ["onLBSelChanged", "LBSelChanged"]
];

_ctrlCombo ctrlCommit 0;

_ctrlCombo
