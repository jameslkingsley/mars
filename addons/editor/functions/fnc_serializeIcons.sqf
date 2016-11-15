/*
 * Author: Kingsley
 * Serializes object icons into controls
 * Runs in scheduled environment
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call mars_editor_fnc_serializeIcons;
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\z\mars\addons\common\macros.hpp"

disableSerialization;

params [["_display", displayNull, [displayNull]]];

{
    private _object = _x;
    private _controls = [_object] call FUNC(getObjectIconControls);
    private _existingControls = GETUVAR(GVAR(iconControls), []);
    private _idcIndex = (count _existingControls) + 1;
    private _idc = IDC_ICONCONTROL_PREFIX + _idcIndex;

    if !(_controls isEqualTo []) then {
        // Controls exist
    } else {
        // Controls don't exist
        private _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", _idc];

        _ctrl ctrlSetPosition [0, 0, 5 * GRID_W, 5 * GRID_H];

        _ctrl ctrlAddEventHandler ["MouseEnter", {
            params ["_ctrl"];
            _ctrl setVariable [QGVAR(hovered), true];
        }];

        _ctrl ctrlAddEventHandler ["MouseExit", {
            params ["_ctrl"];
            _ctrl setVariable [QGVAR(hovered), false];
        }];

        _ctrl ctrlCommit 0;

        _ctrl setVariable [QGVAR(object), _object];

        _existingControls pushBack _ctrl;
        SETUVAR(GVAR(iconControls), _existingControls);
    };

    false
} count (entities "All");
