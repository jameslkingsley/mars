class Marker {
    displayName = QUOTE(ATTR_ARGS param [ARR_2(0, 'Marker')]);
    evalDisplayName = 1;
    actionConfirm = QFUNC(attrConfirmMarker);
    actionCancel = "";
    class All {
        class Name {
            displayName = "Name";
            tooltipText = "Variable name of the marker.";
            class Edit {
                type = "EDIT";
                condition = QUOTE(ATTR_ARGS param [ARR_2(9, true)]);
                textCode = QUOTE(ATTR_ARGS param [ARR_2(3, '')]);
            };
        };
        class Text {
            displayName = "Text";
            tooltipText = "Text shown on the marker.";
            class Edit {
                type = "EDIT";
                textCode = QUOTE(ATTR_ARGS param [ARR_2(4, '')]);
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
                value = QUOTE(ATTR_ARGS param [ARR_2(5, 1)]);
                width = 0.25;
            };
            class EditH {
                type = "NUMBER";
                value = QUOTE(ATTR_ARGS param [ARR_2(6, 1)]);
                width = 0.25;
            };
        };
        class Color {
            displayName = "Color";
            tooltipText = "Color of the marker.";
            class MarkerColor {
                type = "MARKERCOLOR";
                selected = QUOTE(ATTR_ARGS param [ARR_2(7, 'Default')]);
                evalSelected = 1;
            };
        };
        class Alpha {
            displayName = "Alpha";
            tooltipText = "Alpha of the marker.";
            class Slider {
                type = "SLIDER";
                range[] = {0, 1};
                step = 0.1;
                position = QUOTE(ATTR_ARGS param [ARR_2(8, 1)]);
            };
        };

        #define CHECKBOX_INIT(SIDE)\
            init = QUOTE(\
                private _enabled = ATTR_ARGS param [ARR_2(9, true)];\
                if (!_enabled) then {\
                    private _control = [QUOTE(QUOTE(DOUBLES(Checkbox,SIDE)))] call AFUNC(getControl);\
                    [ARR_2(_control, false)] call AFUNC(enableControlSet);\
                };\
            )

        class BLUFOR {
            displayName = "Visible";
            tooltipText = "Which sides will this marker be visible to.";
            CHECKBOX_INIT(BLUFOR);
            class Checkbox {
                type = "CHECKBOX";
                textPlain = "BLUFOR";
                identifier = "Checkbox_BLUFOR";
                checked = 1;
            };
        };

        #define SIDE_CHECKBOX(CNAME)\
            class CNAME {\
                CHECKBOX_INIT(CNAME);\
                class Checkbox {\
                    type = "CHECKBOX";\
                    textPlain = QUOTE(CNAME);\
                    identifier = QUOTE(DOUBLES(Checkbox,CNAME));\
                    checked = 1;\
                };\
            }

        SIDE_CHECKBOX(OPFOR);
        SIDE_CHECKBOX(INDFOR);
        SIDE_CHECKBOX(CIVILIAN);
    };
};
