#include "script_component.hpp"
/*
 * Author: Maid
 * On respawn, restore unit traits if ACE Restore Gear is set.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_respawn_fnc_handleKilled
 *
 * Public: No
 */

params ["_unit"];

if (!ace_respawn_SavePreDeathgear) exitWith {
    TRACE_1("Restore not enabled, exiting",ace_respawn_SavePreDeathgear);
};

private _traits = _unit getVariable [QGVAR(unitTraits), []];

if (count _traits == 0) exitWith {
    TRACE_1("No traits to restore",_unit);
};

TRACE_1("Restoring traits",_traits);
[_unit, _traits] call FUNC(setUnitTraits);
