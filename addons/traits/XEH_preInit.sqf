#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"

ADDON = true;

[QGVARMAIN(roleChanged), {
    params ["_unit"];
    if (_unit != player) exitWith {
        TRACE_1("Unit was not player, exiting",_this);
    };
    _this call FUNC(onRoleChange);
}] call CBA_fnc_addEventHandler;
