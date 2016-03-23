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
            "ace_common"
        };
    };
};

class CfgMods {
    class PREFIX {
        dir = "@ARCMC";
        name = "ARCOMM Mission Control";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://github.com/ARCOMM/ARCMC";
        description = "Issue Tracker: https://github.com/ARCOMM/ARCMC/issues";
    };
};

class CfgSettings {
    class CBA {
        class Versioning {
            class ARCMC {
                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                };
            };
        };
    };
};

#include "CfgEventHandlers.hpp"