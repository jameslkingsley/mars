/*
 * Author: Kingsley
 * Disembarks all units inside the given vehicles
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[vehicle]] call mars_ai_fnc_disembark;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_args", []], ["_broadcast", false]];

if (_vehicles isEqualTo []) exitWith {};

if (_broadcast) then {
    _args params [["_vehicles", []]];
    {[QGVAR(disembark), [_x], _x] call CBA_fnc_targetEvent;false} count _vehicles;
} else {
    _args params [["_vehicle", objNull]];

    {
        unassignVehicle _x;
        _x leaveVehicle _vehicle;
        _x action ["Eject", _vehicle];
        
        false
    } count crew _vehicle;
};
