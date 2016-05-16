class MARS_gui_ctrlTree: MARS_gui_ctrlDefaultText
{
    type = CT_TREE; // Type

    colorBorder[] = {0,0,0,1}; // Frame color
    colorLines[] = {0,0,0,0}; // Structure line color (ToDo: Implement)

    colorBackground[] = {0,0,0,0}; // Fill color
    colorSelect[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color (when multiselectEnabled is 0)
    colorMarked[] = {COLOR_ACTIVE_RGB,0.5}; // Marked item fill color (when multiselectEnabled is 1)
    colorMarkedSelected[] = {COLOR_ACTIVE_RGBA}; // Selected item fill color (when multiselectEnabled is 1)

    colorText[] = {COLOR_TEXT_RGBA}; // Text color
    colorSelectText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 0)
    colorMarkedText[] = {1,1,1,1}; // Selected text color (when multiselectEnabled is 1)

    colorPicture[] = {1,1,1,1}; // Picture color
    //colorPictureSelected[] = {1,1,1,1}; // Selected picture color
    //colorPictureDisabled[] = {1,1,1,0.25}; // Disabled picture color

    colorPictureRight[] = {1,0,1,1}; // Right picture color
    //colorPictureRightSelected[] = {1,1,0,1}; // Selected right picture color
    //colorPictureRightDisabled[] = {1,1,1,0.25}; // Disabled right picture color

    multiselectEnabled = 0; // Allow selecting multiple items while holding Ctrl or Shift
    expandOnDoubleclick = 1; // Expand/collapse item upon double-click
    hiddenTexture = "\a3\3DEN\Data\Controls\ctrlTree\hiddenTexture_ca.paa"; // Expand icon
    expandedTexture = "\a3\3DEN\Data\Controls\ctrlTree\expandedTexture_ca.paa"; // Collapse icon
    maxHistoryDelay = 1; // Time since last keyboard type search to reset it
    disableKeyboardSearch = 0; // 1 to disable searching by typing

    // Scrollbar configuration
    class ScrollBar: ScrollBar
    {
        scrollSpeed = 0.05;
    };

    colorDisabled[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown
    colorArrow[] = {0,0,0,0}; // Does nothing, but must be present, otherwise an error is shown

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

    onTreeSelChanged = "";
    onTreeLButtonDown = "";
    onTreeDblClick = "";
    onTreeExpanded = "";
    onTreeCollapsed = "";
    //onTreeMouseMove = ""; // Causing CTD
    //onTreeMouseHold = ""; // Causing CTD
    onTreeMouseExit = "";
};