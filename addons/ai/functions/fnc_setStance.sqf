/*
 * Author: Kingsley
 * Sets the stance of the given units
 * Used by context menu
 *
 * Arguments:
 * 0: Stance <STRING>
 * 1: Units <ARRAY>
 * 2: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["UP", [unit1, unit2], true] call mars_ai_fnc_setStance;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_stance", "", [""]],
    ["_entities", [], [[]]],
    ["_broadcast", false, [false]]
];

if (_entities isEqualTo []) exitWith {};

if (_broadcast) then {
    _entities = _entities select 0;
    {[QGVAR(setUnitPos), [_x, _stance], _x] call CBA_fnc_targetEvent;false} count _entities;
} else {
    {[_x, _stance] call FUNC(setUnitPos);false} count _entities;
};
