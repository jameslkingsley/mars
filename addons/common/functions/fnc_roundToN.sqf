/*
 * Author: Kingsley
 * Round number to given decimal places
 *
 * Arguments:
 * 0: Number to round <SCALAR>
 * 1: Decimal places <INT>
 *
 * Return Value:
 * Rounded number <SCALAR>
 *
 * Example:
 * [8.27568, 2] call mars_common_fnc_roundToN;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_number", 0, [0]],
    ["_places", 2, [0]]
];

(round (_number * (10 ^ _places)) / (10 ^ _places))
