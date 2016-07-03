class GVARMAIN(context) {
    class ADDON {
        class Infantry {
            displayName = "Infantry";
            condition = QUOTE(_this isKindOf 'Man' && !isPlayer _this);
            
            class ForceMove {
                displayName = "Force Move";
                requiresPosition = true;
                action = QFUNC(forceMove);
            };
            
            class Attack {
                displayName = "Attack";
                requiresPosition = true;
                action = QFUNC(taskAttack);
            };
            
            class Defend {
                displayName = "Defend";
                requiresPosition = true;
                action = QFUNC(taskDefend);
            };
            
            class Patrol {
                displayName = "Patrol";
                requiresPosition = true;
                action = QFUNC(taskPatrol);
            };
            
            class Suppress {
                displayName = "Suppress";
                requiresPosition = true;
                action = QFUNC(suppress);
            };
            
            class SearchNearest {
                displayName = "Search Nearby";
                action = QFUNC(searchNearby);
            };
            
            class Garrison {
                displayName = "Garrison";
                requiresPosition = true;
                action = QFUNC(garrison);
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