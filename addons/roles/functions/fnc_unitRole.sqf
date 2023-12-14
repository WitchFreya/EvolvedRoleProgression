#include "script_component.hpp"

/*
 * Author: Maid
 * Get a unit's role.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Role <STRING>
 *
 * Public: No
 */

params [
  ["_unit", objNull, [objNull]]
];

ASSERT_FALSE_EXIT(_unit isEqualTo objNull,"Invalid args",QGVAR(DEFAULT_ROLE));

_unit getVariable [QGVARMAIN(role),QGVAR(DEFAULT_ROLE)];
