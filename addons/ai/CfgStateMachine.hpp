class GVARMAIN(StateMachines) {
    class ADDON {
        list = "allUnits select {!isPlayer _x && {local _x}}";
        skipNull = 1;

        class Initial {
            onState = "";
            onStateEntered = "";
            onStateLeaving = "";

            class Moving {
                targetState = "Moving";
                condition = "speed _this > 0";
            };
        };

        class Moving {
            //--- When unit is moving, disable their targetting abilities
            //--- This lets them focus on moving to cover
            onStateEntered = "\
                _this disableAI 'TARGET';\
                _this disableAI 'AUTOTARGET';\
            ";

            //--- When unit stops, enable their targetting abilities
            //--- When they're in cover they'll start targetting again
            onStateLeaving = "\
                _this enableAI 'TARGET';\
                _this enableAI 'AUTOTARGET';\
            ";

            class Stopped {
                targetState = "Initial";
                condition = "speed _this <= 0";
            };
        };
    };
};
