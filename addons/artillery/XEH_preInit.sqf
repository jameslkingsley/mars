#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(roundCount) = [QGVAR(roundCount), 1] call CFUNC(loadSetting);
GVAR(showLines) = [QGVAR(showLines), true] call CFUNC(loadSetting);

ADDON = true;
