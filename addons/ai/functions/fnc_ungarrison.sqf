/*
 * Author: Kingsley
 * Ungarrisons the given units
 *
 * Arguments:
 * 0: Units <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [allUnits] call mars_ai_fnc_ungarrison;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_units", [], [[]]]];

if (_units isEqualTo []) exitWith {};

{
    private _unit = _x;

    [QGVAR(disableAI), [_unit, "PATH", false], _unit] call CBA_fnc_targetEvent;

    false
} count _units;
