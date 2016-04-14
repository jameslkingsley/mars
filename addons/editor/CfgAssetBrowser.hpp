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
    class ADDON {
        class tabs {
            class units {
                displayName = "Units";
                tooltipText = "Units (F1)";
                icon = QUOTE(PATHTOF(data\AssetBrowser\modeunits_ca.paa));
                init = QUOTE([ARR_1('units')] call FUNC(populateAssetBrowser));
                class subtabs {
                    class blufor: SideFilter_BLUFOR {
                        init = QUOTE([ARR_2('units',west)] call FUNC(filterAssetBrowser));
                    };
                    class opfor: SideFilter_OPFOR {
                        init = QUOTE([ARR_2('units',east)] call FUNC(filterAssetBrowser));
                    };
                    class indfor: SideFilter_INDFOR {
                        init = QUOTE([ARR_2('units',resistance)] call FUNC(filterAssetBrowser));
                    };
                    class civilian: SideFilter_CIVILIAN {
                        init = QUOTE([ARR_2('units',civilian)] call FUNC(filterAssetBrowser));
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
};
