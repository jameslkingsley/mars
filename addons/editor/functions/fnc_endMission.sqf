/*
 * Author: Kingsley
 * Ends the mission on all machines
 * Can be run from server or client
 *
 * Arguments:
 * 0: Debriefing classname <STRING>
 * 1: Confirmation <BOOL>
 * 2: Broadcast <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["mars_editor_completed", true] call mars_editor_fnc_endMission;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [
    ["_classname", "", [""]],
    ["_confirmation", false, [false]],
    ["_broadcast", false, [false]]
];

if (_broadcast) then {
    if (_confirmation) then {
        [
            "Mission End",
            "Are you sure you want to end the mission?",
            "Yes",
            "No",
            {[QGVAR(endMission), _this] call CBA_fnc_globalEvent},
            {},
            [_classname, _confirmation]
        ] call AFUNC(confirmation);
    } else {
        [QGVAR(endMission), [_classname, _confirmation]] call CBA_fnc_globalEvent;
    };
} else {
    [_classname] call BIS_fnc_endMission;
};
