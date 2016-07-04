/*
 * Author: Kingsley
 * Sets the units' stance
 * Used by CBA_fnc_targetEvent
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, "UP"] call mars_ai_fnc_setUnitPos;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_stance", "AUTO", [""]]
];

_unit setUnitPos _stance;