#define A3_RANKS \a3\ui_f\data\gui\Cfg\Ranks
#define A3_CHARACTERS_UI \a3\characters_f\data\ui
#define UNTRAINED 0
#define TRAINED 1
#define EXPERT 2
class CfgRoles
{
  class Default
  {
    ITEM_META(1);
    description = "The default role should not be available as a selectable item.";
    icon = "a3\ui_f\data\gui\cfg\respawnroles\assault_ca.paa";
    class UnitTraits
    {
      Engineer = UNTRAINED;
      ExplosiveSpecialist = UNTRAINED;
      Medic = UNTRAINED;
      UAVHacker = UNTRAINED;
      AudibleCoef = 1;
      CamouflageCoef = 1;
      LoadCoef = 1;
    };

    class UnitVariables
    {
      ACE_isEngineer = UNTRAINED;
      ACE_Medical_MedicClass = UNTRAINED;
      ACE_Movement_LoadCoef = 1;
    };
  };

  class Rifleman : Default
  {
    SCOPE(2);
    displayName = "Rifleman";
    description = "The rifleman is the core of the fireteam. Anything that does not come down to a special role is their purview, and they boast a slightly increased carrying capacity to support these tasks.";
    icon = QPATHTOEF(arsenal,data\sws_icon_howl_ca.paa);
    class UnitTraits : UnitTraits
    {
      LoadCoef = 0.9;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Movement_LoadCoef = 0.9;
    };
  };

  class CombatLifeSaver : Default {
    SCOPE(2);
    displayName = "Combat Life Saver";
    description = "A CLS is the first responder for a medical incident in combat. By selecting this role, you'll gain access to fixing people up with the Personal Aid Kit, stitching them with a Surgical Kit, and several other features that help with that job.";
    icon = "a3\3den\data\cfgwaypoints\support_ca.paa";
    class UnitTraits : UnitTraits
    {
      Medic = TRAINED;
      CamouflageCoef = 0.9;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Medical_MedicClass = TRAINED;
    };
  };

  class Medic : Default
  {
    SCOPE(2);
    displayName = "Medic";
    description = "In addition to the responsibilities of a CLS, a medic goes above and beyond. In times of emergency, they are expected to take over as a team lead if one is down and direct the flow of combat while dealing with masscas and similar situations.";
    icon = "a3\characters_f\data\ui\icon_medic_ca.paa";
    class UnitTraits : UnitTraits
    {
      Medic = TRAINED;
      CamouflageCoef = 0.9;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Medical_MedicClass = TRAINED;
    };
  };
  class MachineGunner : Default
  {
    SCOPE(2);
    displayName = "Machine Gunner";
    description = "A machine gunner, or autorifleman, is expected to lay down powerful suppressing fire and directed fire on key targets to support their fireteams.";
    icon = "a3\weapons_f\data\ui\icon_mg_ca.paa";
  };
  class Marksman : Default
  {
    SCOPE(2);
    displayName = "Marksman";
    description = "A marksman takes over for longer range targets that your average rifleman couldn't hit as easily.";
    icon = "a3\ui_f\data\gui\cfg\respawnroles\recon_ca.paa";
  };
  class Sniper : Default
  {
    SCOPE(2);
    displayName = "Sniper";
    description = "A sniper is a master at long range targets, capable of engaging targets in ranges exceeding 800m. To support this, they have additional camouflage and some medical training, since they will usually be separate from the primary battle force. Snipers usually operate in pairs.";
    icon = "a3\weapons_f\data\ui\icon_sniper_ca.paa";
    class UnitTraits : UnitTraits
    {
      CamouflageCoef = 0.8;
      Medic = TRAINED;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Medical_MedicClass = TRAINED;
    };
  };
  class Grenadier : Default
  {
    SCOPE(2);
    description = "A grenadier takes advantage of underbarrel grenade launchers, or UGLs, to provide supporting features that a standard rifleman could not. They're capable of shooting off flares, raining grenades down on soldiers, and even marking key targets with smokes.";
    displayName = "Grenadier";
    icon = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\cargothrow_ca.paa";
  };
  class Engineer : Default
  {
    SCOPE(2);
    displayName = "Engineer";
    description = "An engineer is a master of battlefield control. Using the Fortify Tool and explosives as well as repairing key assets, they can redefine the shape of the battle.";
    icon = "a3\ui_f\data\gui\cfg\respawnroles\support_ca.paa";
    class UnitTraits : UnitTraits
    {
      ExplosiveSpecialist = TRAINED;
      UAVHacker = TRAINED;
    };

    class UnitVariables : UnitVariables
    {
      ACE_isEngineer = TRAINED;
    };
  };
  class DroneOperator : Default
  {
    SCOPE(2);
    displayName = "Drone Operator";
    description = "A drone operator takes advantage of various autonomous vehicles to avoid danger and collect valuable intelligence. To do so, they boast some added camouflage as well as the ability to hack enemy drones if they are disabled.";
    icon = "a3\drones_f\air_f_gamma\uav_01\data\ui\map_uav_01_ca.paa";
    class UnitTraits : UnitTraits
    {
      CamouflageCoef = 0.8;
      UAVHacker = TRAINED;
    };
  };

  class AntiarmorSpecialist : Default
  {
    SCOPE(2);
    displayName = "Antiarmor Specialist";
    description = "A step above the average rifleman, an antiarmor specialist is trained with various rockets and similar munitions to take out enemy armor assets.";
    icon = "a3\characters_f\data\ui\icon_expl_specialist_ca.paa";
    class UnitTraits : UnitTraits
    {
      LoadCoef = 0.9;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Movement_LoadCoef = 0.9;
    };
  };

  class TeamLead : Default
  {
    SCOPE(2);
    description = "As a team lead, it's your responsibility to direct and guide your team in battle. Do your part to make sure that everyone makes it out alive.";
    displayName = "Team Lead";
    icon = "a3\ui_f\data\gui\cfg\ranks\sergeant_gs.paa";
  };

  class PlatoonLead : Default
  {
    SCOPE(2);
    description = "As platoon lead, your responsibility is to ensure that all of the other teams have direction. You are command's eyes and voice to the boots on the ground.";
    displayName = "Platoon Lead";
    icon = "a3\ui_f\data\gui\cfg\ranks\lieutenant_gs.paa";
  };

  class ArmorCrew : Default
  {
    SCOPE(2);
    displayName = "Armor Crew";
    description = "Armor crew will often be in some form of armored vehicle, and possess the ability to partially repair their vehicles to avoid getting stuck indefinitely.";
    icon = "a3\data_f_tank\logos\arma3_tank_icon_ca.paa";
    class UnitVariables : UnitVariables
    {
      ACE_isEngineer = TRAINED;
    };
  };

  class Pilot : Default
  {
    SCOPE(2);
    displayName = "Pilot";
    description = "Enjoy your time in the skies, pilot. You may be separate from most of the fireteams, but if you go down at least you have some engineering ability to get yourself up again. Hope you've got a copilot to patch your wounds though.";
    icon = "a3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa";
    class UnitVariables : UnitVariables
    {
      ACE_isEngineer = TRAINED;
    };
  };

  class Copilot : Default
  {
    SCOPE(2);
    displayName = "Copilot";
    description = "As copilot, your job is to assist the pilot with spotting and direction, communicate with ground forces, and to patch yourself and the pilot up in case of medical emergencies.";
    icon = "a3\ui_f\data\igui\cfg\simpletasks\types\navigate_ca.paa";
    class UnitTraits : UnitTraits
    {
      Medic = TRAINED;
    };

    class UnitVariables : UnitVariables
    {
      ACE_Medical_MedicClass = TRAINED;
    };
  };

  class Architect : Default
  {
    SCOPE(2);
    displayName = "Architect";
    description = "You run the show, and have the traits to do just that. Have fun, architect. Try not to kill everyone, please?";
    icon = "a3\characters_f\data\ui\icon_repair_ca.paa";
    class UnitTraits : UnitTraits
    {
        Medic = TRAINED;
        CamouflageCoef = 0.8;
        UAVHacker = TRAINED;
    };

    class UnitVariables : UnitVariables
    {
        ACE_Medical_MedicClass = EXPERT;
        ACE_isEngineer = EXPERT;
    };
  };
};
#undef UNTRAINED
#undef TRAINED
#undef EXPERT
#undef A3_RANKS
