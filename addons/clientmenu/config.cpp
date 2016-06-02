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
        requiredAddons[] = {"mars_common"};
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\menu_zeus.hpp"