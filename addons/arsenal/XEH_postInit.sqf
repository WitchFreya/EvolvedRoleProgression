#include "script_component.hpp"

player setVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE), true];

["CBA_loadoutSet", {
    params ["_unit", "", "_extendedInfo"];
    private _loadoutRole = _extendedInfo getOrDefault [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
    [_unit, _loadoutRole] call FUNC(setUnitRole);
}] call CBA_fnc_addEventHandler;

["CBA_loadoutGet", {
    params ["_unit", "", "_extendedInfo"];
    private _role = _unit getVariable QGVARMAIN(role);
    if (isNil "_role") exitWith {};
    _extendedInfo set [QGVARMAIN(role), _role];
}] call CBA_fnc_addEventHandler;
