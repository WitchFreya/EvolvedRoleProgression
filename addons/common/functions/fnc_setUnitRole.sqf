#include "script_component.hpp"

/*
 * Author: Maid
 * Update a target unit's role.
 *
 * Arguments:
 * 0: Unit to update <OBJECT>
 * 1: New role <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_unit", "_newRole"];
private _oldRole = _unit getVariable QGVARMAIN(role);
if (_oldRole == _newRole) exitWith {
    TRACE_2("Role already set",_unit,_newRole);
};
TRACE_1("Setting role",_this);
_unit setVariable [QGVARMAIN(role), _newRole, true];
[QGVARMAIN(roleChanged), [_unit, _oldRole, _newRole]] call CBA_fnc_globalEvent;
