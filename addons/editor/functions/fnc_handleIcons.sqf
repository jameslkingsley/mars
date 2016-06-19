/*
 * Author: Kingsley
 * Handles object icons in 3D space
 * This function is called on every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_handleIcons;
 *
 * Public: No
 */

#include "script_component.hpp"

BEGIN_COUNTER(iconHandler);

_camPosASL = AGLtoASL GVAR(camPos);

{
    _x params ["_object", "_icon", "_color", ["_zOffset", 0], ["_shadow", 1]];

    private _pos = (getPosASLVisual _object) vectorAdd [0, 0, _zOffset];
    private _alpha = linearConversion [0, GVAR(iconDrawDistance), (_pos distance _camPosASL), 1, 0, true];
    _color set [3, _alpha];

    drawIcon3D [
        _icon,
        _color,
        ASLtoAGL _pos,
        1,
        1,
        0,
        "",
        _shadow,
        0.031
    ];

    false
} count GVAR(serializedIcons);

END_COUNTER(iconHandler);
