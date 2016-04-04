class GVARMAIN(Context) {
    class ADDON {
        class GVAR(debug) {
            displayName = "Debug";
            requiresPosition = false;
            condition = "true";
            action = "";
            class GVAR(destroyObject) {
                displayName = "Destroy Object(s)";
                requiresPosition = false;
                condition = "true";
                action = QUOTE(_this call FUNC(destroyObject));
            };
            class GVAR(logSelection) {
                displayName = "Log Selection to RPT";
                requiresPosition = false;
                condition = "true";
                action = QUOTE(_this call FUNC(logSelection));
            };
        };
    };
};