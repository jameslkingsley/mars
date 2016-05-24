/*
 * Author: Kingsley
 * Creates the toolbar controls
 *
 * Arguments:
 * 0: Editor's main display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_createToolbar;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_display", displayNull, [displayNull]]];

if (isNull _display) exitWith {};

_components = "true" configClasses (configFile >> QGVARMAIN(toolbar));

if (count _components > 0) then {
    {
        {
            _idc = 4700 + _forEachIndex;
            _tooltipText = getText (_x >> "tooltipText");
            _iconOn = getText (_x >> "iconOn");
            _iconOff = getText (_x >> "iconOff");
            _action = getText (_x >> "action");
            _default = getNumber (_x >> "default");
            _defaultBool = [false,true] select _default;
            
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlButtonToolbar", _idc, (_display displayCtrl IDC_TOOLBAR_ITEMS)];
            _ctrl ctrlSetPosition [
                (_forEachIndex * GRID_TOOLBAR_W),
                0,
                GRID_TOOLBAR_W,
                GRID_TOOLBAR_H
            ];
            
            _ctrl ctrlSetText ([_iconOff, _iconOn] select _default);
            _ctrl ctrlSetTooltip _tooltipText;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            ctrlSetFocus (_display displayCtrl IDC_MOUSEHANDLER);
            
            _ctrl setVariable [QGVAR(toolbarItemData), [_idc, _tooltipText, _iconOn, _iconOff, _action, _default, _defaultBool]];
            
            if (_defaultBool) then {
                [_ctrl, true] call FUNC(onToolbarItemClick);
            };
            
            _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                params ["_control"];
                [_control] call FUNC(onToolbarItemClick);
            }];
        } forEach ("true" configClasses (_x));
    } forEach _components;
};
