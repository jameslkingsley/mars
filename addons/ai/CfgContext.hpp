class GVARMAIN(context) {
    class ADDON {
        class Infantry {
            displayName = "Infantry";
            condition = QUOTE(_this isKindOf 'Man' && !isPlayer _this);
            
            class ForceMove {
                displayName = "Force Move";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(forceMove));
            };
            
            class Attack {
                displayName = "Attack";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskAttack));
            };
            
            class Defend {
                displayName = "Defend";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskDefend));
            };
            
            class Patrol {
                displayName = "Patrol";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskPatrol));
            };
            
            class Suppress {
                displayName = "Suppress";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(suppress));
            };
            
            class SearchNearby {
                displayName = "Search Nearby";
                action = QUOTE([ARR_2(_this, true)] call FUNC(searchNearby));
            };
            
            class Garrison {
                displayName = "Garrison";
                requiresPosition = 1;
                action = QFUNC(garrison);
            };
        };
        
        class Air {
            displayName = "Air";
            condition = QUOTE(_this isKindOf 'Air' && !isPlayer _this);
            
            class Attack {
                displayName = "Attack";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskAttack));
            };
            
            class Land {
                displayName = "Land";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskLand));
            };
            
            class Paradrop {
                displayName = "Paradrop";
                requiresPosition = 1;
                action = QFUNC(taskParadrop);
            };
            
            class FillCargo {
                displayName = "Fill Cargo";
                action = QFUNC(fillCargo);
            };
            
            class Disembark {
                displayName = "Disembark";
                action = QFUNC(disembark);
            };
            
            class Orbit {
                displayName = "Orbit";
                
                class Low {
                    displayName = "Low (250m)";
                    requiresPosition = 1;
                    action = QUOTE([ARR_2(_this, 250)] call FUNC(taskOrbit));
                    order = 1;
                };
                
                class Medium: Low {
                    displayName = "Medium (500m)";
                    action = QUOTE([ARR_2(_this, 500)] call FUNC(taskOrbit));
                    order = 2;
                };
                
                class High: Low {
                    displayName = "High (750m)";
                    action = QUOTE([ARR_2(_this, 750)] call FUNC(taskOrbit));
                    order = 3;
                };
                
                class VeryHigh: Low {
                    displayName = "Very High (1000m)";
                    action = QUOTE([ARR_2(_this, 1000)] call FUNC(taskOrbit));
                    order = 4;
                };
            };
        };
    };
};