class Reinforcements {
    displayName = "Reinforcements";
    actionConfirm = QUOTE(_this call FUNC(reinforcement));
    actionCancel = "";
    class AttributeCategories {
        class Basic {
            class AttributeItems {
                class PlayerList {
                    displayName = "Player Selection";
                    tooltipText = "Select which units you want to affect";
                    class AttributeControls {
                        class Control {
                            condition = "true";
                            identifier = "PlayerList";
                            type = "LIST";
                            multi = true;
                            labels = QUOTE(\
                                private _labels = allPlayers select {alive _x && vehicle _x == _x};\
                                _labels = _labels apply {name _x};\
                                _labels\
                            );
                            values = QUOTE(\
                                private _values = allPlayers select {alive _x};\
                                _values = _values apply {getPlayerUID _x};\
                                _values\
                            );
                            expression = "";
                            onLBSelChanged = QUOTE(\
                                private _leaderCtrl = ['GroupLeader'] call AFUNC(getControl);\
                                [ARR_2(_leaderCtrl, 'update')] call AFUNC(execControlFunction);\
                            );
                        };
                    };
                };
                class InsertionMethod {
                    displayName = "Insertion Method";
                    tooltipText = "Choose the insertion method for the selected units";
                    class AttributeControls {
                        class Control {
                            condition = "true";
                            type = "COMBO";
                            labels[] = {"Teleport", "Paradrop"};
                            values[] = {"teleport", "paradrop"};
                            selected = 0;
                            expression = "";
                            onLBSelChanged = QUOTE(\
                                params [ARR_2('_control', '_index')];\
                                private _paraHeight = ['ParaHeight'] call AFUNC(getControl);\
                                private _paraRadius = ['ParaRadius'] call AFUNC(getControl);\
                                [ARR_2(_paraHeight, (_index == 1))] call AFUNC(enableControlSet);\
                                [ARR_2(_paraRadius, (_index == 1))] call AFUNC(enableControlSet);\
                            );
                        };
                    };
                };
                class ParaHeight {
                    displayName = "Paradrop Height";
                    tooltipText = "Height in meters to paradrop the selected units";
                    class AttributeControls {
                        class Control {
                            condition = "false";
                            identifier = "ParaHeight";
                            type = "SLIDER";
                            range[] = {150, 1000};
                            step = 100;
                            position = 400;
                            expression = "";
                            onSliderPosChanged = QUOTE(\
                                _ctrl = _this select 0;\
                                _value = round (sliderPosition _ctrl);\
                                _ctrl ctrlSetTooltip format [ARR_2('%1m', [ARR_2(_value, 0)] call CFUNC(roundToN))];\
                            );
                        };
                    };
                };
                class ParaRadius {
                    displayName = "Paradrop Radius";
                    tooltipText = "Radius in meters to disperse the selected units";
                    class AttributeControls {
                        class Control {
                            condition = "false";
                            identifier = "ParaRadius";
                            type = "SLIDER";
                            range[] = {100, 1500};
                            step = 100;
                            position = 500;
                            expression = "";
                            onSliderPosChanged = QUOTE(\
                                _ctrl = _this select 0;\
                                _value = round (sliderPosition _ctrl);\
                                _ctrl ctrlSetTooltip format [ARR_2('%1m', [ARR_2(_value, 0)] call CFUNC(roundToN))];\
                            );
                        };
                    };
                };
                class Destination {
                    displayName = "Destination";
                    tooltipText = "Position you want the selected units to be sent to";
                    class AttributeControls {
                        class Control {
                            condition = "true";
                            type = "MAP";
                            position = "getPosATL player";
                            expression = "";
                        };
                    };
                };
            };
        };
        class Advanced {
            class AttributeItems {
                class AdvancedToggle {
                    displayName = "Configure";
                    tooltipText = "Configure the group for the selected units";
                    class AttributeControls {
                        class Control {
                            condition = "true";
                            type = "CHECKBOX";
                            checked = false;
                            expression = "";
                            onCheckedChanged = QUOTE(\
                                params [ARR_2('_control','_state')];\
                                {[ARR_2(([_x] call AFUNC(getControl)), INT2BOOL(_state))] call AFUNC(enableControlSet);} forEach [ARR_4('GroupLeader','GroupDetails_Name','GroupDetails_Color','Loadouts')];\
                            );
                        };
                    };
                };
                class GroupLeader {
                    displayName = "Group Leader";
                    tooltipText = "Select the leader of the group";
                    class AttributeControls {
                        class Control {
                            condition = "false";
                            identifier = "GroupLeader";
                            type = "COMBO";
                            labels = QUOTE(\
                                private _selectionCtrl = ['PlayerList'] call AFUNC(getControl);\
                                private _selection = lbSelection _selectionCtrl;\
                                _selection = _selection apply {(_selectionCtrl lbData _x)};\
                                private _selectionObjects = allPlayers select {(getPlayerUID _x) in _selection};\
                                _selectionObjects = _selectionObjects apply {name _x};\
                                _selectionObjects\
                            );
                            values = QUOTE(\
                                private _selectionCtrl = ['PlayerList'] call AFUNC(getControl);\
                                private _selection = lbSelection _selectionCtrl;\
                                _selection = _selection apply {(_selectionCtrl lbData _x)};\
                                _selection\
                            );
                            selected = 0;
                            expression = "";
                        };
                    };
                };
                class GroupDetails {
                    displayName = "Group Details";
                    tooltipText = "Enter the name and color for the group. This is the text that shows up on their colored map marker.";
                    class AttributeControls {
                        class Name {
                            condition = "false";
                            identifier = "GroupDetails_Name";
                            type = "EDIT";
                            width = 0.66;
                            expression = "";
                        };
                        class Color {
                            condition = "false";
                            identifier = "GroupDetails_Color";
                            type = "COMBO";
                            width = 0.33;
                            labels[] = {"Black", "Red", "Green", "Blue", "Yellow", "Orange", "Pink"};
                            values[] = {"ColorBlack", "ColorRed", "ColorGreen", "ColorBlue", "ColorYellow", "ColorOrange", "ColorPink"};
                            selected = 0;
                            expression = "";
                        };
                    };
                };
                class Loadouts {
                    displayName = "Loadouts";
                    tooltipText = "Enter a comma delimited list of loadout names to assign to the selected units. The first loadout in the list will be assigned to the group leader.";
                    class AttributeControls {
                        class List {
                            condition = "false";
                            identifier = "Loadouts";
                            type = "EDIT";
                            textPlain = "ftl, ar, aar, rat, r";
                            expression = "";
                        };
                    };
                };
            };
        };
    };
};
