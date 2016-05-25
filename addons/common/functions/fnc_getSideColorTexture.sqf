/*
 * Author: Kingsley, 654wak654
 * Gets the sides color and returns the texture string
 *
 * Arguments:
 * 0: Side <SIDE>
 *
 * Return Value:
 * 0: Texture color <STRING>
 *
 * Example:
 * [west] call mars_common_fnc_getSideColorTexture;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_side", sideUnknown, [sideUnknown]]];

format ["#(rgb,8,8,3)color(%1,%2,%3,%4)",
    [
        [COLOR_EMPTY_R, COLOR_EMPTY_G, COLOR_EMPTY_B, COLOR_EMPTY_A],
        [COLOR_WEST_R, COLOR_WEST_G, COLOR_WEST_B, COLOR_WEST_A],
        [COLOR_EAST_R, COLOR_EAST_G, COLOR_EAST_B, COLOR_EAST_A],
        [COLOR_GUER_R, COLOR_GUER_G, COLOR_GUER_B, COLOR_GUER_A],
        [COLOR_CIV_R, COLOR_CIV_G, COLOR_CIV_B, COLOR_CIV_A]
    ] select ([sideUnknown, west, east, resistance, civilian] find _side));
];
