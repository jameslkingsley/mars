/*
 * Author: Kingsley
 * 
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 
 *
 * Example:
 * 
 *
 * Public: 
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
        private _display = GETUVAR(GVAR(interface),displayNull);
        private _ctrl = _display displayCtrl IDC_SELBOX;
        private _boxPos = ctrlPosition _ctrl;
        
        private _boxCenter = [
            ((_boxPos select 0) + ((_boxPos select 2) / 2)),
            ((_boxPos select 1) + ((_boxPos select 3) / 2))
        ];
        
        ctrlDelete _ctrl;
        
        private _allIcons = GVAR(groupIcons) + GVAR(unitIcons);
        
        if !(_allIcons isEqualTo []) then {
            GVAR(selection) = [];
            
            {
                _x params ["_posAGL", "_object"];
                
                if (_object isEqualType grpNull) then {
                    {GVAR(selection) pushBack vehicle _x;false} count (units _object);
                } else {
                    GVAR(selection) pushBack vehicle _object;
                };
                
                false
            } count (_allIcons select {
                _x params ["_posAGL", "_object"];
                
                private _screenPos = worldToScreen _posAGL;
                
                if (_screenPos isEqualTo []) then {false} else {
                    (_screenPos inArea [
                        _boxCenter,
                        ((_boxPos select 2) / 2),
                        ((_boxPos select 3) / 2),
                        0,
                        true
                    ])
                };
            });
        };
        
        GVAR(selectionBoxStartPos) = [];
        GVAR(isSelectionBoxSpawned) = false;
    };
};
