/*
 * Author: Kingsley
 * Gets the image path of the given status
 *
 * Arguments:
 * 0: Status <STRING>
 *
 * Return Value:
 * Image path <STRING>
 *
 * Example:
 * ["defend"] call mars_common_fnc_getStatusImage;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_status", "", [""]]];

if (_status == "") exitWith {""};

(format ["\a3\ui_f\data\igui\cfg\simpletasks\types\%1_ca.paa", _status])
