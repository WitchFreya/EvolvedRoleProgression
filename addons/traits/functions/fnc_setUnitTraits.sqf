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

{
    _unit setUnitTrait (
        if (typeName _traits == 'HASHMAP') then {[_x, _y];}
        else { _x; }
    );
} forEach _traits;

true;
