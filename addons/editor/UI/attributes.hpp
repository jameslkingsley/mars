#ifndef WINDOW_EDITATTRIBUTES_W
    #define WINDOW_EDITATTRIBUTES_W	140
#endif

#ifndef WINDOW_EDITATTRIBUTES_H
    #define WINDOW_EDITATTRIBUTES_H	180
#endif

#define WINDOW_EDITATTRIBUTES_HAbs (safezoneH min (WINDOW_EDITATTRIBUTES_H * GRID_H))

class GVAR(attributesWindow) {
    idd = IDD_EDITATTRIBUTES;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = QUOTE([ARR_2('AttributesWindow_onLoad', _this)] call EFUNC(common,localEvent));
    onUnload = QUOTE([ARR_2('AttributesWindow_onUnload', _this)] call EFUNC(common,localEvent));

    class ControlsBackground {
        // class BackgroundDisable: MARS_gui_ctrlStaticBackgroundDisable {};
        // class BackgroundDisableTiles: MARS_gui_ctrlStaticBackgroundDisableTiles {};

        class Background: MARS_gui_ctrlStaticBackground {
            x = CENTER_X - (WINDOW_EDITATTRIBUTES_W * 0.5) * GRID_W;
            y = 0.5 - WINDOW_EDITATTRIBUTES_HAbs * 0.5 + 10 * GRID_H;
            w = WINDOW_EDITATTRIBUTES_W * GRID_W;
            h = WINDOW_EDITATTRIBUTES_HAbs - (SIZE_M + 10) * GRID_H;
        };
        class BackgroundButtons: MARS_gui_ctrlStaticFooter {
            x = CENTER_X - (WINDOW_EDITATTRIBUTES_W * 0.5 - 1*0) * GRID_W;
            y = 0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 2) * GRID_H;
            w = (WINDOW_EDITATTRIBUTES_W) * GRID_W;
            h = (SIZE_M + 2) * GRID_H;
        };
        class Title: MARS_gui_ctrlStaticTitle {
            idc = IDC_EDITATTRIBUTES_TITLE;
            x = CENTER_X - (WINDOW_EDITATTRIBUTES_W * 0.5) * GRID_W;
            y = 0.5 - WINDOW_EDITATTRIBUTES_HAbs * 0.5 + SIZE_M * GRID_H;
            w = WINDOW_EDITATTRIBUTES_W * GRID_W;
            h = SIZE_M * GRID_H;
            text = "";
        };
        class AttributeCategories: MARS_gui_ctrlControlsGroup {
            idc = IDC_EDITATTRIBUTES_CATEGORIES;
            x = CENTER_X - (WINDOW_EDITATTRIBUTES_W * 0.5 - 1*0) * GRID_W;
            y = 0.5 - WINDOW_EDITATTRIBUTES_HAbs * 0.5 + 11 * GRID_H + pixelH;
            w = (WINDOW_EDITATTRIBUTES_W - 2*0) * GRID_W;
            h = WINDOW_EDITATTRIBUTES_HAbs - (2 * SIZE_M + 10 + 3) * GRID_H;
            class Controls {};
        };
        class ButtonOK: MARS_gui_ctrlButtonOk {
            x = CENTER_X + (WINDOW_EDITATTRIBUTES_W * 0.5 - 50 - 2) * GRID_W;
            y = 0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 1) * GRID_H;
            w = 25 * GRID_W;
            h = SIZE_M * GRID_H;
            onButtonDown = "ctrlSetFocus (_this select 0);";
        };
        class ButtonCancel: MARS_gui_ctrlButtonCancel {
            x = CENTER_X + (WINDOW_EDITATTRIBUTES_W * 0.5 - 25 - 1) * GRID_W;
            y = 0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 1) * GRID_H;
            w = 25 * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
    class Controls {};
    class AttributeCategory: MARS_gui_ctrlControlsGroupNoScrollbars {
        y = 2 * pixelH;
        w = (WINDOW_EDITATTRIBUTES_W - 1) * GRID_W;
        class Controls {
            class Minimize: MARS_gui_ctrlCheckbox {
                x = 0 * GRID_W;
                y = 0;
                w = SIZE_M * GRID_W;
                h = SIZE_M * GRID_H;

                #define TEXTURE_CHECKED "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa"
                #define TEXTURE_UNCHECKED "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa"

                textureChecked = TEXTURE_CHECKED;
                textureUnchecked = TEXTURE_UNCHECKED;
                textureFocusedChecked = TEXTURE_CHECKED;
                textureFocusedUnchecked = TEXTURE_UNCHECKED;
                textureHoverChecked = TEXTURE_CHECKED;
                textureHoverUnchecked = TEXTURE_UNCHECKED;
                texturePressedChecked = TEXTURE_CHECKED;
                texturePressedUnchecked = TEXTURE_UNCHECKED;
                textureDisabledChecked = TEXTURE_CHECKED;
                textureDisabledUnchecked = TEXTURE_UNCHECKED;

                #define TITLE_COLOR	1,1,1,0.5
                color[] = {TITLE_COLOR};
                colorFocused[] = {TITLE_COLOR};
                colorHover[] = {TITLE_COLOR};
                colorPressed[] = {TITLE_COLOR};
                colorDisabled[] = {TITLE_COLOR};
            };
            class Title: MARS_gui_ctrlButton {
                x = SIZE_M * GRID_W;
                y = pixelH;
                w = (WINDOW_EDITATTRIBUTES_W - SIZE_M - 3) * GRID_W;
                h = SIZE_M * GRID_H;
                style = ST_MULTI + ST_NO_RECT;
                font = FONT_THIN;
                sizeEx = SIZEEX_PURISTA(SIZEEX_M);
                colorText[] = {TITLE_COLOR};
                colorBackground[] = {COLOR_BACKGROUND_RGBA};
                colorFocused[] = {COLOR_BACKGROUND_RGBA};
                colorBackgroundActive[] = {COLOR_BACKGROUND_RGBA};
                colorShadow[] = {TITLE_COLOR};
                offsetX = 0;
                offsetY = -pixelH;
                offsetPressedX = 0;
                offsetPressedY = 0;
            };
            class Attributes: MARS_gui_ctrlControlsGroupNoScrollbars {
                y = SIZE_S * GRID_H + 4 * pixelH;
                w = (WINDOW_EDITATTRIBUTES_W - 5) * GRID_W;
                class Controls {};
            };
        };
        class AttributeOverlay: MARS_gui_ctrlControlsGroupNoScrollbars {
            y = 4 * pixelH;
            class Controls {
                class AttributeOverlay: MARS_gui_ctrlStatic {
                    style = ST_CENTER;
                    colorBackground[] = {0.2,0.2,0.2,0.9};
                };
                class AttributeEnable: MARS_gui_ctrlCheckbox {
                    w = SIZE_M * GRID_W;
                    h = SIZE_M * GRID_H;
                    tooltip = "";
                };
            };
        };
    };
};
