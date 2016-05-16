class MARS_gui_ctrlStructuredText: MARS_gui_ctrlDefaultText
{
    type = CT_STRUCTURED_TEXT; // Type
    colorBackground[] = {0,0,0,0}; // Fill color
    size = SIZEEX_PURISTA(SIZE_M); // Text size (notice it's NOT named sizeEx)
    text = "";

    class Attributes
    {
        align = "left"; // Text align
        color = RGBTOHEX(1,1,1); // Text color
        colorLink = RGBTOHEX(COLOR_ACTIVE_RGB); // Link text color
        size = 1; // Text size
        font = FONT_NORMAL; // Font from CfgFontFamilies
    };

    onCanDestroy = "";
    onDestroy = "";
};