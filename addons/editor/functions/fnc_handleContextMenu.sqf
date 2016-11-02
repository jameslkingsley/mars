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
if (time < 2) exitWith {};

private _worldPos = screenToWorld GVAR(mousePos);
private _objects = nearestObjects FULL_TYPE_SEARCH;
private _targets = [];

if (count _objects > 0 && {GVAR(selection) isEqualTo []}) then {
    // Object context menu
    _targets = [(_objects select 0)];
} else {
    if !(GVAR(selection) isEqualTo []) then {
        // Selection context menu
        _targets = GVAR(selection);
    } else {
        // General context menu
        _targets = [];
    };
};

GVAR(currentMousePos) = GVAR(mousePos);
[] call FUNC(closeContextMenu);
[] call FUNC(createContextMenu);
