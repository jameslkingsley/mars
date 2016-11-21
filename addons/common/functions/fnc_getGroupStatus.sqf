/*
 * Author: Kingsley
 * Gets the given groups status
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Return image <BOOL>
 *
 * Return Value:
 * Status text or image <STRING>
 *
 * Example:
 * [group player, true] call mars_common_fnc_getGroupStatus;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_group", grpNull, [grpNull, objNull]],
    ["_image", false, [false]]
];

if (_group isEqualType objNull) then {
    _group = group _group;
};

private _status = _group getVariable [QGVAR(groupStatus), ""];

if (!_image) exitWith {_status};

([_status] call CFUNC(getStatusImage))
