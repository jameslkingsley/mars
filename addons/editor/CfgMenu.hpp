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
                    action = QUOTE([QQGVAR(completed)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class Failed {
                    displayName = "Mission Failed";
                    action = QUOTE([QQGVAR(failed)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class Cancelled {
                    displayName = "Mission Cancelled";
                    action = QUOTE([QQGVAR(cancelled)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class BLUFOR {
                    displayName = "BLUFOR Wins";
                    action = QUOTE([QQGVAR(blufor)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class OPFOR {
                    displayName = "OPFOR Wins";
                    action = QUOTE([QQGVAR(opfor)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class INDFOR {
                    displayName = "INDFOR Wins";
                    action = QUOTE([QQGVAR(indfor)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class Civilian {
                    displayName = "Civilians Win";
                    action = QUOTE([QQGVAR(civilian)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
                };
                class Draw {
                    displayName = "Draw";
                    action = QUOTE([QQGVAR(draw)] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
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
