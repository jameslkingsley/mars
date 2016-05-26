#include "script_component.hpp"

intercept_params_var = [];
MARS_LOGINFO("Starting Intercept Boot Load");
_res = "intercept" callExtension "init:";
MARS_LOGINFO_1("Initiated: ", _res);
_res = "intercept" callExtension format ["init_patch:%1", productVersion select 3];

"intercept" callExtension "invoker_begin_register:";
"intercept" callExtension "invoker_register:delete_ptr";
str [1,2,3];
"intercept" callExtension "invoker_register:numeric_type";
str 101;
"intercept" callExtension "invoker_register:string_type";
str "HEEEEEY";
"intercept" callExtension "invoker_register:bool_type";
str true;
str false;
"intercept" callExtension "invoker_register:code_type";
_code = { player; };
str _code;
"intercept" callExtension "invoker_register:object_type";
_obj = player;
str _obj;
"intercept" callExtension "invoker_register:group_type";
str grpNull;
"intercept" callExtension "invoker_register:config_type";
str (configFile >> "CfgVehicles");
"intercept" callExtension "invoker_register:control_type";
str controlNull;
"intercept" callExtension "invoker_register:display_type";
str displayNull;
"intercept" callExtension "invoker_register:location_type";
str locationNull;
"intercept" callExtension "invoker_register:script_type";
str ([] spawn {});
"intercept" callExtension "invoker_register:side_type";
str west;
"intercept" callExtension "invoker_register:text_type";
str (text "ok");
"intercept" callExtension "invoker_register:team_type";
str teamMemberNull;
"intercept" callExtension "invoker_register:namespace_type";
str parsingNamespace;
"intercept" callExtension "invoker_end_register:";

_interceptProjects = configFile >> "Intercept";
for "_i" from 0 to (count _interceptProjects)-1 do {
    _project = _interceptProjects select _i;
    if (isClass _project) then {
        for "_x" from 0 to (count _project)-1 do {
            _module = _project select _x;
            if (isClass _module) then {
                _pluginName = getText(_module >> "pluginName");
                if (_pluginName != "") then {
                    MARS_LOGINFO_1("Intercept Loading Plugin: ", _pluginName);
                    "intercept" callExtension ("load_extension:" + _pluginName);
                };
            };
        };
    };
};
