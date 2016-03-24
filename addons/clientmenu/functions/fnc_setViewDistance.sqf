/*
 * Author: Kingsley
 * Sets the view distance
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

params ["_range"];

setViewDistance _range;

GVAR(viewDistance) = _range;

profileNamespace setVariable [QGVAR(viewDistance), _range];
saveProfileNamespace;