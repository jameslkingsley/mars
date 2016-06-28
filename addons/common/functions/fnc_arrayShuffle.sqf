/*
 * Author: alganthe
 * Shuffles the provided array
 *
 * Arguments:
 * 0: Array to be shuffled <ARRAY>
 *
 * Return Value:
 * Shuffled array <ARRAY>
 *
 * Example:
 * _shuffled = [1,2,3,4,5] call mars_common_fnc_arrayShuffle;
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _cnt = count _this;

for "_i" from 1 to _cnt do {
    _this pushBack (_this deleteAt floor random _cnt);
};

_this
