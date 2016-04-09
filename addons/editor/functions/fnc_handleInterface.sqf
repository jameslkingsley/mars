/*
 * Author: ACE3 Project, Kingsley
 * Handles editor interface events
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event arguments <ANY>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * ["onLoad",_this] call mars_editor_fnc_handleInterface
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_mode",["_args",[]]];

switch (toLower _mode) do {
    case "onload": {
        _args params ["_display"];
        SETUVAR(GVAR(interface),_display);
        // Start the entity list handler
        [] call FUNC(createEntityList);
    };
    case "onunload": {
        // Kill GUI PFHs
        GVAR(camHandler) = nil;

        // Reset variables
        GVAR(camBoom) = 0;
        GVAR(camDolly) = [0,0];
        GVAR(ctrlKey) = false;
        GVAR(heldKeys) = [];
        GVAR(heldKeys) resize 255;
        GVAR(mouse) = [false,false];
        GVAR(mousePos) = [0.5,0.5];
    };
    case "onmousebuttondown": {
        _args params ["_ctrl","_button"];
        GVAR(mouse) set [_button,true];
        
        if ((_button == 0) && GVAR(shiftKey)) then {
            [] call FUNC(handleSelectionDir);
        };

        // Detect right click
        if ((_button == 1) && (GVAR(camMode) == 1)) then {
            // In first person toggle sights mode
            [] call FUNC(transitionCamera);
        };
    };
    case "onmousebuttonup": {
        _args params ["_ctrl","_button"];
        
        if (!isNil QGVAR(selectionDirPFH)) then {
            [GVAR(selectionDirPFH)] call CBA_fnc_removePerFrameHandler;
        };

        GVAR(mouse) set [_button,false];
        [] call FUNC(closeContextMenu);
        
        if (_button == 0) then {
            GVAR(camDolly) = [0,0];
            if (GVAR(isWaitingForLeftClick)) then {GVAR(hasLeftClicked) = true;};
            //[false] call FUNC(handleLeftDrag);
        };
        
        if (_button == 0 && GVAR(canContext)) then {
            [] call FUNC(selectObject);
        };
        
        if (_button == 1 && GVAR(canContext)) then {
            [] call FUNC(selectObject);
            [] call FUNC(handleContextMenu);
            
            if (!isNil QGVAR(contextPosLinePFH)) then {
                [GVAR(contextPosLinePFH)] call CBA_fnc_removePerFrameHandler;
            };
        };
    };
    case "onmousezchanged": {
        _args params ["_ctrl","_zChange"];
    };
    case "onmousemoving": {
        _args params ["_ctrl","_x","_y"];
        
        if (GVAR(mouse) select 1) then {
            GVAR(canContext) = false;
        };
        
        if (GVAR(mouse) select 0) then {
            //[true] call FUNC(handleLeftDrag);
        };
        
        [_x,_y] call FUNC(handleMouse);
    };
    case "onmouseholding": {
        _args params ["_ctrl","_x","_y"];
        if !(GVAR(mouse) select 1) then {
            GVAR(canContext) = true;
        };
    };
    case "onkeydown": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];
        
        if (!GVAR(shiftKey)) then {GVAR(shiftKey) = true};

        // Handle held keys (prevent repeat calling)
        if (GVAR(heldKeys) param [_dik,false]) exitWith {};
        // Exclude movement/adjustment keys so that speed can be adjusted on fly
        if !(_dik in [16,17,30,31,32,44,74,78]) then {
            GVAR(heldKeys) set [_dik,true];
        };

        switch (_dik) do {
            case 1: { // Esc
                //[QGVAR(escape)] call FUNC(interrupt);
                //["escape"] call FUNC(handleInterface);
                [] call FUNC(shutdown);
            };
            case 211: { // Delete
                [] call FUNC(deleteSelection);
            };
            case 2: { // 1
            };
            case 3: { // 2
            };
            case 4: { // 3
            };
            case 5: { // 4
            };
            case 6: { // 5
            };
            case 14: { // Backspace
            };
            case 16: { // Q
                GVAR(camBoom) = 0.5 * GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift);
            };
            case 17: { // W
                GVAR(camDolly) set [1, GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift)];
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = true;
            };
            case 30: { // A
                GVAR(camDolly) set [0, -GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift)];
            };
            case 31: { // S
                GVAR(camDolly) set [1, -GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift)];
            };
            case 32: { // D
                GVAR(camDolly) set [0, GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift)];
            };
            case 44: { // Z
                GVAR(camBoom) = -0.5 * GVAR(camSpeed) * ([1, CAM_SHIFT_SPEED_COEF] select _shift);
            };
            case 49: { // N
            };
            case 50: { // M
            };
            case 57: { // Spacebar
            };
            case 74: { // Num -
            };
            case 78: { // Num +
            };
            case 200: { // Up arrow
            };
            case 203: { // Left arrow
            };
            case 205: { // Right arrow
            };
            case 208: { // Down arrow
            };
        };

        true
    };
    case "onkeyup": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];
        
        if (!isNil QGVAR(selectionDirPFH)) then {
            [GVAR(selectionDirPFH)] call CBA_fnc_removePerFrameHandler;
        };
        
        if (GVAR(shiftKey)) then {GVAR(shiftKey) = false};

        // No longer being held
        GVAR(heldKeys) set [_dik,nil];

        switch (_dik) do {
            case 16: { // Q
                GVAR(camBoom) = 0;
            };
            case 17: { // W
                GVAR(camDolly) set [1, 0];
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = false;
            };
            case 30: { // A
                GVAR(camDolly) set [0, 0];
            };
            case 31: { // S
                GVAR(camDolly) set [1, 0];
            };
            case 32: { // D
                GVAR(camDolly) set [0, 0];
            };
            case 44: { // Z
                GVAR(camBoom) = 0;
            };
        };

        true
    };
    case "onmapclick": {
        _args params ["_map","_button","_x","_y","_shift","_ctrl","_alt"];
    };
    case "escape": {
    };
};
