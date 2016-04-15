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
/*
private _objects = nearestObjects FULL_TYPE_SEARCH; // 0.0065918 ms

if (count _objects > 0) then {
    private _target = (_objects select 0);
    private _color = [[0,0,0,1], MARS_SIDECOLOR(side _target)] select (alive _target); // 0.0527008 ms
    GVAR(cursorOverObjectIsVehicle) = !(_target isKindOf "Man"); // 0.00350342 ms
    [_target, _color] call FUNC(drawBoundingBox);
};
*/
_object = [] call FUNC(objectUnderCursor);

if (isNull _object) exitWith {};

private _color = [[0,0,0,1], MARS_SIDECOLOR(side _object)] select (alive _object);
//GVAR(cursorOverObjectIsVehicle) = !(_object isKindOf "Man");
[_object, _color] call FUNC(drawBoundingBox);