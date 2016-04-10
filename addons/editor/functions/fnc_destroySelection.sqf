/*
 * Author: Kingsley
 * Destroys all objects in selection
 * Does not destroy player units, but will destroy vehicles driven by players
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mars_editor_fnc_destroySelection;
 *
 * Public: No
 */

#include "script_component.hpp"

{
    if (vehicle _x == _x) then {
        // Is not in vehicle
        if (!isPlayer _x) then {
            _x setDamage 1;
        };
    } else {
        // Is in vehicle
        (vehicle _x) setDamage 1;
    };
    
    false
} count GVAR(selection);