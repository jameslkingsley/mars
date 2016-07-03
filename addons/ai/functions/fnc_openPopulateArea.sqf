/*
 * Author: Kingsley
 * Opens the populate area attributes menu
 *
 * Arguments:
 * 0: Position for population <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[1,2,3]] call mars_ai_fnc_openPopulateArea;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_pos", [], [[]]]];

if (_pos isEqualTo []) exitWith {};

[QADDON, "PopulateArea", [140, 140], [0.33, 0.66], _pos] call AFUNC(openAttributes);