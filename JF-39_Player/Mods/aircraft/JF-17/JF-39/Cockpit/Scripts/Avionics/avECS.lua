dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

cpt_smk_scale = 6.0
cpt_smk_time = 20

dtime = 0.1

FAILURE_ECS_TOTAL                 = 0
FAILURE_ECS_MECH                  = 1
FAILURE_ECS_ELEC                  = 2
FAILURE_ECS_2_RDR                 = 3
FAILURE_ECS_2_FUEL                = 4
ECS_FAILURE_WS_GLASS_CRACKED      = 5
ECS_FAILURE_WS_GLASS_BROKEN       = 6
ECS_FAILURE_CANOPY_GLASS_CRACKED  = 7
ECS_FAILURE_CANOPY_GLASS_BROKEN   = 8

Damage = {
    {
        Failure = FAILURE_ECS_MECH, Failure_name = "FAILURE_ECS_MECH", Failure_editor_name = _("FAILURE_ECS_MECH"),
        Integrity_Treshold = 0.4, Slope_param = 1.0,
        Element = damage_cells["BLADE_1_IN"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_ECS_ELEC, Failure_name = "FAILURE_ECS_ELEC", Failure_editor_name = _("FAILURE_ECS_ELEC"),
        Integrity_Treshold = 0.3, Slope_param = 1.0,
        Element = damage_cells["CABIN_RIGHT_SIDE"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    
    {
        Failure = ECS_FAILURE_WS_GLASS_CRACKED, Failure_name = "ECS_FAILURE_WS_GLASS_CRACKED", Failure_editor_name = _("ECS_FAILURE_WS_GLASS_CRACKED"),
        Integrity_Treshold = 0.6, Slope_param = 1.0,
        Element = damage_cells["COCKPIT"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = ECS_FAILURE_WS_GLASS_BROKEN, Failure_name = "ECS_FAILURE_WS_GLASS_BROKEN", Failure_editor_name = _("ECS_FAILURE_WS_GLASS_BROKEN"),
        Integrity_Treshold = 0.3, Slope_param = 1.0,
        Element = damage_cells["COCKPIT"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = ECS_FAILURE_CANOPY_GLASS_CRACKED, Failure_name = "ECS_FAILURE_CANOPY_GLASS_CRACKED", Failure_editor_name = _("ECS_FAILURE_CANOPY_GLASS_CRACKED"),
        Integrity_Treshold = 0.7, Slope_param = 1.0,
        Element = damage_cells["COCKPIT"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = ECS_FAILURE_CANOPY_GLASS_BROKEN, Failure_name = "ECS_FAILURE_CANOPY_GLASS_BROKEN", Failure_editor_name = _("ECS_FAILURE_CANOPY_GLASS_BROKEN"),
        Integrity_Treshold = 0.4, Slope_param = 1.0,
        Element = damage_cells["COCKPIT"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true
