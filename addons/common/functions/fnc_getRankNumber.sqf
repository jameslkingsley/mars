/*
 * Author: Kingsley
 * Returns a number based on the given rank string
 *
 * Arguments:
 * 0: Rank <STRING>
 *
 * Return Value:
 * Number <INT>
 *     PRIVATE: 1
 *     CORPORAL: 2
 *     SERGEANT: 3
 *     LIEUTENANT: 4
 *     CAPTAIN: 5
 *     MAJOR: 6
 *     COLONEL: 7
 *
 * Example:
 * [] call mars_common_fnc_getRankNumber;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_rank", "", [""]]];

if (_rank == "") exitWith {};

switch (_rank) do {
    case "PRIVATE": {1};
    case "CORPORAL": {2};
    case "SERGEANT": {3};
    case "LIEUTENANT": {4};
    case "CAPTAIN": {5};
    case "MAJOR": {6};
    case "COLONEL": {7};
};