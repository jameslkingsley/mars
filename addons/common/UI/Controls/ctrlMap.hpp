class MARS_gui_ctrlMap: MARS_gui_ctrlDefault
{
    type = CT_MAP_MAIN; // Type
    style = ST_PICTURE; // Style

    x = safezoneXAbs; // Horizontal coordinates
    y = safezoneY; // Vertical coordinates
    w = safezoneWAbs; // Width
    h = safezoneH; // Height

    sizeEx = 0.05; // Text size
    font = FONT_NORMAL; // Font from CfgFontFamilies
    colorText[] = {0,0,0,1}; // Text color

    moveOnEdges = 1; // Move map when cursor is near its edge. Discontinued.

    // Rendering density coefficients
    ptsPerSquareSea =	5;	// seas
    ptsPerSquareTxt =	20;	// textures
    ptsPerSquareCLn =	10;	// count-lines
    ptsPerSquareExp =	10;	// exposure
    ptsPerSquareCost =	10;	// cost

    // Rendering thresholds
    ptsPerSquareFor =	9;	// forests
    ptsPerSquareForEdge =	9;	// forest edges
    ptsPerSquareRoad =	6;	// roads
    ptsPerSquareObj =	9;	// other objects

    scaleMin = 0.0001; // Min map scale (i.e., max zoom)
    scaleMax = 1.0; // Max map scale (i.e., min zoom)
    scaleDefault = 0.16; // Default scale

    maxSatelliteAlpha = 0.85; // Maximum alpha of satellite map
    alphaFadeStartScale = 2; // Scale at which satellite map starts appearing
    alphaFadeEndScale = 2; // Scale at which satellite map is fully rendered

    text = "#(argb,8,8,3)color(1,1,1,1)"; // Fill texture
    colorBackground[] =		{0.969,		0.957,		0.949,		1.000}; // Fill color

    colorOutside[] =		{0.000,		0.000,		0.000,		1.000}; // Color outside of the terrain area (not sued when procedural terrain is enabled)
    colorSea[] =			{0.467,		0.631,		0.851,		0.500}; // Sea color
    colorForest[] =			{0.624,		0.780,		0.388,		0.500}; // Forest color
    colorForestBorder[] =		{0.000,		0.000,		0.000,		0.000}; // Forest border color
    colorRocks[] =			{0.000,		0.000,		0.000,		0.300}; // Rocks color
    colorRocksBorder[] =		{0.000,		0.000,		0.000,		0.000}; // Rocks border color

    colorLevels[] =			{0.286,		0.177,		0.094,		0.500}; // Elevation number color
    colorMainCountlines[] =		{0.572,		0.354,		0.188,		0.500}; // Main countline color (every 5th)
    colorCountlines[] =		{0.572,		0.354,		0.188,		0.250}; // Countline color

    colorMainCountlinesWater[] =	{0.491,		0.577,		0.702,		0.600}; // Main water countline color (every 5th)
    colorCountlinesWater[] =	{0.491,		0.577,		0.702,		0.300}; // Water countline color

    colorPowerLines[] =		{0.100,		0.100,		0.100,		1.000}; // Power lines color
    colorRailWay[] =		{0.800,		0.200,		0.000,		1.000}; // Railway color
    colorNames[] =			{0.100,		0.100,		0.100,		0.900}; // Unknown?
    colorInactive[] =		{1.000,		1.000,		1.000,		0.500}; // Unknown?

    colorTracks[] =			{0.840,		0.760,		0.650,		0.150}; // Small road border color
    colorTracksFill[] =		{0.840,		0.760,		0.650,		1.000}; // Small road color
    colorRoads[] =			{0.700,		0.700,		0.700,		1.000}; // Medium road border color
    colorRoadsFill[] =		{1.000,		1.000,		1.000,		1.000}; // Medium road color
    colorMainRoads[] = 		{0.900,		0.500,		0.300,		1.000}; // Large road border color
    colorMainRoadsFill[] =		{1.000,		0.600,		0.400,		1.000}; // Large road color

    colorGrid[] =			{0.100,		0.100,		0.100,		0.600}; // Grid coordinate color
    colorGridMap[] =		{0.100,		0.100,		0.100,		0.600}; // Grid line color

    fontLabel = FONT_NORMAL; // Tooltip font from CfgFontFamilies
    sizeExLabel = 0.05; // Tooltip font size

    fontGrid = FONT_SYSTEM; // Grid coordinate font from CfgFontFamilies
    sizeExGrid = 0.02; // Grid coordinate font size

    fontUnits = FONT_SYSTEM; // Selected group member font from CfgFontFamilies
    sizeExUnits = 0.05; // Selected group member font size

    fontNames = FONT_NARROW; // Marker font from CfgFontFamilies
    sizeExNames = 0.05; // Marker font size

    fontInfo = FONT_NORMAL; // Unknown?
    sizeExInfo = 0.05; // Unknown?

    fontLevel = FONT_SYSTEM; // Elevation number font
    sizeExLevel = 0.02; // Elevation number font size

    showCountourInterval = 1; // Show Legend

    class Legend
    {
        x = 0.5;
        y = 0.5;
        w = 0.4;
        h = 0.1;
        color[] = {0,0,0,1};
        colorBackground[] = {1,1,1,0.5};
        font = FONT_NORMAL;
        sizeEX = SIZEEX_PURISTA(SIZEEX_S);
    };

    class Task
    {
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        color[] = {1,1,1,1};

        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        colorCreated[] = {1,1,0,1};

        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        colorCanceled[] = {0.7,0.7,0.7,1};

        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        colorDone[] = {0.7,1,0.3,1};

        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        colorFailed[] = {1,0.3,0.2,1};

        size = 27;
        importance = 1; // Required, but not used
        coefMin = 1; // Required, but not used
        coefMax = 1; // Required, but not used
    };
    class ActiveMarker
    {
        color[] = {0,0,0,1}; // Icon color
        size = 2; // Size in pixels
    };
    class Waypoint
    {
        coefMax = 1; // Minimum size coefficient
        coefMin = 1; // Maximum size coefficient
        color[] = {0,0,0,1}; // Icon color
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa"; // Icon texture
        importance = 1; // Drawing importance (when multiple icons are close together, the one with larger importance is prioritized)
        size = 24; // Size in pixels
    };
    class WaypointCompleted: Waypoint
    {
        icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };
    class CustomMark: Waypoint
    {
        icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
    };
    class Command: Waypoint
    {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
    };
    class Bush: Waypoint
    {
        coefMax = 4;
        coefMin = 0.25;
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.007;
        size = 7;
    };
    class SmallTree: Bush
    {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.36;
        size = 12;
    };
    class Tree: SmallTree
    {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.72;
    };
    class Rock: SmallTree
    {
        color[] = {0.1,0.1,0.1,0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        importance = 0.3;
    };
    class BusStop: Bush
    {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
    };
    class FuelStation: Waypoint
    {
        coefMax = 1;
        coefMin = 0.85;
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
    };
    class Hospital: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
    };
    class Church: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
    };
    class Lighthouse: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
    };
    class Power: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
    };
    class PowerSolar: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
    };
    class PowerWave: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
    };
    class PowerWind: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
    };
    class Quay: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
    };
    class Transmitter: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
    };
    class Watertower: FuelStation
    {
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
    };
    class Cross: Waypoint
    {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
    };
    class Chapel: Cross
    {
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
    };
    class Shipwreck: Cross
    {
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
    };
    class Bunker: Waypoint
    {
        coefMax = 4;
        coefMin = 0.25;
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        importance = 1.05;
        size = 14;
    };
    class Fortress: Bunker
    {
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        importance = 1.6;
        size = 16;
    };
    class Fountain: Bunker
    {
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        importance = 0.6;
        size = 11;
    };
    class Ruin: Waypoint
    {
        coefMax = 4;
        coefMin = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        importance = 0.96;
        size = 16;
    };
    class Stack: Waypoint
    {
        coefMax = 4;
        coefMin = 0.9;
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        importance = 1.6;
        size = 20;
    };
    class Tourism: Waypoint
    {
        coefMax = 4;
        coefMin = 0.7;
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        importance = 2.8;
        size = 16;
    };
    class ViewTower: Waypoint
    {
        coefMax = 4;
        coefMin = 0.5;
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        importance = 2;
        size = 16;
    };

    onCanDestroy = "";
    onDestroy = "";
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

    onDraw = "";
};

class MARS_gui_ctrlMapEmpty: MARS_gui_ctrlMap
{
    ptsPerSquareSea =	1000;	// seas
    ptsPerSquareTxt =	1000;	// textures
    ptsPerSquareCLn =	1000;	// count-lines
    ptsPerSquareExp =	1000;	// exposure
    ptsPerSquareCost =	1000;	// cost

    ptsPerSquareFor =	1000;	// forests
    ptsPerSquareForEdge =	1000;	// forest edges
    ptsPerSquareRoad =	1000;	// roads
    ptsPerSquareObj =	1000;	// other objects

    alphaFadeStartScale = 0;
    alphaFadeEndScale = 0;

    colorBackground[] =		{1,1,1,1};
    colorOutside[] =		{1,1,1,1};

    colorSea[] =			{0,0,0,0};
    colorForest[] =			{0,0,0,0};
    colorForestBorder[] =		{0,0,0,0};
    colorRocks[] =			{0,0,0,0};
    colorRocksBorder[] =		{0,0,0,0};
    colorLevels[] =			{0,0,0,0};
    colorMainCountlines[] =		{0,0,0,0};
    colorCountlines[] =		{0,0,0,0};
    colorMainCountlinesWater[] =	{0,0,0,0};
    colorCountlinesWater[] =	{0,0,0,0};
    colorPowerLines[] =		{0,0,0,0};
    colorRailWay[] =		{0,0,0,0};
    colorNames[] =			{0,0,0,0};
    colorInactive[] =		{0,0,0,0};
    colorGrid[] =			{0,0,0,0};
    colorGridMap[] =		{0,0,0,0};

    class Task: Task
    {
        icon = "#(argb,8,8,3)color(0,0,0,0)";
        iconCreated = "#(argb,8,8,3)color(0,0,0,0)";
        iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
        iconDone = "#(argb,8,8,3)color(0,0,0,0)";
        iconFailed = "#(argb,8,8,3)color(0,0,0,0)";

        color[] = {0,0,0,0};
        colorCreated[] = {0,0,0,0};
        colorCanceled[] = {0,0,0,0};
        colorDone[] = {0,0,0,0};
        colorFailed[] = {0,0,0,0};

        size = 0;
    };

    #define EMPTY_ICON(CLASSNAME)\
        class CLASSNAME: CLASSNAME\
        {\
            icon = "#(argb,8,8,3)color(0,0,0,0)";\
            color[] = {0,0,0,0};\
            size = 0;\
        };

    EMPTY_ICON(Waypoint)
    EMPTY_ICON(WaypointCompleted)
    EMPTY_ICON(CustomMark)
    EMPTY_ICON(Command)
    EMPTY_ICON(Bush)
    EMPTY_ICON(Rock)
    EMPTY_ICON(SmallTree)
    EMPTY_ICON(Tree)
    EMPTY_ICON(busstop)
    EMPTY_ICON(fuelstation)
    EMPTY_ICON(hospital)
    EMPTY_ICON(church)
    EMPTY_ICON(lighthouse)
    EMPTY_ICON(power)
    EMPTY_ICON(powersolar)
    EMPTY_ICON(powerwave)
    EMPTY_ICON(powerwind)
    EMPTY_ICON(quay)
    EMPTY_ICON(shipwreck)
    EMPTY_ICON(transmitter)
    EMPTY_ICON(watertower)
    EMPTY_ICON(Bunker)
    EMPTY_ICON(Cross)
    EMPTY_ICON(Fortress)
    EMPTY_ICON(Fountain)
    EMPTY_ICON(Chapel)
    EMPTY_ICON(Ruin)
    EMPTY_ICON(Stack)
    EMPTY_ICON(Tourism)
    EMPTY_ICON(ViewTower)
};