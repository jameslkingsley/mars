#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_editor"};
        author = ECSTRING(common,MarsTeam);
        authors[] = {"Kingsley"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgContext.hpp"
#include "CfgModules.hpp"
#include "CfgAttributes.hpp"
#include "CfgStateMachine.hpp"
#include "CfgWaypoints.hpp"