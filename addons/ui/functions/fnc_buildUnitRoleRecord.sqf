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

params [
  ["_unit", objNull, [objNull]]
];

ASSERT_FALSE_EXIT(_unit isEqualTo objNull,"Invalid args","");
private _myHistory = _unit getVariable QGVARMAIN(history);
if (isNil {_myHistory}) exitWith {
  ERROR_1("Unit missing role history",_unit);
  "";
};
private _roles = call EFUNC(roles,classNames);

ASSERT_FALSE_EXIT(isNil {_roles },"Invalid role data","");

private _headerFormat = "<font face='PuristaBold' size='15'>%1</font>";
private _valueFormat = "- <font color='#FACADE'>%1</font> - <font face='EtelkaMonospacePro' color='#50C878'>%2</font>";

private _header = format [_headerFormat, name _unit];

private _body = [_roles, {
  params ["_bodyStr", "_roleName"];
  private _name = [_roleName] call EFUNC(roles,displayName);
  TRACE_1("_name",_name);
  private _opsAsRole = _myHistory getOrDefault [_roleName, createHashMap] getOrDefault ["opCount", 0];
  TRACE_1("_opsAsRole",_opsAsRole);
  private _currText = format [_valueFormat, _name, _opsAsRole];
  if (_bodyStr == "") exitWith {
    _currText;
  };

  format ["%1<br/>%2",_bodyStr,_currText];
}, ""] call FUNCMAIN(reduce);

format ["%1<br/><br/>%2", _header, _body];
