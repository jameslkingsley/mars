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

if (count GVAR(abSelectedObject) == 0) exitWith {};

GVAR(abSelectedObject) params ["_type","_classname","_iconTex","_color",["_groupPath",[]]];

private _worldPos = screenToWorld GVAR(mousePos);

if (count _groupPath > 0) then {
    _groupPath params ["_root", "_side", "_faction", "_type", "_group"];
    _groupUnits = "true" configClasses (configFile >> _root >> _side >> _faction >> _type >> _group);
    
    {
        private ["_offset", "_vehicle", "_icon", "_iconTex", "_position"];
        
        _offset = getArray (_x >> "position");
        _vehicle = getText (_x >> "vehicle");
        _icon = getText (configFile >> "CfgVehicles" >> _vehicle >> "icon");
        _iconTex = if (_icon find "\a3\" > -1 || _icon find "\A3\" > -1) then {_icon} else {getText (configFile >> "CfgVehicleIcons" >> _icon)};
        _position = _worldPos vectorAdd _offset;
        
        drawIcon3D [
            _iconTex,
            _color,
            _position,
            1,
            1,
            0,
            "",
            1,
            0
        ];
    } forEach _groupUnits;
} else {
    drawIcon3D [
        _iconTex,
        _color,
        _worldPos,
        1,
        1,
        0,
        "",
        1,
        0
    ];
};
