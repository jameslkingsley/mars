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

#define GRID_W (pixelW * pixelScale * pixelGrid)
#define GRID_H (pixelH * pixelScale * pixelGrid)

_components = "true" configClasses (configFile >> QGVARMAIN(toolbar));

if (count _components > 0) then {
    _componentIndex = 0;
    
    {
        _children = "true" configClasses (_x);
        _componentIndex = _forEachIndex;
        
        {
            _idc = parseNumber (format ["4700%1%2", _componentIndex, _forEachIndex]);
            _tooltipText = getText (_x >> "tooltipText");
            _iconOn = getText (_x >> "iconOn");
            _iconOff = getText (_x >> "iconOff");
            _action = getText (_x >> "action");
            _default = getNumber (_x >> "default");
            _defaultBool = [false,true] select _default;
            _toggle = [getNumber (_x >> "toggle"), 1] select (isNull (_x >> "toggle"));
            _toggleBool = [false,true] select _toggle;
            
            _ctrl = _display ctrlCreate ["MARS_gui_ctrlButtonToolbar", _idc, (_display displayCtrl IDC_TOOLBAR_ITEMS)];
            
            _pos = [
                ((_forEachIndex * GRID_TOOLBAR_W) + (_componentIndex * GRID_TOOLBAR_W)),
                0,
                GRID_TOOLBAR_W,
                GRID_TOOLBAR_H
            ];
            
            _ctrl ctrlSetPosition _pos;
            
            _ctrl ctrlSetText ([_iconOff, _iconOn] select _default);
            _ctrl ctrlSetTooltip _tooltipText;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            
            _ctrl setVariable [QGVAR(toolbarItemData), [_idc, _tooltipText, _iconOn, _iconOff, _action, _default, _defaultBool, _toggleBool]];
            
            if (_defaultBool) then {
                [_ctrl, true] call FUNC(onToolbarItemClick);
            };
            
            _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                params ["_control"];
                [_control] call FUNC(onToolbarItemClick);
            }];
        } forEach _children;
    } forEach _components;
};
