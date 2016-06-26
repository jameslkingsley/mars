/*
 * Author: Kingsley
 * Add an event handler
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event code <CODE/STRING>
 *
 * Return Value:
 * Event handler ID number (for use with fnc_removeEventHandler) <NUMBER>
 *
 * Example:
 * ["EventName", {}] call mars_common_fnc_addEventHandler;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_eventName", "", [""]],
    ["_eventCode", {}, [{},""]]
];

if (_eventName == "") exitWith {};

if (_eventCode isEqualType "") then {
    if (isNil _eventCode) then {
        _eventCode = compile _eventCode;
    } else {
        _eventCode = compile format ["_this call %1", _eventCode];
    };
};

[(toLower (["mars_" + _eventName, _eventName] select (_eventName select [0,5] == "mars_"))), _eventCode] call CBA_fnc_addEventHandler;
