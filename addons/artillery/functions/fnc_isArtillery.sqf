/*
 * Author: Kingsley
 * Checks if the given objects are artillery vehicles
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 *
 * Return Value:
 * All are artillery vehicles <BOOL>
 *
 * Example:
 * _isArty = [[vehicle player]] call mars_artillery_fnc_isArtillery;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_vehicles", [], [[]]]];

if (_vehicles isEqualTo []) exitWith {false};

({'artillery' in (getArray (configFile >> 'CfgVehicles' >> typeOf _x >> 'availableForSupportTypes') apply {toLower _x})} count _vehicles == count _vehicles)
