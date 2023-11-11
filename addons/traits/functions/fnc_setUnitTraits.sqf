#include "script_component.hpp"
/*
 * Author: Maid
 * Set multiple unit traits at once.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Traits <ARRAY | HASHMAP>
 *
 * Return Value:
 * Boolean success/fail value.
 *
 * Example:
 * [ACE_player, [["Engineer", true], ["Custom", true, true]] call ace_respawn_fnc_handleKilled
 *
 * Public: Yes
 */

params ["_unit", ["_traits", []]];
TRACE_1("setUnitTraits",_this);
if (count _traits == 0) exitWith {
    TRACE_1("No traits to set",_traits);
    false;
};

private _traitsAsArray = if (typeName _traits == 'HASHMAP') then {
    _traits apply {
        if (typeName _y == 'ARRAY') then {
            [_x] + _y;
        } else {
            [_x, _y];
        };
    };
} else { _traits; };

TRACE_1("TraitsAsArray",_traitsAsArray);

{
    _unit setUnitTrait _x;
    _x params ["_trait", "_value"];
    // ACE movement does silly things with loadcoef.
    if (_trait == "LoadCoef") then {
        _unit setVariable ["ace_movement_loadCoef", _value, true];
    };
} forEach _traitsAsArray;

_unit setVariable [QGVARMAIN(traits),_traitsAsArray];

true;
