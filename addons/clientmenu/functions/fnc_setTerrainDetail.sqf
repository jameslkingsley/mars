/*
 * Author: Kingsley
 * Sets the terrain detail
 *
 * Arguments:
 * 0: Terrain grid detail <SCALAR>
 *
 * Return Value:
 * None
 *
 * Example:
 * [6.25] call mars_clientmenu_fnc_setTerrainDetail;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_detail"];

setTerrainGrid _detail;

GVAR(terrainDetail) = _detail;

profileNamespace setVariable [QGVAR(terrainDetail), _detail];
saveProfileNamespace;