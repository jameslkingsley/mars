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
 * [] call mars_editor_fnc_handleSelectionDir;
 *
 * Public: No
 */

#include "script_component.hpp"

if ((GVAR(mouse) select 0) && GVAR(shiftKey) && !GVAR(ctrlKey)) then {
    if (count GVAR(selection) == 0) then {
        GVAR(selection) = [([] call FUNC(objectUnderCursor))];
    };

    _worldPos = AGLtoASL screenToWorld GVAR(mousePos);

    {
        if (!isPlayer _x) then {
            _dir = (getPosASLVisual _x) getDir _worldPos;
            _x setFormDir _dir;
            _x setDir _dir;
        };

        false
    } count GVAR(selection);
};