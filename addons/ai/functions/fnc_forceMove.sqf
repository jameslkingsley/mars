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

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

{
    private _side = _x;
    private _sideUnits = _units select {side group _x == _side};
    
    if !(_sideUnits isEqualTo []) then {
        private _virtualGroup = [] call CFUNC(createVirtualGroup);
        [_virtualGroup, _sideUnits] call CFUNC(addToVirtualGroup);

        {
            [_x, {
                params ["_unit", "_pos"];
                
                private _group = group _unit;
                private _modPos = [_pos, 50] call CBA_fnc_randPos;
                
                [_unit] joinSilent grpNull;
                
                _unit setBehaviour "AWARE";
                _unit setSpeedMode "FULL";
                
                if (count units _group == 0) then {
                    deleteGroup _group;
                };
                
                _unit doMove _modPos;
            }, [_x, _pos]] call CFUNC(execWhereLocal);
            
            if (leader _x == _x) then {
                [_virtualGroup, _x] call CFUNC(setVirtualGroupLeader);
            };
            
            false
        } count _sideUnits;

        private _leader = [_virtualGroup] call CFUNC(getVirtualGroupLeader);

        if (isNull _leader) then {
            [_virtualGroup, (_sideUnits select 0)] call CFUNC(setVirtualGroupLeader);
        };
    };
    
    false
} count [west, east, resistance, civilian];
