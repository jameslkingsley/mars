class GVARMAIN(attributes) {
    class ADDON {
        class Settings {
            displayName = "Artillery Settings";
            actionConfirm = "";
            actionCancel = QUOTE(\
                GVAR(roundCount) = [ARR_2(QUOTE(QGVAR(roundCount)), 1)] call CFUNC(loadSetting);\
                GVAR(showLines) = [ARR_2(QUOTE(QGVAR(showLines)), true)] call CFUNC(loadSetting);\
            );
            class AttributeCategories {
                class Main {
                    class AttributeItems {
                        class RoundCount {
                            displayName = "Round count";
                            tooltipText = "Default number of rounds to fire";
                            class AttributeControls {
                                class Number {
                                    condition = "(true)";
                                    type = "EDIT";
                                    textCode = QUOTE(str GVAR(roundCount));
                                    expression = QUOTE(\
                                        GVAR(roundCount) = parseNumber _this;\
                                        [ARR_2(QUOTE(QGVAR(roundCount)), parseNumber _this)] call CFUNC(saveSetting);\
                                    );
                                };
                            };
                        };
                        class ShowLines {
                            displayName = "Show lines";
                            tooltipText = "Show the 3D lines indicating the flight time and 2D position";
                            class AttributeControls {
                                class Bool {
                                    condition = "(true)";
                                    type = "CHECKBOX";
                                    checked = QGVAR(showLines);
                                    expression = QUOTE(\
                                        GVAR(showLines) = _this;\
                                        [ARR_2(QUOTE(QGVAR(showLines)), _this)] call CFUNC(saveSetting);\
                                    );
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};