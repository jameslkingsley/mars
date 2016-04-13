class GVARMAIN(context) {
    class ADDON {
        class infantry {
            displayName = "Infantry";
            requiresPosition = false;
            condition = "_this isKindOf 'Man'";
            action = "";
            class patrol {
                displayName = "Patrol";
                requiresPosition = true;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(infPatrol));
            };
            class defend {
                displayName = "Defend";
                requiresPosition = true;
                condition = "alive _this";
                action = QUOTE(_this call FUNC(infDefend));
            };
        };
        class air {
            displayName = "Air";
            requiresPosition = false;
            condition = "_this isKindOf 'Air'";
            class attack {
                displayName = "Attack";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airAttack));
            };
            /*class land {
                displayName = "Land";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airLand));
            };
            class paradrop {
                displayName = "Paradrop";
                requiresPosition = true;
                condition = "";
                class low {
                    displayName = "Low (250m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 250] call FUNC(airParadrop));
                };
                class med {
                    displayName = "Medium (500m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 500] call FUNC(airParadrop));
                };
                class high {
                    displayName = "High (750m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([_this, 750] call FUNC(airParadrop));
                };
            };*/
            class orbit {
                displayName = "Orbit";
                requiresPosition = false;
                condition = "";
                action = "";
                class low {
                    displayName = "Low (250m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,250)] call FUNC(airOrbit));
                };
                class med {
                    displayName = "Medium (500m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,500)] call FUNC(airOrbit));
                };
                class high {
                    displayName = "High (750m)";
                    requiresPosition = true;
                    condition = "";
                    action = QUOTE([ARR_2(_this,750)] call FUNC(airOrbit));
                };
            };
        };
    };
};