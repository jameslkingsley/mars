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

params [["_units", [], [[]]]];

_units = _units apply {
    if (_x isEqualType grpNull) exitWith {_x};
    group _x
};

_units = _units arrayIntersect _units;

_units
