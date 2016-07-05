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

if (!isNil QGVAR(drawingMissionEH)) then {
    removeMissionEventHandler ["Draw3D", GVAR(drawingMissionEH)];
    GVAR(drawingMissionEH) = nil;
};

if (!isNil QGVAR(serializeDrawingHandle)) then {
    terminate GVAR(serializeDrawingHandle);
    GVAR(serializeDrawingHandle) = nil;
};

GVAR(pfhArray) = [];