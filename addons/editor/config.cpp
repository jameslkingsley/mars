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

/*
class Intercept {
    class GVARMAIN(intercept) {
        class ADDON {
            pluginName = "mars_editor";
        };
    };
};
*/

#include "\z\mars\addons\common\define.hpp"
#include "UI\interface.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgContext.hpp"
#include "CfgMenu.hpp"
#include "CfgToolbar.hpp"
#include "CfgAttributes.hpp"
#include "CfgCursors.hpp"
