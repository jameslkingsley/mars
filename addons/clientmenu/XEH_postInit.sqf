#include "script_component.hpp"

if !(hasInterface) exitWith {};

[QMODNAME, "OpenClientMenu", ["Open Client Menu", "Press to open the client menu"], {
    call FUNC(openMenu);
}, ""] call CBA_fnc_addKeybind;

GVAR(terrainDetail) = GETPRVAR(GVAR(terrainDetail),12.5);
GVAR(viewDistance) = GETPRVAR(GVAR(viewDistance),3000);

[GVAR(terrainDetail)] call FUNC(setTerrainDetail);
[GVAR(viewDistance)] call FUNC(setViewDistance);
