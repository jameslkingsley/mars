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

_object = [] call FUNC(objectUnderCursor);

if (isNull _object) exitWith {
    if (!GVAR(isDragging)) then {
        private _selectedGroup = [] call FUNC(selectGroupIcon);

        if (isNull _selectedGroup) then {
            GVAR(activeGroupIcon) = objNull;
            [] call FUNC(setCursor);
        } else {
            GVAR(activeGroupIcon) = _selectedGroup;
            ["select"] call FUNC(setCursor);
        };
    };
};

["select"] call FUNC(setCursor);

if (_object in GVAR(selection)) exitWith {};

private _color = [[0,0,0,1], MARS_SIDECOLOR(side group _object)] select (alive _object);
[_object, _color] call FUNC(drawBoundingBox);
