/*
 * Author: Kingsley
 * Forces the given units to move to a position (removes unit from their group)
 *
 * Arguments:
 * 0: Units <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unitOne, unitTwo], [0,0,0]] call mars_ai_fnc_forceMove;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

[_units] call FUNC(ungarrison);
{[_x, "run"] call CFUNC(setGroupStatus)} forEach ([_units] call CFUNC(unitsToGroups));

if (_broadcast) then {
    [QGVAR(forceMove), [_units, _pos], _units] call CBA_fnc_targetEvent;
} else {
    {
        _x setUnitPos "UP";
        _x doMove _pos;
        _x setVariable [QGVAR(forceMove), true, true];
        false
    } count _units;
};
