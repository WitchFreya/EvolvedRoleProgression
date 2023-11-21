#include "script_component.hpp"
/*
 * Author: Maid
 * Handles opening the Role Menu. Called from onLoad event.
 *
 * Arguments:
 * 0: Role Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call erp_ui_fnc_onMenuOpen
 *
 * Public: No
 */

params ["_display"];

private _playButtonCtrl = _display displayCtrl IDC_PlayButton;
[_display, _display displayCtrl IDC_RolesList] call FUNC(populateRoleBox);
[_display, _display displayCtrl IDC_UnitRolesList] call FUNC(populatePlayerBox);

private _detailsGroup = _display displayCtrl IDC_RoleDetails;
private _descriptionCtrl = _detailsGroup controlsGroupCtrl IDC_RoleDescription;
