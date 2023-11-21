#include "script_component.hpp"

/*
 * Author: Maid
 * Handle changing the selection from the roles list.
 *
 * Arguments:
 * 0: Left panel control <CONTROL>
 * 1: Left panel selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_control", "_curSel"];

if (_curSel < 0) exitWith {};
private _selectedRole = _control lbData _curSel;
TRACE_1("Selection changed",_selectedRole);

private _rolesDisplay = findDisplay IDD_RolesMenu;
[_rolesDisplay, _rolesDisplay displayCtrl IDC_RoleDetails, _selectedRole] spawn FUNC(populateDetails);
