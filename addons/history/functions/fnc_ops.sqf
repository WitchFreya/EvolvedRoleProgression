#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the ops previously completed by a unit. Optionally, filter it to a single role.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 * 1: role <STRING> - Optional, the role to limit the check to.
 *
 * Return Value:
 * Ops <DATE[]>
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]],
  ["_role", nil, ["",nil]]
];

if !(isNil {_role}) exitWith {
  [_unit, _role] call FUNC(forRole) getOrDefault ["ops", []];
};

ASSERT_FALSE_EXIT(_unit isEqualTo objNull,"Invalid args",0);

private _history = _unit getVariable QGVARMAIN(history);

ASSERT_FALSE_EXIT(isNil {_history},"Invalid history for unit",0);

private _fnc_append = {
  [_this, {
    params ["_acc", "_date"];
    _acc append _date;
    _acc;
  }] call FUNCMAIN(reduce)
};

[
  _history,
  { _this apply { _y getOrDefault ["ops", []] } },
  _fnc_append
] call FUNCMAIN(pipe);
