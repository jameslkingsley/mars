/*
 * Author: Kingsley
 * Handles changing the accent color
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Change <SCALAR>
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

params ["_control","_change"];

disableSerialization;

_display = findDisplay IDC_ACCENT_DISPLAY;
_ctrlR = _display displayCtrl IDC_ACCENT_SLIDER_R;
_ctrlG = _display displayCtrl IDC_ACCENT_SLIDER_G;
_ctrlB = _display displayCtrl IDC_ACCENT_SLIDER_B;
_ctrlSample = _display displayCtrl IDC_ACCENT_SAMPLE;

profileNamespace setVariable ['MARS_ACCENT_R', sliderPosition _ctrlR];
profileNamespace setVariable ['MARS_ACCENT_G', sliderPosition _ctrlG];
profileNamespace setVariable ['MARS_ACCENT_B', sliderPosition _ctrlB];

_ctrlSample ctrlSetBackgroundColor [sliderPosition _ctrlR, sliderPosition _ctrlG, sliderPosition _ctrlB, 1];
_ctrlSample ctrlSetForegroundColor [sliderPosition _ctrlR, sliderPosition _ctrlG, sliderPosition _ctrlB, 1];
