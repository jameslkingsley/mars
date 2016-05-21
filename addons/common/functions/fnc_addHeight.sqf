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
    ["_position", [], [[]]],
    ["_height", 0, [0]]
];

if (count _position == 0) exitWith {[]};

_position params ["_axisX","_axisY","_axisZ"];
[_axisX, _axisY, (_axisZ + _height)]