/*
 * Author: Kingsley
 * Kills all per-frame handlers associated with the editor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_killPerFrameHandlers;
 *
 * Public: No
 */

#include "script_component.hpp"

{[_x] call CBA_fnc_removePerFrameHandler} forEach GVAR(pfhArray);

if (!isNil QGVAR(serializeIconHandle)) then {
    terminate GVAR(serializeIconHandle);
    GVAR(serializeIconHandle) = nil;
};

if (!isNil QGVAR(draw3DEH)) then {
    removeMissionEventHandler ["Draw3D", GVAR(draw3DEH)];
    GVAR(draw3DEH) = nil;
};

GVAR(pfhArray) = [];