/*
 * Author: Kingsley
 * Toggles the ability to edit player units/vehicles
 *
 * Arguments:
 * 0: Enabled (true = on, false = off) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call mars_editor_fnc_toggleEditPlayers;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_enabled", false, [false]]];

GVAR(editPlayers) = _enabled;
