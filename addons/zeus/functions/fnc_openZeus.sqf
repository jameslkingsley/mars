/*
 * Author: Bohemia Interactive
 * Module function for initalizing zeus
 * Edited to remove eagle and global ascension message
 * Added "zeusUnitAssigned" event call
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

/*[] spawn {
    [] call EFUNC(editor,shutdown);
    sleep 0.1;
    openCuratorInterface;
};*/

_activated = true;
_logic = GVAR(curator);

if (_activated) then {
    // Terminate when not created on the server
    if (!isServer && local _logic && isNull (getAssignedCuratorUnit _logic)) exitWith {
        [format ["%1 is trying to create curator logic ModuleCurator_F", profileName], "BIS_fnc_error", false] call BIS_fnc_mp;
        deleteVehicle _logic;
    };

    // Get curator owner
    _ownerVar = _logic getVariable ["owner",""];
    _ownerUID = parseNumber _ownerVar;
    
    if (cheatsEnabled) then {
        _ownerVarArray = toArray _ownerVar;
        _ownerVarArray resize 3;
        if (toString _ownerVarArray == "DEV") then {_ownerUID = 1;};
    };
    
    if (_ownerVar == "" && !isMultiplayer) then {
        ["Curator owner not defined, player used instead in singleplayer."] call BIS_fnc_error;
        _ownerVar = player call BIS_fnc_objectvar;
    };
    
    if (_ownerUID > 0 && !isMultiplayer) then {
        _ownerVar = player call BIS_fnc_objectvar;
    };
    
    _isAdmin = _ownerVar == "#adminLogged" || _ownerVar == "#adminVoted";

    // Wipe out the variable so clients can't access it
    _logic setVariable ["owner",nil];

    // Server
    if (isServer) then {
        // Prepare admin variable
        _adminVar = "";
        
        if (_isAdmin) then {
            _letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
            _adminVar = "admin_";
            for "_i" from 0 to 9 do {_adminVar = _adminVar + selectRandom _letters};
            _logic setVariable ["adminVar",_adminVar,true];
        };

        // Get allowed addons
        _addonsType = _logic getVariable ["Addons",0];
        _addons = [];
        
        {
            _class = _x;
            if (isClass _class) then {_addons pushBack (configName _class);};
        } forEach ("true" configClasses (configFile >> "Cfgpatches"));
        
        _addons call BIS_fnc_activateAddons;
        removeAllCuratorAddons _logic;
        _logic addCuratorAddons _addons;
        
        // Handle ownership
        [_logic,_ownerVar,_ownerUID,_adminVar] spawn {
            scriptName "BIS_fnc_moduleCurator: Owner";

            _logic = _this select 0;
            _ownerVar = _this select 1;
            _ownerUID = _this select 2;
            _adminVar = _this select 3;

            if (_adminVar != "") then {_ownerVar = _adminVar;};

            _forced = _logic getVariable ["forced",0] > 0;
            _name = _logic getVariable ["name",""];
            if (_name == "") then {_name = localize "STR_A3_curator";};

            // Wait until mission starts
            waitUntil {time > 0}; // NOTE: DO NOT CHANGE TO ACE_TIME, IT BREAKS THE MODULE

            // Refresh addon list, so it's broadcasted to clients
            _addons = curatorAddons _logic;
            removeAllCuratorAddons _logic;
            _logic addCuratorAddons _addons;

            while {true} do {
                // Wait for player to become Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waitUntil {
                            sleep 0.01;
                            {getPlayerUID _x == _ownerVar} count playableUnits > 0 || isNull _logic
                        };
                    };
                    default {
                        waitUntil {isPlayer (missionNamespace getVariable [_ownerVar,objNull]) || isNull _logic};
                    };
                };
                
                if (isNull _logic) exitWith {};

                // Assign
                _player = objNull;
                switch true do {
                    case (_ownerUID > 0): {
                        {
                            if (getPlayerUID _x == _ownerVar) exitWith {_player = _x;};
                        } forEach playableUnits;
                    };
                    default {
                        _player = missionNamespace getVariable [_ownerVar,objNull];
                    };
                };

                waitUntil {unassignCurator _logic; isNull (getAssignedCuratorUnit _logic) || isNull _logic};
                waitUntil {_player assignCurator _logic; getAssignedCuratorUnit _logic == _player || isNull _logic};
                if (isNull _logic) exitWith {};

                // Add radio channels
                {
                    _x radioChannelAdd [_player];
                } forEach (_logic getVariable ["channels",[]]);

                // Added by ace_zeus to delay ascension message at mission start
                [{
                    _logic = _this select 0;
                    _player = _this select 1;

                    // Sent notification to all assigned players
                    if ((_logic getVariable ["showNotification",true]) && GVAR(zeusAscension)) then {
                        {
                            if (isPlayer _x) then {
                                [["CuratorAssign",[_name,name _player]],"BIS_fnc_showNotification",_x] call BIS_fnc_mp;
                            };
                        } forEach (curatorEditableObjects _logic);
                    };
                },[_logic,_player]] call EFUNC(common,execNextFrame);

                [_logic,"curatorUnitAssigned",[_logic,_player]] call BIS_fnc_callscriptedeventhandler;

                // Wait for player to stop being Zeus
                switch true do {
                    case (_ownerUID > 0): {
                        waitUntil {
                            sleep 0.01;
                            {getPlayerUID _x == _ownerVar} count playableUnits == 0 || isNull _logic
                        };
                    };
                    default {
                        waitUntil {_player != missionNamespace getVariable [_ownerVar,objNull] || isNull _logic};
                    };
                };
                if (isNull _logic) exitWith {};

                // Add radio channels
                {
                    _x radioChannelRemove [_player];
                } forEach (_logic getVariable ["channels",[]]);

                // Unassign
                waitUntil {unassignCurator _logic; isNull (getAssignedCuratorUnit _logic) || isNull _logic};
                if (isNull _logic) exitWith {};
            };
        };

        // Activated all future addons
        _addons = [];
        {
            if (typeOf _x == "ModuleCuratorAddAddons_F") then {
                _paramAddons = call compile ("[" + (_x getVariable ["addons",""]) + "]");
                {
                    if !(_x in _addons) then {_addons set [count _addons,_x];};
                    {
                        if !(_x in _addons) then {_addons set [count _addons,_x];};
                    } forEach (unitAddons _x);
                } forEach _paramAddons;
            };
        } forEach (synchronizedObjects _logic);
        _addons call BIS_fnc_activateaddons;

        // Added by ace_zeus to delay bird code
        [{
            _logic = _this select 0;

            if (GVAR(zeusBird)) then {
                // Create bird
                _birdType = _logic getVariable ["birdType","eagle_f"];
                if (_birdType != "") then {
                    _bird = createVehicle [_birdType,[100,100,100],[],0,"none"];
                    _logic setVariable ["bird",_bird,true];
                };

                // Locality changed
                _logic addEventHandler ["local", {
                    _logic = _this select 0;
                    _bird = _logic getVariable ["bird",objNull];
                    _bird setOwner owner _logic;
                }];
            };
        },[_logic]] call EFUNC(common,execNextFrame);
    };

    // Player
    if (hasInterface) then {
        waitUntil {local player};
        _serverCommand = if (_ownerVar == "#adminLogged") then {"#shutdown"} else {"#kick"};

        // Black effect until the interface is open
        _forced = _logic getVariable ["forced",0] > 0;
        if (_forced) then {
            _isCurator = switch true do {
                case (_ownerUID > 0): {
                    getPlayerUID player == _ownerVar
                };
                case (_isAdmin): {
                    isServer || serverCommandAvailable _serverCommand
                };
                default {
                    player == missionNamespace getVariable [_ownerVar,objNull]
                };
            };
            
            if (_isCurator) then {
                [true,true] spawn BIS_fnc_forceCuratorInterface;
                ("RscDisplayCurator" call BIS_fnc_rscLayer) cutText ["","black in",1e10];
            };
        };

        // Check if player is server admin
        if (_isAdmin) then {
            _adminVar = _logic getVariable ["adminVar",""];
            _logic setVariable ["adminVar",nil];
            if (isServer) then {
                // Host
                missionNamespace setVariable [_adminVar,player];
            } else {
                // Client
                [_logic,_adminVar,_serverCommand] spawn {
                    scriptName "BIS_fnc_moduleCurator: Admin check";

                    _logic = _this select 0;
                    _adminVar = _this select 1;
                    _serverCommand = _this select 2;
                    while {true} do {
                        waitUntil {sleep 0.1; serverCommandAvailable _serverCommand};
                        missionNamespace setVariable [_adminVar,player];
                        publicVariable _adminVar;
                        _respawn = player addEventHandler ["respawn",format ["%1 = _this select 0; publicVariable '%1';",_adminVar]];

                        waitUntil {sleep 0.1; !serverCommandAvailable _serverCommand};
                        missionNamespace setVariable [_adminVar,objNull];
                        publicVariable _adminVar;
                        player removeEventHandler ["respawn",_respawn];
                    };
                };
            };
        };

        [_logic] spawn {
            _logic = _this select 0;
            sleep 1;
            waitUntil {alive player};

            // Show warning when Zeus key is not assigned
            if (count (actionKeys "curatorInterface") == 0) then {
                [
                    format [
                        localize "str_a3_cfgvehicles_modulecurator_f_keyNotAssigned",
                        (["IGUI","WARNING_RGB"] call BIS_fnc_displaycolorget) call BIS_fnc_colorRGBAtoHTML
                    ]
                ] call BIS_fnc_guiMessage;
            };

            // Show hint about pinging for players
            if (
                isNil {profilenamespace getVariable "BIS_fnc_curatorPinged_done"}
                &&
                {isTutHintsEnabled}
                &&
                {isNull getassignedcuratorlogic player}
                &&
                {player in curatoreditableobjects _logic}
            ) then {
                sleep 0.5;
                [["Curator","Ping"]] call BIS_fnc_advHint;
            };
        };

        // Add local event handlers
        _logic addEventHandler ["curatorFeedbackMessage",{_this call BIS_fnc_showCuratorFeedbackMessage;}];
        _logic addEventHandler ["curatorPinged",{_this call BIS_fnc_curatorPinged;}];
        _logic addEventHandler ["curatorObjectPlaced",{_this call BIS_fnc_curatorObjectPlaced;}];
        _logic addEventHandler ["curatorObjectEdited",{_this call BIS_fnc_curatorObjectEdited;}];
        _logic addEventHandler ["curatorWaypointPlaced",{_this call BIS_fnc_curatorWaypointPlaced;}];

        _logic addEventHandler ["curatorObjectDoubleClicked",{(_this select 1) call BIS_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorGroupDoubleClicked",{(_this select 1) call BIS_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorWaypointDoubleClicked",{(_this select 1) call BIS_fnc_showCuratorAttributes;}];
        _logic addEventHandler ["curatorMarkerDoubleClicked",{(_this select 1) call BIS_fnc_showCuratorAttributes;}];

        player call BIS_fnc_curatorRespawn;
    };
    
    [] spawn {
        [] call EFUNC(editor,shutdown);
        sleep 0.1;
        openCuratorInterface;
    };
};