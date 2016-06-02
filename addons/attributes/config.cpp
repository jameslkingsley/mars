#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"mars_common"};
        author = ECSTRING(common,MarsTeam);
        authors[] = {"Kingsley"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "\z\mars\addons\common\define.hpp"
#include "CfgEventHandlers.hpp"
#include "UI\interface.hpp"
#include "UI\category.hpp"
