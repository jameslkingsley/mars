#include "script_component.hpp"

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
