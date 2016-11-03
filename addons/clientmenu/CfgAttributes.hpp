class GVARMAIN(attributes) {
    class ADDON {
        class interface {
            displayName = CSTRING(Title);
            actionConfirm = "";
            actionCancel = "";
            class Terrain {
                class Detail {
                    displayName = CSTRING(Detail_Name);
                    tooltipText = CSTRING(Detail_Tooltip);
                    class Options {
                        condition = "(true)";
                        type = "COMBO";
                        labels[] = {"Low", "Medium", "High", "Very High"};
                        values[] = {25, 12.5, 6.25, 3.125};
                        selected = QGVAR(terrainDetail);
                        expression = QUOTE(\
                            _value = parseNumber (_this select 1);\
                            [_value] call FUNC(setTerrainDetail);\
                        );
                    };
                };
                class Distance {
                    displayName = CSTRING(Distance_Name);
                    tooltipText = CSTRING(Distance_Tooltip);
                    class Options {
                        condition = "(true)";
                        type = "SLIDER";
                        range[] = {500, 10000};
                        step = 500;
                        position = QGVAR(viewDistance);
                        expression = QUOTE(\
                            [_this] call FUNC(setViewDistance);\
                        );
                        onSliderPosChanged = QUOTE(\
                            _ctrl = _this select 0;\
                            _value = round (sliderPosition _ctrl);\
                            _ctrl ctrlSetTooltip format [ARR_2('%1m', _value)];\
                        );
                    };
                };
            };
            class Editor {
                class Mars {
                    displayName = CSTRING(Editor_Name);
                    tooltipText = CSTRING(Editor_Tooltip);
                    class Button {
                        condition = QUOTE([player] call EFUNC(editor,canLogin));
                        type = "BUTTON";
                        textCode = QUOTE(\
                            private _canLogin = [player] call EFUNC(editor,canLogin);\
                            ([ARR_2('Editor Unavailable', 'Open Editor')] select (_canLogin))\
                        );
                        action = QEFUNC(editor,openEditor);
                    };
                };
                class Zeus {
                    displayName = "Zeus";
                    tooltipText = "Login to Zeus to start editing the current running mission. Only one person can be logged into Zeus.";
                    class Label {
                        condition = "(true)";
                        type = "LABEL";
                        width = 0.66;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorString))) then {\
                                ([] call EFUNC(zeus,getCuratorString))\
                            } else {\
                                'Undefined'\
                            };\
                        );
                    };
                    class Button {
                        condition = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,isAvailable))) then {\
                                ([] call EFUNC(zeus,isAvailable))\
                            } else {\
                                false\
                            };\
                        );
                        type = "BUTTON";
                        width = 0.33;
                        textCode = QUOTE(\
                            if (!isNil QUOTE(QEFUNC(zeus,getCuratorBtnString))) then {\
                                ([] call EFUNC(zeus,getCuratorBtnString))\
                            } else {\
                                'Disabled'\
                            };\
                        );
                        action = QUOTE([] call EFUNC(zeus,openZeus));
                    };
                };
            };
        };
    };
};
