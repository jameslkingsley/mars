/*
 * Author: Kingsley
 * Draws a somewhat thicker line in 3D space.
 * It sucks we have to do this, but here we are.
 *
 * Arguments:
 * 0: Start pos <ARRAY>
 * 1: End pos <ARRAY>
 * 2: Color <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0,0,0], [1,0,0], [1,1,1,1]] call mars_common_fnc_drawThickLine3D;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_start", [], [[]]],
    ["_end", [], [[]]],
    ["_color", [], [[]]]
];

for "_i" from 0 to 50 do {
    drawLine3D [_start, _end, _color];
};
