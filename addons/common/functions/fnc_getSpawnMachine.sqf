/*
 * Author: Kingsley
 * Get most logical spawn machine for new objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * ID or object of machine to spawn things on <NUMBER/OBJECT>
 *
 * Example:
 * _target = [] call mars_common_fnc_getSpawnMachine;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _headlessClients = (entities "HeadlessClient_F") select {!isNull _x};

if (_headlessClients isEqualTo []) exitWith {
    // No headless client entities in mission, exit with server
    REMOTE_SERVER
};

(selectRandom _headlessClients)