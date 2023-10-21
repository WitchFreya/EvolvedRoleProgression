#include "script_component.hpp"

/*
 * Author: Maid
 * Builds a role record to add to the diary.
 *
 * Arguments:
 * 0: The unit for whom to construct a record <OBJECT>
 *
 * Return Value:
 * A formatted for diary entry <STRING>
 *
 * Public: No
 */

params ["_unit"];
private _history = missionNamespace getVariable QGVARMAIN(history);
if (isNil "_history") exitWith {
    ERROR_1("Role history was empty", _history);
};
private _uid = getPlayerUID player;
private _myHistory = _history get _uid;
private _roles = uiNamespace getVariable QEGVAR(roles,cache);
private _order = uiNamespace getVariable QEGVAR(roles,order);
if (isNil "_roles" || { isNil "_order" }) exitWith {
    ERROR_3("Cache not found", _myHistory, _roles, _order);
};

[_order, {
    params ["_prev", "_curr"];
    private _role = _roles get _curr;
    private _name = _role get "name";
    private _opsAsRole = _myHistory getOrDefault [_curr, 0];
    private _currText = format ["<font color='#FACADE'>%1</font>: %2", _name, _opsAsRole];
    if (_prev == "") exitWith {
        _currText;
    };

    format ["%1<br/>%2",_prev,_currText];
}, ""] call EFUNC(common,reduce);