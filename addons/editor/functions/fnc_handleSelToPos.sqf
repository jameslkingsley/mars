/*
 * Author: Kingsley
 * Handles the selection when right-clicking on a position in a context allowed state (right-click waypoints in Zeus)
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: World position <ARRAY>
 * 2: Target (optional) <OBJECT>
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

private _worldPos = screenToWorld GVAR(mousePos);
private _objects = nearestObjects FULL_TYPE_SEARCH;

if !(_objects isEqualTo []) exitWith {
    [] call FUNC(selectObject);
    [] call FUNC(handleContextMenu);
};

if (GVAR(selection) isEqualTo [] || {_worldPos isEqualTo []}) exitWith {};

{
    private _unit = _x;

    if ({_unit isKindOf _x} count ["Man", "LandVehicle", "Air"] > 0) then {
        _unit doMove _worldPos;
    };

    false
} count GVAR(selection);

GVAR(selection) = [];
