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
        ACE_isOptional = 1;
    };
};

class GVARMAIN(serverSettings) {
    #include "\userconfig\mars\serverconfig.hpp"
};

class ACE_ServerSettings {
    #include "\userconfig\mars\serverconfig.hpp"
};
