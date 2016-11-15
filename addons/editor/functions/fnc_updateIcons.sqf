/*
 * Author: Kingsley
 * Updates icon controls
 * Runs every frame
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_updateIcons;
 *
 * Public: No
 */

#include "script_component.hpp"

{
    private _ctrl = _x;
    private _object = _ctrl getVariable [QGVAR(object), objNull];
    private _hovered = _ctrl getVariable [QGVAR(hovered), false];

    if (!isNull _object) then {
        private _posAGLWorld = getPosVisual _object;
        private _posScreen = worldToScreen _posAGLWorld;

        if !(_posScreen isEqualTo []) then {
            // In viewport
            _ctrl ctrlEnable true;
            _ctrl ctrlShow true;
            _ctrl ctrlSetPosition _posScreen;
            _ctrl ctrlCommit 0;

            if (_hovered) then {
                _ctrl ctrlSetTextColor [0,0,1,1];
            } else {
                _ctrl ctrlSetTextColor [1,0,0,1];
            };
        } else {
            // Not in viewport
            _ctrl ctrlEnable false;
            _ctrl ctrlShow false;
        };
    } else {
        // Object no longer exists
        ctrlDelete _ctrl;
    };

    _ctrl ctrlCommit ([0, 0.1] select _hovered);

    false
} count GETUVAR(GVAR(iconControls), []);
