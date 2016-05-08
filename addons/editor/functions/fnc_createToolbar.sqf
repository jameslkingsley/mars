/*
 * Author: Kingsley
 * Redraws the top navigation bar menus
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

params ["_display"];

disableSerialization;

_components = "true" configClasses (configFile >> QGVARMAIN(toolbar));

if (count _components > 0) then {
    _axisX = (0 * safeZoneW) + safeZoneX;
    _maxNameCount = 0;

    {
        {
            _name = getText (_x >> "displayName");
            _count = count _name;
            if (_count > _maxNameCount) then {_maxNameCount = _count};
        } forEach ("true" configClasses (_x));
    } forEach _components;

    {
        {
            _idc = 4600 + _forEachIndex;
            _displayName = getText (_x >> "displayName");
            _action = getText (_x >> "action");
            _children = "true" configClasses (_x);
            _nameCount = count _displayName;
            _padding = (pixelW * 8) * (sqrt _maxNameCount);
            _width = (_nameCount * (pixelW * 8)) + _padding;
            
            _ctrl = _display ctrlCreate ["MARS_gui_menuTopBase", _idc];
            _ctrl ctrlSetPosition [_axisX, (0 * safeZoneH + safeZoneY), _width, MENU_HEIGHT];
            _ctrl ctrlSetText _displayName;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            
            _ctrl setVariable [QGVAR(display), _display];
            _ctrl setVariable [QGVAR(children), _children];
            
            if (count _children > 0) then {
                _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                    params ["_control","_button","_cordX","_cordY","_shift","_ctrl","_alt"];
                    if (_button != 0) exitWith {};
                    
                    _children = _control getVariable [QGVAR(children), []];
                    if (count _children <= 0) exitWith {};
                    
                    _display = _control getVariable [QGVAR(display), displayNull];
                    if (isNull _display) exitWith {};

                    {
                        _idc = 46000 + _forEachIndex;
                        _displayName = getText (_x >> "displayName");
                        _action = getText (_x >> "action");
                        _axisY = (_cordY + MENU_HEIGHT) * (_forEachIndex min 1);
                        
                        _ctrl = _display ctrlCreate ["MARS_gui_contextBase", _idc];
                        _ctrl ctrlSetPosition [_cordX, _axisY, TOOLBAR_CONTEXT_WIDTH, TOOLBAR_CONTEXT_HEIGHT];
                        _ctrl ctrlSetText _displayName;
                        _ctrl ctrlShow true;
                        _ctrl ctrlCommit 0;
                    } forEach _children;
                }];
            } else {
                _ctrl ctrlAddEventHandler ["MouseButtonUp", _action];
            };

            _axisX = _axisX + _width;
            GVAR(topNavControls) pushBack _idc;
        } forEach ("true" configClasses (_x));
    } forEach _components;
};
