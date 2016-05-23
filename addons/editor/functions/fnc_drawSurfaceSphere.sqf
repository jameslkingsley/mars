/*
 * Author: Kingsley
 * Draws a surface sphere on given position
 *
 * Arguments:
 * 0: Position AGL <POSITION>
 * 1: Color RGBA or Side (will get color from side) (optional) <ARRAY/SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ASLtoAGL (getPosASL player), [1,0,1,1]] call mars_editor_fnc_drawSurfaceSphere;
 *
 * Public: Yes
 */

#include "script_component.hpp"

#define SURFACE_OBJECT "Sign_Sphere100cm_F"

params [
    ["_position", [], [[]]],
    ["_color", sideUnknown, [[], sideUnknown]]
];

if (count _position == 0) exitWith {};

if (isNull GVAR(prepSurfaceSphere)) then {
    GVAR(prepSurfaceSphere) = SURFACE_OBJECT createVehicleLocal _position;
    
    if (_color isEqualType sideUnknown) then {
        GVAR(prepSurfaceSphere) setObjectTexture [0, ([_color] call EFUNC(common,getSideColorTexture))];
    } else {
        _color params ["_colorR","_colorG","_colorB","_colorA"];
        GVAR(prepSurfaceSphere) setObjectTexture [0, (format[
            "#(rgb,8,8,3)color(%1,%2,%3,%4)",
            _colorR,
            _colorG,
            _colorB,
            _colorA
        ])];
    };
};

GVAR(prepSurfaceSphere) setPosASL (AGLtoASL _position);
