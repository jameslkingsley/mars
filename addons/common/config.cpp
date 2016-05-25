#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/jameslkingsley/mars";
        VERSION_CONFIG;
        requiredAddons[] = {"mars_main"};
    };
};

#include "CfgEventHandlers.hpp"
#include "define.hpp"
