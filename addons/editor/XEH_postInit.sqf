#include "script_component.hpp"

[QMODNAME, "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    [] spawn FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;

if (!isNull player) then {
    GVAR(camPos) = ATLtoASL [(getPosATL player) select 0, (getPosATL player) select 1, 20];
};

["DestroyObject", "Destroy Object", QUOTE(alive _this), {_this setDamage 1;}] call FUNC(addContextParent);
["ControlUnit", "Control Unit", QUOTE(_this isKindOf 'CAManBase' && alive _this), {selectPlayer _this; [] call FUNC(shutdown);}] call FUNC(addContextParent);

_index = ["Debug", "Debug", "", ""] call FUNC(addContextParent);
[_index, "Debug_LogPos", "Log Position to Clipboard", "", {copyToClipboard (str (getPos _this))}] call FUNC(addContextChild);