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
GVAR(camSpeed) = 2;
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

// Asset Browser
GVAR(tabs) = [];
GVAR(subtabs) = [];

// Context Menu
GVAR(canContext) = true;
GVAR(allContextControls) = [];
GVAR(indexedContexts) = [];

// Toolbar
GVAR(allToolbarMenus) = [];
GVAR(hasClickedOnToolbar) = false;
GVAR(toolbarMenuOpen) = false;

// Caches
GVAR(cachedGroups) = [];
GVAR(cachedUnits) = [];

// Selection
GVAR(selection) = [];
GVAR(movingObjectsPFH) = 0;
GVAR(movingObjects) = [];

GVAR(ctrlKey) = false;
GVAR(altKey) = false;
GVAR(shiftKey) = false;

GVAR(isRemoteControl) = false;

ADDON = true;
