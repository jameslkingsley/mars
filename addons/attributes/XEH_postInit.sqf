#include "script_component.hpp"

[{
    // [QUOTE(ADDON), "sandbox", [nil, 165]] call FUNC(openAttributes);
    ["ARCMF", "Reinforcements", [nil, 180]] call mars_attributes_fnc_openAttributes;
}, [], 1] call CFUNC(waitAndExecute);
