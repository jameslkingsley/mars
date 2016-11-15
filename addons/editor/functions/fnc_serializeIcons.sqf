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

BEGIN_COUNTER(serializeIcons);

disableSerialization;

params [["_display", displayNull, [displayNull]]];

{
    private _object = _x;
    private _color = [side group _object] call CFUNC(getSideColor);
    private _controls = [_object] call FUNC(getObjectIconControls);
    private _existingControls = GETUVAR(GVAR(iconControls), []);
    private _idcIndex = (count _existingControls) + 1;
    private _idc = IDC_ICONCONTROL_PREFIX + _idcIndex;

    _object setVariable [QGVAR(color), _color];

    if !(_controls isEqualTo []) then {
        // Controls exist
    } else {
        // Controls don't exist
        private _ctrl = _display ctrlCreate ["MARS_gui_ctrlUnitButton", _idc, (_display displayCtrl IDC_MOUSEHANDLER)];
        private _dimensions = [5 * GRID_W, 5 * GRID_H];

        _ctrl ctrlSetPosition [0, 0, _dimensions select 0, _dimensions select 1];
        _ctrl ctrlCommit 0;

        _ctrl setVariable [QGVAR(object), _object];
        _ctrl setVariable [QGVAR(dimensions), _dimensions];
        _ctrl setVariable [QGVAR(color), _color];

        _ctrl ctrlAddEventHandler ["MouseEnter", {
            params ["_ctrl"];

            ["select"] call FUNC(setCursor);

            private _bbPFH = _ctrl getVariable [QGVAR(bbPFH), -1];
            [_bbPFH] call CBA_fnc_removePerFrameHandler;

            if (GVAR(bbOpen)) then {
                _bbPFH = [{
                    params ["_ctrl", "_handle"];

                    private _object = _ctrl getVariable [QGVAR(object), objNull];
                    private _color = _ctrl getVariable [QGVAR(color), [0,0,0,1]];

                    [_object, _color] call FUNC(drawBoundingBox);
                }, 0, _ctrl] call CBA_fnc_addPerFrameHandler;
            };

            _ctrl setVariable [QGVAR(bbPFH), _bbPFH];
            _ctrl setVariable [QGVAR(hovered), true];
        }];

        _ctrl ctrlAddEventHandler ["MouseExit", {
            params ["_ctrl"];

            [] call FUNC(setCursor);

            private _bbPFH = _ctrl getVariable [QGVAR(bbPFH), -1];
            [_bbPFH] call CBA_fnc_removePerFrameHandler;

            _ctrl setVariable [QGVAR(hovered), false];
        }];

        _ctrl ctrlAddEventHandler ["MouseButtonClick", {
            params ["_ctrl"];

            private _object = _ctrl getVariable [QGVAR(object), objNull];
            private _objPos = AGLtoASL ((getPos _object) vectorAdd [0, 0, 50]);
            private _delay = linearConversion [0, 5000, GVAR(camera) distance _object, 0.5, 2.5, true];

            GVAR(preventCamHandler) = true;
            GVAR(camera) camSetPos _objPos;
            GVAR(camera) camSetDir (GVAR(camPos) vectorFromTo _objPos);
            GVAR(camera) camCommit _delay;

            [{
                private _pitchBank = GVAR(camera) call BIS_fnc_getPitchBank;
                GVAR(camPos) = getPosASLVisual GVAR(camera);
                GVAR(camPan) = direction GVAR(camera);
                GVAR(camTilt) = _pitchBank select 0;
                GVAR(preventCamHandler) = false;
            }, [], _delay] call cba_fnc_waitAndExecute;
        }];

        _existingControls pushBack _ctrl;
        SETUVAR(GVAR(iconControls), _existingControls);
    };

    false
} count ((entities "All") select {
    !((worldToScreen (getPos _x)) isEqualTo []) &&
    {_x distance GVAR(camera) <= GVAR(iconDrawDistance)}
});

END_COUNTER(serializeIcons);
