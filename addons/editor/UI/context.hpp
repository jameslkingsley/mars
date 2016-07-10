#define CC_WIDTH (50 * GRID_W)
#define CC_HEIGHT (SIZE_M * GRID_H)
#define CC_ICON_WIDTH (SIZE_M * GRID_W)

class GVAR(contextControl): MARS_gui_ctrlControlsGroupNoScrollbars {
    x = 0;
    y = 0;
    w = CC_WIDTH;
    h = CC_HEIGHT;
    
    class Controls {
        class Background: MARS_gui_ctrlStaticBackground {
            idc = IDC_CONTEXT_BACKGROUND;
            x = 0;
            y = 0;
            w = 1;
            h = 1;
            colorBackground[] = {COLOR_ACTIVE_RGB, 1};
        };
        
        class IconLeft: MARS_gui_ctrlActivePictureKeepAspect {
            idc = IDC_CONTEXT_ICONLEFT;
            x = 0;
            y = 0;
            w = CC_ICON_WIDTH;
            h = 1;
            font = FONT_THIN;
            size = SIZEEX_PURISTA_M;
            sizeEx = SIZEEX_PURISTA_M;
            text = QPATHTOF(data\EntityMenu\arsenal_ca.paa);
            colorBackground[] = {0,1,0,1};
        };
        
        class Text: MARS_gui_ctrlActiveText {
            idc = IDC_CONTEXT_TEXT;
            x = CC_ICON_WIDTH;
            y = 0;
            w = CC_WIDTH - (CC_ICON_WIDTH * 2);
            h = 1;
            text = "Mars Bars";
            font = FONT_THIN;
            size = SIZEEX_PURISTA_M;
            sizeEx = SIZEEX_PURISTA_M;
            colorBackground[] = {0,0,1,1};
        };
        
        class IconRight: IconLeft {
            idc = IDC_CONTEXT_ICONRIGHT;
            x = CC_WIDTH - CC_ICON_WIDTH;
            w = CC_ICON_WIDTH;
            text = QPATHTOF(data\EntityMenu\playfromhere_ca.paa);
        };
    };
};