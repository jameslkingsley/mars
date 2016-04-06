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

GVAR(selectionDirPFH) = [{
    _worldPos = AGLtoASL screenToWorld GVAR(mousePos);
    
    {
        if (!isPlayer _x) then {
            _dir = [(getPosASLVisual _x), _worldPos] call BIS_fnc_dirTo;
            _x setFormDir _dir;
            _x setDir _dir;
        };
        
        false
    } count GVAR(selection);
}, 0, []] call CBA_fnc_addPerFrameHandler;