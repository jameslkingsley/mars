#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ARCOMM", "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    call FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;