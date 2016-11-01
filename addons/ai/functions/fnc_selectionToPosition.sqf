/*
 * Author: Kingsley
 * Handles the selection to position event for AI
 *
 * Arguments:
 * 0: Position <ARRAY>
 * 1: Selection <ARRAY>
 * 2: Target (optional) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0,0,0], [player]] call mars_ai_fnc_selectionToPosition;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_pos", [], [[]]],
    ["_selection", [], [[]]],
    ["_target", objNull, [objNull]]
];

[_selection] call FUNC(ungarrison);

if (!isNull _target) exitWith {
    #ifdef DEBUG_MODE_FULL
        MARS_LOGINFO_1("Targetting unit: %1", _target);
    #endif
    
    private _groups = [_selection] call CFUNC(unitsToGroups);
    
    {
        if (!EGVAR(editor,ctrlKey)) then {
            [_x] call CBA_fnc_clearWaypoints;
        };
        
        private _isEnemy = (side _x) getFriend (side group _target) < 0.6;
        
        if (crew vehicle _target isEqualTo []) then {
            _x addVehicle _target;
            [_x, _target, 0, "GETIN", "CARELESS", "RED", "FULL", "NO CHANGE"] call CBA_fnc_addWaypoint;
            ["Group ordered to get in vehicle"] call EFUNC(editor,notification);
        } else {
            if (_isEnemy) then {
                [_x, _target, 0, "DESTROY", "AWARE", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
                ["Group ordered to destroy target"] call EFUNC(editor,notification);
            } else {
                if !(_target call CBA_fnc_isPerson) then {
                    private _emptyPositions = 0;
                    {_emptyPositions = _emptyPositions + (_target emptyPositions _x)} forEach ["Commander", "Driver", "Gunner", "Cargo"];
                    
                    if (_emptyPositions > 0) then {
                        if (_emptyPositions >= count units _x) then {
                            _x addVehicle _target;
                            [_x, _target, 0, "GETIN", "CARELESS", "RED", "FULL", "NO CHANGE"] call CBA_fnc_addWaypoint;
                            ["Group ordered to get in vehicle"] call EFUNC(editor,notification);
                        } else {
                            ["Not enough seats for unit(s)", 0] call EFUNC(editor,notification);
                        };
                    } else {
                        ["Vehicle is full", 0] call EFUNC(editor,notification);
                    };
                };
            };
        };
        
        false
    } count _groups;
};

{
    if (!EGVAR(editor,ctrlKey)) then {
        [_x] call CBA_fnc_clearWaypoints;
    };

    
    false
} count ([_selection] call CFUNC(unitsToGroups));
