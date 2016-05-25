#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_common"};
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/jameslkingsley";
        VERSION_CONFIG;
    };
};

#include "\z\mars\addons\common\define.hpp"
#include "CfgEventHandlers.hpp"
#include "UI\interface.hpp"