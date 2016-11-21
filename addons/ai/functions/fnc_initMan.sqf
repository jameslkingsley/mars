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

if (!local _unit || {isPlayer _unit} || {!([_unit] call CFUNC(isValidSide))}) exitWith {};

// This prevents AI from automatically entering combat mode, preventing 24/7 prone mode
// _unit disableAI "AUTOCOMBAT";

// This stops AI from getting suppressed, preventing them to cower
// _unit disableAI "SUPPRESSION";

// This sets their starting behaviour to AWARE so they move decently
// _unit setBehaviour "AWARE";

// This sets their starting speed to full so they're allowed to move out of formation
// _unit setSpeedMode "FULL";

// This stops them from fleeing. Balls to the wall mode.
// _unit allowFleeing 0;


