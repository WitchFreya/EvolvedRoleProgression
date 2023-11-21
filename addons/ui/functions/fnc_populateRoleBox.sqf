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

private _roles = uiNamespace getVariable QEGVAR(roles,cache);
private _unitRole = player getVariable [QGVARMAIN(role),QUOTE(DEFAULT_ROLE)];
{
    private _role = _x;
    _ctrl lbAdd (_y get "name");
    _ctrl lbSetPicture [_forEachIndex, _y get "icon"];
    // TODO: # of players currently using role.
    _ctrl lbSetTooltip [_forEachIndex, format ["Number of players as role: %1", 0]];
    _ctrl lbSetData [_forEachIndex, _role];
} forEach _roles;

_ctrl lbSortBy [];

for '_i' from 0 to (lbSize _ctrl) - 1 do {
    private _role = _ctrl lbData _i;
    if (_role == _unitRole) exitWith {
        _display setVariable [QGVAR(selectedRole),_role];
        _ctrl lbSetCurSel _i;
    };
};
