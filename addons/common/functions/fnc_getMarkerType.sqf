/*
 * Author: KoffeinFlummi
 * Get the apropriate marker for a group.
 *
 * Arguments:
 * 0: Group
 *
 * Return Value:
 * Marker Type <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

#define MARKER(TYPE) [ARR_3(QUOTE(DOUBLES(n,TYPE)),QUOTE(DOUBLES(b,TYPE)),QUOTE(DOUBLES(o,TYPE)))] select (([ARR_3("GUER","WEST","EAST")] find (str _side)) max 0)

params [["_group", grpNull, [grpNull]]];

if (isNull _group) exitWith {""};

private _leader = leader _group;
private _vehicle = vehicle _leader;
private _side = side _group;

if (_vehicle == _leader) exitWith {
    if (
        getNumber (configFile >> "CfgVehicles" >> typeOf _leader >> "detectSkill") > 20 ||
        getNumber (configFile >> "CfgVehicles" >> typeOf _leader >> "camouflage") < 1 ||
        getText   (configFile >> "CfgVehicles" >> typeOf _leader >> "textsingular") == "diver"
    ) then {
        MARKER(recon)
    } else {
        MARKER(inf)
    };
};

if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant") == 1) exitWith {
    MARKER(med)
};

if (
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportRepair") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportFuel") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportAmmo") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_canRepair") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_fuelCapacityCargo") > 0
) exitWith {
    MARKER(maint)
};

if (_vehicle isKindOf "Plane") exitWith {
    MARKER(plane)
};

if (_vehicle isKindOf "Air") exitWith {
    MARKER(air)
};

if (_vehicle isKindOf "StaticMortar") exitWith {
    MARKER(mortar)
};

if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "artilleryScanner") == 1) exitWith {
    MARKER(art)
};

if (_vehicle isKindOf "Car") exitWith {
    MARKER(motor_inf)
};

if (_vehicle isKindOf "Tank") exitWith {
    if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportSoldier") > 0) then {
        MARKER(mech_inf)
    } else {
        MARKER(armor)
    };
};

if (_vehicle isKindOf "Ship") exitWith {
    MARKER(naval)
};

MARKER(unknown)
