class GVARMAIN(attributes) {
    class ADDON {
        #include "attributes\reinforcements.hpp"
        #include "attributes\teleport.hpp"
        
        class AdminMenu {
            displayName = "Administration";
            actionConfirm = "";
            actionCancel = "";
            class AttributeCategories {
                class Gameplay {
                    class AttributeItems {
                        class Teleport {
                            displayName = "Teleport";
                            tooltipText = "Teleport a selection of players to a desired location.";
                            class AttributeControls {
                                class Button {
                                    condition = "(true)";
                                    type = "BUTTON";
                                    textPlain = "Open Teleport Menu";
                                    action = QUOTE([ARR_3(QUOTE(QUOTE(ADDON)), 'Teleport', [ARR_2(100, 100)])] call AFUNC(openAttributes));
                                };
                            };
                        };
                        class Reinforcements {
                            displayName = "Reinforcements";
                            tooltipText = "Send spectating players in as reinforcements.";
                            class AttributeControls {
                                class Button {
                                    condition = "(true)";
                                    type = "BUTTON";
                                    textPlain = "Open Reinforcements Menu";
                                    action = QUOTE([ARR_3(QUOTE(QUOTE(ADDON)), 'Reinforcements', [ARR_2(100, 100)])] call AFUNC(openAttributes));
                                };
                            };
                        };
                    };
                };
            };
        };
    };
    class GVARMAIN(clientmenu) {
        class interface {
            class AttributeCategories {
                class Editor {
                    class AttributeItems {
                        class Admin {
                            displayName = "Admin";
                            tooltipText = "Open the admin menu. Only the server admin and verified Steam accounts are able to access the admin menu.";
                            class AttributeControls {
                                class Button {
                                    condition = QUOTE([player] call FUNC(isAdmin));
                                    type = "BUTTON";
                                    textPlain = "Open Admin Menu";
                                    action = QUOTE([] call FUNC(openAdminMenu));
                                };
                            };
                        };
                    };
                };
                class Misc {
                    class AttributeItems {
                        class Debug {
                            displayName = "Debug";
                            tooltipText = "";
                            class AttributeControls {
                                class ResetPosition {
                                    condition = "(true)";
                                    type = "BUTTON";
                                    textPlain = "Reset Position";
                                    tooltipText = "Reset your position to the nearest safest location. Used for when you get stuck.";
                                    action = QUOTE([player] call FUNC(resetPosition));
                                };
                                class FixSpectator {
                                    condition = "if (isNil 'ARC_isSpectating') exitWith {false}; ARC_isSpectating";
                                    type = "BUTTON";
                                    textPlain = "Fix Spectator";
                                    tooltipText = "Fixes spectator if it breaks on you.";
                                    action = QUOTE([] call FUNC(resetSpectator));
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};