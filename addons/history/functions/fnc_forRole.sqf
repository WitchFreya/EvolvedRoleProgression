#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the history data for a role.
 *
 * Arguments:
 * 0: unit <OBJECT> - The unit to collate the operational history for.
 * 1: role <STRING> - Optional, the role to limit the check to.
 *
 * Return Value:
 * Role history object <HASHMAP> or an empty hashmap.
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]],
  ["_role", nil, ["",nil]]
];

ASSERT_FALSE_EXIT(_unit isEqualTo objNull,"Invalid args",createHashMap);

private _history = _unit getVariable QGVARMAIN(history);

ASSERT_FALSE_EXIT(isNil {_history},"Invalid history for unit",createHashMap);

_history getOrDefault [_role, createHashMap];
