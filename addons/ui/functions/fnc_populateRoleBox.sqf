#include "script_component.hpp"

/*
 * Author: Maid
 * Fill the roles box.
 *
 * Arguments:
 * 0: Populated display <DISPLAY>
 * 1: Role box <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_display", "_ctrl"];

private _roles = call EFUNC(roles,classNames);
private _unitRole = player getVariable [QGVARMAIN(role),QUOTE(DEFAULT_ROLE)];
private _myHistory = player getVariable QGVARMAIN(history);
{
  private _role = _x;
  _ctrl lbAdd ([_role] call EFUNC(roles,displayName));
  _ctrl lbSetPicture [_forEachIndex, [_role] call EFUNC(roles,icon)];
  // TODO: # of players currently using role.
  _ctrl lbSetData [_forEachIndex, _role];
  if !(isNil {_myHistory}) then {
    private _timesPlayed = _myHistory getOrDefault [_role, createHashMap] getOrDefault ["opCount", 0];
    private _msg = if (_timesPlayed == 0) then {
      "You haven't played this role in an op before. If you're certified, why not give it a try?";
    } else {
      format ["You have played this role %1 times before.", _timesPlayed];
    };
    _ctrl lbSetTooltip [_forEachIndex, _msg];
  };
} forEach _roles;

_ctrl lbSortBy [];

for '_i' from 0 to (lbSize _ctrl) - 1 do {
  private _role = _ctrl lbData _i;
  if (_role == _unitRole) exitWith {
    _display setVariable [QGVAR(selectedRole),_role];
    _ctrl lbSetCurSel _i;
  };
};
