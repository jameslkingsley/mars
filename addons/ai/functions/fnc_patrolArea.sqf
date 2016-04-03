/*
 * Author: Kingsley
 * 
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 
 *
 * Example:
 * 
 *
 * Public: 
 */

#include "script_component.hpp"

params ["_units","_pos"];

private _groups = [_units] call EFUNC(common,unitsToGroup);

{
    [_x, _pos, 200] call CBA_fnc_taskPatrol;
    false
} count _groups;