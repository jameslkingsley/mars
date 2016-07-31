/*
 * Author: Kingsley
 * Orders the given selection of air vehicles to land at the given position
 *
 * Arguments:
 * 0: Args <ARRAY>
 *    0: Selection <ARRAY>
 *    1: Position <ARRAY>
 * 1: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[[grpOne, unitOne], [1,2,3]], true] call mars_ai_fnc_taskLand;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

MARS_LOGINFO_2("%1  --  %2", _units, _pos);

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

if (_broadcast) then {
    [HELIPAD_INVISIBLE, _pos, [], 0, "CAN_COLLIDE"] remoteExecCall ["createVehicle", 2];
    systemChat "Created Helipad";
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(taskLand), [_groups, _pos], _groups] call CBA_fnc_targetEvent;
} else {
    private _cargo = [];
    {_cargo append (units _x); false} count _units;
    _units = _units arrayIntersect _units;
    
    systemChat str _units;
    
    {
        [_x] call CBA_fnc_clearWaypoints;

        [_x, _pos, 0, "UNLOAD", "AWARE", "RED", "FULL", "WEDGE", "this land 'LAND'", nil, 25] call CBA_fnc_addWaypoint;
        
        if (vehicle _x == _x && {_x isKindOf "Air"}) then {
            // _x land "LAND";
        };

        false
    } count (_units select {driver vehicle _x isEqualTo _x});
};