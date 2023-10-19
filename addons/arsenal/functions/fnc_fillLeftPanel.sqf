#include "script_component.hpp"
#include "defines.hpp"

/*
 * Author: Maid
 * Populate the arsenal with the role selection info.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control idc <NUMBER>
 * 2: Right tab control idc <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_display", "_panelIdc", "_rightPanelIdc"];
private _ctrlPanel = _display displayCtrl IDC_leftTabContent;

if (_panelIDC != IDC_buttonRole) exitWith {};

private _roles = uiNamespace getVariable [QEGVAR(roles,cache), createHashMap];
private _order = uiNamespace getVariable [QEGVAR(roles,order), []];

TOGGLE_RIGHT_PANEL_HIDE;
lbClear _ctrlPanel;

{
    private _entry = _roles getOrDefault [_x, createHashMap];
	private _displayName = _entry get "name";
	private _itemPicture = _entry get "icon";

    private _lbAdd = _ctrlPanel lbAdd _displayName;
    _ctrlPanel lbSetData [_lbAdd, _x];
    _ctrlPanel lbSetPicture [_lbAdd, _itemPicture];
    private _usage = format ["Select this item to get credit for running as %1 when an op ends.",
        toLower _displayName
    ];
    _ctrlPanel lbSetTooltip [_lbAdd, _usage];
} forEach _order;

// Because ACE calls leftPanelFilled before doing more changes to the layout, wait until they're done.
[
    { [QGVAR(leftPanelFilled), _this] call CBA_fnc_localEvent; },
    [_display, _rightPanelIdc]
] call CBA_fnc_execNextFrame;

// i know
// it hurts me too
// one day i will request an API
// for now i will simply sob
