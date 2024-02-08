#include "script_component.hpp"

#include "CfgRoles.inc"
#include "CfgEventHandlers.inc"
#include "CfgVehicles.inc"

class CfgPatches {
  class ADDON {
    name = QUOTE(COMPONENT);
    units[] = { CLASSES_VEHICLES };
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {
      "ace_zeus"
      , "zen_dialog"
      , "erp_main"
      , "erp_common"
    };
    author = QUOTE(AUTHOR);
    VERSION_CONFIG;
  };
};
