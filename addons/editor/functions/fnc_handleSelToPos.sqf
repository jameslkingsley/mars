/*
 * Author: Kingsley
 * Handles the selection when right-clicking on a position in a context allowed state (right-click waypoints in Zeus)
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: World position <ARRAY>
 * 2: Target (optional) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * N/A
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_selection", []], ["_destination", []], ["_target", objNull]];

if (count _selection == 0 || count _pos == 0) exitWith {};

{
    private _unit = _x;
    _unit disableAI "AUTOCOMBAT";
    _unit disableAI "SUPPRESSION";
    _unit setBehaviour "AWARE";
    _unit setSpeedMode "FULL";
    _unit allowFleeing 0;
    _unit doMove _destination;
    false
} count _selection;

GVAR(selection) = [];
GVAR(leftSelection) = [];
GVAR(rightSelection) = [];
