#include "script_component.hpp"

params ["_display", "_ctrl"];

private _players = call BIS_fnc_listPlayers;

private _fn_createRow = {
  params ["_ctrl", "_idx", "_name", "_picture", "_data", "_tooltip"];
  _ctrl lnbAddRow ["", _name, ""];
  _ctrl lnbSetPicture [[_idx, 1], _picture];
  _ctrl lnbSetData [[_idx, 1], _data];
  // TODO: examine why this doesn't work (nothing shows on hover)
  _ctrl lnbSetTooltip [[_idx, 1], _tooltip];
};

private _fn_addUnit = {
  params ["_unit", "_ctrl", "_idx"];
  private _unitName = name _unit;
  private _role = [_unit] call EFUNC(roles,unitRole);
  private _roleName = [_role] call EFUNC(roles,displayName);
  private _picture = [_role] call EFUNC(roles,icon);
  private _opCount = [_unit, _role] call EFUNC(history,opCount);

  // build the history tooltip
  private _msg = if (_opCount == 0) then {
    "This is %1's first op as this role."
  } else {
    format ["%1 has played this role %2 times before.", "%1", _opCount];
  };
  private _tooltipHistory = format [_msg, _unitName];
  private _tooltip = format ["%1 - %2", _roleName, _tooltipHistory];

  [_ctrl, _idx, _unitName, _picture, getPlayerUID _unit, _tooltip] call _fn_createRow;
};

{
  [_x, _ctrl, _forEachIndex] call _fn_addUnit;
} forEach _players;
_ctrl lnbSetCurSelRow -1;
[_ctrl, 1] lnbSortBy [];
