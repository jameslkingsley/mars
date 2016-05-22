/*
 * Author: Kingsley
 * Resets accent color to default Mars red
 *
 * Arguments:
 * None
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

_display = findDisplay IDC_ACCENT_DISPLAY;
_ctrlR = _display displayCtrl IDC_ACCENT_SLIDER_R;
_ctrlG = _display displayCtrl IDC_ACCENT_SLIDER_G;
_ctrlB = _display displayCtrl IDC_ACCENT_SLIDER_B;
_ctrlSample = _display displayCtrl IDC_ACCENT_SAMPLE;

_ctrlR sliderSetPosition COLOR_DEFAULT_RGB_R;
_ctrlG sliderSetPosition COLOR_DEFAULT_RGB_G;
_ctrlB sliderSetPosition COLOR_DEFAULT_RGB_B;

profileNamespace setVariable ['MARS_ACCENT_R', COLOR_DEFAULT_RGB_R];
profileNamespace setVariable ['MARS_ACCENT_G', COLOR_DEFAULT_RGB_G];
profileNamespace setVariable ['MARS_ACCENT_B', COLOR_DEFAULT_RGB_B];

_ctrlSample ctrlSetBackgroundColor [COLOR_DEFAULT_RGBA];
_ctrlSample ctrlSetForegroundColor [COLOR_DEFAULT_RGBA];