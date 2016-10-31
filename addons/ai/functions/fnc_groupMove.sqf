/*
 * Author: Kingsley
 * Gives a simple move waypoint to the given group
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group unit, [0,0,0]] call mars_ai_fnc_groupMove;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];
_args params [["_group", grpNull], ["_pos", []]];

if (isNull _group || {_pos isEqualTo []}) exitWith {};

[units _group] call FUNC(ungarrison);

if (_broadcast) then {
    [QGVAR(groupMove), [_group, _pos], _group] call CBA_fnc_targetEvent;
} else {
    // _group move _pos;

    (units _group) doMove _pos;

    {
        _x setDestination [_pos, "LEADER PLANNED", true];
    } forEach units _group;
};
