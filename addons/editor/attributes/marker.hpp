class Marker {
    displayName = QUOTE(format [ARR_2('%1 Marker', (_this select 0))]);
    evalDisplayName = 1;
    actionConfirm = QFUNC(attrConfirmMarker);
    actionCancel = "";
    class All {
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
                type = "NUMBER";
                value = 1;
                width = 0.25;
            };
            class EditH {
                type = "NUMBER";
                value = 1;
                width = 0.25;
            };
        };
        class Color {
            displayName = "Color";
            tooltipText = "Color of the marker.";
            class MarkerColor {
                type = "MARKERCOLOR";
                selected = "Default";
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
        class BLUFOR {
            displayName = "Visible";
            tooltipText = "Which sides will this marker be visible to.";
            class Checkbox {
                type = "CHECKBOX";
                textPlain = "BLUFOR";
                checked = 1;
            };
        };

        #define SIDE_CHECKBOX(CNAME)\
            class CNAME {\
                class Checkbox {\
                    type = "CHECKBOX";\
                    textPlain = QUOTE(CNAME);\
                    checked = 1;\
                };\
            }

        SIDE_CHECKBOX(OPFOR);
        SIDE_CHECKBOX(INDFOR);
        SIDE_CHECKBOX(CIVILIAN);
    };
};
