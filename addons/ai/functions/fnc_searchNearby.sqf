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

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []]];

if (_units isEqualTo []) exitWith {};

[_units] call FUNC(ungarrison);

if (_broadcast) then {
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(searchNearby), [_groups], _groups] call CBA_fnc_targetEvent;
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;
        [_x] call CBA_fnc_searchNearby;
        
        false
    } count _units;
};
