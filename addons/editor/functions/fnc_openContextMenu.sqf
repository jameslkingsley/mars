/*
 * Author: Kingsley
 * Handles a context menu for the given object(s)
 *
 * Arguments:
 * 0: Objects <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player]] call mars_editor_fnc_openContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_objects"];

systemChat str _objects;

disableSerialization;

{
    _item = _x;
    _index = _x select 0;
    _name = _x select 1;
    _condition = if ((_x select 2) == "") then {"true"} else {(_x select 2)};
    _code = _x select 3;
    _idc = 10000 + _forEachIndex;
    _hasChildren = if (typeName _code != "CODE") then {true} else {false};
    
    if (!_hasChildren) then {
        if !({_x call compile _condition} count _objects > 0) exitWith {};
    };
    
    _ctrl = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_menuBase", _idc];
    _text = if (_hasChildren) then {(format["%1...", _name])} else {_name};
    _ctrl ctrlSetText _text;
    _ctrl ctrlSetPosition [
        ((GVAR(mousePos) select 0)),
        ((GVAR(mousePos) select 1)) + (CONTEXT_OPTION_HEIGHT * _forEachIndex),
        CONTEXT_OPTION_WIDTH,
        CONTEXT_OPTION_HEIGHT
    ];
    
    [] call FUNC(closeChildContext);
    
    if (_hasChildren) then {
        GVAR(tempParentIDC) = _idc;
        
        _action = _ctrl ctrlAddEventHandler ["MouseEnter", {
            disableSerialization;
            params ["_ctrl"];

            {
                _objects = (_x select 2);
                _parentIndex = (_x select 3);
                _parentControl = _ctrl;

                if ((_x select 0) == GVAR(tempParentIDC)) exitWith {
                    {
                        private ["_item","_parent","_index","_name","_condition","_code","_idc","_ctrl"];
                        _item = _x;
                        _parent = _x select 0;
                        _index = _x select 1;
                        _name = _x select 2;
                        _condition = if ((_x select 3) == "") then {"true"} else {(_x select 3)};
                        _code = _x select 4;
                        _idc = 100000 + _forEachIndex;
                        
                        if (toLower _parent == toLower _parentIndex) then {
                            if !({_x call compile _condition} count _objects > 0) exitWith {};
                        };
                        
                        _parentPos = ctrlPosition _parentControl;
                        _ctrl = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_menuBase", _idc];
                        _ctrl ctrlSetText _name;
                        _ctrl ctrlSetPosition [
                            (_parentPos select 0) + CONTEXT_OPTION_WIDTH + 0.05,
                            ((_parentPos select 1) + (CONTEXT_OPTION_HEIGHT * _forEachIndex)),
                            CONTEXT_OPTION_WIDTH,
                            CONTEXT_OPTION_HEIGHT
                        ];
                        
                        _action = _ctrl ctrlAddEventHandler ["MouseButtonUp", {
                            disableSerialization;
                            params ["_ctrl","_button"];
                            if (_button != 0) exitWith {};

                            {
                                _code = _x select 1;
                                if ((_x select 0) == (ctrlIDC _ctrl)) exitWith {
                                    {_x call _code; false} count (_x select 2);
                                };
                                false
                            } count GVAR(contextControls);
                            
                            GVAR(selection) = [];
                            [] call FUNC(closeContextMenu);
                        }];
                        
                        _action = _ctrl ctrlAddEventHandler ["MouseExit", {
                            [] call FUNC(closeChildContext);
                        }];
                        
                        _ctrl ctrlCommit 0;
                        
                        GVAR(contextControls) pushBack [_idc, _code, _objects, _index, true];
                    } forEach GVAR(childContextOptions);
                };
                
                false
            } count GVAR(contextControls);
        }];
    } else {
        _ctrl ctrlAddEventHandler ["MouseEnter", {
            [] call FUNC(closeChildContext);
        }];
        
        _action = _ctrl ctrlAddEventHandler ["MouseButtonUp", {
            disableSerialization;
            params ["_ctrl","_button"];
            if (_button != 0) exitWith {};

            {
                _code = _x select 1;
                if ((_x select 0) == (ctrlIDC _ctrl)) exitWith {
                    {_x call _code; false} count (_x select 2);
                };
                false
            } count GVAR(contextControls);
            
            GVAR(selection) = [];
            [] call FUNC(closeContextMenu);
        }];
    };
    
    _ctrl ctrlCommit 0;
    
    GVAR(contextControls) pushBack [_idc, _code, _objects, _index, false];
} forEach GVAR(contextOptions);