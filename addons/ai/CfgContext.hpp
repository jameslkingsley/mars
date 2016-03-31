class MARS_Context {
    class ADDON {
        class GVAR(patrolArea) {
            displayName = "Patrol Area";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(patrolArea));
        };
        class GVAR(fleeArea) {
            displayName = "Flee Area";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(fleeArea));
        };
    };
};