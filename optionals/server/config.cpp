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

class GVARMAIN(serverSettings) {
    #include "\userconfig\mars\serverconfig.hpp"
};