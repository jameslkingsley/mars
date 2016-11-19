class GVARMAIN(modules) {
    class ADDON {
        displayName = "Miscellaneous";
        class Arsenal {
            displayName = "Spawn Arsenal";
            tooltipText = "Spawn a virtual arsenal box containing everything";
            action = QUOTE([ARR_2(QQGVAR(spawnArsenal), _this)] call CBA_fnc_serverEvent);
        };
    };
};
