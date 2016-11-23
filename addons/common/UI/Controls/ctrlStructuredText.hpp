class MARS_gui_ctrlStructuredText: MARS_gui_ctrlDefaultText {
    type = CT_STRUCTURED_TEXT;
    colorBackground[] = {0,0,0,0};
    size = SIZE_PURISTA_M;
    text = "";
    onCanDestroy = "";
    onDestroy = "";

    class Attributes {
        align = "left";
        color = "#ffffff";
        colorLink = "#ffffff";
        size = 1;
        font = FONT_NORMAL;
    };
};

class MARS_gui_ctrlDebugPanelText: MARS_gui_ctrlStructuredText {
    size = SIZE_PURISTA_S;
    sizeEx = SIZEEX_PURISTA_S;
    shadow = 0;
};
