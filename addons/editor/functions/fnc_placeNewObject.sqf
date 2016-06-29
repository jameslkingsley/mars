/*
 * Author: Kingsley
 * Places any selected object from the asset browser
 *
 * Arguments:
 * 0: Ctrl key held <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_ctrlKeyHeld", false, [false]]];

if (GVAR(abSelectedObject) isEqualTo []) exitWith {};

private _worldPos = [] call FUNC(getSurfaceUnderCursor);
private _spawnMachine = [] call CFUNC(getSpawnMachine);
private _args = [_worldPos, player, GVAR(abSelectedObject)];

#ifdef DEBUG_MODE_FULL
    MARS_LOGINFO_1("Targetting machine: %1", _spawnMachine);
#endif

if (_spawnMachine isEqualTo REMOTE_SERVER) then {
    [QGVAR(spawnObject), _args] call CBA_fnc_serverEvent;
    
    #ifdef DEBUG_MODE_FULL
        MARS_LOGINFO("Spawning on server");
    #endif
} else {
    [QGVAR(spawnObject), _args, _spawnMachine] call CBA_fnc_targetEvent;
    
    #ifdef DEBUG_MODE_FULL
        MARS_LOGINFO("Spawning on target");
    #endif
};

// Don't reset selected object if control key is held (for multiple creations)
if (!_ctrlKeyHeld) then {
    GVAR(abSelectedObject) = [];
};

// Cleanup helper object and variables
deleteVehicle GVAR(prepSurfaceSphere);
GVAR(prepSurfaceSphere) = objNull;
GVAR(allowDragging) = false;
GVAR(allowDirection) = false;
GVAR(selection) = [];

// Invoke serialize drawing
[] spawn FUNC(serializeDrawing);