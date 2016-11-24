/*
 * Author: Kingsley
 * Waypoints the given vehicles to paradrop at the given position
 *
 * Arguments:
 * 0: Units <ARRAY>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit1], [1,2,3]] call mars_ai_fnc_taskParadrop;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_units", []], ["_pos", []]];

if (_units isEqualTo [] || {_pos isEqualTo []}) exitWith {};

if (_broadcast) then {
    private _groups = [_units] call CFUNC(unitsToGroups);
    [QGVAR(taskParadrop), [_groups, _pos], _groups] call CBA_fnc_targetEvent;
    ["Group Waypointed"] call EFUNC(editor,notification);
} else {
    {
        [_x] call CBA_fnc_clearWaypoints;

        private _wp = _x addWaypoint [_pos, 0, 1, "Paradrop"];
        _wp setWaypointType "SCRIPTED";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointCombatMode "RED";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointScript getText (configFile >> "CfgWaypoints" >> QADDON >> "Paradrop" >> "file");

        false
    } count _units;
};
