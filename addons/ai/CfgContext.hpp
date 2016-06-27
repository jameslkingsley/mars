class GVARMAIN(context) {
    class ADDON {
        class infantry {
            displayName = "Infantry";
            condition = QUOTE(_this isKindOf 'Man' && !isPlayer _this);
            
            class force_move {
                displayName = "Force Move";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(forceMove));
            };
            
            class patrol {
                displayName = "Patrol";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(taskPatrol));
            };
            
            class defend {
                displayName = "Defend";
                requiresPosition = true;
                action = QUOTE(_this call FUNC(infDefend));
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