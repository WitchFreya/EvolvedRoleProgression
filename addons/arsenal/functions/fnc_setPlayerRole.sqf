#include "script_component.hpp"

/*
 * Author: Maid
 * Update a target unit's role.
 *
 * Arguments:
 * 0: Previous role <STRING>
 * 1: New role <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_oldRole", "_newRole"];
TRACE_3("Setting role", ace_arsenal_center, _oldRole, _newRole);
ace_arsenal_center setVariable [QGVARMAIN(role), _newRole, true];
[QGVAR(roleUpdated), [_oldRole, _newRole], ace_arsenal_center] call CBA_fnc_targetEvent;
