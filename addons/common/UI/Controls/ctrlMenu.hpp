class MARS_gui_ctrlMenu: MARS_gui_ctrlDefaultText
{
	type = CT_STATIC;

	font = FONT_NORMAL; // Font of the strip and context menu items

	colorBorder[] = {0,0,0,0}; // Frame color
	colorBackground[] = {0,0,0,1};
	colorText[] = {COLOR_TEXT_RGBA};
	colorSelect[] = {0,0,0,1}; // Used only when the item is not disabled
	colorSelectBackground[] = {COLOR_ACTIVE_RGBA}; // Used even when item is disabled
	colorDisabled[] = {COLOR_TEXT_RGB,0.25};

	colorPicture[] = {1,1,1,1};
	colorPictureSelect[] = {0,0,0,1};
	colorPictureDisabled[] = {1,1,1,0.5};

	arrow = "\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa"; // Texture of "expand" arrow
	rowHeight = 0; // Context menu row height (should behave same as the same attribute in CT_LISTBOX)
	itemSpacingW = 0.01; // Horizontal space between context menus, should support negative values
	itemSpacingH = 0.01; // Vertical space between menu strip and the first context menu, should support negative values

	pictureCheckboxEnabled = "\a3\3DEN\Data\Controls\ctrlMenu\pictureCheckboxEnabled_ca.paa"; // Picture for checked checkbox
	pictureCheckboxDisabled= "#(argb,8,8,3)color(0,0,0,0)"; // Picture for unchecked checkbox
	pictureRadioEnabled = "\a3\3DEN\Data\Controls\ctrlMenu\pictureRadioEnabled_ca.paa"; // Picture for checked radio button
	pictureRadioDisabled= "#(argb,8,8,3)color(0,0,0,0)"; // Picture for unchecked radio button
	
	text = "";
};