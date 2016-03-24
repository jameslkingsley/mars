/*
 * Author: Kingsley
 * Sets the terrain detail
 *
 * Arguments:
 * 0: Combo Box <CONTROL>
 * 1: Selection Index <SCALAR>
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

params ["_detail"];

setTerrainGrid _detail;

GVAR(terrainDetail) = _detail;

profileNamespace setVariable [QGVAR(terrainDetail), _detail];
saveProfileNamespace;