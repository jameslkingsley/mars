/*
 * Author: Kingsley
 * Adds the given height value to the position Z value
 *
 * Arguments:
 * 0: Position <POSITION>
 * 1: Height to add to current height <SCALAR>
 *
 * Return Value:
 * New position <POSITION>
 *
 * Example:
 * [[0,0,0], 10] call mars_common_fnc_addHeight;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_position", [], [[]], [3]],
    ["_height", 0, [0]]
];

if !(_position isEqualTo []) then {
    _position = _position vectorAdd [0, 0, _height];
};

_position
