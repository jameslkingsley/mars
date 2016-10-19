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

if (_broadcast) then {
    [QGVAR(forceMove), [_units, _pos], _units] call CBA_fnc_targetEvent;
    
    {
        private _side = _x;
        private _sideUnits = _units select {side group _x == _side};
        
        if !(_sideUnits isEqualTo []) then {
            {
                private _existingVirtualGroup = [_x] call CFUNC(getVirtualGroup);
                
                if (!isNull _existingVirtualGroup) then {
                    [_existingVirtualGroup] call CFUNC(deleteVirtualGroup);
                };
                
                false
            } count _sideUnits;
            
            private _virtualGroup = [] call CFUNC(createVirtualGroup);
            [_virtualGroup, _sideUnits] call CFUNC(addToVirtualGroup);

            private _leader = [_virtualGroup] call CFUNC(getVirtualGroupLeader);

            if (isNull _leader) then {
                [_virtualGroup, [_sideUnits] call CFUNC(getHighestRank)] call CFUNC(setVirtualGroupLeader);
            };
        };
        
        false
    } count [west, east, resistance, civilian];
} else {
    {
        private _side = _x;
        private _sideUnits = _units select {side group _x == _side};
        
        if !(_sideUnits isEqualTo []) then {
            {
                private _unit = _x;
                private _group = group _unit;
                private _modPos = linearConversion [0, 1000, (_unit distance _pos), _pos, ([_pos, 100] call CBA_fnc_randPos), true];
                
                [_unit] joinSilent grpNull;
                
                _unit setBehaviour "AWARE";
                _unit setSpeedMode "FULL";
                _unit setUnitPos "UP";
                _unit allowFleeing 0;
                
                {_unit setSkill [_x, 1]} forEach ["endurance","courage","commanding","general"];
                
                if (count units _group == 0) then {
                    deleteGroup _group;
                };
                
                _unit doMove _modPos;
                
                false
            } count _sideUnits; 
        };
        
        false
    } count [west, east, resistance, civilian];
};
