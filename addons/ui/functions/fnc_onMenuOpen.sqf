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
_playButtonCtrl ctrlSetStructuredText parseText (format ["<t align='center' valign='middle'>%1</t>", LLSTRING(UseRole)]);
