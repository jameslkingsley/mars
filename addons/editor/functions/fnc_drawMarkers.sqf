/*
 * Author: Kingsley
 * Draws all markers in 3D space
 * Called every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_drawMarkers;
 *
 * Public: No
 */

#include "script_component.hpp"

private _camPosASL = GVAR(camPos);

{
    private _texture = getText (configfile >> "CfgMarkers" >> markerType _x >> "icon");
    private _color = [getArray (configFile >> "CfgMarkerColors" >> markerColor _x >> "color")] call CFUNC(evalColor);
    private _alpha = linearConversion [0, GVAR(iconDrawDistance), ((markerPos _x) distance _camPosASL), 0.75, 0, true];

    _color set [3, _alpha];

    drawIcon3D [
        _texture,
        _color,
        markerPos _x,
        (markerSize _x) select 0,
        (markerSize _x) select 1,
        markerDir _x,
        markerText _x,
        0,
        0.032,
        "PuristaBold",
        "center"
    ];

    false
} count allMapMarkers;
