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
            idc = IDC_ASSETBROWSER_TAB_UNITS;
            displayName = "Units";
            tooltipText = "Units";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modeunits_ca.paa));
            onSearch = QUOTE(_this call FUNC(onABSearch));
            class subtabs {
                class blufor: SideFilter_BLUFOR {
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
            idc = IDC_ASSETBROWSER_TAB_GROUPS;
            displayName = "Groups";
            tooltipText = "Groups";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modegroups_ca.paa));
            class subtabs {
                class blufor: SideFilter_BLUFOR {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_GROUPS_WEST] call FUNC(handleAssetBrowser));
                };
                class opfor: SideFilter_OPFOR {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_GROUPS_EAST] call FUNC(handleAssetBrowser));
                };
                class indfor: SideFilter_INDFOR {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_GROUPS_GUER] call FUNC(handleAssetBrowser));
                };
                class civilian: SideFilter_CIVILIAN {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_GROUPS_CIV] call FUNC(handleAssetBrowser));
                };
                class empty: SideFilter_EMPTY {
                    onClick = QUOTE([IDC_ASSETBROWSER_TREE_GROUPS_EMPTY] call FUNC(handleAssetBrowser));
                };
            };
        };
        class modules {
            idc = IDC_ASSETBROWSER_TAB_MODULES;
            displayName = "Modules";
            tooltipText = "Modules";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modemodules_ca.paa));
        };
        class markers {
            idc = IDC_ASSETBROWSER_TAB_MARKERS;
            displayName = "Markers";
            tooltipText = "Markers";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modemarkers_ca.paa));
        };
        class favorites {
            idc = IDC_ASSETBROWSER_TAB_FAVS;
            displayName = "Favorites";
            tooltipText = "Favorites";
            icon = QUOTE(PATHTOF(data\AssetBrowser\modefavorites_ca.paa));
        };
    };
};
