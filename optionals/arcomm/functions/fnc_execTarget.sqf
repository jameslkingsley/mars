/*
 * Author: Kingsley
 * Executes the code block control text on the given target
 *
 * Arguments:
 * 0: Target <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["server"] call mars_arcomm_fnc_execTarget;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_target", "local", [""]]];

private _code = compile (ctrlText (["CodeBox"] call AFUNC(getControl)));

switch (toLower _target) do {
    case "server": {
        _code remoteExecCall ['BIS_fnc_call', 2];
    };
    case "global": {
        _code remoteExecCall ['BIS_fnc_call', 0];
    };
    case "hc": {
        {
            _code remoteExecCall ['BIS_fnc_call', _x];
        } forEach ((entities 'HeadlessClient_F') select {isPlayer _x});
    };
    case "local": {
        call _code;
    };
};