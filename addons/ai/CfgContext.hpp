class GVARMAIN(context) {
    class ADDON {
        class Infantry {
            displayName = "Infantry";
            condition = QUOTE(_this isKindOf 'Man' && !isPlayer _this);
            
            class Patrol {
                displayName = "Patrol";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(taskPatrol));
                order = 1;
            };
            
            class Defend {
                displayName = "Defend";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(taskDefend));
                order = 2;
            };
            
            class Attack {
                displayName = "Attack";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(taskAttack));
                order = 3;
            };
            
            class ForceMove {
                displayName = "Force Move";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(forceMove));
                order = 4;
            };
            
            class Garrison {
                displayName = "Garrison";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(garrison));
                order = 5;
            };
            
            class Suppress {
                displayName = "Suppress";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(suppress));
                order = 6;
            };
        };
        
        class air {
            displayName = "Air";
            condition = QUOTE(_this isKindOf 'Air' && !isPlayer _this);
            
            class attack {
                displayName = "Attack";
                requiresPosition = true;
                condition = "";
                action = QUOTE(_this call FUNC(airAttack));
            };
            
            class orbit {
                displayName = "Orbit";
                
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