#include "script_component.hpp"
/*
 * Author: Maid
 * On killed, cache unit traits if ACE Restore Gear is set.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * Boolean success/failure value.
 *
 * Example:
 * [ACE_player, some_killer] call erp_traits_fnc_handleKilled
 *
 * Public: No
 */

params ["_unit"];

if (ACE_player != _unit || {!ace_respawn_SavePreDeathGear}) exitWith {
    TRACE_2("No need to save, exiting",_unit,ace_respawn_SavePreDeathGear);
    false;
};

private _allUnitTraits = getAllUnitTraits _unit;
_unit setVariable [QGVAR(unitTraits), getAllUnitTraits _unit];
TRACE_2("Cached unit traits to unit",_unit,_allUnitTraits);
true;
