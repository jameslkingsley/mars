/*
 * Author: Kingsley
 * Handles the editor control creation
 *
 * Arguments:
 * 0: The display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_onEditorOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

if (!ADDON) exitWith {};

[_display] call FUNC(redrawMenus);

GVAR(camera) = "camera" camCreate [(getPos player) select 0, (getPos player) select 1, 3];
GVAR(camera) cameraEffect ["External", "Back"];
GVAR(camera) camSetFov 1.2;
GVAR(camera) camCommit 0;

cameraEffectEnableHUD false;
showCinemaBorder false;

[{[] call FUNC(onFrame)}, 0, []] call CBA_fnc_addPerFrameHandler;

GVAR(cam_active) = true;