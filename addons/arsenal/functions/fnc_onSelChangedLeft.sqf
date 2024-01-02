#include "script_component.hpp"

/*
 * Author: Maid
 * Verify that the selection happened by the player and then update.
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
private _selectedRole = _control lnbData [_curSel, 0];
TRACE_1("Selection changed",_selectedRole);
private _currentRole = ace_arsenal_center getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];

if (!ace_arsenal_leftTabFocus && { _selectedRole != _currentRole }) exitWith {};

private _display = ctrlParent _control;
[_display, _control, _curSel, configFile >> "CfgRoles" >> _selectedRole] call ace_arsenal_fnc_itemInfo;
[ace_arsenal_center, _selectedRole] call EFUNC(common,setUnitRole);
