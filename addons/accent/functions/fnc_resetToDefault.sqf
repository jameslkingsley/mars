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

_display = findDisplay ACCENT_DISPLAY;
_ctrlR = _display displayCtrl ACCENT_SLIDER_R;
_ctrlG = _display displayCtrl ACCENT_SLIDER_G;
_ctrlB = _display displayCtrl ACCENT_SLIDER_B;
_ctrlSample = _display displayCtrl ACCENT_SAMPLE;

_ctrlR sliderSetPosition COLOR_ACCENT_DEFAULT_R;
_ctrlG sliderSetPosition COLOR_ACCENT_DEFAULT_G;
_ctrlB sliderSetPosition COLOR_ACCENT_DEFAULT_B;

profileNamespace setVariable ['MARS_ACCENT_R', COLOR_ACCENT_DEFAULT_R];
profileNamespace setVariable ['MARS_ACCENT_G', COLOR_ACCENT_DEFAULT_G];
profileNamespace setVariable ['MARS_ACCENT_B', COLOR_ACCENT_DEFAULT_B];

_ctrlSample ctrlSetBackgroundColor [COLOR_ACCENT_DEFAULT_RGBA];
_ctrlSample ctrlSetForegroundColor [COLOR_ACCENT_DEFAULT_RGBA];