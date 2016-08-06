class MARS_gui_ctrlCheckbox: MARS_gui_ctrlDefault {
    type = CT_CHECKBOX;
    font = FONT_THIN;
    checked = 0;
    size = SIZEEX_PURISTA_M;
    sizeEx = SIZEEX_PURISTA_M;
    text = "";
    color[] = {1,1,1,0.7};
    colorText[] = {COLOR_TEXT_RGBA};
    colorFocused[] = {1,1,1,1};
    colorHover[] = {1,1,1,1};
    colorPressed[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorBackground[] = {0,0,0,0};
    colorBackgroundFocused[] = {0,0,0,0};
    colorBackgroundHover[] = {0,0,0,0};
    colorBackgroundPressed[] = {0,0,0,0};
    colorBackgroundDisabled[] = {0,0,0,0};
    textureChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    textureFocusedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureFocusedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    textureHoverChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureHoverUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    texturePressedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    texturePressedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    textureDisabledChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureDisabledUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onCheckedChanged = "";
};

class MARS_gui_ctrlCheckboxToolbar: MARS_gui_ctrlCheckbox {
    color[] = {1,1,1,1};
    colorBackgroundHover[] = {QCOLOR_ACTIVE_RGBA};
    colorBackgroundPressed[] = {QCOLOR_ACTIVE_RGBA};
};

class MARS_gui_ctrlCheckboxBaseline: MARS_gui_ctrlCheckbox {
    CHECKBOX_TEXTURE("\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa","\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa")
};