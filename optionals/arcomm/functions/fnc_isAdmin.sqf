/*
 * Author: Kingsley
 * Checks whether the given player is an admin (either logged into server admin or a verified Steam ID)
 *
 * Arguments:
 * 0: Player to check <OBJECT>
 *
 * Return Value:
 * Is admin <BOOL>
 *
 * Example:
 * _isAdmin = [player] call mars_arcomm_fnc_isAdmin;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {false};

private _curators = [];

{
    _curators pushBackUnique (getAssignedCuratorUnit _x);
    false
} count allCurators;

if (_unit in _curators) exitWith {true};

private _adminList = [
    "76561198011054794",
    "76561197971299792",
    "76561198006430958",
    "76561198073677701",
    "76561198115517788",
    "76561198043696611"
];

if (serverCommandAvailable "#kick" || isServer) exitWith {true};
if ((getPlayerUID _unit) in _adminList) exitWith {true};

false