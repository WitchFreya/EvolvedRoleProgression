#include "script_component.hpp"

/*
 * Author: Maid
 * Saves the role progress for all players on the server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _players = call BIS_fnc_listPlayers;
{
    private _uid = getPlayerUID _x;
    private _name = name _x;
    private _role = _x getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)];
    TRACE_3("Saving player to db", _uid, _name, _role);
    private _result =[_uid, _name, _role] call FUNC(saveUnitRolePlaytime);
    if (!result) then {
        ERROR_1("Saving failed",_result);
    };
} forEach _players;
