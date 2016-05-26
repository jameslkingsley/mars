/*
 * Author: Kingsley
 * Creates a combo control
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
 * ["configFile >> 'SomeConfig'", 100, [0,0,0,0]] call mars_attributes_fnc_ctrlCombo;
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

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_controlGroup = _display displayCtrl _group;

_ctrlCombo = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc, _controlGroup];
_ctrlCombo ctrlSetPosition _position;

_values = [call compile getText (_config >> "values"), getArray (_config >> "values")] select (isArray (_config >> "values"));
_labels = [call compile getText (_config >> "labels"), getArray (_config >> "labels")] select (isArray (_config >> "labels"));
_selected = call compile getText (_config >> "selected");

if (count _labels > count _values) then {
    MARS_LOGERROR_1("Labels array is bigger than the values array in %1. Ignoring extra labels.", _config);
    _labels resize (count _values);
} else {
    if (count _values > count _labels) then {
        MARS_LOGERROR_1("Values array is bigger than the labels array in %1. Ignoring extra values.", _config);
        _values resize (count _labels);
    };
};

{
    _i = _ctrlCombo lbAdd (_labels select _forEachIndex);
    _ctrlCombo lbSetData [_i, str _x];
    if (_x == _selected) then {
        _ctrlCombo lbSetCurSel _i;
    };
} forEach _values;

// Add an extra dummy item to stop it from cutting off the last element in values
_ctrlCombo lbAdd "";

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