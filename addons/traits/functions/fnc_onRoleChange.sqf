#include "script_component.hpp"

/**
 * Author: Maid
 * Updates the traits of a unit based on their role.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 *
 *
 * Public: Yes
 */

params ["_unit", "_oldRole", "_newRole"];

if (_oldRole == _newRole) exitWith {
    ERROR_1("Old role and new role cannot be the same",_this);
    false;
};

if (!alive _unit) exitWith {
    ERROR_1("Cannot change role for dead unit",_this);
    false;
};

private _traitsRoles = uiNamespace getVariable QGVAR(traits);
if (isNil "_traitsRoles") exitWith {
    ERROR_2("Role traits cache was empty",_this,_traitsRoles);
};

private _traitsRole = _traitsRoles get _newRole;
if (isNil "_traitsRole") exitWith {
    ERROR_3("Roles cache didn't have new role",_this,_traitsRoles,_traitsRole);
};

{
    _unit setUnitTrait [_x, _y];
    TRACE_3("Setting unit trait",_unit,_x,_y);
} forEach _traitsRole;

getAllUnitTraits _unit;
