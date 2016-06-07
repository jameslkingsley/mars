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
GVAR(camSpeed) = [QGVAR(camSpeed), 1.5] call EFUNC(common,loadSetting);
GVAR(camTilt) = -10;
GVAR(camUnit) = objNull;
GVAR(camVision) = -2;
GVAR(camZoom) = [QGVAR(camZoom), 1] call EFUNC(common,loadSetting);
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
GVAR(placedStaticObjects) = [];
GVAR(prepSurfaceSphere) = objNull;
GVAR(currentCursor) = "";

// Asset Browser
GVAR(tabs) = [];
GVAR(subtabs) = [];
GVAR(abCurrentTab) = 0;
GVAR(abCurrentMode) = 0;
GVAR(abCurrentSubmode) = 0;
GVAR(abActiveTree) = -1;
GVAR(abSelectedObject) = [];

// Context Menu
GVAR(canContext) = true;
GVAR(allContextControls) = [];
GVAR(indexedContexts) = [];

// Toolbar
GVAR(allMenuStripMenus) = [];
GVAR(hasClickedOnMenuStrip) = false;
GVAR(menuStripMenuOpen) = false;
GVAR(dummyMenus) = [];

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

// Object Dragging
GVAR(objectDragAnchor) = objNull;
GVAR(objectsDragging) = [];
GVAR(allowDragging) = false;
GVAR(isDragging) = false;
GVAR(prepDragObjectUnderCursor) = objNull;

// Object Direction
GVAR(objectDirAnchor) = objNull;
GVAR(objectsDirection) = [];
GVAR(allowDirection) = false;
GVAR(isDirection) = false;
GVAR(prepDirObjectUnderCursor) = objNull;

// Remote Control
GVAR(isRemoteControl) = false;

ADDON = true;
