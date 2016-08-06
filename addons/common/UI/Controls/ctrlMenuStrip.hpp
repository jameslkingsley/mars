class MARS_gui_ctrlMenuStripFake: MARS_gui_ctrlMenu {
    type = CT_STATIC;
    colorStripBackground[] = {0,0,0,1};
    colorStripText[] = {COLOR_TEXT_RGBA};
    colorStripSelect[] = {0,0,0,1};
    colorStripSelectBackground[] = {QCOLOR_ACTIVE_RGBA};
    colorStripDisabled[] = {COLOR_TEXT_RGB,0.25};
};

class MARS_gui_ctrlMenuStrip: MARS_gui_ctrlMenu {
    type = CT_MENU_STRIP;
    colorStripBackground[] = {COLOR_TAB_RGBA};
    colorStripText[] = {COLOR_TEXT_RGBA};
    colorStripSelect[] = {COLOR_TEXT_RGBA};
    colorStripSelectBackground[] = {QCOLOR_ACTIVE_RGBA};
    colorStripDisabled[] = {COLOR_TEXT_RGB,0.25};
};
