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

private _code = ctrlText (["CodeBox"] call AFUNC(getControl));

switch (toLower _target) do {
    case "server": {
        (compile _code) remoteExecCall ['BIS_fnc_call', 2];
    };
    case "global": {
        (compile _code) remoteExecCall ['BIS_fnc_call', 0];
    };
    case "hc": {
        (compile _code) remoteExecCall ['BIS_fnc_call', ((entities 'HeadlessClient_F') select {isPlayer _x})];
    };
    case "local": {
        call compile _code;
    };
};