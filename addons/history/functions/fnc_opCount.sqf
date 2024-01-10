#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the number of ops previously completed by a unit. Optionally, filter it to a single role.
 *  Note: This includes legacy ops, which may not have a date associated with them.
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

if !(isNil {_role}) exitWith {
  [_unit, _role] call FUNC(forRole) getOrDefault ["opCount", 0];
};

private _history = [_unit] call FUNC(get);

[
  _history,
  { _this apply { _y getOrDefault ["opCount", 0] } },
  FUNCMAIN(sum)
] call FUNCMAIN(pipe);
