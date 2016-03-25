#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(menus) = [];
GVAR(topNavControls) = [];

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

ADDON = true;