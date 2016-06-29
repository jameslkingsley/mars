/*
 * Author: Kingsley
 * Displays a hint with some extra options
 *
 * Arguments:
 * 0: Text to show <STRING>
 * 1: How long to show the hint for (in seconds) <NUMBER>
 * 2: Broadcast the hint to all machines (defaults to false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Hello World", 5] call mars_common_fnc_hint;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_text", "", [""]],
    ["_delay", -1, [0]],
    ["_broadcast", false, [false]]
];

if (_broadcast) then {
    _text remoteExecCall ["hint", 0];
} else {
    hint _text;
};

if (_delay > -1) then {
    [{
        params [["_broadcast", false]];
        
        if (_broadcast) then {
            "" remoteExecCall ["hintSilent", 0];
        } else {
            hintSilent "";
        };
    }, [_broadcast], _delay] call CBA_fnc_waitAndExecute;
};
