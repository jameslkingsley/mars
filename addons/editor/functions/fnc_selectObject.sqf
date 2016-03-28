/*
 * Author: Kingsley
 * Handles selecting an object via left click
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_selectObject;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_worldPos","_objects"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects [_worldPos, TYPE_SEARCH, 5];

if (count _objects > 0) then {
    private _target = (_objects select 0);
    [_target, !(vehicle _target == _target)] call FUNC(highlightObject);
} else {
    // Clear Selection
    GVAR(selection) = [];
};