#include "script_component.hpp"
/*
 * Author: Maid
 * Set traits and variables on a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Properties <HASHMAP>
 *
 * Return Value:
 * Boolean success/fail value.
 *
 * Example:
 * [ACE_player, uiNamespace getVariable "erp_traits_roleProperties" get "Rifleman"] call erp_traits_fnc_setUnitProperties
 *
 * Public: Yes
 */

params ["_unit", "_properties"];

private _traits = _properties get "traits";
private _variables = _properties get "variables";
TRACE_2("Values",_traits,_variables);
[_unit, _traits] call FUNC(setUnitTraits);

{
    _unit setVariable [_x, _y, true];
    TRACE_2("Setting",_x,_y);
} forEach _variables;

true;
