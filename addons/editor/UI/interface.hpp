class GVAR(interface) {
    idd = IDC_DISPLAY;
    enableSimulation = 1;
    enableDisplay = 1;
    closeOnMissionEnd = 0;
    movingEnable = 0;
    onLoad = QUOTE([ARR_2('onLoad',_this)] call FUNC(handleInterface));
    onUnload = QUOTE([ARR_2('onUnload',_this)] call FUNC(handleInterface));
    onKeyDown = QUOTE([ARR_2('onKeyDown',_this)] call FUNC(handleInterface));
    onKeyUp = QUOTE([ARR_2('onKeyUp',_this)] call FUNC(handleInterface));
    class ControlsBackground {
        class Map: MARS_gui_ctrlMap {
            idc = IDC_MAP;
            x = safezoneXAbs;
            y = safezoneY;
            w = safezoneWAbs;
            h = safezoneH;
            /*class CustomMark {
                icon = "#(argb,8,8,3)color(0,0,0,0)";
                color[] = {0,0,0,0};
                size = 0;
                importance = 0;
                coefMin = 0;
                coefMax = 0;
            };*/
        };
        class MouseHandler: RscControlsGroupNoScrollbars {
            idc = IDC_MOUSEHANDLER;
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            onMouseButtonDown = QUOTE([ARR_2('onMouseButtonDown',_this)] call FUNC(handleInterface));
            onMouseButtonUp = QUOTE([ARR_2('onMouseButtonUp',_this)] call FUNC(handleInterface));
            onMouseZChanged = QUOTE([ARR_2('onMouseZChanged',_this)] call FUNC(handleInterface));
            onMouseMoving = QUOTE([ARR_2('onMouseMoving',_this)] call FUNC(handleInterface));
            onMouseHolding = QUOTE([ARR_2('onMouseHolding',_this)] call FUNC(handleInterface));
        };
        class ScrollBlockTop: MARS_gui_ctrlStatic {
            idc = IDC_SCROLLBLOCK_TOP;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = (MENUBAR_H + TOOLBAR_H) * GRID_H;
        };
        class ScrollBlockBottom: ScrollBlockTop {
            idc = IDC_SCROLLBLOCK_BOTTOM;
            x = safezoneX;
            y = safezoneY + safezoneH - STATUSBAR_H * GRID_H;
            w = STATUSBAR_W;
            h = (STATUSBAR_H + 1) * GRID_H;
        };
        class ScrollBlockLeft: ScrollBlockTop {
            idc = IDC_SCROLLBLOCK_LEFT;
            x = safezoneX;
            y = safezoneY + (MENUBAR_H + TOOLBAR_H) * GRID_H;
            w = PANEL_W * GRID_W;
            h = safezoneH - (MENUBAR_H + TOOLBAR_H + STATUSBAR_H) * GRID_H;
        };
        class ScrollBlockRight: ScrollBlockTop {
            idc = IDC_SCROLLBLOCK_RIGHT;
            x = safezoneX + safezoneW - PANEL_W * GRID_W;
            y = safezoneY + (SIZE_M + TOOLBAR_H) * GRID_H;
            w = PANEL_W * GRID_W;
            h = safezoneH - (MENUBAR_H + TOOLBAR_H) * GRID_H;
        };
    };
    class Controls {
        class ButtonExit: MARS_gui_ctrlButtonPicture {
            idc = IDC_EXIT;
            x = safezoneX + safezoneW - (SIZE_M * GRID_W);
            y = safezoneY;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
            colorBackground[] = {COLOR_TAB_RGBA};
            text = QPATHTOF(data\cross_ca.paa);
            action = QUOTE([] call FUNC(closeEditor));
            offsetPressedX = 0;
            offsetPressedY = 0;
        };
        class MenuStrip: MARS_gui_ctrlMenuStrip {
            idc = IDC_MENUSTRIP;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW - SIZE_M * GRID_W;
            h = MENUBAR_H * GRID_H;
            colorBackground[] = {COLOR_TAB_RGBA};
        };
        class Toolbar: MARS_gui_ctrlControlsGroupNoScrollbars {
            idc = IDC_TOOLBAR;
            x = safezoneX;
            y = safezoneY + MENUBAR_H * GRID_H;
            w = safezoneW;
            h = TOOLBAR_H * GRID_H;
            class Controls {
                class ToolbarBackground: MARS_gui_ctrlStatic {
                    idc = IDC_TOOLBAR_BACKGROUND;
                    x = 0;
                    y = 0;
                    w = safezoneW;
                    h = 7 * GRID_H;
                    colorBackground[] = {COLOR_BACKGROUND_RGBA};
                };
                class Items: MARS_gui_ctrlControlsGroupNoScrollbars {
                    idc = IDC_TOOLBAR_ITEMS;
                    x = 1 * GRID_W;
                    y = 1 * GRID_H;
                    w = safezoneW;
                    h = GRID_TOOLBAR_H;
                    class Controls {};
                };
            };
        };
        class Notification: MARS_gui_ctrlStructuredText {
            idc = IDC_NOTIFICATION;
            x = safezoneX + PANEL_W * GRID_W;
            y = safezoneY + (MENUBAR_H + TOOLBAR_H) * GRID_H;
            w = safezoneW - 2 * PANEL_W * GRID_W;
            h = 0;
            colorBackground[] = {1,0,1,1};
            shadow = 0;
            class Attributes: Attributes {
                align = "center";
            };
        };
        class PanelLeft: MARS_gui_ctrlControlsGroupNoScrollbars {
            idc = IDC_LEFTPANEL;
            x = safezoneX;
            y = safezoneY + (MENUBAR_H + TOOLBAR_H) * GRID_H;
            w = PANEL_W * GRID_W;
            h = safezoneH - (MENUBAR_H + TOOLBAR_H + STATUSBAR_H) * GRID_H;
            class Controls {
                class TabLeftBackground: MARS_gui_ctrlStatic {
                    idc = IDC_LEFTPANEL_TAB_BG;
                    x = 0;
                    y = 0;
                    w = PANEL_W * GRID_W;
                    h = TAB_H * GRID_H;
                    colorBackground[] = {COLOR_TAB_RGBA};
                };
                class TabLeftToggle: MARS_gui_ctrlButton {
                    idc = IDC_LEFTPANEL_TAB_TOGGLE;
                    style = ST_CENTER;
                    x = 0;
                    y = 0;
                    w = TAB_H * GRID_W;
                    h = TAB_H * GRID_H;
                    text = "«";
                    sizeEx = SIZE_PURISTA_XL;
                    colorBackground[] = {COLOR_TAB_RGBA};
                    onbuttonclick = "";
                };
                class TabLeftSections: MARS_gui_ctrlToolbox {
                    idc = IDC_LEFTPANEL_TAB_SECTIONS;
                    x = TAB_H * GRID_W;
                    y = GRID_H;
                    w = (PANEL_W - TAB_H - 1) * GRID_W;
                    h = SIZE_M * GRID_H;
                    font = FONT_THIN;
                    columns = 2;
                    strings[] = {
                        "Entities",
                        "Locations"
                    };
                    sizeEx = SIZEEX_PURISTA_M;
                    colorText[] = {COLOR_TEXT_RGBA};
                    colorTextSelect[] = {1,1,1,1};
                    colorBackground[] = {0,0,0,0};
                    colorSelectedBg[] = {COLOR_BACKGROUND_RGBA};
                    onToolBoxSelChanged = "";
                };
                class PanelLeftBackground: MARS_gui_ctrlStatic {
                    idc = IDC_LEFTPANEL_BG;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + STATUSBAR_H) * GRID_H;
                    colorBackground[] = {COLOR_BACKGROUND_RGB,TRANSPARENT_A};
                };
                class PanelLeftEdit: MARS_gui_ctrlControlsGroupNoScrollbars {
                    idc = IDC_LEFTPANEL_EDIT;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + STATUSBAR_H) * GRID_H;
                    class Controls {
                        class PanelLeftEditBackground: MARS_gui_ctrlStatic {
                            w = PANEL_W * GRID_W;
                            h = (SIZE_M + 2) * GRID_H;
                            colorBackground[] = {COLOR_BACKGROUND_RGBA};
                        };
                        class SearchEdit: MARS_gui_ctrlEdit {
                            idc = IDC_LEFTPANEL_EDIT_SEARCH;
                            x = 1 * GRID_W;
                            y = GRID_H;
                            w = (PANEL_W - SIZE_M - 2) * GRID_W;
                            h = SIZE_M * GRID_H;
                        };
                        class SearchEditButton: MARS_gui_ctrlButtonSearch {
                            idc = IDC_LEFTPANEL_EDIT_SEARCHBTN;
                            x = (PANEL_W - SIZE_M - 1) * GRID_W;
                            y = GRID_H;
                            w = SIZE_M * GRID_W;
                            h = SIZE_M * GRID_H;
                            onLoad = "";
                        };
                        class Edit: MARS_gui_ctrlTree {
                            idc = IDC_LEFTPANEL_EDIT_EDIT;
                            x = 0;
                            y = (SIZE_M + 2) * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + STATUSBAR_H + SIZE_M + 2 + 1 + SIZE_M) * GRID_H;
                            sizeEx = SIZEEX_PURISTA_S;
                            font = FONT_NORMAL;
                            colorBorder[] = {0,0,0,0};
                            multiselectEnabled = 1;
                            disableKeyboardSearch = 1;
                            colorDisabled[] = {1,1,1,0.25};
                        };
                    };
                };
                class PanelLeftLocations: MARS_gui_ctrlControlsGroupNoScrollbars {
                    idc = IDC_LEFTPANEL_LOCS;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + STATUSBAR_H) * GRID_H;
                    show = 0;
                    class Controls {
                        class PanelLeftLocationsBackground: MARS_gui_ctrlStatic {
                            w = PANEL_W * GRID_W;
                            h = 1 * GRID_H;
                            colorBackground[] = {COLOR_BACKGROUND_RGBA};
                        };
                        class Locations: MARS_gui_ctrlTree {
                            idc = IDC_LEFTPANEL_LOCS_LOCS;
                            x = 0;
                            w = PANEL_W * GRID_W;
                            h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + STATUSBAR_H + 1) * GRID_H;
                            sizeEx = SIZEEX_PURISTA_S;
                            font = FONT_NORMAL;
                            colorBorder[] = {0,0,0,0};
                            onTreeDblClick = "";
                            disableKeyboardSearch = 1;
                        };
                    };
                };
            };
        };
        class PanelRight: MARS_gui_ctrlControlsGroupNoScrollbars {
            idc = IDC_RIGHTPANEL;
            x = safezoneX + safezoneW - PANEL_W * GRID_W;
            y = safezoneY + (SIZE_M + TOOLBAR_H) * GRID_H;
            w = PANEL_W * GRID_W;
            h = safezoneH - (MENUBAR_H + TOOLBAR_H + STATUSBAR_H) * GRID_H;
            class Controls {
                class TabRightBackground: MARS_gui_ctrlStatic {
                    idc = IDC_ASSETBROWSER_SECTIONS_BG;
                    x = 0;
                    y = 0;
                    w = PANEL_W * GRID_W;
                    h = TAB_H * GRID_H;
                    colorBackground[] = {COLOR_TAB_RGBA};
                };
                class TabRightToggle: MARS_gui_ctrlButton {
                    idc = IDC_ASSETBROWSER_TOGGLE;
                    style = ST_CENTER;
                    x = (PANEL_W - TAB_H) * GRID_W;
                    y = 0;
                    w = TAB_H * GRID_W;
                    h = TAB_H * GRID_H;
                    text = "»";
                    sizeEx = SIZE_PURISTA_XL;
                    colorBackground[] = {0,0,0,0};
                    onButtonClick = QUOTE(['right'] call FUNC(togglePanel));
                };
                class TabRightSections: MARS_gui_ctrlToolbox {
                    idc = IDC_ASSETBROWSER_SECTIONS;
                    x = GRID_W;
                    y = GRID_H;
                    w = (PANEL_W - TAB_H - 1) * GRID_W;
                    h = SIZE_M * GRID_H;
                    font = FONT_THIN;
                    columns = 2;
                    strings[] = {
                        "Assets",
                        "Notes"
                    };
                    sizeEx = SIZEEX_PURISTA_M;
                    values[] = {0,1};
                    colorText[] = {COLOR_TEXT_RGBA};
                    colorTextSelect[] = {1,1,1,1};
                    colorBackground[] = {0,0,0,0};
                    colorSelectedBg[] = {COLOR_BACKGROUND_RGBA};
                    onToolBoxSelChanged = QUOTE([ARR_2('rightTabs', _this)] call FUNC(handlePanelSections));
                };
                class PanelRightBackground: MARS_gui_ctrlStatic {
                    idc = IDC_ASSETBROWSER_BG;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H) * GRID_H;
                    colorBackground[] = {COLOR_BACKGROUND_RGB,TRANSPARENT_A};
                };
                class PanelRightNotes: MARS_gui_ctrlControlsGroupNoScrollbars {
                    idc = IDC_ASSETBROWSER_NOTES;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H) * GRID_H;
                    show = 0;
                    class Controls {
                        class PanelRightNotesBackground: MARS_gui_ctrlStatic {
                            w = PANEL_W * GRID_W;
                            h = 26 * GRID_H;
                            colorBackground[] = {COLOR_BACKGROUND_RGBA};
                        };
                        class Modes: MARS_gui_ctrlToolboxPictureKeepAspect {
                            idc = IDC_ASSETBROWSER_NOTES_MODES;
                            x = 0;
                            y = 3 * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = 7 * GRID_H;
                            rows = 1;
                            columns = 2;
                            strings[] = {
                                QPATHTOF(data\PanelRight\notes_tasks_ca.paa),
                                QPATHTOF(data\PanelRight\notes_diary_ca.paa)
                            };
                            tooltips[] = {
                                "Tasks",
                                "Diary"
                            };
                            values[] = {0,1,2,3,4,5,6};
                            colorBackground[] = {0,0,0,0};
                            colorText[] = {COLOR_TEXT_RGB,0.25};
                            colorTextSelect[] = {1,1,1,1};
                            colorSelectedBg[] = {0,0,0,0};
                            onToolBoxSelChanged = QUOTE([ARR_2('rightNotesModes', _this)] call FUNC(handlePanelSections));
                        };
                    };
                };
                class PanelRightCreate: MARS_gui_ctrlControlsGroupNoScrollbars {
                    idc = IDC_ASSETBROWSER_CREATE;
                    x = 0;
                    y = TAB_H * GRID_H;
                    w = PANEL_W * GRID_W;
                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H) * GRID_H;
                    class Controls {
                        #define MOD_COLUMNS	5
                        class PanelRightCreateBackground: MARS_gui_ctrlStatic {
                            w = PANEL_W * GRID_W;
                            h = 26 * GRID_H;
                            colorBackground[] = {COLOR_BACKGROUND_RGBA};
                        };
                        class Modes: MARS_gui_ctrlToolboxPictureKeepAspect {
                            idc = IDC_ASSETBROWSER_MODES;
                            x = 0;
                            y = 3 * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = 7 * GRID_H;
                            rows = 1;
                            columns = MOD_COLUMNS;
                            strings[] = {
                                QPATHTOF(data\PanelRight\modeobjects_ca.paa),
                                QPATHTOF(data\PanelRight\modegroups_ca.paa),
                                QPATHTOF(data\PanelRight\modemodules_ca.paa),
                                QPATHTOF(data\PanelRight\modemarkers_ca.paa),
                                QPATHTOF(data\PanelRight\modefavorites_ca.paa)
                            };
                            tooltips[] = {
                                "Objects",
                                "Compositions",
                                "Modules",
                                "Markers",
                                "Favorites"
                            };
                            values[] = {0,1,2,3,4,5,6};
                            colorBackground[] = {0,0,0,0};
                            colorText[] = {COLOR_TEXT_RGB,0.25};
                            colorTextSelect[] = {1,1,1,1};
                            colorSelectedBg[] = {0,0,0,0};
                            onToolBoxSelChanged = QUOTE([ARR_2('rightModes', _this)] call FUNC(handlePanelSections));
                        };
                        class Sides: Modes {
                            idc = IDC_ASSETBROWSER_SUBMODES_SIDES;
                            y = 11 * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = 8 * GRID_H;
                            columns = 5;
                            strings[] = {
                                QPATHTOF(data\PanelRight\side_west_ca.paa),
                                QPATHTOF(data\PanelRight\side_east_ca.paa),
                                QPATHTOF(data\PanelRight\side_guer_ca.paa),
                                QPATHTOF(data\PanelRight\side_civ_ca.paa),
                                QPATHTOF(data\PanelRight\side_empty_ca.paa)
                            };
                            tooltips[] = {
                                "BLUFOR",
                                "OPFOR",
                                "INDFOR",
                                "CIVILIAN",
                                "EMPTY"
                            };
                            values[] = {
                                SIDE_WEST,
                                SIDE_EAST,
                                SIDE_GUER,
                                SIDE_CIV,
                                SIDE_EMPTY
                            };
                            onToolBoxSelChanged = QUOTE([ARR_2('rightSides', _this)] call FUNC(handlePanelSections));
                        };
                        class Brushes: Modes {
                            idc = IDC_ASSETBROWSER_SUBMODES_BRUSHES;
                            y = 11 * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = 8 * GRID_H;
                            columns = 2;
                            show = 0;
                            strings[] = {
                                QPATHTOF(data\PanelRight\submode_marker_icon_ca.paa),
                                QPATHTOF(data\PanelRight\submode_marker_area_ca.paa)
                            };
                            tooltips[] = {
                                "Icons",
                                "Areas"
                            };
                            values[] = {
                                0,
                                1
                            };
                            onToolBoxSelChanged = QUOTE([ARR_2('rightBrushes', _this)] call FUNC(handlePanelSections));
                        };
                        class SearchCreate: MARS_gui_ctrlEdit {
                            idc = IDC_ASSETBROWSER_SEARCH_CREATE;
                            x = 1 * GRID_W;
                            y = 20 * GRID_H;
                            w = (PANEL_W - SIZE_M - 2) * GRID_W;
                            h = SIZE_M * GRID_H;
                            onSetFocus = QUOTE(GVAR(isInputActive) = true);
                            onKillFocus = QUOTE(GVAR(isInputActive) = false);
                        };
                        class SearchCreateButton: MARS_gui_ctrlButtonSearch {
                            idc = IDC_ASSETBROWSER_SEARCH_CREATE_BTN;
                            x = (PANEL_W - SIZE_M - 1) * GRID_W;
                            y = 20 * GRID_H;
                            w = SIZE_M * GRID_W;
                            h = SIZE_M * GRID_H;
                            onLoad = "";
                            onMouseButtonUp = QUOTE(_this call FUNC(handleABSearch));
                        };
                        class Create: MARS_gui_ctrlControlsGroupNoScrollbars {
                            idc = IDC_ASSETBROWSER_TREE;
                            x = 0;
                            y = 26 * GRID_H;
                            w = PANEL_W * GRID_W;
                            h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + 25 + SIZE_M) * GRID_H;
                            class Controls {
                                class CreateObjectWEST: MARS_gui_ctrlTree {
                                    idc = IDC_ASSETBROWSER_TREE_UNITS_WEST;
                                    w = PANEL_W * GRID_W;
                                    h = safezoneH - (MENUBAR_H + TOOLBAR_H + TAB_H + 25 + SIZE_M) * GRID_H;
                                    defaultItem[] = {};
                                    sizeEx = SIZEEX_PURISTA_S;
                                    font = FONT_NORMAL;
                                    multiselectEnabled = 0;
                                    colorBackground[] = {0,0,0,0};
                                    colorBorder[] = {0,0,0,0};
                                    onTreeSelChanged = QUOTE(_this call FUNC(onABTreeSelChanged));
                                    onMouseButtonDown = "";
                                    onMouseButtonUp = "";
                                    disableKeyboardSearch = 1;
                                };
                                class CreateObjectEAST: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_UNITS_EAST;
                                    defaultItem[] = {};
                                };
                                class CreateObjectGUER: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_UNITS_GUER;
                                    defaultItem[] = {};
                                };
                                class CreateObjectCIV: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_UNITS_CIV;
                                    defaultItem[] = {};
                                };
                                class CreateObjectEMPTY: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_UNITS_EMPTY;
                                    defaultItem[] = {};
                                };
                                class CreateGroupWEST: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_GROUPS_WEST;
                                    defaultItem[] = {};
                                };
                                class CreateGroupEAST: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_GROUPS_EAST;
                                    defaultItem[] = {};
                                };
                                class CreateGroupGUER: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_GROUPS_GUER;
                                    defaultItem[] = {};
                                };
                                class CreateGroupCIV: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_GROUPS_CIV;
                                    defaultItem[] = {};
                                };
                                class CreateGroupEMPTY: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_GROUPS_EMPTY;
                                    defaultItem[] = {};
                                };
                                class CreateModule: CreateObjectWEST {
                                    idc = IDC_ASSETBROWSER_TREE_MODULES;
                                    defaultItem[] = {};
                                };
                            };
                        };
                    };
                };
            };
        };
        class StatusBar: MARS_gui_ctrlControlsGroupNoScrollbars {
            idc = IDC_STATUSBAR;
            x = safezoneX;
            y = safezoneY + safezoneH - STATUSBAR_H * GRID_H;
            w = STATUSBAR_W;
            h = (STATUSBAR_H + 1) * GRID_H;
            colorBackground[] = {COLOR_TAB_RGBA};

            class Controls {
                #define TEXT_W 3
                #define VALUE_W	16
                #define SPACE_W	4
                #define SPACE_H (2 * pixelH)
                class StatusBarBackground: MARS_gui_ctrlStatic {
                    idc = IDC_STATUSBAR_BG;
                    x = 0;
                    y = 0;
                    w = STATUSBAR_W;
                    h = (STATUSBAR_H + 1) * GRID_H;
                    colorBackground[] = {COLOR_BACKGROUND_RGBA};
                };
                class TextX: MARS_gui_ctrlStaticPicture {
                    y = SPACE_H;
                    w = TEXT_W * GRID_W;
                    h = TEXT_W * GRID_H;
                    sizeEx = SIZEEX_PURISTA_XS;
                    text = QPATHTOF(data\StatusBar\x_ca.paa);
                    colorBackground[] = {0,0,0,0};
                    shadow = 0;
                };
                class ValueX: MARS_gui_ctrlEdit {
                    idc = IDC_STATUSBAR_X;
                    style = ST_RIGHT + ST_NO_RECT;
                    x = TEXT_W * GRID_W;
                    y = SPACE_H;
                    w = VALUE_W * GRID_W;
                    h = STATUSBAR_H * GRID_H - 2 * SPACE_H;
                    font = FONT_MONO;
                    sizeEx = (3.1 * (1 / (getResolution select 3)) * 1.25 * 4);
                    shadow = 0;
                    colorDisabled[] = {COLOR_TEXT_RGB,0.5};
                    onLoad = "(_this select 0) ctrlEnable false;";
                    text = "0.000m";
                    canModify = 0;
                };
                class TextY: TextX {
                    x = (TEXT_W + VALUE_W + SPACE_W) * GRID_W;
                    text = QPATHTOF(data\StatusBar\y_ca.paa);
                    colorBackground[] = {0,0,0,0};
                };
                class ValueY: ValueX {
                    idc = IDC_STATUSBAR_Y;
                    x = ((TEXT_W + VALUE_W + SPACE_W) + TEXT_W) * GRID_W;
                };
                class TextZ: TextX {
                    x = 2 * (TEXT_W + VALUE_W + SPACE_W) * GRID_W;
                    text = QPATHTOF(data\StatusBar\z_ca.paa);
                    colorBackground[] = {0,0,0,0};
                };
                class ValueZ: ValueX {
                    idc = IDC_STATUSBAR_Z;
                    x = (2 * (TEXT_W + VALUE_W + SPACE_W) + TEXT_W) * GRID_W;
                };
                class TextDis: TextX {
                    x = 3 * (TEXT_W + VALUE_W + SPACE_W) * GRID_W;
                    text = QPATHTOF(data\StatusBar\dis_ca.paa);
                    colorBackground[] = {0,0,0,0};
                };
                class ValueDis: ValueX {
                    idc = IDC_STATUSBAR_DIS;
                    x = (3 * (TEXT_W + VALUE_W + SPACE_W) + TEXT_W) * GRID_W;
                };
                class TextGrid: TextX {
                    x = 4 * (TEXT_W + VALUE_W + SPACE_W) * GRID_W;
                    text = QPATHTOF(data\Toolbar\map_off_ca.paa);
                    colorBackground[] = {0,0,0,0};
                };
                class ValueGrid: ValueX {
                    idc = IDC_STATUSBAR_GRID;
                    x = (4 * (TEXT_W + VALUE_W + SPACE_W) + TEXT_W) * GRID_W;
                };
                class FPS: ValueX {
                    idc = IDC_STATUSBAR_FPS;
                    x = STATUSBAR_W - (34) * GRID_W;
                    w = 13 * GRID_W;
                    text = "0 FPS";
                };
                class Version: ValueX {
                    idc = IDC_STATUSBAR_VERSION;
                    x = STATUSBAR_W - (20.5 + SPACE_H) * GRID_W;
                    w = 20 * GRID_W;
                };
            };
        };
        class CursorHelper: MARS_gui_ctrlStaticPictureKeepAspect {
            idc = IDC_CURSORHELPER;
            x = 0.5;
            y = 0.5;
            w = pixelW * 14;
            h = pixelW * 14;
            sizeEx = SIZEEX_PURISTA_M;
            text = "";
            colorBackground[] = {0,0,0,0};
            shadow = 0;
        };
    };
};
