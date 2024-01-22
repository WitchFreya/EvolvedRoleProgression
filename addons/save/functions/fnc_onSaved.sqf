#include "script_component.hpp"

/*
 * Author: Maid
 * Handle save completed.
 *
 * Arguments:
 * 0: role <STRING> - The role that was saved
 * 1: count <NUMBER> - The new count of how many times the unit has played this role
 *
 * Return Value:
 * None
 *
 * Public: No
 */

_this call FUNC(showSave);
[QEGVAR(db,buildHistory), [getPlayerUID player, player]] call CBA_fnc_serverEvent;
