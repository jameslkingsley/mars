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

    {
        {
            _idc = 4600 + _forEachIndex;
            _displayName = getText (_x >> "displayName");
            _action = getText (_x >> "action");
            _width = safeZoneW / ((count _displayName) - 0);
            _axisX = _axisX + (_width * (_forEachIndex max 1));
            
            _ctrl = _display ctrlCreate ["MARS_gui_menuBase", _idc];
            _ctrl ctrlSetPosition [_axisX, (0 * safeZoneH + safeZoneY), _width, MENU_HEIGHT];
            _ctrl ctrlSetText _displayName;
            _ctrl ctrlShow true;
            _ctrl ctrlCommit 0;
            _ctrl ctrlAddEventHandler ["MouseButtonUp", _action];
            GVAR(topNavControls) pushBack _idc;
        } forEach ("true" configClasses (_x));
    } forEach _components;
};
