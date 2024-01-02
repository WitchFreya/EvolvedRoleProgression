#include "script_component.hpp"

params ["_display", "_ctrl"];

private _players = call BIS_fnc_listPlayers;

private _fn_createRowItem = {
  params ["_ctrl", "_idx", "_text", "_picture", "_data", "_tooltip", "_rankCfg"];

  TRACE_2("Rank Details",_rankPic,_rankName);
  _ctrl lnbAddRow [_name, _rankName];
  TRACE_1("Rank",_rank);
  _ctrl lnbSetPicture [[_idx, 0], _picture];
  _ctrl lnbSetColumnsPos [0, 0.5];

  _ctrl lnbSetPicture [[_idx, 1], _rankPic];
  _ctrl lnbSetData [[_idx, 0], _data];
  _ctrl lnbSetData [[_idx, 1], configName _rankCfg];
  _ctrl lnbSetTooltip [[_idx, 0], _tooltip];
  _ctrl lnbSetTooltip [[_idx, 1], _rankName];
};

private _fn_addUnit = {
  params ["_unit", "_ctrl", "_idx"];
  private _unitName = name _unit;
  private _role = [_unit] call EFUNC(roles,unitRole);
  private _roleName = [_role] call EFUNC(roles,displayName);
  private _rolePicture = [_role] call EFUNC(roles,icon);
  private _opCountAsRole = [_unit, _role] call EFUNC(history,opCount);
  private _totalOpCount = [_unit] call EFUNC(history,opCount);
  private _rank = [_unit, _role] call EFUNC(history,rank);
  private _rankCfg = configFile >> "CfgRoles" >> _role >> "CfgRanks" >> _rank;
  private _rankName = (_rankCfg >> "displayName") call BIS_fnc_getCfgData;
  private _rankPicture = (_rankCfg >> "icon") call BIS_fnc_getCfgData;
  private _tooltipHistory = format [_msg, _unitName];
  private _tooltip = format [
    "%1 - %2 (%3) - Ops as Role: %4/%5",
    _unitName,
    _roleName,
    _rankName,
    _opCountAsRole,
    _totalOpCount
  ];

  _ctrl lnbAddRow ["", _unitName, ""];
  _ctrl lnbSetPicture [[_idx, 0], _rolePicture];
  _ctrl lnbSetPicture [[_idx, 2], _rankPicture];
  _ctrl lnbSetData [[_idx, 0], _role];
  _ctrl lnbSetData [[_idx, 1], getPlayerUID _unit];
  _ctrl lnbSetData [[_idx, 2], _rank];
  _ctrl lnbSetTooltip [[_idx, 0], _tooltip];
};

{
  [_x, _ctrl, _forEachIndex] call _fn_addUnit;
} forEach _players;
_ctrl lnbSetCurSelRow -1;
[_ctrl, 1] lnbSortBy [];
