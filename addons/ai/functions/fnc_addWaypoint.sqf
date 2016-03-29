/*
 * Author: Kingsley
 * Adds a waypoint for the given unit.
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

MARS_LOGINFO(_this);

params ["_object","_destination"];

_object doMove _destination;