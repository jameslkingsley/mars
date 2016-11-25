class GVARMAIN(attributes) {
    class ADDON {
        class Confirmation {
            displayName = QUOTE(ATTR_ARGS select 0);
            evalDisplayName = 1;
            actionConfirm = QUOTE((ATTR_ARGS select 6) call (ATTR_ARGS select 4));
            actionCancel = QUOTE((ATTR_ARGS select 6) call (ATTR_ARGS select 5));
            confirmText = QUOTE(ATTR_ARGS select 2);
            cancelText = QUOTE(ATTR_ARGS select 3);
            evalButtonText = 1;
            class Main {
                class Message {
                    displayName = "Message";
                    class Text {
                        type = "LABEL";
                        height = 3;
                        textCode = QUOTE(format [ARR_2('<t align=''center''>%1</t>', ATTR_ARGS select 1)]);
                    };
                };
            };
        };
    };
};
