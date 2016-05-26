/*
 * Author: Kingsley
 * Handles clicking toolbar menu
 *
 * Arguments:
 * 0: Control <CONTROL>
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

params ["_control", "_button", "_cordX", "_cordY", "_shift", "_ctrl", "_alt"];

if (_button != 0) exitWith {};

_children = GETVAR(_control,GVAR(children),[]);
if (_children isEqualTo []) exitWith {};

_display = GETVAR(_control,GVAR(display),displayNull);
if (isNull _display) exitWith {};

[] call FUNC(closeMenuStripMenus);

[{
    GVAR(hasClickedOnMenuStrip) = false;
}, []] call EFUNC(common,execNextFrame);

_parentPos = ctrlPosition _control;
_axisY = (_parentPos select 1) + MENUSTRIP_CONTEXT_HEIGHT;
_prevPosYH = [_parentPos select 1, MENUSTRIP_CONTEXT_HEIGHT];

_idc = 46000;

{
    _displayName = getText (_x >> "displayName");
    _action = getText (_x >> "action");

    _childCtrl = _display ctrlCreate ["MARS_gui_toolbarContextBase", _idc];
    _childCtrl ctrlSetPosition [_parentPos select 0, (_prevPosYH select 0) + (_prevPosYH select 1) - pixelH, MENUSTRIP_CONTEXT_WIDTH, MENUSTRIP_CONTEXT_HEIGHT];
    _childCtrl ctrlSetText (format [" %1", _displayName]);
    _childCtrl ctrlShow true;
    _childCtrl ctrlCommit 0;

    _childCtrl ctrlAddEventHandler ["MouseButtonDown", {
        GVAR(hasClickedOnMenuStrip) = true;
    }];

    _childCtrl ctrlAddEventHandler ["MouseButtonUp", QUOTE([true] call FUNC(closeMenuStripMenus);) + _action];

    _ctrlPos = ctrlPosition _childCtrl;
    _prevPosYH = [_ctrlPos select 1, _ctrlPos select 3];

    ADD(_axisY,MENUSTRIP_CONTEXT_HEIGHT);
    GVAR(allMenuStripMenus) pushBack _idc;

    INC(_idc);

    false
} count _children;

GVAR(menuStripMenuOpen) = true;
