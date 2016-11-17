/*
 * Author: Kingsley
 * Toggles ACRE spectator chat
 *
 * Arguments:
 * 0: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call mars_acre_fnc_toggleSpectator;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_state", false]];

[_state] call acre_api_fnc_setSpectator;
GVAR(spectatorOn) = _state;
