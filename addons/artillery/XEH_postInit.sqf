#include "script_component.hpp"

[QGVAR(fireArtillery), {
    params ["_unit", "_pos", "_ammo", "_count"];
    _unit doArtilleryFire [_pos, _ammo, _count];
}] call CBA_fnc_addEventHandler;

["isArtillery", {[_this] call FUNC(isArtillery)}] call CFUNC(addException);
