/*
 * Author: Kingsley
 * Orders the given units to suppress the given position
 *
 * Arguments:
 * 0: Units that will suppress <ARRAY>
 * 1: Position to suppress <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[u1, u2], [0,0,0]] call mars_ai_fnc_suppress;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_units", []],
    ["_pos", []]
];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

{
    [_x, {
        params ["_unit","_pos"];
        _unit doSuppressiveFire _pos;
    }, [_x, _pos]] call CFUNC(execWhereLocal);
    
    false
} count _units;