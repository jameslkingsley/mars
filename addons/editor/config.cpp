#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_common"};
        author[] = {"ACE3 Project","Kingsley"};
        authorUrl = "https://github.com/jameslkingsley/mars";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\interface.hpp"
