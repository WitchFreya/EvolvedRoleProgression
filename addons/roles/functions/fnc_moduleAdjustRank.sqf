#include "script_component.hpp"

/*
 * Author: Maid
 * Module function for adjusting a unit's role rank in-game.
 *
 * Arguments:
 * 0: logic <LOGIC> - The module for this function
 * 1: targets <ARRAY> - Synchronized targets. Unused in Zeus, always empty.
 * 2: activated <BOOL> - Always true in Zeus.
 *
 * Return Value:
 * true on success
 *
 * Example:
 * [_this, [player], true] call erp_roles_fnc_moduleAdjustRank
 *
 * Public: No
 */

TRACE_1("ModuleAdjustRank",_this);

if (canSuspend) exitWith { [FUNC(moduleAdjustRank), _this] call CBA_fnc_directCall; };

params ["_logic"];

// Run just for Zeus
if !(local _logic) exitWith {};

private _target = attachedTo _logic;
deleteVehicle _logic;

if (isNull _target) exitWith {
  ["Place on a unit"] call ace_zeus_fnc_showMessage;
};

if !(alive _target) exitWith {
  ["Target unit must be alive"] call ace_zeus_fnc_showMessage;
};

if (driver _target isEqualTo _target) then {
  [_target] call FUNC(openUnitRankUI);
} else {
  [driver _target] call FUNC(openUnitRankUI);
};
