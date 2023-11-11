#include "script_component.hpp"

/**
 * Author: Maid
 * Updates the traits of a unit based on their role.
 *
 * Arguments:
 * 0: Unit <OBJECT> - Unit to update.
 * 1: Old Role <STRING> - Previous role.
 * 2: New role <STRING> - The new role
 *
 * Return Value:
 * Unit Traits <ARRAY>
 *
 * Example:
 *
 *
 * Public: Yes
 */

params ["_unit", "_oldRole", "_newRole"];

if (_oldRole == _newRole) then {
    WARNING_1("Old role and new role were the same",_this);
};

if (!alive _unit) exitWith {
    ERROR_1("Cannot change role for dead unit",_this);
    false;
};

private _traitsForRole = [_newRole] call FUNC(getTraitsForRole);

TRACE_1("TraitsForRole",_traitsForRole);
[_unit, _traitsForRole] call FUNC(setUnitTraits);

getAllUnitTraits _unit;
