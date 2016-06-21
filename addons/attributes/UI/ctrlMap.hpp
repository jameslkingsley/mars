#define WINDOW_EDITATTRIBUTES_HAbs (safeZoneH min (100 * GRID_H))

class GVAR(ctrlMapWindow) {
    idd = IDD_EDITATTRIBUTES_CTRLMAP;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = QUOTE(_this call FUNC(_ctrlMapOnLoad));
    onUnload = "";

    class ControlsBackground {
        class Background: MARS_gui_ctrlStaticBackground {
            x = QUOTE(CENTER_X - (100 * 0.5) * GRID_W);
            y = QUOTE(0.5 - WINDOW_EDITATTRIBUTES_HAbs * 0.5 + 10 * GRID_H);
            w = QUOTE(100 * GRID_W);
            h = QUOTE(WINDOW_EDITATTRIBUTES_HAbs - (SIZE_M + 10) * GRID_H);
        };
        class BackgroundButtons: MARS_gui_ctrlStaticFooter {
            x = QUOTE(CENTER_X - (100 * 0.5) * GRID_W);
            y = QUOTE(0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 2) * GRID_H);
            w = QUOTE(100 * GRID_W);
            h = (SIZE_M + 2) * GRID_H;
        };
        class Title: MARS_gui_ctrlStaticTitle {
            idc = IDC_EDITATTRIBUTES_CTRLMAP_TITLE;
            x = QUOTE(CENTER_X - (100 * 0.5) * GRID_W);
            y = QUOTE(0.5 - WINDOW_EDITATTRIBUTES_HAbs * 0.5 + SIZE_M * GRID_H);
            w = QUOTE(100 * GRID_W);
            h = SIZE_M * GRID_H;
            text = "Map Position";
            colorShadow[] = {0,0,0,0};
        };
        class ButtonOK: MARS_gui_ctrlButtonOk {
            idc = IDC_EDITATTRIBUTES_CTRLMAP_BTN_OK;
            x = QUOTE(CENTER_X + (100 * 0.5 - 50 - 2) * GRID_W);
            y = QUOTE(0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 1) * GRID_H);
            w = 25 * GRID_W;
            h = SIZE_M * GRID_H;
            text = CSTRING(GUI_BTN_OK);
            font = FONT2_THIN;
            onButtonDown = "ctrlSetFocus (_this select 0);";
        };
        class ButtonCancel: MARS_gui_ctrlButtonCancel {
            idc = IDC_EDITATTRIBUTES_CTRLMAP_BTN_CANCEL;
            x = QUOTE(CENTER_X + (100 * 0.5 - 25 - 1) * GRID_W);
            y = QUOTE(0.5 + WINDOW_EDITATTRIBUTES_HAbs * 0.5 - (2 * SIZE_M + 1) * GRID_H);
            w = 25 * GRID_W;
            h = SIZE_M * GRID_H;
            font = FONT2_THIN;
            text = CSTRING(GUI_BTN_CANCEL);
        };
    };
    
    class Controls {
        class Map: MARS_gui_ctrlMap {
            idc = IDC_EDITATTRIBUTES_CTRLMAP_MAP;
            x = QUOTE((CENTER_X - (100 * 0.5) * GRID_W) + (SIZE_M * GRID_W));
            y = QUOTE(0.5 - (WINDOW_EDITATTRIBUTES_HAbs * 0.5) + ((SIZE_M * 3) * GRID_H));
            w = QUOTE((100 - (2 * SIZE_M)) * GRID_W);
            h = QUOTE((100 - (2 * SIZE_M)) * GRID_W);
        };
    };
};
