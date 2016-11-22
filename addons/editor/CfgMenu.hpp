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
                action = QUOTE([] remoteExecCall [ARR_2('BIS_fnc_endMission', 0)]);
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
