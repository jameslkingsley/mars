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

private _color = switch (_side) do {
    case west: {[COLOR_WEST_RGBA]};
    case east: {[COLOR_EAST_RGBA]};
    case resistance: {[COLOR_GUER_RGBA]};
    case civilian: {[COLOR_CIV_RGBA]};
    default {[COLOR_EMPTY_RGBA]};
};

_color
