#include "script_component.hpp"

INFO("Roles postInit");
[player, player getVariable [QGVARMAIN(role), QUOTE(DEFAULT_ROLE)]] call EFUNC(common,setUnitRole);
