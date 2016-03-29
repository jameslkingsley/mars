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

disableSerialization;

_i = 0;

{
    _item = _x;
    _index = _x select 0;
    _name = _x select 1;
    _condition = if ((_x select 2) == "") then {"true"} else {(_x select 2)};
    _code = _x select 3;
    _idc = 10000 + _i;
    _hasChildren = if (typeName _code != "CODE") then {true} else {false};
    
    if (!_hasChildren) then {
        if !({_x call compile _condition} count _objects > 0) exitWith {};
    };
    
    _ctrl = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
    _text = if (_hasChildren) then {(format["%1...", _name])} else {_name};
    _ctrl ctrlSetText _text;
    _ctrl ctrlSetPosition [
        ((GVAR(mousePos) select 0)),
        ((GVAR(mousePos) select 1)) + (CONTEXT_OPTION_HEIGHT * _i),
        CONTEXT_OPTION_WIDTH,
        CONTEXT_OPTION_HEIGHT
    ];
    
    [] call FUNC(closeChildContext);
    
    if (_hasChildren) then {
        GVAR(tempParentIDC) = _idc;
        
        _ctrl ctrlAddEventHandler ["MouseEnter", {
            disableSerialization;
            params ["_ctrl"];
            
            [] call FUNC(closeChildContext);

            {
                _objects = (_x select 2);
                _parentIndex = (_x select 3);
                _parentControl = _ctrl;

                if ((_x select 0) == GVAR(tempParentIDC)) then {
                    _counter = 0;
                    
                    {
                        MARS_LOGINFO(_x);
                        private ["_item","_parent","_index","_name","_condition","_code","_idc","_ctrl"];
                        _item = _x;
                        _parent = _x select 0;
                        _index = _x select 1;
                        _name = _x select 2;
                        _condition = if ((_x select 3) == "") then {"true"} else {(_x select 3)};
                        _code = _x select 4;
                        _idc = 100000 + _counter;
                        
                        if (toLower _parent == toLower _parentIndex) then {
                            if !({_x call compile _condition} count _objects > 0) exitWith {};
                            
                            _parentPos = ctrlPosition _parentControl;
                            _ctrl = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
                            _ctrl ctrlSetText _name;
                            _ctrl ctrlSetPosition [
                                (_parentPos select 0) + CONTEXT_OPTION_WIDTH + 0.005,
                                ((_parentPos select 1) + (CONTEXT_OPTION_HEIGHT * _counter)),
                                CONTEXT_OPTION_WIDTH,
                                CONTEXT_OPTION_HEIGHT
                            ];
                            
                            _ctrl ctrlAddEventHandler ["MouseButtonUp", {
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
                            
                            _ctrl ctrlAddEventHandler ["MouseEnter", {
                                GVAR(isMouseOverChild) = true;
                            }];
                            
                            _ctrl ctrlAddEventHandler ["MouseExit", {
                                [{
                                    if (!GVAR(isMouseOverChild)) then {
                                        [] call FUNC(closeChildContext);
                                    };
                                }, []] call EFUNC(common,execNextFrame);
                            }];
                            
                            _ctrl ctrlCommit 0;
                            _counter = _counter + 1;
                            GVAR(contextControls) pushBack [_idc, _code, _objects, _index, true];
                        };
                        
                        false
                    } count GVAR(childContextOptions);
                    
                    false
                };
                
                false
            } count GVAR(contextControls);
        }];
    } else {
        _ctrl ctrlAddEventHandler ["MouseEnter", {
            GVAR(isMouseOverChild) = false;
            [] call FUNC(closeChildContext);
        }];
        
        _ctrl ctrlAddEventHandler ["MouseButtonUp", {
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
    _i = _i + 1;
    GVAR(contextControls) pushBack [_idc, _code, _objects, _index, false];
    
    false
} count GVAR(contextOptions);