class GVARMAIN(assetBrowser) {
    class SideFilter_BLUFOR {
        displayName = "BLUFOR";
        tooltipText = "BLUFOR";
    };
    class SideFilter_OPFOR {
        displayName = "OPFOR";
        tooltipText = "OPFOR";
    };
    class SideFilter_INDFOR {
        displayName = "INDFOR";
        tooltipText = "INDFOR";
    };
    class SideFilter_CIVILIAN {
        displayName = "CIVILIAN";
        tooltipText = "CIVILIAN";
    };
    class tabs {
        class units {
            displayName = "Units";
            tooltipText = "Units (F1)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modeunits_ca.paa));
            class subtabs {
                class blufor: SideFilter_BLUFOR {
                    selected = true;
                    onClick = QUOTE([ARR_2('units',west)] call FUNC(populateAssetBrowser));
                };
                class opfor: SideFilter_OPFOR {
                    onClick = QUOTE([ARR_2('units',east)] call FUNC(populateAssetBrowser));
                };
                class indfor: SideFilter_INDFOR {
                    onClick = QUOTE([ARR_2('units',resistance)] call FUNC(populateAssetBrowser));
                };
                class civilian: SideFilter_CIVILIAN {
                    onClick = QUOTE([ARR_2('units',civilian)] call FUNC(populateAssetBrowser));
                };
            };
        };
        class groups {
            displayName = "Groups";
            tooltipText = "Groups (F2)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modegroups_ca.paa));
        };
        class props {
            displayName = "Props";
            tooltipText = "Props (F3)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modeprops_ca.paa));
        };
        class markers {
            displayName = "Markers";
            tooltipText = "Markers (F4)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modemarkers_ca.paa));
        };
        class favorites {
            displayName = "Favorites";
            tooltipText = "Favorites (F5)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modefavorites_ca.paa));
        };
    };
};
