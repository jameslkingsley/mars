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

params ["_control","_button","_cordX","_cordY","_shift","_ctrl","_alt"];

if (_button != 0) exitWith {};

_children = _control getVariable [QGVAR(children), []];
if (count _children <= 0) exitWith {};

_display = _control getVariable [QGVAR(display), displayNull];
if (isNull _display) exitWith {};

[] call FUNC(closeToolbarMenus);

[{
    GVAR(hasClickedOnToolbar) = false;
}, []] call EFUNC(common,execNextFrame);

_parentPos = ctrlPosition _control;
_axisY = (_parentPos select 1) + TOOLBAR_CONTEXT_HEIGHT;

{
    _idc = 46000 + _forEachIndex;
    _displayName = getText (_x >> "displayName");
    _action = getText (_x >> "action");

    _childCtrl = _display ctrlCreate ["MARS_gui_toolbarContextBase", _idc];
    _childCtrl ctrlSetPosition [(_parentPos select 0), _axisY, TOOLBAR_CONTEXT_WIDTH, TOOLBAR_CONTEXT_HEIGHT];
    _childCtrl ctrlSetText (format["   %1 (%2)", _displayName, _axisY]);
    _childCtrl ctrlShow true;
    _childCtrl ctrlCommit 0;
    
    _childCtrl ctrlAddEventHandler ["MouseButtonDown", {
        GVAR(hasClickedOnToolbar) = true;
    }];
    
    _childCtrl ctrlAddEventHandler ["MouseButtonUp", QUOTE([true] call FUNC(closeToolbarMenus);) + _action];
    
    _axisY = _axisY + TOOLBAR_CONTEXT_HEIGHT;
    GVAR(allToolbarMenus) pushBack _idc;
} forEach _children;

GVAR(toolbarMenuOpen) = true;