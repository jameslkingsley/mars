/*
 * Author: Kingsley
 * Populates the asset browser tree view based on given arguments
 *
 * Arguments:
 * 0: Mode <STRING>
 * 1: Side filter <SIDE>
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

MARS_LOGINFO(_this);

params [
    ["_mode", "units", [""]],
    ["_sideFilter", sideUnknown, [sideUnknown]]
];

switch (toLower _mode) do {
    case "units": {
        _side = _sideFilter;
    };
};