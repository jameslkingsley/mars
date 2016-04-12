/*
 * Author: Kingsley
 * Removes all waypoints from given group/unit
 *
 * Arguments:
 * 0: Unit or group <OBJECT/GROUP>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player] call mars_common_fnc_removeAllWaypoints;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_target", grpNull, [objNull, grpNull]]];

private _group = if (typeName _target == "GROUP") then {_target} else {group _target};

{deleteWaypoint _x;false} count waypoints _group;

nil