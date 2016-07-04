/*
 * Author: Kingsley
 * Gets the virtual group leader
 *
 * Arguments:
 * 0: Virtual group <LOCATION>
 *
 * Return Value:
 * Leader or objNull if none exists <OBJECT>
 *
 * Example:
 * _group = [] call mars_common_fnc_createVirtualGroup;
 * _leader = [_group] call mars_common_fnc_getVirtualGroupLeader;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_group", locationNull, [locationNull]]];

private _leader = _group getVariable "leader";

if (isNil "_leader") exitWith {objNull};

_leader