/*
 * Author: Kingsley
 * Gets the highest ranking unit from the given array and returns that unit
 *
 * Arguments:
 * 0: Units <ARRAY>
 *
 * Return Value:
 * Highest ranking unit <OBJECT>
 *
 * Example:
 * _leader = [units player] call mars_common_fnc_getHighestRank;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_units", [], [[]]]];

if (_units isEqualTo []) exitWith {};

_units = _units apply {[rankId _x, _x]};
_units sort false;

(_units select 0 select 1)