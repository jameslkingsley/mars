/*
 * Author: Kingsley
 * Searches the given array of objects for the closest one to the cursor's world position
 *
 * Arguments:
 * 0: Array of objects to search <ARRAY>
 *
 * Return Value:
 * Closest object <OBJECT>
 *
 * Example:
 * [mars_editor_selection] call mars_editor_fnc_getNearestUnderCursor;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_objects", [], [[]]]];

if (count _objects == 0) exitWith {};

_worldPos = screenToWorld GVAR(mousePos);
_closest = [objNull, 0];

{
    private _distance = _x distance _worldPos;
    
    if (_distance < (_closest select 1)) then {
        _closest = [_x, _distance];
    };
    
    false
} count _objects;

(_closest select 0)