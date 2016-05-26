#define WINDOW_EDITATTRIBUTES_HAbs (safeZoneH min (WINDOW_EDITATTRIBUTES_H * GRID_H))

class GVAR(AttributesWindow) {
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
            text = "OK";
            onButtonDown = "ctrlSetFocus (_this select 0);";
        };
        class ButtonCancel: MARS_gui_ctrlButtonCancel {
            x = CENTER_X + (WINDOW_EDITATTRIBUTES_W * 0.5 - 25 - 1) * GRID_W;
            y = 0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 1) * GRID_H;
            w = 25 * GRID_W;
            h = SIZE_M * GRID_H;
            text = "CANCEL";
        };
    };
};
