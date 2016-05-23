/*
 * Author: Kingsley
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

private _color = switch (_side) do {
    case west: {
        (format["#(rgb,8,8,3)color(%1,%2,%3,%4)", COLOR_WEST_R, COLOR_WEST_G, COLOR_WEST_B, COLOR_WEST_A])
    };
    case east: {
        (format["#(rgb,8,8,3)color(%1,%2,%3,%4)", COLOR_EAST_R, COLOR_EAST_G, COLOR_EAST_B, COLOR_EAST_A])
    };
    case resistance: {
        (format["#(rgb,8,8,3)color(%1,%2,%3,%4)", COLOR_GUER_R, COLOR_GUER_G, COLOR_GUER_B, COLOR_GUER_A])
    };
    case civilian: {
        (format["#(rgb,8,8,3)color(%1,%2,%3,%4)", COLOR_CIV_R, COLOR_CIV_G, COLOR_CIV_B, COLOR_CIV_A])
    };
    default {
        (format["#(rgb,8,8,3)color(%1,%2,%3,%4)", COLOR_EMPTY_R, COLOR_EMPTY_G, COLOR_EMPTY_B, COLOR_EMPTY_A])
    };
};

_color
