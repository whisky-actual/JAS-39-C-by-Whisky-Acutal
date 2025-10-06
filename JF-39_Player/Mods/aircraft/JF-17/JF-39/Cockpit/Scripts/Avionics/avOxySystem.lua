dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

dtime = 0.1

oxy_press = 14.7
oxy_rate  = 6.6667e-4
leak_rate = 9e-8

oxy_cpt_time = 1200.0
oxy_seat_time = 90.0

oxy_starv_limit     = 54019.91 -- 101000.00
oxy_starv_dead_time = 60.0

OXY_FAILURE_AUTO_100_O2   = 0
OXY_FAILURE_AIR_O2_SWITCH = 1
OXY_FAILURE_HIGH_PRESS    = 2
OXY_FAILURE_L_LEAK        = 3
OXY_FAILURE_L_LEAK_SEVERE = 4
OXY_FAILURE_R_LEAK        = 5
OXY_FAILURE_R_LEAK_SEVERE = 6


Damage = {
    {
        Failure = OXY_FAILURE_AUTO_100_O2, Failure_name = "OXY_FAILURE_AUTO_100_O2", Failure_editor_name = _("OXY_FAILURE_AUTO_100_O2"),
        Element = damage_cells["CABIN_LEFT_SIDE"], work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_AIR_O2_SWITCH, Failure_name = "OXY_FAILURE_AIR_O2_SWITCH", Failure_editor_name = _("OXY_FAILURE_AIR_O2_SWITCH"),
        Element = damage_cells["CABIN_LEFT_SIDE"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_HIGH_PRESS, Failure_name = "OXY_FAILURE_HIGH_PRESS", Failure_editor_name = _("OXY_FAILURE_HIGH_PRESS"),
        Element = damage_cells["CABIN_LEFT_SIDE"], work_time_to_fail_probability = 0.2, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_L_LEAK, Failure_name = "OXY_FAILURE_L_LEAK", Failure_editor_name = _("OXY_FAILURE_L_LEAK"),
        Element = damage_cells["LEFT_GEAR_BOX"], work_time_to_fail_probability = 0.2, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_L_LEAK_SEVERE, Failure_name = "OXY_FAILURE_L_LEAK_SEVERE", Failure_editor_name = _("OXY_FAILURE_L_LEAK_SEVERE"),
        Element = damage_cells["LEFT_GEAR_BOX"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_R_LEAK, Failure_name = "OXY_FAILURE_R_LEAK", Failure_editor_name = _("OXY_FAILURE_R_LEAK"),
        Element = damage_cells["RIGHT_GEAR_BOX"], work_time_to_fail_probability = 0.2, work_time_to_fail = 3600*300
    },
    {
        Failure = OXY_FAILURE_R_LEAK_SEVERE, Failure_name = "OXY_FAILURE_R_LEAK_SEVERE", Failure_editor_name = _("OXY_FAILURE_R_LEAK_SEVERE"),
        Element = damage_cells["RIGHT_GEAR_BOX"], work_time_to_fail_probability = 0.1, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true
