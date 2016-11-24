#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(roundCount) = [QGVAR(roundCount), 1] call CFUNC(loadSetting);
GVAR(dispersion) = [QGVAR(dispersion), 25] call CFUNC(loadSetting);
GVAR(showLines) = [QGVAR(showLines), true] call CFUNC(loadSetting);

ADDON = true;
