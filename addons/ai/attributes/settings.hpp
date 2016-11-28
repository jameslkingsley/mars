class Settings {
    displayName = "Settings";
    actionConfirm = "";
    actionCancel = "";
    class General {
        class Ammunition {
            displayName = "Ammunition";
            tooltipText = "Toggle unlimited magazines for AI units. They will still need to reload, but will never run out of magazines.";
            class UnlimitedMagazines {
                type = "CHECKBOX";
                textPlain = "Unlimited Magazines";
                checked = QGVAR(unlimitedMagazines);
                expression = QUOTE(\
                    GVAR(unlimitedMagazines) = _this;\
                    publicVariable QQGVAR(unlimitedMagazines);\
                    [ARR_2(QQGVAR(unlimitedMagazines), _this)] call CFUNC(saveSetting);\
                );
            };
        };
    };
};
