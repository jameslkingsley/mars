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
 * _color = [player] call mars_common_fnc_getSideColor;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_side", sideUnknown]];

private _color = switch (_side) do {
    case west: {WEST_COLOR};
    case east: {EAST_COLOR};
    case resistance: {GUER_COLOR};
    case civilian: {CIV_COLOR};
    default {UNKNOWN_COLOR};
};

_color