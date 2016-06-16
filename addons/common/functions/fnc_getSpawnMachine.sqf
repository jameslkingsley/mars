/*
 * Author: Kingsley
 * Get most logical spawn machine for new objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Network ID of machine to spawn things on <NUMBER>
 *
 * Example:
 * _netID = [] call mars_common_fnc_getSpawnMachine;
 *
 * Public: Yes
 */

#include "script_component.hpp"

2
/*
private _headlessClients = (entities "HeadlessClient_F") select {!isNull _x};

if (_headlessClients isEqualTo []) exitWith {
    // No headless client entities in mission, exit with server network ID
    if (!isNil QEGVAR(editor,serverNetworkID)) then {
        EGVAR(editor,serverNetworkID)
    };
};

*/