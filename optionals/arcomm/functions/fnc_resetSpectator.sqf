/*
 * Author: Kingsley
 * Resets spectator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isNil "f_fnc_ForceExit" || {isNil "f_fnc_CamInit"}) exitWith {};

[] call f_fnc_ForceExit;

[{
    [player, objNull, 1, 1, true] call f_fnc_CamInit;
}, [], 2] call CBA_fnc_waitAndExecute;