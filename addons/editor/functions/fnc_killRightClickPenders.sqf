/*
 * Author: Kingsley
 * Kills the right-click "penders" - handlers that require right-click to end
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_killRightClickPenders;
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(abSelectedObject) = [];
deleteVehicle GVAR(prepSurfaceSphere);
GVAR(prepSurfaceSphere) = objNull;
[] call FUNC(clearABSelection);

if (!isNil QGVAR(contextPosLinePFH)) then {
    [GVAR(contextPosLinePFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(contextMenuOpen) = false;
    GVAR(isWaitingForLeftClick) = false;
};
