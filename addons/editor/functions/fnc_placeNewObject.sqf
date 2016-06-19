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

[_worldPos, player, GVAR(abSelectedObject)] remoteExecCall [QFUNC(spawnObject), call CFUNC(getSpawnMachine)];

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