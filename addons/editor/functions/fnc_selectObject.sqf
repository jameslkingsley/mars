/*
 * Author: Kingsley
 * Handles selecting an object via left click
 *
 * Arguments:
 * 0: Button (0 = left, 1 = right) <INT>
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

params [["_button", 0]];

if (GVAR(cursorOverObjectIsVehicle)) then {
    private ["_target","_worldPos","_objects"];
    
    _target = objNull;
    _worldPos = screenToWorld GVAR(mousePos);
    _objects = lineIntersectsWith [GVAR(camPos), AGLtoASL _worldPos, objNull, objNull, true];

    {
        private _obj = _x;
        if ({_obj isKindOf _x} count TYPE_SEARCH > 0) then {
            _target = _obj;
        };
        false
    } count _objects;

    if (isNull _target) then {
        // Clear Selection
        GVAR(selection) = [];
        
        // Default to true to allow selecting vehicles
        GVAR(cursorOverObjectIsVehicle) = true;
    } else {
        [_target, !(vehicle _target == _target), _button] call FUNC(highlightObject);
    };
} else {
    private ["_worldPos","_objects"];
    
    _worldPos = screenToWorld GVAR(mousePos);
    _objects = nearestObjects FULL_TYPE_SEARCH;

    if (count _objects > 0) then {
        private _target = (_objects select 0);
        [_target, !(vehicle _target == _target), _button] call FUNC(highlightObject);
    } else {
        // Clear Selection
        GVAR(selection) = [];
        
        // Default to true to allow selecting vehicles
        GVAR(cursorOverObjectIsVehicle) = true;
    };
};
