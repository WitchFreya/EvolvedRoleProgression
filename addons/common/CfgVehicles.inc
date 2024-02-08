class CfgVehicles {
  class Module_F;
  class ERP_ModuleBase : Module_F {
    META;
    scope = 1;
    scopeCurator = 2;
    category = "ERP";
    function = QFUNC(noop);
    functionPriority = 1;
    isGlobal = MODULE_isGlobal_GLOBAL;
    isTriggerActivated = FALSE;
  };
};
