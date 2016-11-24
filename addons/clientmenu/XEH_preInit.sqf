#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(terrainDetail) = profileNamespace getVariable [QGVAR(terrainDetail), 12.5];
GVAR(viewDistance) = profileNamespace getVariable [QGVAR(viewDistance), 3000];
