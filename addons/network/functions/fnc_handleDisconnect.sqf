/*
 * Author: Jonpas, Kingsley
 * Removes Headless Client from use.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Transfer To Server <BOOL>
 *
 * Example:
 * [unit] call mars_network_fnc_handleDisconnect;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_object"];

// Exit if not HC
if !(_object in GVAR(headlessClients)) exitWith {};

// Remove HC
GVAR(headlessClients) deleteAt (GVAR(headlessClients) find _object);

// Broadcast headless clients to all machines
publicVariable QGVAR(headlessClients);

#ifdef DEBUG_MODE_FULL
    MARS_LOGINFO_1("Removed HC: %1", _object);
#endif

// Prevent transferring of HC to server
false