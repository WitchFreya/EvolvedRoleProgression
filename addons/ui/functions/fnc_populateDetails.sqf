#include "script_component.hpp"

params ["_display", "_ctrlGroup", "_role"];

private _ctrl = _ctrlGroup controlsGroupCtrl IDC_RoleDescription;

private _description = [_role] call EFUNC(roles,description);
TRACE_2("Describing role",_role,_description);
_ctrl ctrlSetStructuredText (parseText _description);
