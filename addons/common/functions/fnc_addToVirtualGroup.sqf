/*
 * Author: Kingsley
 * Adds the given units to the given virtual group
 *
 * Arguments:
 * 0: Virtual group <LOCATION>
 * 1: Units to add <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _group = [] call mars_common_fnc_createVirtualGroup;
 * [_group, player] call mars_common_fnc_addToVirtualGroup;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_group", locationNull, [locationNull]],
    ["_units", [], [[]]]
];

private _members = _group getVariable "members";

{
    _members pushBackUnique _x;
    _x setVariable ["virtualGroup", _group, true];
} forEach _units;

_group setVariable ["members", _members];

GVAR(virtualGroups) set [(GVAR(virtualGroups) find _group), _group];
publicVariable QGVAR(virtualGroups);