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
#include "\z\mars\addons\common\macros.hpp"

BEGIN_COUNTER(updateIcons);

private _index = 0;

{
    private _ctrl = _x;
    private _object = _ctrl getVariable [QGVAR(object), objNull];

    if (!isNull _object) then {
        private _posAGLWorld = getPosVisual _object;
        private _posASLWorld = getPosASLVisual _object;
        private _posScreen = worldToScreen (ASLtoAGL _posASLWorld);

        if (!(_posScreen isEqualTo []) && {_posASLWorld distance GVAR(camPos) <= GVAR(iconDrawDistance)}) then {
            // In viewport
            private _hovered = _ctrl getVariable [QGVAR(hovered), false];
            private _dimensions = _ctrl getVariable [QGVAR(dimensions), [5 * GRID_W, 5 * GRID_H]];
            private _color = _ctrl getVariable [QGVAR(color), [0,0,0,1]];

            _posScreen params ["_psX", "_psY"];
            _dimensions params ["_sizeW", "_sizeH"];

            _ctrl ctrlEnable true;
            _ctrl ctrlShow true;

            _ctrl ctrlSetPosition [
                // Subtract safezones since control is inside
                // the mouse handler controls group
                (_psX - (_sizeW / 2)) - safeZoneX,
                (_psY - (_sizeH / 2)) - safeZoneY
            ];

            _ctrl ctrlCommit 0;
            _ctrl ctrlSetTextColor _color;
        } else {
            // Not in viewport
            _ctrl ctrlEnable false;
            _ctrl ctrlShow false;
        };
    } else {
        // Object no longer exists
        ctrlDelete _ctrl;
        private _currentControls = GETUVAR(GVAR(iconControls), []);
        _currentControls deleteAt _index;
        SETUVAR(GVAR(iconControls), _currentControls);
    };

    _ctrl ctrlCommit 0;

    INC(_index);

    false
} count GETUVAR(GVAR(iconControls), []);

END_COUNTER(updateIcons);
