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

params [["_side", sideUnknown]];

[
    [COLOR_EMPTY_RGBA],
    [COLOR_WEST_RGBA],
    [COLOR_EAST_RGBA],
    [COLOR_GUER_RGBA],
    [COLOR_CIV_RGBA]
] select ([sideUnknown, west, east, resistance, civilian] find _side);
