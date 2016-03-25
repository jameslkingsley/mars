#include "script_component.hpp"

if !(hasInterface) exitWith {};

["ARCOMM", "OpenMissionEditor", ["Open Mission Editor", "Press to open the mission editor interface"], {
    call FUNC(openEditor);
}, ""] call CBA_fnc_addKeybind;

GVAR(dh_onMouseButtonUp) = ["MouseButtonUp", QUOTE(_this call FUNC(onMouseButtonUp))] call CBA_fnc_addDisplayHandler;
GVAR(dh_onMouseButtonDown) = ["MouseButtonDown", QUOTE(_this call FUNC(onMouseButtonDown))] call CBA_fnc_addDisplayHandler;
GVAR(dh_onKeyDown) = ["KeyDown", QUOTE(_this call FUNC(onKeyDown))] call CBA_fnc_addDisplayHandler;
GVAR(dh_onKeyUp) = ["KeyUp", QUOTE(_this call FUNC(onKeyUp))] call CBA_fnc_addDisplayHandler;
GVAR(dh_onMouseMoving) = ["MouseMoving", QUOTE(_this call FUNC(onMouseMoving))] call CBA_fnc_addDisplayHandler;
GVAR(dh_onMouseHolding) = ["MouseHolding", QUOTE(_this call FUNC(onMouseHolding))] call CBA_fnc_addDisplayHandler;
