/*
 * Author: Kingsley
 * Checks whether the given object is in a valid side (west, east, guer, civilian)
 *
 * Arguments:
 * 0: Object to check <OBJECT>
 *
 * Return Value:
 * Valid side <BOOL>
 *
 * Example:
 * _valid = [player] call mars_common_fnc_isValidSide;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {false};

((side group _unit) in [west,east,resistance,civilian])