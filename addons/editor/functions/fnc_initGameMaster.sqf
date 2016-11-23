/*
 * Author: Kingsley
 * Initializes the game master unit
 * Used by XEH
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call mars_editor_fnc_initGameMaster;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit", objNull]];

if (isNull _unit || {!local _unit} || {player != _unit}) exitWith {};

[{time > 0}, {
    GVAR(isGameMaster) = true;
    [] call FUNC(openEditor);
}] call CBA_fnc_waitUntilAndExecute;
