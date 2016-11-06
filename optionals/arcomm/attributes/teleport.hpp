class Teleport {
    displayName = "Teleport";
    actionConfirm = QUOTE(_this call FUNC(teleport));
    actionCancel = "";
    class Basic {
        class PlayerList {
            displayName = "Player Selection";
            tooltipText = "Select which units you want to affect";
            class Control {
                condition = "(true)";
                type = "LIST";
                multi = true;
                labels = QUOTE(\
                    private _labels = allPlayers select {alive _x};\
                    _labels = _labels apply {name _x};\
                    _labels\
                );
                values = QUOTE(\
                    private _values = allPlayers select {alive _x};\
                    _values = _values apply {getPlayerUID _x};\
                    _values\
                );
                expression = "";
            };
        };
        class InsertionMethod {
            displayName = "Insertion Method";
            tooltipText = "Choose the teleportation method for the selected units";
            class Control {
                condition = "(true)";
                type = "COMBO";
                labels[] = {"Teleport", "Paradrop"};
                values[] = {"teleport", "paradrop"};
                selected = 0;
                expression = "";
                onLBSelChanged = QUOTE(\
                    params [ARR_2('_control', '_index')];\
                    private _paraHeight = ['ParaHeight'] call AFUNC(getControl);\
                    private _paraRadius = ['ParaRadius'] call AFUNC(getControl);\
                    [ARR_2(_paraHeight, (_index == 1))] call AFUNC(enableControlSet);\
                    [ARR_2(_paraRadius, (_index == 1))] call AFUNC(enableControlSet);\
                );
            };
        };
        class ParaHeight {
            displayName = "Paradrop Height";
            tooltipText = "Height in meters to paradrop the selected units";
            class Control {
                condition = "(false)";
                identifier = "ParaHeight";
                type = "SLIDER";
                range[] = {150, 1000};
                step = 100;
                position = 400;
                expression = "";
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _value = round (sliderPosition _ctrl);\
                    _ctrl ctrlSetTooltip format [ARR_2('%1m', [ARR_2(_value, 0)] call CFUNC(roundToN))];\
                );
            };
        };
        class ParaRadius {
            displayName = "Paradrop Radius";
            tooltipText = "Radius in meters to disperse the selected units";
            class Control {
                condition = "(false)";
                identifier = "ParaRadius";
                type = "SLIDER";
                range[] = {100, 1500};
                step = 100;
                position = 500;
                expression = "";
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _value = round (sliderPosition _ctrl);\
                    _ctrl ctrlSetTooltip format [ARR_2('%1m', [ARR_2(_value, 0)] call CFUNC(roundToN))];\
                );
            };
        };
        class Destination {
            displayName = "Destination";
            tooltipText = "Position you want the selected units to be sent to";
            class Control {
                condition = "(true)";
                type = "MAP";
                position = "getPosATL player";
                expression = "";
            };
        };
    };
};
