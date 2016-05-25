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

format ([
    ["#(rgb,8,8,3)color(%1)", COLOR_EMPTY_RGBA],
    ["#(rgb,8,8,3)color(%1)", COLOR_WEST_RGBA],
    ["#(rgb,8,8,3)color(%1)", COLOR_EAST_RGBA],
    ["#(rgb,8,8,3)color(%1)", COLOR_GUER_RGBA],
    ["#(rgb,8,8,3)color(%1)", COLOR_CIV_RGBA]
] select ([sideUnknown, west, east, resistance, civilian] find _side));
