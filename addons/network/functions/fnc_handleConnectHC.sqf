/*
 * Author: Jonpas, Kingsley
 * Registers connected headless client for use.
 *
 * Arguments:
 * 0: Headless Client <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [headlessClient] call mars_network_fnc_handleConnectHC;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_headlessClient"];

// Exit if already registered
if (_headlessClient in GVAR(headlessClients)) exitWith {};

// Register for use
GVAR(headlessClients) pushBack _headlessClient;

// Broadcast headless clients to all machines
publicVariable QGVAR(headlessClients);

#ifdef DEBUG_MODE_FULL
    MARS_LOGINFO_1("Registered HC: %1", _headlessClient);
#endif
