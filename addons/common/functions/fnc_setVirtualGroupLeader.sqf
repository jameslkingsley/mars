/*
 * Author: Kingsley
 * Sets the leader of the virtual group
 *
 * Arguments:
 * 0: Virtual group <LOCATION>
 * 1: New leader <OBJECT>
 * 2: Delete old leader from group (defaults to false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _group = [] call mars_common_fnc_createVirtualGroup;
 * [_group, player] call mars_common_fnc_setVirtualGroupLeader;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_group", locationNull, [locationNull]],
    ["_newLeader", objNull, [objNull]],
    ["_deleteOldLeader", false, [false]]
];

private _oldLeader = _group getVariable "leader";

if (!isNil "_oldLeader") then {
    private _members = _group getVariable "members";
    
    if (_deleteOldLeader) then {
        _members deleteAt (_members find _oldLeader);
    } else {
        _members pushBackUnique _oldLeader;
    };
    
    _group setVariable ["members", _members];
};

_group setVariable ["leader", _newLeader];

// Pick a new leader if this one dies
_newLeader addEventHandler ["Killed", {
    params ["_unit"];
    
    private _virtualGroup = [_unit] call CFUNC(getVirtualGroup);
    
    if (isNull _virtualGroup) exitWith {};
    
    private _members = _virtualGroup getVariable "members";
    
    if (!isNil "_members" && {!(_members isEqualTo [])}) then {
        private _newLeader = (_members select {!isNull _x && {alive _x}}) param [0, objNull];
        
        if (!isNull _newLeader) then {
            [_virtualGroup, _newLeader] call CFUNC(setVirtualGroupLeader);
        };
    };
}];