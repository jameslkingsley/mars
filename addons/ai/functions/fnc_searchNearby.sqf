/*
 * Author: Kingsley
 * Forces the given units to clear the nearest building
 *
 * Arguments:
 * 0: Units to search building <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[u1, u2, u3]] call mars_ai_fnc_searchNearby;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_units", []]];

if (_units isEqualTo []) exitWith {};

private _groups = [_units] call CFUNC(unitsToGroups);

{
    [_x, {
        params ["_group"];
        
        [_group] call CBA_fnc_clearWaypoints;
        
        // These parameters need to be set via a settings menu eventually
        [_group] call CBA_fnc_searchNearby;
    }, [_x]] call CFUNC(execWhereLocal);
    
    false
} count _groups;