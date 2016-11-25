class GVARMAIN(context) {
    class ADDON {
        class Infantry {
            displayName = "Infantry";
            condition = QUOTE(_this isKindOf 'Man');
            exceptions[] = {"isNotPlayer"};
            order = 1;
            class Stance {
                displayName = "Stance";
                order = 1;
                class Prone {
                    displayName = "Prone";
                    action = QUOTE([ARR_3('DOWN', _this, true)] call FUNC(setStance));
                    order = 1;
                };
                class Crouch {
                    displayName = "Crouch";
                    action = QUOTE([ARR_3('MIDDLE', _this, true)] call FUNC(setStance));
                    order = 2;
                };
                class Stand {
                    displayName = "Stand";
                    action = QUOTE([ARR_3('UP', _this, true)] call FUNC(setStance));
                    order = 3;
                };
                class Auto {
                    displayName = "Auto";
                    action = QUOTE([ARR_3('AUTO', _this, true)] call FUNC(setStance));
                    order = 4;
                };
            };
            class ForceMove {
                displayName = "Force Move";
                order = 2;
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(forceMove));
            };
            class Suppress {
                displayName = "Suppress";
                order = 3;
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(suppress));
            };
            class Attack {
                displayName = "Attack";
                order = 4;
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskAttack));
            };
            class Defend {
                displayName = "Defend";
                order = 5;
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskDefend));
            };
            class Patrol {
                displayName = "Patrol";
                order = 6;
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskPatrol));
            };
            class SearchNearby {
                displayName = "Search Nearby";
                order = 7;
                action = QUOTE([ARR_2(_this, true)] call FUNC(searchNearby));
            };
            class Garrison {
                displayName = "Garrison";
                order = 8;
                requiresPosition = 1;
                action = QFUNC(garrison);
            };
        };

        class Formation {
            displayName = "Formation";
            condition = "(true)";
            exceptions[] = {"isNotPlayer"};
            only[] = {Groups};
            order = 4;
            class Column {
                displayName = "Column";
                action = QUOTE([ARR_3('COLUMN', _this, true)] call FUNC(setFormation));
            };
            class StagColumn {
                displayName = "Staggered Column";
                action = QUOTE([ARR_3('STAG COLUMN', _this, true)] call FUNC(setFormation));
            };
            class Wedge {
                displayName = "Wedge";
                action = QUOTE([ARR_3('WEDGE', _this, true)] call FUNC(setFormation));
            };
            class EchLeft {
                displayName = "Echelon Left";
                action = QUOTE([ARR_3('ECH LEFT', _this, true)] call FUNC(setFormation));
            };
            class EchRight {
                displayName = "Echelon Right";
                action = QUOTE([ARR_3('ECH RIGHT', _this, true)] call FUNC(setFormation));
            };
            class Vee {
                displayName = "Vee";
                action = QUOTE([ARR_3('VEE', _this, true)] call FUNC(setFormation));
            };
            class Line {
                displayName = "Line";
                action = QUOTE([ARR_3('LINE', _this, true)] call FUNC(setFormation));
            };
            class File {
                displayName = "File";
                action = QUOTE([ARR_3('FILE', _this, true)] call FUNC(setFormation));
            };
            class Diamond {
                displayName = "Diamond";
                action = QUOTE([ARR_3('DIAMOND', _this, true)] call FUNC(setFormation));
            };
        };

        class Vehicle {
            displayName = "Vehicle";
            condition = "!(_this call CBA_fnc_isPerson)";
            exceptions[] = {"isNotPlayer"};
            order = 3;
            class Suppress {
                displayName = "Suppress";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(suppress));
                order = 1;
            };
            class Patrol {
                displayName = "Patrol";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskPatrol));
                order = 2;
            };
            class DisembarkCargo {
                displayName = "Disembark Cargo";
                action = QUOTE([ARR_3(_this, 'cargo', true)] call FUNC(disembark));
                order = 3;
            };
            class DisembarkAll {
                displayName = "Disembark All";
                action = QUOTE([ARR_3(_this, 'all', true)] call FUNC(disembark));
                order = 4;
            };
        };
        
        class Air {
            displayName = "Air";
            condition = QUOTE(_this isKindOf 'Air');
            exceptions[] = {"isNotPlayer"};
            order = 2;
            class Attack {
                displayName = "Attack";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskAttack));
                order = 1;
            };
            /*class Land {
                displayName = "Land";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskLand));
            };
            class FillCargo {
                displayName = "Fill Cargo";
                action = QFUNC(fillCargo);
            };*/
            class Orbit {
                displayName = "Orbit";
                order = 2;
                class Low {
                    displayName = "Low (250m)";
                    requiresPosition = 1;
                    action = QUOTE([ARR_3(_this, 250, true)] call FUNC(taskOrbit));
                    order = 1;
                };
                class Medium: Low {
                    displayName = "Medium (500m)";
                    action = QUOTE([ARR_3(_this, 500, true)] call FUNC(taskOrbit));
                    order = 2;
                };
                class High: Low {
                    displayName = "High (750m)";
                    action = QUOTE([ARR_3(_this, 750, true)] call FUNC(taskOrbit));
                    order = 3;
                };
                class VeryHigh: Low {
                    displayName = "Very High (1000m)";
                    action = QUOTE([ARR_3(_this, 1000, true)] call FUNC(taskOrbit));
                    order = 4;
                };
            };
            /*class Paradrop {
                displayName = "Paradrop";
                requiresPosition = 1;
                action = QUOTE([ARR_2(_this, true)] call FUNC(taskParadrop));
            };*/
        };
    };
};
