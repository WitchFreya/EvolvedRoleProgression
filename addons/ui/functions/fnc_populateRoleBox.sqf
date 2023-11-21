#include "script_component.hpp"



params ["_display", "_ctrl"];

private _roles = uiNamespace getVariable QEGVAR(roles,cache);
private _unitRole = player getVariable [QGVARMAIN(role),QUOTE(DEFAULT_ROLE)];
{
    _ctrl lbAdd (_y get "name");
    _ctrl lbSetPicture [_forEachIndex, _y get "icon"];
    // TODO: # of players currently using role.
    _ctrl lbSetTooltip [_forEachIndex, format ["Number of players as role: %1", 0]];
    _ctrl lbSetData [_forEachIndex, _x];
} forEach _roles;
_ctrl lbSortBy [];
_ctrl lbSetCurSel 0;
