/*
 * Author: Kingsley
 * Handles object tagging which is the process of highlighting objects in 3D space based on mouse position
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

private ["_worldPos","_objects"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects [_worldPos, ["Man","LandVehicle","Air"], 5];

if (count _objects > 0) then {
    private _target = (_objects select 0);
    [_target, ([side _target] call BIS_fnc_sideColor)] call FUNC(drawBoundingBox);
};