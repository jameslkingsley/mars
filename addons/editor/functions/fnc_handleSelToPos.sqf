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

private ["_worldPos","_objects"];

_worldPos = screenToWorld GVAR(mousePos);
_objects = nearestObjects FULL_TYPE_SEARCH;

if (count _objects > 0) exitWith {
    [] call FUNC(selectObject);
    [] call FUNC(handleContextMenu);
};

if (count GVAR(selection) == 0 || count _worldPos == 0) exitWith {};

{
    private _unit = _x;
    
    switch (true) do {
        // Infantry
        case (_unit isKindOf "Man"): {
            _unit doMove _worldPos;
        };
        
        // Land vehicle
        case (_unit isKindOf "LandVehicle"): {
            _unit doMove _worldPos;
        };
        
        // Air vehicle
        case (_unit isKindOf "Air"): {
            _unit doMove _worldPos;
        };
        
        default {};
    };

    false
} count GVAR(selection);

GVAR(selection) = [];
