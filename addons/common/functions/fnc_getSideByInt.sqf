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

if (_side == -1) exitWith {sideUnknown};

private _retSide = switch (_side) do {
    case SIDE_WEST: {west};
    case SIDE_EAST: {east};
    case SIDE_GUER: {resistance};
    case SIDE_CIV: {civilian};
    default {sideUnknown};
};

_retSide