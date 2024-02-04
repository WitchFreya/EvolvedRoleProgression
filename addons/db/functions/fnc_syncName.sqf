#include "script_component.hpp"

TRACE_1(QGVAR(syncName),_this);

/*
 * Author: Maid
 * Update the stored name of a user.
 *
 * Arguments:
 * 0: Player UID <STRING>
 * 1: Player in-game profile name <STRING>
 *
 * Return Value:
 * true if is write was successfull, false if not
 *
 * Public: No
 */

params [
  ["_uid", "", [""]],
  ["_name", "", [""]]
];

[[_uid] call FUNC(getUnitDb), "$metadata", "playerName", _name] call FUNC(write);
[call FUNC(getCoreDb), _uid, "name", _name] call FUNC(write);
