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

GVAR(camera) = objNull;
GVAR(cam_active) = false;
GVAR(cam_mouseMoving) = false;
GVAR(cam_leftMouseDown) = false;
GVAR(cam_leftMouseUp) = false;
GVAR(cam_rightMouseDown) = false;
GVAR(cam_rightMouseUp) = false;
GVAR(cam_middleMouseDown) = false;
GVAR(cam_middleMouseUp) = false;
GVAR(cam_angleX) = 0;
GVAR(cam_angleY) = 60;
GVAR(cam_mouseDeltaX) = 0.5;
GVAR(cam_mouseDeltaY) = 0.5;
GVAR(cam_mouseLastX) = 0.5;
GVAR(cam_mouseLastY) = 0.5;

GVAR(mouseCord) = [0.5, 0.5];