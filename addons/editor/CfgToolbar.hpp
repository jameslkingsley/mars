class GVARMAIN(toolbar) {
    class ADDON {
        class edit_players {
            default = false;
            tooltipText = "Edit players";
            iconOn = QPATHTOF(data\Toolbar\player_on_ca.paa);
            iconOff = QPATHTOF(data\Toolbar\player_off_ca.paa);
            action = QUOTE(_this call FUNC(toggleEditPlayers));
        };
    };
};