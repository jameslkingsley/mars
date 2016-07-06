/*
 * Author: Kingsley
 * Deletes a virtual group
 *
 * Arguments:
 * 0: Virtual group to delete <LOCATION>
 *
 * Return Value:
 * None
 *
 * Example:
 * _group = [leader player, units player] call mars_common_fnc_createVirtualGroup;
 * [_group] call mars_common_fnc_deleteVirtualGroup;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_group", locationNull, [locationNull]]];

private _leader = _group getVariable "leader";
private _members = _group getVariable "members";

{
    _x setVariable ["virtualGroup", nil, true];
} forEach (_members + [_leader]);

GVAR(virtualGroups) deleteAt (GVAR(virtualGroups) find _group);
publicVariable QGVAR(virtualGroups);

_group call CBA_fnc_deleteNamespace;