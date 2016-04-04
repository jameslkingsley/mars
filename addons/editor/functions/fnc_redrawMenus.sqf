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
 * [] call mars_editor_fnc_redrawMenus;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

disableSerialization;

if (count GVAR(topNavControls) > 0) then {
    {
        if (!isNull (_display displayCtrl _x)) then {
            _deleted = ctrlDelete (_display displayCtrl _x);
            if (!_deleted) then {
                MARS_LOGERROR_1("Menu failed to delete - supplied array:", GVAR(topNavControls));
            };
        };
        false
    } count GVAR(topNavControls);
};

_components = "true" configClasses (configFile >> QGVARMAIN(Toolbar));

if (count _components > 0) then {
    _menuWidth = safeZoneW / (count _components);
    _axisX = 0 * safeZoneW + safeZoneX;

    {
        {
            _idc = 2000 + _forEachIndex;
            _displayName = getText (_x >> "displayName");
            _action = getText (_x >> "action");
            
            _ctrl = _display ctrlCreate ["MARS_gui_menuBase", _idc];
            _ctrl ctrlSetPosition [_axisX, (0 * safeZoneH + safeZoneY), _menuWidth, MENU_HEIGHT];
            _ctrl ctrlSetText _displayName;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            _ctrl ctrlAddEventHandler ["MouseButtonUp", _action];
            _axisX = _axisX + _menuWidth;
            GVAR(topNavControls) pushBack _idc;
        } forEach ("true" configClasses (_x));
    } forEach _components;
};
