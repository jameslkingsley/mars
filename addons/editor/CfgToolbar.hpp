class GVARMAIN(toolbar) {
    class ADDON {
        class edit_players {
            default = false;
            tooltipText = "Edit players";
            iconOn = QUOTE(PATHTOF(data\Toolbar\player_on_ca.paa));
            iconOff = QUOTE(PATHTOF(data\Toolbar\player_off_ca.paa));
            action = QUOTE(_this call FUNC(toggleEditPlayers));
        };
    };
};