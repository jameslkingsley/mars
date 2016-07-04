/*
 * Author: Kingsley
 * Handles clicking a context menu item
 *
 * Arguments:
 * 0: Action <STRING>
 * 1: Requires position? <BOOL>
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

params [["_action", ""], ["_requiresPosition", false], ["_preAction", ""]];

if (!isNil _action) then {
    _action = format ["_this call %1", _action];
};

if (!isNil _preAction) then {
    _preAction = format ["_this call %1", _preAction];
};

[] call FUNC(closeContextMenu);
[GVAR(selection)] call compile _preAction;

if (_requiresPosition) then {
    GVAR(hasLeftClicked) = false;
    GVAR(isWaitingForLeftClick) = true;
    
    GVAR(contextPosLinePFH) = [{
        params ["_args","_handle"];
        _args params ["_selection","_action"];
        
        if (GVAR(hasLeftClicked)) exitWith {
            _worldPos = [] call FUNC(getSurfaceUnderCursor);
            [_selection, _worldPos] call compile _action;
            
            [_handle] call CBA_fnc_removePerFrameHandler;
            
            GVAR(hasLeftClicked) = false;
            GVAR(isWaitingForLeftClick) = false;
        };
        
        _groups = [_selection] call CFUNC(unitsToGroups);
        _worldPos = ASLtoAGL ([] call FUNC(getSurfaceUnderCursor));
        
        {
            _leader = leader _x;
            _objectPos = ASLtoAGL (getPosASLVisual _leader);
            _objectPos = _objectPos vectorAdd [0, 0, ((_leader selectionPosition "pelvis") param [2, 1])];
            
            // Do drawLine3D 50 times to make it thicker (cheers BIS)
            for "_i" from 0 to 50 do {
                drawLine3D [_objectPos, _worldPos, [0,0,0,1]];
            };
            
            false
        } count (_groups select {
            !((getPosASLVisual leader _x) isEqualTo [0,0,0])
        });
        
        drawIcon3D [
            "\A3\ui_f\data\map\groupicons\waypoint.paa",
            [0,0,0,1],
            _worldPos,
            1,
            1,
            0,
            "",
            2,
            0.03,
            "PuristaBold",
            "center"
        ];
    }, 0, [GVAR(selection), _action]] call CBA_fnc_addPerFrameHandler;
} else {
    [GVAR(selection)] call compile _action;
};