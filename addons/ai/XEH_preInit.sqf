#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(unlimitedMagazines) = [QGVAR(unlimitedMagazines), true] call CFUNC(loadSetting);

ADDON = true;
