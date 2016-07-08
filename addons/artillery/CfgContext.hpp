class GVARMAIN(context) {
    class ADDON {
        class Artillery {
            displayName = "Artillery";
            condition = QUOTE('artillery' in (getArray (configFile >> 'CfgVehicles' >> typeOf _this >> 'availableForSupportTypes') apply {toLower _x}));
            
            class HE {
                displayName = "HE";
                requiresPosition = true;
                action = QFUNC(fireArtillery);
            };
            
            class Smoke {
                displayName = "Smoke";
                requiresPosition = true;
                action = "";
            };
            
            class Flare {
                displayName = "Flare";
                requiresPosition = true;
                action = "";
            };
        };
    };
};