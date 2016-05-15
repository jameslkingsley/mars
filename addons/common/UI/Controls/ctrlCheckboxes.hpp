class MARS_gui_ctrlCheckboxes: MARS_gui_ctrlDefaultText
{
	type = CT_CHECKBOXES; // Type

	colorBackground[] = {COLOR_OVERLAY_RGBA}; // Background color

	colorText[] = {1,1,1,1}; // Text color
	colorTextSelect[] = {1,1,1,1}; // Selected text color

	rows = 1; // Number of rows
	columns = 1; // Number of columns
	strings[] = {}; // Options (added row by row)
	checked_strings[] = {}; // Checked options

	color[] = {1,0,1,1}; // Does nothing, but must be present, otherwise an error is shown
	colorSelect[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
	colorTextDisable[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
	colorDisable[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown

	colorSelectedBg[] = {COLOR_ACTIVE_RGBA}; // Fill color

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

	onCheckBoxesSelChanged = "";
};
class MARS_gui_ctrlCheckboxesCheckbox: MARS_gui_ctrlCheckboxes
{
	style = ST_PICTURE;
	strings[] = {"\a3\3DEN\Data\Controls\ctrlCheckbox\textureUnchecked_ca.paa"};
	checked_strings[] = {"\a3\3DEN\Data\Controls\ctrlCheckbox\textureChecked_ca.paa"};
	colorBackground[] = {0,0,0,0};
	colorSelectedBg[] = {0,0,0,0};
};