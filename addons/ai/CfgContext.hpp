class MARS_Context {
    class ADDON {
        class GVAR(patrolArea) {
            displayName = "Patrol Area";
            requiresPosition = true;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(patrolArea));
        };
        class GVAR(fleeArea) {
            displayName = "Flee Area";
            requiresPosition = false;
            condition = "alive _this";
            action = QUOTE(_this call FUNC(fleeArea));
        };
        class GVAR(air) {
            displayName = "Air";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            action = "";
            class GVAR(air_attack) {
                displayName = "Attack";
                requiresPosition = true;
                condition = "alive _this";
                action = "";
            };
            class GVAR(air_land) {
                displayName = "Land";
                requiresPosition = true;
                condition = "alive _this";
                action = "";
            };
            class GVAR(air_para) {
                displayName = "Paradrop";
                requiresPosition = true;
                condition = "alive _this";
                action = "";
            };
            class GVAR(air_orbit) {
                displayName = "Orbit";
                requiresPosition = true;
                condition = "isPlayer (driver _this)";
                action = "";
            };
        };
    };
};