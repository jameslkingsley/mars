/*
 * Author: commy2, Kingsley, 654wak654
 * Check if the position is in a building. Will return true if the position is in a bush.
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * Is the position in a building? <BOOL>
 *
 * Example:
 * [getPos myUnit] call mars_common_fnc_isInBuilding;
 *
 * Public: Yes
 */

#include "script_component.hpp"

#define CHECK_DISTANCE 15

params [["_position", []]];

if (_position isEqualTo []) exitWith {};

private _intersections = {
    lineIntersects [_position, _position vectorAdd _x]
} count [
    [0, 0, +CHECK_DISTANCE],
    [+CHECK_DISTANCE, 0, 0],
    [-CHECK_DISTANCE, 0, 0],
    [0, +CHECK_DISTANCE, 0],
    [0, -CHECK_DISTANCE, 0]
];

_intersections > 3
