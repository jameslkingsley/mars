/*
 * Author: Kingsley
 * Handles the camera teleport when middle clicking the map control
 *
 * Arguments:
 * TODO
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_map", "_button", "_cordX", "_cordY", "_shift", "_ctrl", "_alt"];

if (!GVAR(mapOpen) || {!_alt}) exitWith {};

private _worldPos = _map ctrlMapScreenToWorld [_cordX, _cordY];

// Add the Z coordinate
_worldPos pushBack 20;

GVAR(camPos) = _worldPos;
