#define CLASSES_VEHICLES \
  "ERP_ModuleAdjustRank"

class CfgVehicles {
  class ERP_ModuleBase;
  class ERP_ModuleAdjustRank : ERP_ModuleBase {
    displayName = QNAME(Adjust Role Rank);
    icon = QPATHTOEF(common,data\sws_icon_howl_ca.paa);
    category = "ERP_Utility";
    function = QFUNC(moduleAdjustRank);
    functionPriority = 10;
    isGlobal = MODULE_isGlobal_SERVER;
    isDisposable = FALSE;
    curatorCanAttach = TRUE;
  };
};
