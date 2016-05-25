/*
 * Author: Kingsley
 * Execute a local event on this client only
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event args <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["EventName", [1,2,3,4,5]] call mars_common_fnc_localEvent;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_eventName", "", [""]],
    ["_eventArgs", []]
];

if (_eventName == "") exitWith {};

[toLower (["mars_" + _eventName, _eventName] select (_eventName select [0,5] == "mars_")), _eventArgs] call CBA_fnc_localEvent;
