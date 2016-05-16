class MARS_gui_ctrlStructuredText: MARS_gui_ctrlDefaultText {
    type = CT_STRUCTURED_TEXT;
    colorBackground[] = {0,0,0,0};
    size = SIZEEX_PURISTA(SIZE_M);
    text = "";
    onCanDestroy = "";
    onDestroy = "";

    class Attributes {
        align = "left";
        color = RGBTOHEX(1,1,1);
        colorLink = RGBTOHEX(COLOR_ACTIVE_RGB);
        size = 1;
        font = FONT_NORMAL;
    };
};