#include "script_component.hpp"

["ARCOMM", "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    [] spawn FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;