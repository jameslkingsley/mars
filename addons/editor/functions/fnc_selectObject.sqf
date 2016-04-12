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

if (GVAR(cursorOverObjectIsVehicle)) then {
    private _target = [] call FUNC(objectUnderCursor);

    if (isNull _target) then {
        // Clear Selection
        GVAR(selection) = [];
        
        // Default to true to allow selecting vehicles
        GVAR(cursorOverObjectIsVehicle) = true;
    } else {
        [_target, !(vehicle _target == _target)] call FUNC(highlightObject);
    };
} else {
    private ["_worldPos","_objects"];
    
    _worldPos = screenToWorld GVAR(mousePos);
    _objects = nearestObjects FULL_TYPE_SEARCH;

    if (count _objects > 0) then {
        private _target = (_objects select 0);
        [_target, !(vehicle _target == _target)] call FUNC(highlightObject);
    } else {
        // Clear Selection
        GVAR(selection) = [];
        
        // Default to true to allow selecting vehicles
        GVAR(cursorOverObjectIsVehicle) = true;
    };
};
