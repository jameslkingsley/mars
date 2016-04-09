/*
 * Author: Kingsley
 * Converts an array of units to an array of their groups
 *
 * Arguments:
 * 0: Units <ARRAY>
 *
 * Return Value:
 * Groups <ARRAY>
 *
 * Example:
 * [allUnits] call mars_common_fnc_unitsToGroups;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_units"];

private _groups = [];

{
    if !((group _x) in _groups) then {
        _groups pushBack (group _x);
    };
    
    false
} count _units;

_groups