/*
 * Author: Kingsley
 * Sets the group status that corresponds to the status image file name
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Status <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [group player, "defend"] call mars_common_fnc_setGroupStatus;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_group", grpNull, [grpNull, objNull]],
    ["_status", "", [""]],
    ["_cooldown", -1, [0]]
];

if (_group isEqualType objNull) then {
    _group = group _group;
};

_group setVariable [QGVAR(groupStatus), _status, true];

if (_cooldown > -1) then {
    [{_this setVariable [QGVAR(groupStatus), "", true]}, _group, _cooldown] call CBA_fnc_waitAndExecute;
};
