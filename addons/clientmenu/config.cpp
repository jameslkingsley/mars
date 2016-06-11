#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        author = ECSTRING(common,MarsTeam);
        authors[] = {"Kingsley"};
        PBO_URL;
        VERSION_CONFIG;
        requiredAddons[] = {"mars_attributes"};
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAttributes.hpp"
