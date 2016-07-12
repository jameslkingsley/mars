class MARS_gui_ctrlMenu: ctrlMenu {
    colorBorder[] = {0,0,0,0};
    colorBackground[] = {COLOR_TAB_RGBA};
    colorText[] = {COLOR_TEXT_RGBA};
    colorSelect[] = {0,0,0,1};
    colorSelectBackground[] = {COLOR_ACTIVE_RGBA};
    colorDisabled[] = {COLOR_TEXT_RGB,0.25};
    colorPicture[] = {1,1,1,1};
    colorPictureSelect[] = {0,0,0,1};
    colorPictureDisabled[] = {1,1,1,0.5};
    arrow = "\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
    font = FONT_THIN;
    size = SIZEEX_PURISTA_M;
    sizeEx = SIZEEX_PURISTA_M;
};

class MARS_gui_ctrlContextMenu: MARS_gui_ctrlMenu {
    class Items {
        items[] = {};
        class Default {
            text = "Empty";
            data = "Empty";
            enable = 0;
        };
    };
};
