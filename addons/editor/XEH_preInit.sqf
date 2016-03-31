#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Reset the stored display
SETUVAR(GVAR(interface),displayNull);

// Camera
GVAR(availableModes) = [0];
GVAR(availableVisions) = [-2,-1,0,1];
GVAR(camAgent) = objNull;
GVAR(camDistance) = 10;
GVAR(camMode) = 0;
GVAR(camPan) = 0;
GVAR(camPos) = ATLtoASL [worldSize * 0.5, worldSize * 0.5, 20];
GVAR(camSpeed) = 1.5;
GVAR(camTilt) = -10;
GVAR(camUnit) = objNull;
GVAR(camVision) = -2;
GVAR(camZoom) = 1;
GVAR(interrupts) = [];
GVAR(isSet) = false;

// Interface
GVAR(menus) = [];
GVAR(topNavControls) = [];
GVAR(hasLeftClicked) = false;
GVAR(isWaitingForLeftClick) = false;
GVAR(entityListPFH) = 0;
GVAR(entityListGroups) = [];
GVAR(entityListUnits) = [];
GVAR(entityList_west) = 0;
GVAR(entityList_east) = 0;
GVAR(entityList_guer) = 0;
GVAR(entityList_civ) = 0;
GVAR(entityList_empty) = 0;

// Context Menu
GVAR(canContext) = true;
GVAR(parentContextControls) = [];
GVAR(childContextControls) = [];
GVAR(isMouseOverChild) = false;
GVAR(isChildContextOpen) = false;

// Caches
GVAR(cachedGroups) = [];
GVAR(cachedUnits) = [];

// Selection
GVAR(selection) = [];
GVAR(cursorOverObjectIsVehicle) = false;
GVAR(movingObjectsPFH) = 0;
GVAR(movingObjects) = [];

GVAR(ctrlKey) = false;
GVAR(altKey) = false;
GVAR(shiftKey) = false;

ADDON = true;
