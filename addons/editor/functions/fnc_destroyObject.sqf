/*
 * Author: Kingsley
 * Destroys all objects in selection
 *
 * Arguments:
 * 
 *
 * Return Value:
 * 
 *
 * Example:
 * 
 *
 * Public: 
 */

#include "script_component.hpp"

params ["_units"];

{
    (vehicle _x) setDamage 1;
    false
} count _units;