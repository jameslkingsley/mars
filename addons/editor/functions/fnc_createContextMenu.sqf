/*
 * Author: Kingsley
 * Creates the context menu with all relevant event handlers
 *
 * Arguments:
 * None (uses GVAR(selection))
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_createContextMenu;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_contexts", []], ["_xIndex", 0], ["_yIndex", 0], ["_startYPos", -1]];

if (!isNull GVAR(prepSurfaceSphere)) exitWith {};

if (count _contexts > 0) then {
    _contexts = _contexts apply {[([getText (_x >> "displayName"), ""] select (isNull (_x >> "displayName"))), _x]};
    _contexts sort true;
    _contexts = _contexts apply {(_x select 1)};

    _index = 0;
    
    {
        private ["_config", "_condition"];
        _config = _x;
        _condition = ["", (getText (_config >> "condition"))] select (!isNull (_config >> "condition"));
        if (_condition == "") then {_condition = "(true)"};
        
        // Run the condition for all in selection
        if (({_x call compile _condition} count GVAR(selection)) > 0) then {
            _idc = (9630 + _index) * ((10 * _xIndex) max 1);
            _children = "true" configClasses (_config);
            _hasChildren = (count _children > 0);
            _displayName = getText (_config >> "displayName");
            _action = ["", (getText (_config >> "action"))] select (isText (_config >> "action"));
            _preAction = ["", (getText (_config >> "preAction"))] select (isText (_config >> "preAction"));
            _requiresPosition = [false, [false,true] select (getNumber (_config >> "requiresPosition"))] select (!isNull (_config >> "requiresPosition"));
            
            disableSerialization;
            
            _control = GETUVAR(GVAR(interface),displayNull) ctrlCreate ["MARS_gui_contextBase", _idc];
            _control ctrlSetText (format ["%1%2", _displayName, (["","..."] select _hasChildren)]);

            _startYPos = if (_startYPos > -1) then {
                _startYPos
            } else {
                GVAR(currentMousePos) select 1
            };
            
            _cordX = (GVAR(currentMousePos) select 0) + (_xIndex * CONTEXT_OPTION_WIDTH) + (_xIndex * 0.005);
            _cordY = _startYPos + ((_yIndex * CONTEXT_OPTION_HEIGHT) + (_index * CONTEXT_OPTION_HEIGHT));

            _control ctrlSetPosition [
                _cordX,
                _cordY,
                CONTEXT_OPTION_WIDTH,
                CONTEXT_OPTION_HEIGHT
            ];
            
            _control setVariable [QGVAR(ctrlChildren), _children];
            _control setVariable [QGVAR(ctrlAction), [_action, _requiresPosition, _preAction]];
            
            _control ctrlAddEventHandler ["MouseEnter",
                compile format[
                    "[_this, %1, %2, %3, %4] call " + QUOTE(FUNC(onContextHover)),
                    _idc,
                    _xIndex,
                    _index,
                    (_cordY - (CONTEXT_OPTION_HEIGHT * _index))
                ]
            ];
            
            _control ctrlAddEventHandler ["MouseButtonUp", {
                params ["_control"];
                _actionArgs = _control getVariable [QGVAR(ctrlAction), []];
                if (count _actionArgs > 0) then {
                    _actionArgs call FUNC(onContextClick);
                };
            }];

            _control ctrlCommit 0;
            
            GVAR(allContextControls) pushBack _idc;
            _index = _index + 1;
            
            if ((count GVAR(indexedContexts) - 1) >= _xIndex) then {
                _curCtrls = GVAR(indexedContexts) select _xIndex;
                _curCtrls pushBackUnique _idc;
                GVAR(indexedContexts) set [_xIndex, _curCtrls];
            } else {
                GVAR(indexedContexts) pushBack [_idc];
            };
        };
        
        false
    } count _contexts;
} else {
    _contexts = [];
    
    {
        {
            _contexts pushBack _x;
        } forEach ("true" configClasses (_x));
    } forEach ("true" configClasses (configFile >> QGVARMAIN(context)));
    
    [_contexts, _xIndex, _yIndex] call FUNC(createContextMenu);
};
