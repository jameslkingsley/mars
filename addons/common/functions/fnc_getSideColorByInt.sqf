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

params [["_side", -1]];

private _color = switch (_side) do {
    case SIDE_WEST: {COLOR_WEST_RGBA_ARR};
    case SIDE_EAST: {COLOR_EAST_RGBA_ARR};
    case SIDE_GUER: {COLOR_GUER_RGBA_ARR};
    case SIDE_CIV: {COLOR_CIV_RGBA_ARR};
    default {COLOR_EMPTY_RGBA_ARR};
};

_color
