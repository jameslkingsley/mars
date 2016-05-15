class MARS_gui_ctrlShortcutButton: MARS_gui_ctrlDefaultButton
{
	type = CT_SHORTCUTBUTTON; // Type
	style = ST_UPPERCASE;

	colorBackground[] = {0,0,0,1}; // Fill color
	colorBackground2[] = {COLOR_ACTIVE_RGBA}; // Selected fill color
	colorBackgroundFocused[] = {COLOR_ACTIVE_RGBA}; // Selected fill color (oscillates between this and colorBackground2)
	colorBackgroundActive[] = {COLOR_ACTIVE_RGBA}; // Mouse hover fill color

	text = ""; // Displayed text
	size = SIZEEX_PURISTA(SIZE_M); // Text size
	color[] = {COLOR_TEXT_RGBA}; // Text color
	color2[] = {COLOR_TEXT_RGBA}; // Selected fill color
	colorFocused[] = {COLOR_TEXT_RGBA}; // Selected text color (oscillates between this and color2)
	colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color

	// Texture must be in 4:1 ratio. Square areas on left and right are undeformed, space inbetween is stretched to fit button width
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)"; // Background texture
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)"; // Mouse over background texture
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)"; // Mouse pressed background texture
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)"; // Focused background texture
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)"; // Disabled background texture
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)"; // Unknown?

	period = 1; // Oscillation time between color2/colorBackground2 and colorFocused/colorBackgroundFocused when selected
	periodFocus = 1; // Oscillation time between color2/colorBackground2 and colorFocused/colorBackgroundFocused when focused
	periodOver = 0.5; // Oscillation time between color2/colorBackground2 and colorFocused/colorBackgroundFocused during mouse hover

	shortcuts[] = {KEY_XBOX_A, DIK_RETURN, DIK_SPACE, DIK_NUMPADENTER}; // DIK codes of keyoboard shortcuts
	textureNoShortcut = "#(argb,8,8,3)color(1,1,1,1)"; // Icon displayed on ShortcutPos position when no shortcut key is found

	class Attributes
	{
		align = "center"; // Text align
		color = "#ffffff"; // Text color
		font = FONT2_THIN; // Font from CfgFontFamilies
		shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	};
	class HitZone // Clickable area
	{
		left = 0; // Left border
		top = 0; // Top border
		right = 0; // Right border
		bottom = 0; // Bottom border
	};
	class TextPos // Text position inside button
	{
		left = 0; // Left border
		top = 0; // Top border
		right = 0; // Right border
		bottom = 0; // Bottom border
	};
	class ShortcutPos // Shortcut icon position (e.g., XboX A button), based on keys in shortcuts[] attribute
	{
		left = 0; // Horizontal coordinates
		top = 0; // Horizontal coordinates
		w = 0; // Width
		h = 0; // Height
	};

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

	onButtonClick = "";
	onButtonDown = "";
	onButtonUp = "";
};
class MARS_gui_ctrlShortcutButtonOK: MARS_gui_ctrlShortcutButton
{
	default = 1;
	idc = IDC_OK;
	text = $STR_DISP_OK;
};
class MARS_gui_ctrlShortcutButtonCancel: MARS_gui_ctrlShortcutButton
{
	idc = IDC_CANCEL;
	text = $STR_DISP_CANCEL;
};