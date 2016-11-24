class GVARMAIN(context) {
    class ADDON {
        /*class Attributes {
            displayName = "Attributes";
            requiresPosition = 0;
            condition = QUOTE('CAManBase' countType GVAR(selection) == count GVAR(selection));
            action = QUOTE([ARR_2('__objects', 'CAManBase')] call AFUNC(openAttributes));
            order = 100;
        };*/
        class Teleport {
            displayName = "Teleport";
            requiresPosition = 1;
            action = QUOTE(\
                params [ARR_2('_units', '_pos')];\
                {(vehicle _x) setPosASL _pos} forEach _units;\
            );
        };
        class RemoteControl {
            displayName = "Remote Control";
            exceptions[] = {"isNotPlayer", "isAlive"};
            condition = QUOTE(count GVAR(selection) == 1 && {count crew vehicle _this > 0});
            action = QFUNC(remoteControl);
            order = 100;
        };
    };
};
