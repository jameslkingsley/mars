/*
 * Author: Kingsley
 * Sets up some default attributes to make AI units better
 * This function is called for every CAManBase that is spawned
 *
 * Arguments:
 * 0: The man <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unitOne] call mars_ai_fnc_initMan;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit", objNull]];

if (isNull _unit) exitWith {};
if (isPlayer _unit) exitWith {};
if (!([_unit] call CFUNC(isValidSide))) exitWith {};

_unit addEventHandler ["Reloaded", {
    params [["_unit", objNull], "_weapon", "_muzzle", "_newMag", ["_oldMag", [""]]];
    if (isNull _unit || {!GVAR(unlimitedMagazines)}) exitWith {};
    if (_oldMag isEqualType [] && {count _oldMag > 0} && {(_oldMag select 0) isEqualType ""}) then {
        _unit addMagazine [(_oldMag select 0), 1E6];
    };
}];

if (!local _unit) exitWith {};

_unit disableAI "AUTOCOMBAT";
_unit allowFleeing 0;
