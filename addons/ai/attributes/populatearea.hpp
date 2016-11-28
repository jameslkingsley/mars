class PopulateArea {
    displayName = "Populate Area";
    actionConfirm = QFUNC(populateArea);
    actionCancel = "";
    class Settings {
        class Faction {
            displayName = "Faction";
            tooltipText = "";
            class Side {
                type = "COMBO";
                identifier = "Side";
                labels[] = {"BLUFOR", "OPFOR", "INDFOR"};
                values[] = {SIDE_WEST, SIDE_EAST, SIDE_GUER};
                onLBSelChanged = QUOTE(\
                    private _ctrlFaction = ['Faction'] call AFUNC(getControl);\
                    [ARR_2(_ctrlFaction, 'update')] call AFUNC(execControlFunction);\
                );
            };
            class Faction {
                type = "COMBO";
                identifier = "Faction";
                labels = QUOTE(\
                    private _ctrlSide = ['Side'] call AFUNC(getControl);\
                    private _sideInt = parseNumber (_ctrlSide lbData (lbCurSel _ctrlSide));\
                    private _factions = format [ARR_2('getNumber (_x >> ''side'') == %1', _sideInt)] configClasses (configFile >> 'CfgFactionClasses');\
                    (_factions apply {getText (_x >> 'displayName')})\
                );
                values = QUOTE(\
                    private _ctrlSide = ['Side'] call AFUNC(getControl);\
                    private _sideInt = parseNumber (_ctrlSide lbData (lbCurSel _ctrlSide));\
                    private _factions = format [ARR_2('getNumber (_x >> ''side'') == %1', _sideInt)] configClasses (configFile >> 'CfgFactionClasses');\
                    (_factions apply {configName _x})\
                );
            };
        };
        class Infantry {
            displayName = "Options";
            tooltipText = "";
            class Checkbox {
                type = "CHECKBOX";
                textPlain = "Infantry";
                checked = true;
                onCheckedChanged = QUOTE(\
                    params [ARR_2('_control','_state')];\
                    [ARR_2((['Infantry'] call AFUNC(getControl)), INT2BOOL(_state))] call AFUNC(enableControlSet);\
                );
            };
            class Slider {
                type = "SLIDER";
                identifier = "Infantry";
                range[] = {1, 10};
                step = 1;
                position = "random 10";
                onSliderPosChanged = QUOTE(\
                    _ctrl = _this select 0;\
                    _value = round (sliderPosition _ctrl);\
                    _ctrl ctrlSetTooltip format [ARR_3('%1%2', _value * 10, '%')];\
                );
            };
        };
        
        #define OPTION_CHECKBOX(CNAME, DNAME, CHECKED)\
            class CNAME {\
                class Checkbox {\
                    type = "CHECKBOX";\
                    textPlain = DNAME;\
                    checked = CHECKED;\
                    onCheckedChanged = QUOTE(\
                        params [ARR_2('_control','_state')];\
                        [ARR_2(([QUOTE(QUOTE(CNAME))] call AFUNC(getControl)), INT2BOOL(_state))] call AFUNC(enableControlSet);\
                    );\
                };\
                class Slider {\
                    condition = QUOTE(CHECKED);\
                    type = "SLIDER";\
                    identifier = QUOTE(CNAME);\
                    range[] = {1, 10};\
                    step = 1;\
                    position = "random 10";\
                    onSliderPosChanged = QUOTE(\
                        _ctrl = _this select 0;\
                        _value = round (sliderPosition _ctrl);\
                        _ctrl ctrlSetTooltip format [ARR_3('%1%2', _value * 10, '%')];\
                    );\
                };\
            }
        
        OPTION_CHECKBOX(Cars, "Cars", true);
        OPTION_CHECKBOX(Armor, "Armor", false);
        OPTION_CHECKBOX(AA, "Anti-Air", false);
        OPTION_CHECKBOX(Helicopters, "Helicopters", false);
        OPTION_CHECKBOX(Planes, "Planes", false);
    };
};
