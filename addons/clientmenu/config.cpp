#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/ARCOMM/ARCMC";
        VERSION_CONFIG;
        requiredAddons[] = {
            "arcmc_main"
        };
    };
};

#include "CfgEventHandlers.hpp"