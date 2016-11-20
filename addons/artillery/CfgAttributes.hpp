class GVARMAIN(attributes) {
    class ADDON {
        class Settings {
            displayName = CSTRING(Settings);
            actionConfirm = "";
            actionCancel = QUOTE(\
                GVAR(roundCount) = [ARR_2(QQGVAR(roundCount), 1)] call CFUNC(loadSetting);\
                GVAR(dispersion) = [ARR_2(QQGVAR(dispersion), 25)] call CFUNC(loadSetting);\
                GVAR(showLines) = [ARR_2(QQGVAR(showLines), true)] call CFUNC(loadSetting);\
            );
            class Main {
                class RoundCount {
                    displayName = "Round count";
                    tooltipText = "Default number of rounds to fire";
                    class Number {
                        condition = "(true)";
                        type = "EDIT";
                        textCode = QUOTE(str GVAR(roundCount));
                        expression = QUOTE(\
                            GVAR(roundCount) = parseNumber _this;\
                            [ARR_2(QQGVAR(roundCount), parseNumber _this)] call CFUNC(saveSetting);\
                        );
                    };
                };
                class Dispersion {
                    displayName = "Dispersion";
                    tooltipText = "Dispersion of rounds in meters";
                    class Number {
                        condition = "(true)";
                        type = "EDIT";
                        textCode = QUOTE(str GVAR(dispersion));
                        expression = QUOTE(\
                            GVAR(dispersion) = parseNumber _this;\
                            [ARR_2(QQGVAR(dispersion), parseNumber _this)] call CFUNC(saveSetting);\
                        );
                    };
                };
                class ShowLines {
                    displayName = "Show lines";
                    tooltipText = "Show the 3D lines indicating the flight time and 2D position";
                    class Bool {
                        condition = "(true)";
                        type = "CHECKBOX";
                        checked = QGVAR(showLines);
                        expression = QUOTE(\
                            GVAR(showLines) = _this;\
                            [ARR_2(QQGVAR(showLines), _this)] call CFUNC(saveSetting);\
                        );
                    };
                };
            };
        };
    };
};