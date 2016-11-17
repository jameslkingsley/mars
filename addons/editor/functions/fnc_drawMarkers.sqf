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

{
    _x params ["_name", "_texture", "_color", "_pos", "_width", "_height", "_dir", "_text"];

    if (_name == GVAR(hoveredMarker) || {_name in GVAR(selectedMarkers)}) then {
        _color set [3, 1];
    } else {
        _color set [3, linearConversion [0, GVAR(iconDrawDistance), (_pos distance GVAR(camPos)), 0.75, 0, true]];
    };

    GVAR(markerIcons) pushBack [_pos, _name];

    drawIcon3D [
        _texture,
        _color,
        _pos,
        _width,
        _height,
        _dir,
        _text,
        0,
        0.032,
        "PuristaBold",
        "center"
    ];

    false
} count GVAR(serializedMarkers);
