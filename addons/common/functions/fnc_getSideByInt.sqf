/*
 * Author: Kingsley
 * Returns the side type based on given side number
 *
 * Arguments:
 * 0: Side number <INT>
 *
 * Return Value:
 * Side <SIDE>
 *
 * Example:
 * _side = [1] call mars_common_fnc_getSideByInt;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_side", -1, [0]]
];

if (_side < 0 || _side > 3) exitWith {sideUnknown};

[east, west, resistance, civilian] select _side;
