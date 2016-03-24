#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/ARCOMM/mars";
        VERSION_CONFIG;
        requiredAddons[] = {"mars_common"};
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\menu.hpp"