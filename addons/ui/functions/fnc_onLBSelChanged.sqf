#include "script_component.hpp"

/*
 * Author: Maid
 * Handle changing the selection from the roles list.
 *
 * Arguments:
 * 0: Changing control <CONTROL>
 * 1: Selection index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_control", "_curSel"];

if (_curSel < 0) exitWith {};
private _selectedRole = _control lnbData [_curSel, 0];
TRACE_1("Selection changed",_selectedRole);

private _rolesDisplay = ctrlParent _control;
_rolesDisplay setVariable [QGVAR(selectedRole),_selectedRole];
[_rolesDisplay, _rolesDisplay displayCtrl IDC_RoleDetails, _selectedRole] call FUNC(populateDetails);
