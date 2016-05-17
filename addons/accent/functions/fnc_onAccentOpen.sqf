/*
 * Author: Kingsley
 * Handles the accent dialog
 *
 * Arguments:
 * 0: Display <DISPLAY>
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

disableSerialization;

params ["_display"];

_ctrlR = _display displayCtrl ACCENT_SLIDER_R;
_ctrlG = _display displayCtrl ACCENT_SLIDER_G;
_ctrlB = _display displayCtrl ACCENT_SLIDER_B;
_ctrlSave = _display displayCtrl ACCENT_BUTTON_SAVE;
_ctrlSample = _display displayCtrl ACCENT_SAMPLE;

{
    _x sliderSetRange [0, 1];
    _x sliderSetSpeed [0.1, 0.1];
} forEach [_ctrlR,_ctrlG,_ctrlB];

_pnR = profileNamespace getVariable ['MARS_ACCENT_R',COLOR_ACCENT_DEFAULT_R];
_pnG = profileNamespace getVariable ['MARS_ACCENT_G',COLOR_ACCENT_DEFAULT_G];
_pnB = profileNamespace getVariable ['MARS_ACCENT_B',COLOR_ACCENT_DEFAULT_B];

_ctrlR sliderSetPosition _pnR;
_ctrlG sliderSetPosition _pnG;
_ctrlB sliderSetPosition _pnB;

_ctrlSample ctrlSetBackgroundColor [_pnR,_pnG,_pnB,1];
_ctrlSample ctrlSetForegroundColor [_pnR,_pnG,_pnB,1];
