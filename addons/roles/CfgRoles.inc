#define A3_RANKS \A3\Ui_f\data\GUI\Cfg\Ranks
#define UNTRAINED 0
#define TRAINED 1
#define EXPERT 2
class CfgRoles
{
    class Default
    {
        ITEM_META(1);
        icon = QUOTE(A3_RANKS\sergeant_gs);
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
    };
    class Marksman : Default
    {
        SCOPE(2);
        displayName = "Marksman";
    };
    class Sniper : Default
    {
        SCOPE(2);
        displayName = "Sniper";
        class UnitTraits
        {
            CamouflageCoef = 0.8;
        };
    };
    class Grenadier : Default
    {
        SCOPE(2);
        displayName = "Grenadier";
    };
    class Engineer : Default
    {
        SCOPE(2);
        displayName = "Engineer";
        class UnitTraits : UnitTraits
        {
            ExplosiveSpecialist = TRAINED;
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
        class UnitTraits : UnitTraits
        {
            CamouflageCoef = 0.8;
        };
    };

    class AntiarmorSpecialist : Default
    {
        SCOPE(2);
        displayName = "Antiarmor Specialist";
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
        displayName = "Team Lead";
    };

    class PlatoonLead : Default
    {
        SCOPE(2);
        displayName = "Platoon Lead";
    };

    class ArmorCrew : Default
    {
        SCOPE(2);
        displayName = "Armor Crew";
        class UnitVariables : UnitVariables
        {
            ACE_isEngineer = TRAINED;
        };
    };

    class Pilot : Default
    {
        SCOPE(2);
        displayName = "Pilot";
        class UnitVariables : UnitVariables
        {
            ACE_isEngineer = TRAINED;
        };
    };

    class Copilot : Default
    {
        SCOPE(2);
        displayName = "Copilot";
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
        class UnitTraits : UnitTraits
        {
            Medic = TRAINED;
            CamouflageCoef = 0.9;
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
