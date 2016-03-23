class CfgPatches {
    class arcmc_main {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.54;
        author[] = {"Kingsley"};
        authorUrl = "https://github.com/ARCOMM/ARCMC";
        requiredAddons[] = {
            "ace_common"
        };
    };
};

class Extended_PreStart_EventHandlers {
    class arcmc_main {
        init = "\arcmc_main\XEH_preStart.sqf";
    };
};

class Extended_PreInit_EventHandlers {
    class arcmc_main {
        init = "\arcmc_main\XEH_preInit.sqf";
        disableModuload = true;
    };
};

class Extended_PostInit_EventHandlers {
    class arcmc_main {
        init = "\arcmc_main\XEH_postInit.sqf";
    };
};