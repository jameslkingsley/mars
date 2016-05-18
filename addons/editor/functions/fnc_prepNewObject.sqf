/*
 * Author: Kingsley
 * Prepares a new object from the asset browser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_prepNewObject;
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;

_display = GETUVAR(GVAR(interface),displayNull);
_activeTree = _display displayCtrl GVAR(abActiveTree);
_selObject = tvCurSel _activeTree;

if (count _selObject == 0) exitWith {};

(compile (_activeTree tvData _selObject)) params ["_type","_classname"];

switch (_type) do {
    case "unit": {
        _icon = getText (configFile >> "CfgVehicles" >> _classname >> "icon");
        _iconTex = if (_icon find "\a3\" > -1 || _icon find "\A3\" > -1) then {_icon} else {getText (configFile >> "CfgVehicleIcons" >> _icon)};
        _side = getNumber (configFile >> "CfgVehicles" >> _classname >> "side");
        [_side] call EFUNC(common,getSideColorByInt);
    };
    case "group": {};
};

_icon = getText (_classname >> "icon");
_iconTex = if (_icon find "\a3\" > -1 || _icon find "\A3\" > -1) then {_icon} else {getText (configFile >> "CfgVehicleIcons" >> _icon)};
_side = getNumber (_classname >> "side");
[_side] call EFUNC(common,getSideColorByInt);
