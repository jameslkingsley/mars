/*
 * Author: Kingsley
 * Fires the unit's launcher at the given position
 *
 * Arguments:
 * 0: Selection <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[u1, u2, u3], [0,0,0]] call mars_ai_fnc_fireLauncher;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_units", []],
    ["_pos", []]
];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};