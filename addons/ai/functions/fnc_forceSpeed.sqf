/*
 * Author: Kingsley
 * Sets the forceSpeed for the given unit
 * Used with CBA_fnc_targetEvent
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Force speed value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0] call mars_ai_fnc_forceSpeed;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_value", 0, [0]]
];

_unit forceSpeed _value;