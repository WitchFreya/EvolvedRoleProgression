#include "script_component.hpp"

/*
 * Author: Maid
 * Open role menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if (dialog) exitWith {
    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
    if (!isNull _display) then {closeDialog 0};
};

createDialog "ERP_Role_Menu";
GVAR(lastOpenedOn) = CBA_missionTime;
