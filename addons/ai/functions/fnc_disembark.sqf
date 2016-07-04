/*
 * Author: Kingsley
 * Disembarks all units inside the given vehicle
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

params [["_vehicles", []]];

if (_vehicles isEqualTo []) exitWith {};

{
    [_x, {
        params ["_vehicle"];
        
        {
            unassignVehicle _x;
            _x leaveVehicle _vehicle;
            _x action ["Eject", _vehicle];
            
            false
        } count crew _vehicle;
    }, [_x]] call CFUNC(execWhereLocal);
    
    false
} count _vehicles;