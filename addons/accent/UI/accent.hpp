#include "\z\mars\addons\common\define.hpp"

class GVAR(accent) {
    idd = ACCENT_DISPLAY;
    movingEnable = true;
    onLoad = QUOTE([_this select 0] call FUNC(onAccentOpen));
    
    class Controls {
        #define GAP (GRID_H * 0.25)
        #define LINE_X (SIZE_M * GRID_W)
        #define LINE_Y (SIZE_M * (GRID_H + GAP))
        #define LINE_W (SIZE_M * (10 * GRID_W))
        #define LINE_H (SIZE_M * GRID_H)
        
        class Sample: MARS_gui_ctrlStatic {
            idc = ACCENT_SAMPLE;
            x = LINE_X;
            y = 1 * LINE_Y;
            w = LINE_W;
            h = LINE_H;
            colorBackground[] = {
                QUOTE((profileNamespace getVariable [ARR_2('MARS_ACCENT_R',COLOR_ACCENT_DEFAULT_R)])),
                QUOTE((profileNamespace getVariable [ARR_2('MARS_ACCENT_G',COLOR_ACCENT_DEFAULT_G)])),
                QUOTE((profileNamespace getVariable [ARR_2('MARS_ACCENT_B',COLOR_ACCENT_DEFAULT_B)])),
                1
            };
        };
        class Red: MARS_gui_ctrlSliderH {
            idc = ACCENT_SLIDER_R;
            x = LINE_X;
            y = 2 * LINE_Y;
            w = LINE_W;
            h = LINE_H;
            color[] = {1,0,0,1};
            colorDisabled[] = {1,0,0,1};
            colorActive[] = {1,0,0,1};
            thumb = "#(argb,8,8,3)color(1,0,0,1)";
            onSliderPosChanged = QUOTE(_this call FUNC(onAccentChange));
        };
        class Green: MARS_gui_ctrlSliderH {
            idc = ACCENT_SLIDER_G;
            x = LINE_X;
            y = 3 * LINE_Y;
            w = LINE_W;
            h = LINE_H;
            color[] = {0,1,0,1};
            colorDisabled[] = {0,1,0,1};
            colorActive[] = {0,1,0,1};
            thumb = "#(argb,8,8,3)color(0,1,0,1)";
            onSliderPosChanged = QUOTE(_this call FUNC(onAccentChange));
        };
        class Blue: MARS_gui_ctrlSliderH {
            idc = ACCENT_SLIDER_B;
            x = LINE_X;
            y = 4 * LINE_Y;
            w = LINE_W;
            h = LINE_H;
            color[] = {0,0,1,1};
            colorDisabled[] = {0,0,1,1};
            colorActive[] = {0,0,1,1};
            thumb = "#(argb,8,8,3)color(0,0,1,1)";
            onSliderPosChanged = QUOTE(_this call FUNC(onAccentChange));
        };
        class Default: MARS_gui_ctrlShortcutButton {
            idc = ACCENT_BUTTON_DEFAULT;
            text = "DEFAULT";
            x = LINE_X;
            y = 5 * LINE_Y;
            w = LINE_W / 2;
            h = LINE_H;
            action = QUOTE([] call FUNC(resetToDefault));
        };
        class Save: MARS_gui_ctrlShortcutButton {
            idc = ACCENT_BUTTON_SAVE;
            text = "SAVE";
            x = (LINE_W / 2) + GAP;
            y = 5 * LINE_Y;
            w = (LINE_W / 2) - GAP;
            h = LINE_H;
            action = QUOTE([] call FUNC(saveChanges));
        };
    };
};