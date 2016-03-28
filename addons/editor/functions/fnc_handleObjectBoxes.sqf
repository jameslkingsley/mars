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
_objects = nearestObjects [_worldPos, TYPE_SEARCH, 5];

if (count _objects > 0) then {
    private _target = (_objects select 0);
    private _color = if (alive _target) then {MARS_SIDECOLOR(side _target)} else {[0,0,0,1]};
    [_target, _color] call FUNC(drawBoundingBox);
};