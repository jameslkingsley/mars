#include "script_component.hpp"

if (IS_SERVER_OR_HC) then {
    // Is server or headless client
    
    // Broadcast server's network ID to all machines
    GVAR(serverNetworkID) = netID player;
    publicVariable QGVAR(serverNetworkID);
    
    QGVAR(createObjectRemote) addPublicVariableEventHandler {
        params [
            ["_varName", ""],
            ["_varValue", []]
        ];
        
        _varValue params [
            ["_targetID", -1],
            ["_data", []]
        ];
        
        private _localID = netID player;
        
        if (_localID != _targetID) exitWith {};
        
        [_data] call FUNC(spawnObject);
    };
};

[QMODNAME, "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    [] spawn FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;

if (!isNull player) then {
    GVAR(camPos) = ATLtoASL [(getPosATL player) select 0, (getPosATL player) select 1, 10];
};

// Is this needed?
createCenter west;
createCenter east;
createCenter resistance;
createCenter civilian;
