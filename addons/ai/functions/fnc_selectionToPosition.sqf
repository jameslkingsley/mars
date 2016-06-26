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

if (!isNull _target) exitWith {
    #ifdef DEBUG_MODE_FULL
        MARS_LOGINFO_1("Targetting unit: %1", _target);
    #endif
    
    {
        [_x] call CBA_fnc_clearWaypoints;
        [_x, _target, 0, "DESTROY", "AWARE", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
        
        false
    } count ([_selection] call CFUNC(unitsToGroups));
};

{
    [_x] call CBA_fnc_clearWaypoints;
    [_x, _pos, 0, "MOVE", "AWARE", "RED", "FULL", "LINE"] call CBA_fnc_addWaypoint;
    
    false
} count ([_selection] call CFUNC(unitsToGroups));
