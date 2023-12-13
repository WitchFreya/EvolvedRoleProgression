#include "script_component.hpp"

params ["_display", "_ctrl"];

private _players = call BIS_fnc_listPlayers;

private _fn_addUnit = {
    params ["_unit", "_ctrl", "_idx"];
    private _unitName = name _unit;
    private _role = _unit getVariable QGVARMAIN(role);
    _ctrl lnbAddRow ["", _unitName, ""];
    _ctrl lnbSetPicture [[_idx, 1], [_role] call EFUNC(roles,icon)];
    _ctrl lnbSetData [[_idx, 1], _unitName];
    private _uid = getPlayerUID _unit;
    private _rolesHistory = _unit getVariable QGVARMAIN(history);
    private _roleHistory = _rolesHistory getOrDefault [_role, createHashMap] getOrDefault ["opCount", 0];

    // build the history tooltip
    private _msg = if (_roleHistory == 0) then {
        "This is %1's first op as this role."
    } else {
        private _playTime = format ["has played this role %1 times before.", _roleHistory];
        TRACE_1("history",_roleHistory);
        "%1 " + _playTime;
    };
    private _tooltipHistory = format [_msg, _unitName];
    private _tooltip = format ["%1 - %2", [_role] call EFUNC(roles,displayName), _tooltipHistory];
    _ctrl lnbSetTooltip [[_idx, 1], _tooltip];
};

{
   [_x, _ctrl, _forEachIndex] call _fn_addUnit;
} forEach _players;
_ctrl lnbSetCurSelRow -1;
[_ctrl, 1] lnbSortBy [];
