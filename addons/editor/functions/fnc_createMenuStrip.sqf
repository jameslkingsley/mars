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
 * [] call mars_editor_fnc_createMenuStrip;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

disableSerialization;

_components = "true" configClasses (configFile >> QGVARMAIN(menu));

if (count _components > 0) then {
    _axisX = safeZoneX;
    _maxNameCount = 0;

    {
        {
            _name = getText (_x >> "displayName");
            _count = count _name;
            if (_count > _maxNameCount) then {_maxNameCount = _count};
        } forEach ("true" configClasses (_x));
    } forEach _components;

    {
        private _menus = "true" configClasses (_x);
        _menus = _menus apply {[getText (_x >> "displayName"), _x]};
        _menus sort true;
        _menus = _menus apply {_x select 1};
        
        {
            _idc = 4600 + _forEachIndex;
            _displayName = getText (_x >> "displayName");
            _action = getText (_x >> "action");
            _children = "true" configClasses (_x);
            _nameCount = count _displayName;
            _padding = (pixelW * 6.5) * (sqrt _maxNameCount);
            _width = (_nameCount * (pixelW * 6.5)) + _padding;
            
            if (!isNil _action) then {
                _action = format ["_this call %1", _action];
            };
            
            _ctrl = _display ctrlCreate ["MARS_gui_menuTopBase", _idc];
            _ctrl ctrlSetPosition [_axisX, (0 * safeZoneH + safeZoneY), _width, MENUSTRIP_CONTEXT_HEIGHT];
            _ctrl ctrlSetText _displayName;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            
            _ctrl setVariable [QGVAR(display), _display];
            _ctrl setVariable [QGVAR(children), _children];
            
            _ctrl ctrlAddEventHandler ["MouseButtonDown", {
                GVAR(hasClickedOnMenuStrip) = true;
            }];
            
            _ctrl ctrlAddEventHandler ["MouseEnter", {
                if (GVAR(menuStripMenuOpen)) then {
                    [] call FUNC(closeMenuStripMenus);
                    _this call FUNC(onMenuStripClick);
                };
            }];
            
            if (count _children > 0) then {
                _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                    _this call FUNC(onMenuStripClick);
                }];
            } else {
                _ctrl ctrlAddEventHandler ["MouseButtonUp", QUOTE([true] call FUNC(closeMenuStripMenus);) + _action];
            };

            _axisX = _axisX + _width;
            GVAR(topNavControls) pushBack _idc;
        } forEach _menus;
    } forEach _components;
};
