dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

FAILURE_EXT_LIGHT_NAV_LEFT = 0
FAILURE_EXT_LIGHT_NAV_RIGHT = 1
FAILURE_EXT_LIGHT_NAV_TAIL = 2
FAILURE_EXT_LIGHT_ANTICOL = 3
FAILURE_EXT_LIGHT_FORMATION_LEFT = 4
FAILURE_EXT_LIGHT_FORMATION_RIGHT = 5
FAILURE_EXT_LIGHT_TAXI = 6
FAILURE_EXT_LIGHT_LAND = 7

Damage = {
    {
        Failure = FAILURE_EXT_LIGHT_NAV_LEFT, Failure_name = "FAILURE_EXT_LIGHT_NAV_LEFT", Failure_editor_name = _("FAILURE_EXT_LIGHT_NAV_LEFT"),
        Element = damage_cells["BLADE_1_OUT"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_NAV_RIGHT, Failure_name = "FAILURE_EXT_LIGHT_NAV_RIGHT", Failure_editor_name = _("FAILURE_EXT_LIGHT_NAV_RIGHT"),
        Element = damage_cells["BLADE_2_OUT"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_NAV_TAIL, Failure_name = "FAILURE_EXT_LIGHT_NAV_TAIL",  Failure_editor_name = _("FAILURE_EXT_LIGHT_NAV_TAIL"),
        Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.7, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_ANTICOL, Failure_name = "FAILURE_EXT_LIGHT_ANTICOL",   Failure_editor_name = _("FAILURE_EXT_LIGHT_ANTICOL"),
        Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.7, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_FORMATION_LEFT, Failure_name = "FAILURE_EXT_LIGHT_FORMATION_LEFT",  Failure_editor_name = _("FAILURE_EXT_LIGHT_FORMATION_LEFT"),
        Element = damage_cells["WING_L_OUT"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_FORMATION_RIGHT, Failure_name = "FAILURE_EXT_LIGHT_FORMATION_RIGHT", Failure_editor_name = _("FAILURE_EXT_LIGHT_FORMATION_RIGHT"),
        Element = damage_cells["WING_R_OUT"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_TAXI, Failure_name = "FAILURE_EXT_LIGHT_TAXI",      Failure_editor_name = _("FAILURE_EXT_LIGHT_TAXI"),
        Element = damage_cells["FRONT_GEAR_BOX"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_EXT_LIGHT_LAND, Failure_name = "FAILURE_EXT_LIGHT_LAND",      Failure_editor_name = _("FAILURE_EXT_LIGHT_LAND"),
        Element = damage_cells["FRONT_GEAR_BOX"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true -- close lua state after initialization
