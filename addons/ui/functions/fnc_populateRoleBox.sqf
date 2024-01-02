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
private _unitRole = [player] call EFUNC(roles,unitRole);

{
  private _role = _x;
  private _roleName = [_role] call EFUNC(roles,displayName);
  private _icon = [_role] call EFUNC(roles,icon);
  private _opCount = [player,_role] call EFUNC(history,opCount);
  private _tooltip = if (_opCount == 0) then {
    "You haven't played this role in an op before. If you've been given training, why not give it a try?";
  } else {
    format ["You have played this role %1 times before.", _opCount];
  };

  // TODO: # of players currently using role.
  _ctrl lbAdd _roleName;
  _ctrl lbSetPicture [_forEachIndex, _icon];
  _ctrl lbSetData [_forEachIndex, _role];
  _ctrl lbSetTooltip [_forEachIndex, _tooltip];
} forEach _roles;

_ctrl lbSortBy [];

for '_i' from 0 to (lbSize _ctrl) - 1 do {
  private _role = _ctrl lbData _i;
  if (_role == _unitRole) exitWith {
    _display setVariable [QGVAR(selectedRole),_role];
    _ctrl lbSetCurSel _i;
  };
};
