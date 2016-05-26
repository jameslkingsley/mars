/*
 * Author: Kingsley
 * Sets the view distance
 *
 * Arguments:
 * 0: View distance in meters <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5000] call mars_clientmenu_fnc_setViewDistance;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_range"];

setViewDistance _range;

GVAR(viewDistance) = _range;

SETPRVAR(GVAR(viewDistance),_range);
saveProfileNamespace;
