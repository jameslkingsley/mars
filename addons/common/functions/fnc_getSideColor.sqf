/*
 * Author: Kingsley
 * Gets the color of the given side
 * This function is used over the BIS function to allow changes to the side color
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * RGBA <ARRAY>
 *
 * Example:
 * _color = [side player] call mars_common_fnc_getSideColor;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_side", sideUnknown, [sideUnknown]],
    ["_alpha", 1, [0]]
];

private _index = ([west, east, resistance, civilian] find _side) + 1;

[
    [COLOR_EMPTY_RGB, _alpha],
    [COLOR_WEST_RGB, _alpha],
    [COLOR_EAST_RGB, _alpha],
    [COLOR_GUER_RGB, _alpha],
    [COLOR_CIV_RGB, _alpha]
] select _index;