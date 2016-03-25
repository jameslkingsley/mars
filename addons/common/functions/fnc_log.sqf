/*
 * Author: Kingsley
 * Logs a message to the RPT file
 *
 * Arguments:
 * 0: Component <STRING>
 * 1: Message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [COMPONENT, "You did something wrong!"] call mars_common_fnc_log;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_component", "_message"];

diag_log (format ["----------[MARS] mars_%1: %2", _component, _message]);