#include "script_component.hpp"

/*
 * Author: Maid
 * Retrieve the traits for a role.
 *
 * Arguments:
 * 0: Role <STRING>
 * 1: Default <HASHMAP> - Optional, return this if not found.
 *
 * Return Value:
 * 0: Traits <HASHMAP>
 *
 * Example:
 * ["Rifleman"] call erp_traits_fnc_getTraitsForRole
 *
 * Public: No
 */

params ["_role", "_default"];

private _traitsCache = uiNamespace getVariable QGVAR(roleProperties);

if (isNil "_traitsCache" && {isNil "_default";}) exitWith {
    ERROR_1("Empty properties cache with no default",_role);
    [];
};

if (isNil "_default") then {
    _traitsCache get _role;
} else {
    _traitsCache getOrDefault [_role, _default];
};
