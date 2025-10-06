dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 0.2

parse_f10_fp = true

--
DTC_FAILURE_CARD_BROKEN = 0
DTC_FAILURE_DATA_CRC = 1
DTC_FAILURE_DATA_DECIPHER = 2
DTC_FAILURE_READER_BROKEN = 3

Damage = {
{
    Failure = DTC_FAILURE_CARD_BROKEN,     Failure_name = "DTC_FAILURE_CARD_BROKEN",    Failure_editor_name = _("DTC_FAILURE_CARD_BROKEN"),
    Element = damage_cells["KEEL_R_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = DTC_FAILURE_DATA_CRC,        Failure_name = "DTC_FAILURE_DATA_CRC",       Failure_editor_name = _("DTC_FAILURE_DATA_CRC"),
    Element = damage_cells["KEEL_R_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = DTC_FAILURE_DATA_DECIPHER,   Failure_name = "DTC_FAILURE_DATA_DECIPHER",  Failure_editor_name = _("DTC_FAILURE_DATA_DECIPHER"),
    Element = damage_cells["KEEL_R_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = DTC_FAILURE_READER_BROKEN,   Failure_name = "DTC_FAILURE_READER_BROKEN",  Failure_editor_name = _("DTC_FAILURE_READER_BROKEN"),
    Element = damage_cells["KEEL_R_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
}

--
need_to_be_closed = true
