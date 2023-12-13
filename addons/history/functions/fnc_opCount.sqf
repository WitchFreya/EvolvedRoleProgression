#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the number of ops previously completed by a unit. Optionally, filter it to a single role.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 * 1: role <STRING> - Optional, the role to limit the check to.
 *
 * Return Value:
 * The number of ops <NUMBER>
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]],
  ["_role", nil, ["",nil]]
];

ASSERT_FALSE_EXIT(_unit isEqualTo objNull,"Invalid args",0);

private _history = _unit getVariable QGVARMAIN(history);

ASSERT_FALSE_EXIT(isNil {_history},"Invalid history for unit",0);

if !(isNil {_role}) exitWith {
  _history getOrDefault [_role, createHashMap] getOrDefault ["opCount", 0];
};

[
  _history,
  { _this apply { _y getOrDefault ["opCount", 0] } },
  FUNCMAIN(sum)
] call FUNCMAIN(pipe);
