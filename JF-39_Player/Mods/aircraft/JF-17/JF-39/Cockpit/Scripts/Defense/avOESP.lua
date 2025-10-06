dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- debug_eye = true

dtime = 0.05

eyes ={}
eyes[1] = {
    position      = {x = -4.532, y = 0.951, z =  0.202},
    orientation   = {azimuth = math.rad(135.0), elevation = 0},
    field_of_view = math.rad(95.0),
}
eyes[2] = {
    position      = {x = -4.532, y = 0.951, z = -0.202},
    orientation   = {azimuth = math.rad(-135.0), elevation = 0},
    field_of_view = math.rad(95.0),
}

-- 损毁定义
OESP_FAILURE_FL_DISP_L = 0
OESP_FAILURE_FL_DISP_R = 1
OESP_FAILURE_CH_DISP_L = 2
OESP_FAILURE_CH_DISP_R = 3
OESP_FAILURE_MAWS_L = 4
OESP_FAILURE_MAWS_R = 5


Damage = {
    {
        Failure = OESP_FAILURE_FL_DISP_L, Failure_name = "OESP_FAILURE_FL_DISP_L", Failure_editor_name = _("OESP_FAILURE_FL_DISP_L"),
        Element = damage_cells["TAIL_LEFT_SIDE"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = OESP_FAILURE_FL_DISP_R, Failure_name = "OESP_FAILURE_FL_DISP_R", Failure_editor_name = _("OESP_FAILURE_FL_DISP_R"),
        Element = damage_cells["TAIL_RIGHT_SIDE"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = OESP_FAILURE_CH_DISP_L, Failure_name = "OESP_FAILURE_CH_DISP_L", Failure_editor_name = _("OESP_FAILURE_CH_DISP_L"),
        Element = damage_cells["TAIL_LEFT_SIDE"], Integrity_Treshold = 0.6, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = OESP_FAILURE_CH_DISP_R, Failure_name = "OESP_FAILURE_CH_DISP_R", Failure_editor_name = _("OESP_FAILURE_CH_DISP_R"),
        Element = damage_cells["TAIL_RIGHT_SIDE"], Integrity_Treshold = 0.6, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = OESP_FAILURE_MAWS_L, Failure_name = "OESP_FAILURE_MAWS_L", Failure_editor_name = _("OESP_FAILURE_MAWS_L"),
        Element = damage_cells["TAIL_LEFT_SIDE"], Integrity_Treshold = 0.8, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
    {
        Failure = OESP_FAILURE_MAWS_R, Failure_name = "OESP_FAILURE_MAWS_R", Failure_editor_name = _("OESP_FAILURE_MAWS_R"),
        Element = damage_cells["TAIL_RIGHT_SIDE"], Integrity_Treshold = 0.8, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,
    },
}

need_to_be_closed = true
