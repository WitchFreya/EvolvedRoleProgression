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

private _headerFormat = "<font face='PuristaBold' size='15'>%1</font>";
private _valueFormat = "- <font color='#FACADE'>%1</font> - <font face='EtelkaMonospacePro' color='#50C878'>%2</font>";

private _header = format [_headerFormat, name _unit];

private _body = [_order, {
    params ["_bodyStr", "_roleName"];
    private _role = _roles get _roleName;
    TRACE_1("_role",_role);
    private _name = _role get "name";
    TRACE_1("_name",_name);
    private _opsAsRole = _myHistory getOrDefault [_roleName, 0];
    TRACE_1("_opsAsRole",_opsAsRole);
    private _currText = format [_valueFormat, _name, _opsAsRole];
    if (_bodyStr == "") exitWith {
        _currText;
    };

    format ["%1<br/>%2",_prev,_currText];
}, ""] call FUNCMAIN(reduce);

format ["%1<br/><br/>%2", _header, _body];
