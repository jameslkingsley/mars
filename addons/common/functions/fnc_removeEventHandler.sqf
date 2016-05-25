/*
 * Author: Nou, Kingsley
 * Remove an event handler
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["EventName", 2] call mars_common_fnc_removeEventHandler;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_eventName", "", [""]],
    ["_eventIndex", -1, [0]]
];

if (_eventName == "") exitWith {};

[toLower (["mars_" + _eventName, _eventName] select (_eventName select [0,5] == "mars_")), _eventIndex] call CBA_fnc_removeEventHandler;
