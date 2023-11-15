#include "script_component.hpp"
/*
 * Author: Maid
 * Restore unit traits on respawn.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, old_body_lying_on_floor] call erp_traits_fnc_handleRespawn;
 *
 * Public: No
 */

params ["_unit"];

private _role = _unit getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
private _propertiesForRole = [_role] call FUNC(getPropertiesForRole);
[_unit, _propertiesForRole] call FUNC(setUnitProperties);
