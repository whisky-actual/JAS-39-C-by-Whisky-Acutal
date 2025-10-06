dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
pcheck = true

dtime = 1.0 / 32

unarm_duration      = 3600.0
align_duration      = 30.0
align_duration_agm  = 18.0
align_duration_jsow = 21.0

-- damage
FAILURE_SMS_PYLON_1 = 0
FAILURE_SMS_PYLON_2 = 1
FAILURE_SMS_PYLON_3 = 2
FAILURE_SMS_PYLON_4 = 3
FAILURE_SMS_PYLON_5 = 4
FAILURE_SMS_PYLON_6 = 5
FAILURE_SMS_PYLON_7 = 6

Damage = {
    {
        Failure = FAILURE_SMS_PYLON_1, Failure_name = "FAILURE_SMS_PYLON_1", Failure_editor_name = _("FAILURE_SMS_PYLON_1"),
        Element = damage_cells["WING_L_OUT"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_2, Failure_name = "FAILURE_SMS_PYLON_2", Failure_editor_name = _("FAILURE_SMS_PYLON_2"),
        Element = damage_cells["WING_L_CENTER"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_3, Failure_name = "FAILURE_SMS_PYLON_3", Failure_editor_name = _("FAILURE_SMS_PYLON_3"),
        Element = damage_cells["WING_L_IN"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_4, Failure_name = "FAILURE_SMS_PYLON_4", Failure_editor_name = _("FAILURE_SMS_PYLON_4"),
        Element = damage_cells["FUSELAGE_BOTTOM"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_5, Failure_name = "FAILURE_SMS_PYLON_5", Failure_editor_name = _("FAILURE_SMS_PYLON_5"),
        Element = damage_cells["WING_R_IN"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_6, Failure_name = "FAILURE_SMS_PYLON_6", Failure_editor_name = _("FAILURE_SMS_PYLON_6"),
        Element = damage_cells["WING_R_CENTER"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = FAILURE_SMS_PYLON_7, Failure_name = "FAILURE_SMS_PYLON_7", Failure_editor_name = _("FAILURE_SMS_PYLON_7"),
        Element = damage_cells["WING_R_OUT"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
}

need_to_be_closed = true
