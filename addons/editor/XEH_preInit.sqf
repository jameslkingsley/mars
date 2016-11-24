#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Reset the stored display
SETUVAR(GVAR(interface), displayNull);
SETUVAR(GVAR(iconControls), []);
SETUVAR(GVAR(markerControls), []);

GVAR(pfhArray) = [];
GVAR(objectUnderCursor) = objNull;
GVAR(drawingControls) = [];

GVAR(capturedEntities) = [];
GVAR(capturedMarkers) = [];

// Camera
GVAR(availableModes) = [0];
GVAR(availableVisions) = [-2,-1,0,1];
GVAR(camDistance) = 10;
GVAR(camMode) = 0;
GVAR(camPan) = 0;
GVAR(camPos) = [];
GVAR(camSpeed) = [QGVAR(camSpeed), CAM_DEFAULT_SPEED] call CFUNC(loadSetting);
GVAR(camZoom) = [QGVAR(camZoom), CAM_DEFAULT_ZOOM] call CFUNC(loadSetting);
GVAR(camTilt) = -10;
GVAR(camUnit) = objNull;
GVAR(camVision) = -2;
GVAR(interrupts) = [];
GVAR(isSet) = false;
GVAR(camSlowDownInBuildings) = [QGVAR(camSlowDownInBuildings), true] call CFUNC(loadSetting);
GVAR(nightVisionEnabled) = false;
GVAR(preventCamHandler) = false;
GVAR(camLightOn) = false;
GVAR(camLight) = objNull;
GVAR(camLightIntensity) = [QGVAR(camLightIntensity), 20] call CFUNC(loadSetting);
GVAR(camPanSpeedCoef) = [QGVAR(camPanSpeedCoef), 1.5] call CFUNC(loadSetting);

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
GVAR(prepSurfaceSphere) = objNull;
GVAR(currentCursor) = "";
GVAR(isInputActive) = false;
GVAR(mapOpen) = false;
GVAR(isGameMaster) = false;
GVAR(debugPaneLines) = [];
GVAR(showDebugPanel) = [QGVAR(showDebugPanel), false] call CFUNC(loadSetting);

// Selection Box
GVAR(selectionBoxStartPos) = [];
GVAR(isSelectionBoxSpawned) = false;
GVAR(disableSelectionBox) = false;

// Icons
GVAR(serializedIcons) = [];
GVAR(serializedLines) = [];
GVAR(serializedMarkers) = [];
GVAR(groupIcons) = [];
GVAR(unitIcons) = [];
GVAR(markerIcons) = [];
GVAR(activeGroupIcon) = grpNull;
GVAR(hoveredMarker) = "";
GVAR(selectedMarkers) = [];
GVAR(iconHoverSize) = [QGVAR(iconHoverSize), ICON_HOVER_SIZE] call CFUNC(loadSetting);
GVAR(iconDrawDistance) = [QGVAR(iconDrawDistance), ICON_FADE_DISTANCE] call CFUNC(loadSetting);
GVAR(hoveringOverIcon) = false;
GVAR(hoveringOverGroupIcon) = false;
GVAR(showGroupIconCallsigns) = [QGVAR(showGroupIconCallsigns), true] call CFUNC(loadSetting);
GVAR(idcsIcons) = 1;

// Asset Browser
GVAR(serializedABData) = uiNamespace getVariable [QGVAR(serializedABData), []];
GVAR(tabs) = [];
GVAR(subtabs) = [];
GVAR(abCurrentTab) = 0;
GVAR(abCurrentMode) = 0;
GVAR(abCurrentSubmode) = 0;
GVAR(abActiveTree) = -1;
GVAR(abSelectedObject) = [];
GVAR(placeVehiclesWithCrew) = [QGVAR(placeVehiclesWithCrew), true] call CFUNC(loadSetting);

// Context Menu
GVAR(canContext) = true;
GVAR(allContextControls) = [];
GVAR(indexedContexts) = [];
GVAR(contextMenuOpen) = false;

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

// Server/HC FPS
GVAR(fps_server) = 0;

ADDON = true;
