/*
 * Author: Kingsley
 * Creates a combo control
 *
 * Arguments:
 * 0: Control config <STRING>
 * 1: Width <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_config", "", [""]],
    ["_idc", -1, [0]],
    ["_position", [0,0,0,0], [[]]]
];

_config = call compile _config;
_display = GETUVAR(GVAR(interface),displayNull);

_categoryGroup = _display displayCtrl IDC_EDITATTRIBUTES_CATEGORIES;
_controlGroup = _display displayCtrl IDC_EDITATTRIBUTES_CATEGORIES_ITEMS;

_ctrlCombo = _display ctrlCreate ["MARS_gui_ctrlCombo", _idc, _controlGroup];
_ctrlCombo ctrlSetPosition _position;

_values = if (isArray (_config >> "values")) then {getArray (_config >> "values")} else {call compile getText (_config >> "values")};
_labels = if (isArray (_config >> "labels")) then {getArray (_config >> "labels")} else {call compile getText (_config >> "labels")};
_selected = if (isText (_config >> "selected")) then {call compile getText (_config >> "selected")} else {getNumber (_config >> "selected")};

{
    _i = _ctrlCombo lbAdd (_labels select _forEachIndex);
    _ctrlCombo lbSetData [_i, str _x];
    if (_x == _selected) then {
        _ctrlCombo lbSetCurSel _i;
    };
} forEach _values;

// Add an extra dummy item to stop it from cutting off the last element in values
_ctrlCombo lbAdd "";

_ctrlCombo ctrlCommit 0;
