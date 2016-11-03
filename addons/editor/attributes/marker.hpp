class Marker {
    displayName = QUOTE(format [ARR_2('%1 Marker', (_this select 0))]);
    evalDisplayName = 1;
    actionConfirm = "";
    actionCancel = "";
    class General {
        class Name {
            displayName = "Name";
            tooltipText = "Variable name of the marker.";
            class Edit {
                type = "EDIT";
            };
        };
        class Text {
            displayName = "Text";
            tooltipText = "Text shown on the marker.";
            class Edit {
                type = "EDIT";
            };
        };
    };
    class Coordinates {
        class Position {
            displayName = "Position";
            tooltipText = "Position of the marker.";
            class Vector {
                type = "VECTOR";
                value = QUOTE((ATTR_ARGS param [ARR_2(1, [ARR_3(0,0,0)])]) apply {round _x});
            };
        };
        class Size {
            displayName = "Size";
            tooltipText = "Size of the marker.";
            class EditW {
                type = "EDIT";
                textPlain = "1";
            };
            class EditH {
                type = "EDIT";
                textPlain = "1";
            };
        };
    };
    class Color {
        class Color {
            displayName = "Color";
            tooltipText = "Color of the marker.";
            class Combo {
                type = "COMBO";
                values = QUOTE((('true' configClasses (configFile >> 'CfgMarkerColors')) apply {configName _x}));
                labels = QUOTE((('true' configClasses (configFile >> 'CfgMarkerColors')) apply {getText (_x >> 'name')}));
            };
        };
        class Alpha {
            displayName = "Alpha";
            tooltipText = "Alpha of the marker.";
            class Slider {
                type = "SLIDER";
                range[] = {0, 1};
                step = 0.1;
                position = 1;
            };
        };
    };
};
