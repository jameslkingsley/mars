class GVARMAIN(assetBrowser) {
    class SideFilter_BLUFOR {
        displayName = "BLUFOR";
        tooltipText = "BLUFOR";
        icon = QUOTE(PATHTOF(data\AssetBrowser\side_west_ca.paa));
    };
    class SideFilter_OPFOR {
        displayName = "OPFOR";
        tooltipText = "OPFOR";
        icon = QUOTE(PATHTOF(data\AssetBrowser\side_east_ca.paa));
    };
    class SideFilter_INDFOR {
        displayName = "INDFOR";
        tooltipText = "INDFOR";
        icon = QUOTE(PATHTOF(data\AssetBrowser\side_guer_ca.paa));
    };
    class SideFilter_CIVILIAN {
        displayName = "CIVILIAN";
        tooltipText = "CIVILIAN";
        icon = QUOTE(PATHTOF(data\AssetBrowser\side_civ_ca.paa));
    };
    class SideFilter_EMPTY {
        displayName = "EMPTY";
        tooltipText = "EMPTY";
        icon = QUOTE(PATHTOF(data\AssetBrowser\side_empty_ca.paa));
    };
    class tabs {
        class units {
            displayName = "Units";
            tooltipText = "Units (F1)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modeunits_ca.paa));
            onSearch = QUOTE(_this call FUNC(onABSearch));
            class subtabs {
                class blufor: SideFilter_BLUFOR {
                    selected = true;
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_UNITS_WEST] call FUNC(handleAssetBrowser));
                };
                class opfor: SideFilter_OPFOR {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_UNITS_EAST] call FUNC(handleAssetBrowser));
                };
                class indfor: SideFilter_INDFOR {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_UNITS_GUER] call FUNC(handleAssetBrowser));
                };
                class civilian: SideFilter_CIVILIAN {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_UNITS_CIV] call FUNC(handleAssetBrowser));
                };
                class empty: SideFilter_EMPTY {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_UNITS_EMPTY] call FUNC(handleAssetBrowser));
                };
            };
        };
        class groups {
            displayName = "Groups";
            tooltipText = "Groups (F2)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modegroups_ca.paa));
        };
        class modules {
            displayName = "Modules";
            tooltipText = "Modules (F3)";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modemodules_ca.paa));
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
