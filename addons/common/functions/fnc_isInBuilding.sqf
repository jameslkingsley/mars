/*
 * Author: commy2, Kingsley
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

#define CHECK_DISTANCE 25

params [["_position", []]];

if (count _position == 0) exitWith {};

private _intersections = 0;

if (lineIntersects [_position, _position vectorAdd [0, 0, +CHECK_DISTANCE]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [+CHECK_DISTANCE, 0, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [-CHECK_DISTANCE, 0, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [0, +CHECK_DISTANCE, 0]]) then {
  _intersections = _intersections + 1;
};

if (lineIntersects [_position, _position vectorAdd [0, -CHECK_DISTANCE, 0]]) then {
  _intersections = _intersections + 1;
};

_intersections > 3
