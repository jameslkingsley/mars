/*
 * Author: Kingsley
 * Disables/Enables the given AI attribute on the given unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Attribute <STRING>
 * 2: Disable (defaults to true) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * Same as doing unit enableAI "PATH"
 * [unit, "PATH", false] call mars_ai_fnc_disableAI;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_attr", "", [""]],
    ["_state", true, [true]]
];

if (_state) then {
    _unit disableAI _attr;
} else {
    _unit enableAI _attr;
};
