/*
 * Author: Kingsley
 * Handles tree selection changes of the asset browser
 *
 * Arguments:
 * See UI EH
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;

params ["_control", "_path"];

private _selected = call compile (_control tvData _path);

if (_selected isEqualTo []) exitWith {
    GVAR(abSelectedObject) = [];
};

_selected params [
    ["_objType", ""],
    ["_classname", ""],
    ["_groupPath", []]
];

if (_objType in ["man", "vehicle"]) then {
    _cfg = (configFile >> "CfgVehicles" >> _classname);
    _icon = getText (_cfg >> "icon");
    _side = getNumber (_cfg >> "side");
    _color = [_side] call EFUNC(common,getSideColorByInt);
    _iconTex = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\a3\" > -1);
    GVAR(abSelectedObject) = [_objType, _classname, _iconTex, _color, _side];
} else {
    _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
    _groupConfig = (configFile >> _root >> _side >> _faction >> _type >> _group);
    _icon = getText (_groupConfig >> "icon");
    _side = getNumber (_groupConfig >> "side");
    _color = [_side] call EFUNC(common,getSideColorByInt);
    GVAR(abSelectedObject) = [_objType, _classname, _icon, _color, _side, _groupPath];
};
