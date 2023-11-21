#include "script_component.hpp"

params ["_display", "_ctrl"];

private _players = call BIS_fnc_listPlayers;
private _rolesCache = uiNamespace getVariable QEGVAR(roles,cache);

{
    private _role = _x getVariable QGVARMAIN(role);
    private _cache = _rolesCache get _role;
    // TODO: Get role history number
    private _opNumber = 0;
    _ctrl lbAdd (name _x);
    _ctrl lbSetPicture [_forEachIndex, _cache get "icon"];
    _ctrl lbSetTooltip [_forEachIndex, format ["Op #%1 as %2", _opNumber, _cache get "name"]];
    _ctrl lbSetData [_forEachIndex, name _x];
} forEach _players;
_ctrl lbSetCurSel -1;
_ctrl lbSortBy [];
