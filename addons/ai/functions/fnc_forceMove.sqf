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

params [
    ["_units", [], [[]]],
    ["_pos", [], [[]]]
];

{
    private _unit = _x;
    private _group = group _unit;
    private _modPos = [_pos, 50] call CBA_fnc_randPos;
    
    [_unit] joinSilent grpNull;
    
    if (count units _group == 0) then {
        deleteGroup _group;
    };
    
    _unit doMove _modPos;
    
    false
} count _units;