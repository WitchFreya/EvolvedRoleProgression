#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

#include "initSettings.sqf"

ADDON = true;

[QGVARMAIN(roleChanged), { _this call FUNC(onRoleChange); }] call CBA_fnc_addEventHandler;
