#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_editor"};
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/jameslkingsley";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMenu.hpp"
#include "CfgToolbar.hpp"
#include "CfgContext.hpp"
