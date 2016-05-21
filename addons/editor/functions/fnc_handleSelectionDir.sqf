/*
 * Author: Kingsley
 * Handles direction of objects in selection
 *
 * Arguments:
 * None
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

if (count GVAR(selection) == 0) then {
    GVAR(selection) = [([] call FUNC(objectUnderCursor))];
};

GVAR(selectionDirPFH) = [{
    _worldPos = AGLtoASL screenToWorld GVAR(mousePos);
    
    {
        if (!isPlayer _x) then {
            _dir = (getPosASLVisual _x) getDir _worldPos;
            _x setFormDir _dir;
            _x setDir _dir;
        };
        
        false
    } count GVAR(selection);
}, 0, []] call CBA_fnc_addPerFrameHandler;