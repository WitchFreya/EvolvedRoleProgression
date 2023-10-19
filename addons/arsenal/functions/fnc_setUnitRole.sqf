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
TRACE_1("Setting role", _this);
_unit setVariable [QGVARMAIN(role), _newRole, true];
[QGVAR(roleUpdated), [_newRole], _unit] call CBA_fnc_targetEvent;
