class MARS_gui_ctrlCheckbox: MARS_gui_ctrlDefault
{
    type = CT_CHECKBOX; // Type
    //style = ST_LEFT + ST_MULTI; // Style

    checked = 0; // Default state

    //Colors
    color[] = {1,1,1,0.7}; // Texture color
    colorFocused[] = {1,1,1,1}; // Focused texture color
    colorHover[] = {1,1,1,1}; // Mouse over texture color
    colorPressed[] = {1,1,1,1}; // Mouse pressed texture color
    colorDisabled[] = {1,1,1,0.25}; // Disabled texture color

    //Background colors
    colorBackground[] = {0,0,0,0}; // Fill color
    colorBackgroundFocused[] = {0,0,0,0}; // Focused fill color
    colorBackgroundHover[] = {0,0,0,0}; // Mouse hover fill color
    colorBackgroundPressed[] = {0,0,0,0}; // Mouse pressed fill color
    colorBackgroundDisabled[] = {0,0,0,0}; // Disabled fill color

    //Textures
    textureChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";		//Texture of checked CheckBox.
    textureUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";		//Texture of unchecked CheckBox.
    textureFocusedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";	//Texture of checked focused CheckBox (Could be used for showing different texture when focused).
    textureFocusedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";	//Texture of unchecked focused CheckBox.
    textureHoverChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureHoverUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    texturePressedChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    texturePressedUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";
    textureDisabledChecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa";
    textureDisabledUnchecked = "\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa";

    //Sounds
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1}; // Sound played after control is activated in format {file, volume, pitch}
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1}; // Sound played when mouse cursor enters the control
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1}; // Sound played when the control is pushed down
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1}; // Sound played when the control is released after pushing down

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
class MARS_gui_ctrlCheckboxToolbar: MARS_gui_ctrlCheckbox
{
    color[] = {1,1,1,1};
    colorBackgroundHover[] = {COLOR_ACTIVE_RGBA};
    colorBackgroundPressed[] = {COLOR_ACTIVE_RGBA};
};
class MARS_gui_ctrlCheckboxBaseline: MARS_gui_ctrlCheckbox
{
    CHECKBOX_TEXTURE("\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureUnchecked_ca.paa","\a3\3DEN\Data\Controls\ctrlCheckbox\baseline_textureChecked_ca.paa")
};