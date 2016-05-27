/*
 * Author: Kingsley
 * Sets the fog of the mission on the server (changes will propagate globally)
 * To use the current server value, pass a -1 (per part)
 *
 * Arguments:
 * 0: Value <NUMBER>
 * 1: Decay <NUMBER>
 * 2: Base (meters) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.5, 0.01, 100] call mars_environment_fnc_setFog;
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isServer) exitWith {
    params [
        ["_value", -1, [0]],
        ["_decay", -1, [0]],
        ["_base", -1, [0]]
    ];

    0 setFog [
        ([fogParams select 0, _value] select (_value != -1)),
        ([fogParams select 1, _decay] select (_decay != -1)),
        ([fogParams select 2, _base] select (_base != -1))
    ];
};

_this remoteExec [QFUNC(setFog), REMOTE_SERVER];
