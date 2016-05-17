#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_editor"};
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/jameslkingsley/mars";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "UI\accent.hpp"
#include "CfgToolbar.hpp"