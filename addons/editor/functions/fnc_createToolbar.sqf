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

GVAR(toolbarControlWatches) = [];

private _components = "true" configClasses (configFile >> QGVARMAIN(toolbar));

if (count _components > 0) then {
    private _componentIndex = 0;
    private _previousX = 0;
    private _isFirst = true;
    
    {
        _children = "true" configClasses (_x);
        _componentIndex = _forEachIndex;
        
        {
            private _idc = parseNumber (format ["4700%1%2", _componentIndex, _forEachIndex]);
            private _tooltipText = getText (_x >> "tooltipText");
            private _iconOn = getText (_x >> "iconOn");
            private _iconOff = getText (_x >> "iconOff");
            private _action = getText (_x >> "action");
            private _watch = getText (_x >> "watch");
            private _default = if (isText (_x >> "default")) then {call compile getText (_x >> "default")} else {getNumber (_x >> "default")};
            private _defaultBool = [false,true] select _default;
            private _toggle = [getNumber (_x >> "toggle"), 1] select (isNull (_x >> "toggle"));
            private _toggleBool = [false,true] select _toggle;
            
            private _ctrl = _display ctrlCreate ["MARS_gui_ctrlButtonToolbar", _idc, (_display displayCtrl IDC_TOOLBAR_ITEMS)];
            
            private _modX = [GRID_TOOLBAR_W, -(0.75 * GRID_W)] select _isFirst;
            if (_isFirst) then {_isFirst = false};
            
            private _xOffset = [GRID_W, 0] select _isFirst;
            
            private _pos = [
                _previousX + _modX + _xOffset,
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
            _ctrl setVariable [QGVAR(watch), _watch];
            
            if (_defaultBool) then {
                [_ctrl, true] call FUNC(onToolbarItemClick);
            };
            
            _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                params ["_control"];
                [_control] call FUNC(onToolbarItemClick);
            }];
            
            GVAR(toolbarControlWatches) pushBack _ctrl;
            
            _previousX = _previousX + _modX;
            _previousX = _previousX + _xOffset;
        } forEach _children;
    } forEach _components;
};

if (!isNil QGVAR(toolbarControlWatchHandler)) then {
    [GVAR(toolbarControlWatchHandler)] call CBA_fnc_removePerFrameHandler;
};

[{
    {
        private _control = _x;
        private _watch = _control getVariable [QGVAR(watch), ""];
        
        if (_watch != "") then {
            private _data = _control getVariable [QGVAR(toolbarItemData), []];
            if (count _data == 0) exitWith {};
            
            _data params ["_idc", "_tooltipText", "_iconOn", "_iconOff", "_action", "_default", "_status", "_isToggle"];
            
            private _state = call compile _watch;
            
            _control ctrlSetText ([_iconOff, _iconOn] select _state);
            _data set [6, _state];
            _control setVariable [QGVAR(toolbarItemData), _data];
        };
        
        false
    } count GVAR(toolbarControlWatches);
}, 0.1, []] call CBA_fnc_addPerFrameHandler;