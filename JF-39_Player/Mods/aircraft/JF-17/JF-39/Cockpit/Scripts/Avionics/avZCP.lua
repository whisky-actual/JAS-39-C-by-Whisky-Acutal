dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 0.2

ZCP_FAILURE_MALFUNC = 0

Damage = {
    {
        Failure = ZCP_FAILURE_MALFUNC, Failure_name = "ZCP_FAILURE_MALFUNC", Failure_editor_name = _("ZCP_FAILURE_MALFUNC"),
        Element = damage_cells["CABIN_RIGHT_SIDE"], Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true
