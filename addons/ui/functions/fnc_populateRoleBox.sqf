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

private _totalOps = [player] call EFUNC(history,opCount);

{
  private _role = _x;
  private _roleName = [_role] call EFUNC(roles,displayName);
  private _icon = [_role] call EFUNC(roles,icon);
  private _opCount = [player,_role] call EFUNC(history,opCount);
  private _rank = [player,_role] call EFUNC(history,rank);
  private _rankCfg = configFile >> "CfgRoles" >> _role >> "CfgRanks" >> _rank;
  private _rankName = (_rankCfg >> "displayName") call BIS_fnc_getCfgData;
  private _rankPicture = (_rankCfg >> "icon") call BIS_fnc_getCfgData;

  private _tooltipBase = format [
    "%1 (%2) - Ops as Role: %3/%4",
    _roleName,
    _rankName,
    _opCount,
    _totalOps
  ];

  private _tooltip = _tooltipBase + (["", ": You should get training on this role before playing it."] select (_rank == "Uncertified"));

  _ctrl lnbAddRow [_roleName, ""];
  _ctrl lnbSetPicture [[_forEachIndex, 0], _icon];
  _ctrl lnbSetData [[_forEachIndex, 0], _role];
  _ctrl lnbSetTooltip [[_forEachIndex, 0], _tooltip];

  _ctrl lnbSetData [[_forEachIndex, 1], _rank];
  _ctrl lnbSetPicture [[_forEachIndex, 1], _rankPicture];
} forEach _roles;

[_ctrl, 0] lnbSortBy ["TEXT"];

for '_i' from 0 to (lbSize _ctrl) - 1 do {
  private _role = _ctrl lnbData [_i, 0];
  if (_role == _unitRole) exitWith {
    _display setVariable [QGVAR(selectedRole),_role];
    _ctrl lnbSetCurSelRow _i;
  };
};
