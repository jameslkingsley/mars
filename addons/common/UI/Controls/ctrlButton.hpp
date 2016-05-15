class MARS_gui_ctrlButton: MARS_gui_ctrlDefaultButton
{
	type = CT_BUTTON; // Type
	style = ST_CENTER + ST_UPPERCASE;

	colorBackground[] = {0,0,0,1}; // Fill color
	colorBackgroundDisabled[] = {0,0,0,0.5}; // Disabled fill color
	colorBackgroundActive[] = {COLOR_ACTIVE_RGBA}; // Mouse hover fill color
	colorFocused[] = {COLOR_ACTIVE_RGBA}; // Selected fill color (oscillates between this and colorBackground)

	font = FONT2_THIN;
	text = ""; // Displayed text
	colorText[] = {COLOR_TEXT_RGBA}; // Text color
	colorDisabled[] = {COLOR_TEXT_RGB,0.25}; // Disabled text color

	borderSize = 0; // Left color width (border is a stripe of the control height on the left side)
	colorBorder[] = {0,0,0,0}; // Left border color

	colorShadow[] = {0,0,0,0}; // Background frame color
	offsetX = 0; // Horizontal background frame offset
	offsetY = 0; // Vertical background frame offset
	offsetPressedX = pixelW; // Horizontal background offset when pressed
	offsetPressedY = pixelH; // Horizontal background offset when pressed

	period = 0; // Oscillation time between colorBackground and colorFocused when selected
	periodFocus = 2; // Unknown?
	periodOver = 0.5; // Unknown?

	// Xbox hints (behavior unknown)
	class KeyHints
	{
		class A
		{
			key = KEY_XBOX_A;
			hint = "KEY_XBOX_A";
		}
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
	//onLoad = "(_this select 0) ctrlsettext toupper ctrltext (_this select 0);";

	onButtonClick = "";
	onButtonDown = "";
	onButtonUp = "";
};
class MARS_gui_ctrlButtonPicture: MARS_gui_ctrlButton
{
	style = ST_CENTER + ST_PICTURE;
};
class MARS_gui_ctrlButtonPictureKeepAspect: MARS_gui_ctrlButton
{
	style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
};
class MARS_gui_ctrlButtonOK: MARS_gui_ctrlButton
{
	default = 1;
	idc = IDC_OK;
	text = $STR_DISP_OK;//$STR_3DEN_Button_OK;
};
class MARS_gui_ctrlButtonCancel: MARS_gui_ctrlButton
{
	idc = IDC_CANCEL;
	text = $STR_DISP_CANCEL;//$STR_3DEN_Button_Cancel;
};
class MARS_gui_ctrlButtonClose: MARS_gui_ctrlButtonCancel
{
	text = $STR_DISP_CLOSE;//$STR_3DEN_Button_Close;
};
class MARS_gui_ctrlButtonToolbar: MARS_gui_ctrlButtonPictureKeepAspect
{
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
};
class MARS_gui_ctrlButtonSearch: MARS_gui_ctrlButton
{
	style = ST_CENTER + ST_PICTURE + ST_KEEP_ASPECT_RATIO;
	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	textSearch = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
	tooltip = $STR_3den_display3den_menubar_search_text;
};
class MARS_gui_ctrlButtonFilter: MARS_gui_ctrlButton
{
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {1,1,1,0.3};
	colorFocused[] = {0,0,0,0};
};