/*
 * Author: Kingsley
 * Toggles the editor camera light
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_toggleLight;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (GVAR(camLightOn)) then {
    // Turn light off
    deleteVehicle GVAR(camLight);
    GVAR(camLightOn) = false;
} else {
    // Turn light on
    private _intensity = GVAR(camLightIntensity);
    private _light = "#lightpoint" createVehicleLocal (position GVAR(camera));
    _light setLightBrightness _intensity;
    _light setLightAmbient [1, 1, 1];
    _light setLightColor [0, 0, 0];
    _light lightAttachObject [GVAR(camera), [0, 0, -_intensity * 7]];
    GVAR(camLight) = _light;
    GVAR(camLightOn) = true;
};
