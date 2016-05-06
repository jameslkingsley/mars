/*
 * Author: Kingsley
 * Handles clicking a tab in the asset browser
 *
 * Arguments:
 * Whatever the event handler returns
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

// Remove all subtabs
{ctrlDelete (GETUVAR(GVAR(interface),displayNull) displayCtrl _x)} forEach GVAR(subtabs);

// Reset opacity of all tabs
{
    disableSerialization;
    private _control = (GETUVAR(GVAR(interface),displayNull) displayCtrl _x);
    _control ctrlSetFade DEFAULT_TAB_OPACITY;
    _control ctrlCommit 0;
} forEach GVAR(tabs);

_control ctrlSetFade 0;
_control ctrlCommit 0;

_config = _control getVariable [QGVAR(tabConfig), configNull];
_tabWH = _control getVariable [QGVAR(tabWH), 0];

if (!isNull _config) then {
    _subtabs = ("true" configClasses (_config >> "subtabs"));
    
    if (count _subtabs > 0) then {
        _subtabWH = (0.15 * safeZoneW) / (count _subtabs);
        
        {
            private _cfg = _x;
            private _idc = IDC_ASSETBROWSER_SUBTAB + _forEachIndex;
            private _displayName = getText (_cfg >> "displayName");
            private _tooltipText = getText (_cfg >> "tooltipText");
            private _icon = getText (_cfg >> "icon");
            
            private _subtab = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_tabBase", _idc];
            GVAR(subtabs) pushBackUnique _idc;
            
            _subtab ctrlSetText _icon;
            _subtab ctrlSetTooltip _tooltipText;
            
            _subtab setVariable [QGVAR(tabConfig), _cfg];
            
            _subtab ctrlSetPosition [
                (0.85 * safeZoneW + safeZoneX) + (_subtabWH * _forEachIndex),
                (0.07 * safeZoneH + safeZoneY) + _tabWH,
                _subtabWH,
                _subtabWH
            ];
            
            _subtab ctrlAddEventHandler ["MouseButtonDown", {_this call FUNC(onABSubtabClick)}];
            
            if (_forEachIndex == 0) then {
                [_subtab, 0] call FUNC(onABSubtabClick);
            };
            
            _subtab ctrlSetFade DEFAULT_TAB_OPACITY;
            _subtab ctrlCommit 0;
        } forEach _subtabs;
    };
};
