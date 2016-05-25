/*
 * Author: Kingsley
 * Gets the color of the given side integer
 * This function is used over the BIS function to allow changes to the side color
 *
 * Arguments:
 * 0: Side <INT>
 *
 * Return Value:
 * RGBA <ARRAY>
 *
 * Example:
 * _color = [1] call mars_common_fnc_getSideColorByInt;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_side", -1, [0]]
];

if (_side < 0 || {_side > 3}) exitWith {[COLOR_EMPTY_RGBA]};

[
    [COLOR_EAST_RGBA],
    [COLOR_WEST_RGBA],
    [COLOR_GUER_RGBA],
    [COLOR_CIV_RGBA]
] select _side;
