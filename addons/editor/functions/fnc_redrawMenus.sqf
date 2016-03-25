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
                [QCOMPONENT, format["Menu failed to delete - supplied array: %1", GVAR(topNavControls)]] call EFUNC(common,log);
            };
        };
    } forEach GVAR(topNavControls);
};

if (count GVAR(menus) > 0) then {
    _menuWidth = safeZoneW / (count GVAR(menus));
	_axisX = 0 * safeZoneW + safeZoneX;
	
    {
        _index = _x select 0;
        _displayName = _x select 1;
        _options = _x select 2;
        _idc = 1000 + _forEachIndex;
        
        _ctrl = _display ctrlCreate ["MARS_gui_menuBase", _idc];
        _ctrl ctrlSetPosition [_axisX, (0 * safeZoneH + safeZoneY), _menuWidth, MENU_HEIGHT];
        _ctrl ctrlSetText _displayName;
        _ctrl ctrlShow true;
        _ctrl ctrlCommit 0;
        
        _axisX = _axisX + _menuWidth;
        
        GVAR(topNavControls) pushBack _idc;
    } forEach GVAR(menus);
};
