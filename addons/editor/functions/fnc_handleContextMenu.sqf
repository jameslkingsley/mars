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

private ["_worldPos","_objects","_targets"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects FULL_TYPE_SEARCH;
_targets = [];
_selToPos = false;
_selObject = objNull;

if (count _objects > 0) then {
    if (count GVAR(leftSelection) > 0) then {
        _targets = GVAR(leftSelection);
        _selToPos = true;
        _selObject = (_objects select 0);
    } else {
        _targets = [(_objects select 0)];
    };
} else {
    if (count GVAR(leftSelection) > 0) then {
        _targets = GVAR(leftSelection);
        _selToPos = true;
        _selObject = objNull;
    } else {
        _targets = [];
    };
};

if (_selToPos) then {
    [] call FUNC(closeContextMenu);
    [_targets, _worldPos, _selObject] call FUNC(handleSelToPos);
} else {
    GVAR(currentMousePos) = GVAR(mousePos);
    [] call FUNC(closeContextMenu);
    [] call FUNC(createContextMenu);
};
