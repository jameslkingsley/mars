/*
 * Author: Kingsley
 * Captures all entities visible on the screen and stores them in a global variable
 * Spawned every 3 seconds
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] spawn mars_editor_fnc_captureEntities;
 *
 * Public: No
 */

#include "script_component.hpp"

private _entities = (entities "All") select {
    !((worldToScreen (getPos _x)) isEqualTo []) &&
    {(_x distance GVAR(camPos)) <= GVAR(iconDrawDistance)}
};

private _markers = allMapMarkers select {
    !((worldToScreen (markerPos _x)) isEqualTo []) &&
    {((markerPos _x) distance GVAR(camPos)) <= GVAR(iconDrawDistance)}
};

GVAR(capturedEntities) = _entities;
GVAR(capturedMarkers) = _markers;
