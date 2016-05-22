/*
 * Author: Kingsley
 * Handles drawing location icons
 * This is called on every frame
 *
 * Arguments:
 * None
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

{
    _pos = locationPosition _x;
    _pos set [2, 0];
    _alpha = linearConversion [0, ICON_FADE_DISTANCE, (_pos distance GVAR(camPos)), 1, 0, true];
    
    drawIcon3D [
        QUOTE(PATHTOF(data\PanelLeft\location_ca.paa)),
        [1,1,1,_alpha],
        _pos,
        2,
        2,
        0,
        "",
        2
    ];
    
    drawIcon3D [
        "#(argb,8,8,3)color(0,0,0,1)",
        [1,1,1,_alpha],
        _pos,
        0,
        -0.5,
        0,
        text _x,
        2
    ];
    
    false
} count nearestLocations [GVAR(camPos), ["nameVillage","nameCity","nameCityCapital"], ICON_FADE_DISTANCE];