/*
 * Author: Kingsley
 * Handles all move commands from the CAManBase jobs config
 *
 * Arguments:
 * 0: Profile <STRING>
 * 1: Args <ARRAY>
 *
 * Return Value:
 * Nil
 *
 * Example:
 * TODO
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    ["_profile", "run", [""]],
    ["_args", [], [[]]]
];

switch (_profile) do {
    case "walk": {};
    case "run": {};
    case "sprint": {};
};

nil