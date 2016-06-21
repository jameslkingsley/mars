/*
 * Author: Kingsley
 * Creates a list box control
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
 * ["configFile >> 'SomeConfig'", 100, 90, [0,0,0,0]] call mars_attributes_fnc_ctrlList;
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

_multi = [false, true] select (getNumber (_config >> "multi"));
_ctrlClass = ["MARS_gui_ctrlListbox", "MARS_gui_ctrlListboxMulti"] select _multi;

_ctrlList = _display ctrlCreate [_ctrlClass, _idc, _controlGroup];

_values = [call compile getText (_config >> "values"), getArray (_config >> "values")] select (isArray (_config >> "values"));
_labels = [call compile getText (_config >> "labels"), getArray (_config >> "labels")] select (isArray (_config >> "labels"));
_selected = if (isNull (_config >> "selected")) then {-1} else {
    if (isArray (_config >> "selected")) then {
        getArray (_config >> "selected")
    } else {
        if (isText (_config >> "selected")) then {
            call compile getText (_config >> "selected")
        } else {
            getNumber (_config >> "selected")
        };
    };
};

if (count _labels > count _values) then {
    MARS_LOGERROR_1("Labels array is bigger than the values array in %1. Ignoring extra labels.", _config);
    _labels resize (count _values);
} else {
    if (count _values > count _labels) then {
        MARS_LOGERROR_1("Values array is bigger than the labels array in %1. Ignoring extra values.", _config);
        _values resize (count _labels);
    };
};

_ctrlListHeight = ((count _values) * (SIZE_M * GRID_H)) min ((SIZE_M * GRID_H) * 7);
_position set [3, _ctrlListHeight];

{
    if (_x isEqualType "") then {
        _value = _values select _forEachIndex;
        _i = _ctrlList lbAdd _x;
        _ctrlList lbSetData [_i, ([str _value, _value] select (_value isEqualType ""))];
        if (_selected isEqualType 0 && {_i == _selected}) then {
            _ctrlList lbSetCurSel _i;
        };
    } else {
        _x params [
            ["_text", "", [""]],
            ["_color", [0,0,0,0], [[]]],
            ["_picture", "", [""]],
            ["_tooltip", "", [""]]
        ];
        
        _value = _values select _forEachIndex;
        _i = _ctrlList lbAdd _text;
        _ctrlList lbSetData [_i, ([str _value, _value] select (_value isEqualType ""))];
        _ctrlList lbSetColor [_i, _color];
        _ctrlList lbSetPicture [_i, _picture];
        _ctrlList lbSetPictureColor [_i, _color];
        _ctrlList lbSetTooltip [_i, _tooltip];
        
        if (_selected isEqualType 0 && {_i == _selected}) then {
            _ctrlList lbSetCurSel _i;
        };
    };
} forEach _labels;

if (_selected isEqualType []) then {
    {_ctrlList lbSetSelected [_x, true]} forEach _selected;
};

_ctrlList ctrlSetPosition _position;

_ctrlList setVariable [QGVAR(label), (_display displayCtrl _labelIDC)];
_ctrlList setVariable [QGVAR(controlKey), [_config] call FUNC(createControlKey)];
_ctrlList setVariable [QGVAR(lbStartSelected), ([lbCurSel _ctrlList, lbSelection _ctrlList] select _multi)];
_ctrlList setVariable [QGVAR(execExpression), false];
_ctrlList setVariable [QGVAR(execExpressionStr), getText (_config >> "expression")];
_ctrlList setVariable [QGVAR(execReturnData), ([lbCurSel _ctrlList, lbSelection _ctrlList] select _multi)];

_ctrlList ctrlAddEventHandler ["KillFocus", {
    params ["_ctrl","_index"];
    _startSelection = _ctrl getVariable [QGVAR(lbStartSelected), -1];
    
    if (_startSelection isEqualType []) then {
        _curSelection = lbSelection _ctrl;
        _data = _curSelection apply {_ctrl lbData _x};
        _ctrl setVariable [QGVAR(execExpression), !(_curSelection isEqualTo _startSelection)];
        _ctrl setVariable [QGVAR(execReturnData), _data];
    } else {
        _curSelection = lbCurSel _ctrl;
        _data = _ctrl lbData _curSelection;
        _ctrl setVariable [QGVAR(execExpression), (_curSelection != _startSelection)];
        _ctrl setVariable [QGVAR(execReturnData), _data];
    };
}];

{
    _x params ["_configEvent","_runtimeEvent"];
    if (!isNull (_config >> _configEvent)) then {
        _ctrlList ctrlAddEventHandler [_runtimeEvent, getText (_config >> _configEvent)];
    };
} forEach [
    ["onLBSelChanged", "LBSelChanged"]
];

_ctrlList ctrlCommit 0;

_ctrlList