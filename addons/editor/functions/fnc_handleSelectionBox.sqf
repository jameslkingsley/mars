/*
 * Author: Kingsley
 * Handles the selection box
 *
 * Arguments:
 * 0: Mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_mode", "init", [""]]];

switch (_mode) do {
    case "init": {
        private _display = GETUVAR(GVAR(interface),displayNull);
        private _ctrl = _display ctrlCreate ["MARS_gui_ctrlStaticSelectionBox", IDC_SELBOX];
        
        _ctrl ctrlSetPosition [GVAR(mousePos) select 0, GVAR(mousePos) select 1, 0, 0];
        _ctrl ctrlCommit 0;
        
        GVAR(selectionBoxStartPos) = GVAR(mousePos);
        GVAR(isSelectionBoxSpawned) = true;
    };
    case "update": {
        GVAR(mousePos) params ["_mouseX", "_mouseY"];
        GVAR(selectionBoxStartPos) params ["_startX", "_startY"];

        private _display = GETUVAR(GVAR(interface),displayNull);
        private _ctrl = _display displayCtrl IDC_SELBOX;

        _ctrl ctrlSetPosition [
            _mouseX min _startX,
            _mouseY min _startY,
            abs (_mouseX - _startX),
            abs (_mouseY - _startY)
        ];

        _ctrl ctrlCommit 0;
    };
    case "end": {
        private _display = GETUVAR(GVAR(interface), displayNull);
        private _ctrl = _display displayCtrl IDC_SELBOX;
        private _boxPos = ctrlPosition _ctrl;
        
        private _boxCenter = [
            ((_boxPos select 0) + ((_boxPos select 2) / 2)),
            ((_boxPos select 1) + ((_boxPos select 3) / 2))
        ];
        
        ctrlDelete _ctrl;
        
        GVAR(selection) = [];
        GVAR(selectedMarkers) = [];
        GVAR(hoveredMarker) = "";
        
        {
            private _object = _x getVariable [QGVAR(object), objNull];
            private _group = _x getVariable [QGVAR(group), grpNull];

            if (!isNull _group) then {
                {GVAR(selection) pushBack (vehicle _x);false} count units _group;
            };

            GVAR(selection) pushBack (vehicle _object);
            
            false
        } count (GETUVAR(GVAR(iconControls), []) select {
            private _ctrl = _x;
            private _object = _ctrl getVariable [QGVAR(object), objNull];
            private _offset = _ctrl getVariable [QGVAR(offset), [0,0,0]];
            private _posASLWorld = (getPosASLVisual _object) vectorAdd _offset;
            private _posScreen = worldToScreen (ASLtoAGL _posASLWorld);

            !(_posScreen isEqualTo []) &&
            {(_ctrl getVariable [QGVAR(eligibleForSelection), false])} &&
            {(_posScreen inArea [
                _boxCenter,
                ((_boxPos select 2) / 2),
                ((_boxPos select 3) / 2),
                0,
                true
            ])}
        });
        
        GVAR(selectionBoxStartPos) = [];
        GVAR(isSelectionBoxSpawned) = false;
    };
};
