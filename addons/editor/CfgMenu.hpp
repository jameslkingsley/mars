class GVARMAIN(menu) {
    class ADDON {
        class Scenario {
            displayName = "Scenario";
            class Hint {
                displayName = "Hint";
                action = QUOTE([ARR_3(QQADDON, 'Hint', [ARR_2(140, 90)])] call AFUNC(openAttributes));
            };
            class EndMission {
                displayName = "End Mission";
                class Completed {
                    displayName = "Mission Complete";
                    action = QUOTE([ARR_3(QQGVAR(completed), true, true)] call FUNC(endMission));
                };
                class Failed {
                    displayName = "Mission Failed";
                    action = QUOTE([ARR_3(QQGVAR(failed), true, true)] call FUNC(endMission));
                };
                class Cancelled {
                    displayName = "Mission Cancelled";
                    action = QUOTE([ARR_3(QQGVAR(cancelled), true, true)] call FUNC(endMission));
                };
                class BLUFOR {
                    displayName = "BLUFOR Wins";
                    action = QUOTE([ARR_3(QQGVAR(blufor), true, true)] call FUNC(endMission));
                };
                class OPFOR {
                    displayName = "OPFOR Wins";
                    action = QUOTE([ARR_3(QQGVAR(opfor), true, true)] call FUNC(endMission));
                };
                class INDFOR {
                    displayName = "INDFOR Wins";
                    action = QUOTE([ARR_3(QQGVAR(indfor), true, true)] call FUNC(endMission));
                };
                class Civilian {
                    displayName = "Civilians Win";
                    action = QUOTE([ARR_3(QQGVAR(civilian), true, true)] call FUNC(endMission));
                };
                class Draw {
                    displayName = "Draw";
                    action = QUOTE([ARR_3(QQGVAR(draw), true, true)] call FUNC(endMission));
                };
            };
        };
        class Settings {
            displayName = "Settings";
            class Camera {
                displayName = "Editor";
                action = QFUNC(openEditorSettings);
            };
        };
    };
};
