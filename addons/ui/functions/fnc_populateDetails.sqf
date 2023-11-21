#include "script_component.hpp"

params ["_display", "_ctrlGroup", "_role"];

private _description = _ctrlGroup controlsGroupCtrl IDC_RoleDescription;

private _roleData = uiNamespace getVariable QEGVAR(roles,cache) get _role;

TRACE_1("Setting description",_roleData);
_description ctrlSetStructuredText parseText (_roleData get "description");
