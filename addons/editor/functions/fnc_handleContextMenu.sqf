/*
 * Author: Kingsley
 * Handles which context menu to open if any
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

// Prevents opening menus on mission start (for some reason BIS)
if (time < 5) exitWith {};

private ["_worldPos","_objects","_targets"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects FULL_TYPE_SEARCH;
_targets = [];

if (count _objects > 0 && count GVAR(selection) == 0) then {
    // Object context menu
    _targets = [(_objects select 0)];
} else {
    if (count GVAR(selection) > 0) then {
        // Selection context menu
        _targets = GVAR(selection);
    } else {
        // General context menu
        _targets = [];
    };
};

[_targets] call FUNC(openContextMenu);