/*
 * Author: Kingsley
 * Prepares a new object from the asset browser
 * This is called on every frame
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

#define SURFACE_OBJECT "Sign_Sphere100cm_F"

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

_surfacePos = ASLtoAGL ([GVAR(prepSurfaceSphere)] call FUNC(getSurfaceUnderCursor));

if (round(_surfacePos select 2) > round(_worldPos select 2)) then {
    // Cursor position is over a surface that is higher than the terrain
    if (isNull GVAR(prepSurfaceSphere)) then {
        GVAR(prepSurfaceSphere) = SURFACE_OBJECT createVehicleLocal _surfacePos;
    };
    
    GVAR(prepSurfaceSphere) setPosASL (AGLtoASL _surfacePos);
} else {
    deleteVehicle GVAR(prepSurfaceSphere);
    GVAR(prepSurfaceSphere) = objNull;
};