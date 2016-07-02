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

if (GVAR(abSelectedObject) isEqualTo []) exitWith {};

GVAR(abSelectedObject) params ["_type", "_classname", "_iconPath", "_color", "_side", ["_groupConfigStr", ""]];

private _worldPos = screenToWorld GVAR(mousePos);

if (_groupConfigStr != "" && {_type != "module"}) then {
    private _groupConfig = call compile _groupConfigStr;
    private _groupUnits = "true" configClasses (_groupConfig);
    
    {
        private _offset = getArray (_x >> "position");
        private _vehicle = getText (_x >> "vehicle");
        private _icon = getText (configFile >> "CfgVehicles" >> _vehicle >> "icon");
        private _iconPath = [getText (configFile >> "CfgVehicleIcons" >> _icon), _icon] select ((toLower _icon) find "\" > -1);
        private _position = _worldPos vectorAdd _offset;
        
        drawIcon3D [
            _iconPath,
            _color,
            _position,
            1,
            1,
            0,
            "",
            1,
            0
        ];
        
        false
    } count _groupUnits;
} else {
    drawIcon3D [
        _iconPath,
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

if (_type != "module") then {
    _surfacePos = ASLtoAGL ([GVAR(prepSurfaceSphere)] call FUNC(getSurfaceUnderCursor));

    if (round (_surfacePos select 2) > round (_worldPos select 2)) then {
        // Cursor position is over a surface that is higher than the terrain
        [_surfacePos, _color] call FUNC(drawSurfaceSphere);
    } else {
        [] call FUNC(destroySurfaceSphere);
    };
};