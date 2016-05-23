/*
 * Author: Kingsley
 * Destroys the surface sphere
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_destroySurfaceSphere;
 *
 * Public: Yes
 */

#include "script_component.hpp"

deleteVehicle GVAR(prepSurfaceSphere);
GVAR(prepSurfaceSphere) = objNull;