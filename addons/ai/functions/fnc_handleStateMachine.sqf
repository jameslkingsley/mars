/*
 * Author: Kingsley
 * Handles the state machine code
 *
 * Arguments:
 * 0: State <STRING>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_ai_fnc_handleStateMachine;
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_state", "", [""]],
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || {_state == ""}) exitWith {};

switch (_state) do {
    case "MovingEntered": {
        _unit disableAI "TARGET";
        _unit disableAI "AUTOTARGET";
        _unit disableAI "SUPPRESSION";

        private _isForceMove = _unit getVariable [QGVAR(forceMove), false];
        if (_isForceMove) then {
            _unit disableAI "FSM";
        };
    };

    case "MovingLeaving": {
        _unit enableAI "TARGET";
        _unit enableAI "AUTOTARGET";
        _unit enableAI "SUPPRESSION";

        private _isForceMove = _unit getVariable [QGVAR(forceMove), false];
        if (_isForceMove) then {
            _unit enableAI "FSM";
            _unit setVariable [QGVAR(forceMove), false, true];
        };
    };
};
