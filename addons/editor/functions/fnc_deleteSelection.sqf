/*
 * Author: Kingsley
 * Deletes all objects in selection
 * Does not delete player objects
 *
 * Arguments:
 * None
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

{
    if (vehicle _x == _x) then {
        // Not vehicle
        if (!isPlayer _x) then {
            deleteVehicle _x;
        };
    } else {
        // Vehicle
        _crew = crew _x;
        
        if (count _crew > 0) then {
            if !({isPlayer _x} count _crew > 0) then {
                {deleteVehicle _x} forEach _crew;
                deleteVehicle _x;
            };
        } else {
            deleteVehicle _x;
        };
    };
    
    false
} count GVAR(selection);