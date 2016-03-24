#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ARCOMM", "OpenClientMenu", ["Open Client Menu", "Press to open the client menu"], {
    call FUNC(openMenu);
}, ""] call CBA_fnc_addKeybind;

GVAR(terrainDetail) = profileNamespace getVariable [QGVAR(terrainDetail), 12.5];
GVAR(viewDistance) = profileNamespace getVariable [QGVAR(viewDistance), 3000];

[GVAR(terrainDetail)] call FUNC(setTerrainDetail);
[GVAR(viewDistance)] call FUNC(setViewDistance);