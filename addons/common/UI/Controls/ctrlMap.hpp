class MARS_gui_ctrlMap: MARS_gui_ctrlDefault {
    type = CT_MAP_MAIN;
    style = ST_PICTURE;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    sizeEx = SIZEEX_PURISTA_M;
    font = FONT_NORMAL;
    colorText[] = {0,0,0,1};
    moveOnEdges = 1;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    scaleMin = 0.0001;
    scaleMax = 1.0;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 2;
    alphaFadeEndScale = 2;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    idcMarkerColor = -1;
	idcMarkerIcon = -1;
	textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	showMarkers = true;
    colorBackground[] = {0.969,0.957,0.949,1.000};
    colorOutside[] = {0.000,0.000,0.000,1.000};
    colorSea[] = {0.467,0.631,0.851,0.500};
    colorForest[] = {0.624,0.780,0.388,0.500};
    colorForestBorder[] = {0.000,0.000,0.000,0.000};
    colorRocks[] = {0.000,0.000,0.000,0.300};
    colorRocksBorder[] = {0.000,0.000,0.000,0.000};
    colorLevels[] = {0.286,0.177,0.094,0.500};
    colorMainCountlines[] = {0.572,0.354,0.188,0.500};
    colorCountlines[] = {0.572,0.354,0.188,0.250};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.600};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.300};
    colorPowerLines[] = {0.100,0.100,0.100,1.000};
    colorRailWay[] = {0.800,0.200,0.000,1.000};
    colorNames[] = {0.100,0.100,0.100,0.900};
    colorInactive[] = {1.000,1.000,1.000,0.500};
    colorTracks[] = {0.840,0.760,0.650,0.150};
    colorTracksFill[] = {0.840,0.760,0.650,1.000};
    colorRoads[] = {0.700,0.700,0.700,1.000};
    colorRoadsFill[] = {1.000,1.000,1.000,1.000};
    colorMainRoads[] = {0.900,0.500,0.300,1.000};
    colorMainRoadsFill[] = {1.000,0.600,0.400,1.000};
    colorGrid[] = {0.100,0.100,0.100,0.600};
    colorGridMap[] = {0.100,0.100,0.100,0.600};
    fontLabel = FONT_NORMAL;
    sizeExLabel = SIZEEX_PURISTA_M;
    fontGrid = FONT_SYSTEM;
    sizeExGrid = SIZEEX_PURISTA_S;
    fontUnits = FONT_SYSTEM;
    sizeExUnits = SIZEEX_PURISTA_M;
    fontNames = FONT_NARROW;
    sizeExNames = SIZEEX_PURISTA_M;
    fontInfo = FONT_NORMAL;
    sizeExInfo = SIZEEX_PURISTA_M;
    fontLevel = FONT_SYSTEM;
    sizeExLevel = SIZEEX_PURISTA_M;
    showCountourInterval = 0;
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

    class Legend {
        x = 0.5;
        y = 0.5;
        w = 0.4;
        h = 0.1;
        color[] = {0,0,0,1};
        colorBackground[] = {1,1,1,0.5};
        font = FONT_NORMAL;
        sizeEx = SIZEEX_PURISTA_S;
    };

    class Task {
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
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };

    class ActiveMarker {
        color[] = {0,0,0,1};
        size = 2;
    };

    class Waypoint {
        coefMax = 1;
        coefMin = 1;
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        importance = 1;
        size = 24;
    };

    class WaypointCompleted: Waypoint {
        icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
    };

    class CustomMark: Waypoint {
        icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
    };

    class Command: Waypoint {
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
    };

    class Bush: Waypoint {
        coefMax = 4;
        coefMin = 0.25;
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.007;
        size = 7;
    };

    class SmallTree: Bush {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.36;
        size = 12;
    };

    class Tree: SmallTree {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        importance = 0.72;
    };

    class Rock: SmallTree {
        color[] = {0.1,0.1,0.1,0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        importance = 0.3;
    };

    class BusStop: Bush {
        color[] = {0.45,0.64,0.33,0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
    };

    class FuelStation: Waypoint {
        coefMax = 1;
        coefMin = 0.85;
        color[] = {1,1,1,1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
    };

    class Hospital: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
    };

    class Church: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
    };
    class Lighthouse: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
    };

    class Power: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
    };

    class PowerSolar: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
    };

    class PowerWave: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
    };

    class PowerWind: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
    };

    class Quay: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
    };

    class Transmitter: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
    };

    class Watertower: FuelStation {
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
    };

    class Cross: Waypoint {
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
    };

    class Chapel: Cross {
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
    };

    class Shipwreck: Cross {
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
    };

    class Bunker: Waypoint {
        coefMax = 4;
        coefMin = 0.25;
        color[] = {0,0,0,1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        importance = 1.05;
        size = 14;
    };

    class Fortress: Bunker {
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        importance = 1.6;
        size = 16;
    };

    class Fountain: Bunker {
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        importance = 0.6;
        size = 11;
    };

    class Ruin: Waypoint {
        coefMax = 4;
        coefMin = 1;
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        importance = 0.96;
        size = 16;
    };

    class Stack: Waypoint {
        coefMax = 4;
        coefMin = 0.9;
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        importance = 1.6;
        size = 20;
    };

    class Tourism: Waypoint {
        coefMax = 4;
        coefMin = 0.7;
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        importance = 2.8;
        size = 16;
    };

    class ViewTower: Waypoint {
        coefMax = 4;
        coefMin = 0.5;
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        importance = 2;
        size = 16;
    };

    class LineMarker {
        lineDistanceMin = 3e-005;
        lineLengthMin = 5;
        lineWidthThick = 0.014;
        lineWidthThin = 0.008;
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class MARS_gui_ctrlMapEmpty: MARS_gui_ctrlMap {
    ptsPerSquareSea = 1000;
    ptsPerSquareTxt = 1000;
    ptsPerSquareCLn = 1000;
    ptsPerSquareExp = 1000;
    ptsPerSquareCost = 1000;
    ptsPerSquareFor = 1000;
    ptsPerSquareForEdge = 1000;
    ptsPerSquareRoad = 1000;
    ptsPerSquareObj = 1000;
    alphaFadeStartScale = 0;
    alphaFadeEndScale = 0;
    colorBackground[] = {1,1,1,1};
    colorOutside[] = {1,1,1,1};
    colorSea[] = {0,0,0,0};
    colorForest[] = {0,0,0,0};
    colorForestBorder[] = {0,0,0,0};
    colorRocks[] = {0,0,0,0};
    colorRocksBorder[] = {0,0,0,0};
    colorLevels[] = {0,0,0,0};
    colorMainCountlines[] = {0,0,0,0};
    colorCountlines[] = {0,0,0,0};
    colorMainCountlinesWater[] = {0,0,0,0};
    colorCountlinesWater[] = {0,0,0,0};
    colorPowerLines[] = {0,0,0,0};
    colorRailWay[] = {0,0,0,0};
    colorNames[] = {0,0,0,0};
    colorInactive[] = {0,0,0,0};
    colorGrid[] = {0,0,0,0};
    colorGridMap[] = {0,0,0,0};

    class Task: Task {
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
        class CLASSNAME: CLASSNAME {\
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