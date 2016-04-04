/*
 * Author: Kingsley
 * Executes the context menu option action
 *
 * Arguments:
 * 0: Action <CODE>
 * 1: Requires position <BOOL>
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

params ["_action","_requiresPosition"];

[] call FUNC(closeContextMenu);

if (_requiresPosition) then {
    GVAR(isWaitingForLeftClick) = true;
    
    GVAR(contextPosLinePFH) = [{
        params ["_selection"];
        _groups = [(_selection select 0)] call EFUNC(common,unitsToGroup);
        _worldPos = AGLtoASL (screenToWorld GVAR(mousePos));
        _worldPos set [2, 1];
        
        {
            _objectPos = ASLtoAGL (getPosASLVisual (leader _x));
            _objectPos set [2, ((_objectPos select 2) + 5)];
            
            // Do drawLine3D 50 times to make it thicker (cheers BIS)
            for "_i" from 0 to 50 do {
                drawLine3D [_objectPos, _worldPos, [0,0,0,1]];
            };
            
            false
        } count _groups;
        
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
    }, 0, [GVAR(selection)]] call CBA_fnc_addPerFrameHandler;
    
    [{GVAR(hasLeftClicked)}, {
        _worldPos = screenToWorld GVAR(mousePos);
        [(_this select 1), _worldPos] call compile (_this select 0);
        
        if (!isNil QGVAR(contextPosLinePFH)) then {
            [GVAR(contextPosLinePFH)] call CBA_fnc_removePerFrameHandler;
        };
        
        GVAR(hasLeftClicked) = false;
        GVAR(isWaitingForLeftClick) = false;
    }, [_action, GVAR(selection)]] call EFUNC(common,waitUntilAndExecute);
} else {
    [GVAR(selection)] call compile _action;
};