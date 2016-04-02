class GVARMAIN(Context) {
    class ADDON {
        class GVAR(takeControl) {
            displayName = "Take Control";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(takeControlOfUnit));
        };
    };
};