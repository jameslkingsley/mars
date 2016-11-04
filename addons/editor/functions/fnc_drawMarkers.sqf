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
    private _color = _x select 1;
    _color set [3, linearConversion [0, GVAR(iconDrawDistance), ((_x select 2) distance _camPosASL), 0.75, 0, true]];
    _x set [1, _color];
    drawIcon3D _x;
    false
} count GVAR(serializedMarkers);
