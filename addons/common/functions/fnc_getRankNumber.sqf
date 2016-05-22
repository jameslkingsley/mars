/*
 * Author: Kingsley
 * Returns a number based on the given rank string
 *
 * Arguments:
 * 0: Rank <STRING>
 *
 * Return Value:
 * Number <INT>
 *     Invalid rank: -1
 *     PRIVATE: 0
 *     CORPORAL: 1
 *     SERGEANT: 2
 *     LIEUTENANT: 3
 *     CAPTAIN: 4
 *     MAJOR: 5
 *     COLONEL: 6
 *
 * Example:
 * ["SERGEANT"] call mars_common_fnc_getRankNumber;
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_rank", "", [""]]];

[
    "PRIVATE",
    "CORPORAL",
    "SERGEANT",
    "LIEUTENANT",
    "CAPTAIN",
    "MAJOR",
    "COLONEL"
] find _rank;
