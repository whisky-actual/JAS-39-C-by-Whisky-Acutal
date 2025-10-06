dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

local scale = 5.0

hyd1_ail_left    = scale * 0.006
hyd1_ail_right   = scale * 0.006
hyd1_stab_left   = scale * 0.008
hyd1_stab_right  = scale * 0.008
hyd1_lef_left    = scale * 0.004
hyd1_lef_right   = scale * 0.004
hyd1_rudder      = scale * 0.006

hyd2_ail_left    = scale * 0.006
hyd2_ail_right   = scale * 0.006
hyd2_stab_left   = scale * 0.008
hyd2_stab_right  = scale * 0.008
hyd2_flap_left   = scale * 0.006
hyd2_flap_right  = scale * 0.006
hyd2_rudder      = scale * 0.006

hyd2_mg_brk_left  = scale * 0.004
hyd2_mg_brk_right = scale * 0.004

hyd2_ng_steer     = scale * 0.003
hyd2_ng_inout     = scale * 0.008
hyd2_spd_brake    = scale * 0.002
hyd2_inlet_door   = scale * 0.001

dtime = 0.05

FAILURE_HYDRAULICS_EMERGE                    = 0
FAILURE_HYDRAULICS_EMERGE_ACCU               = 1
FAILURE_HYDRAULICS_1_PUMP                    = 2
FAILURE_HYDRAULICS_1_ACCU                    = 3
FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE        = 4
FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE_SEVERE = 5
FAILURE_HYDRAULICS_1_INTERNAL_LEAKAGE        = 6
FAILURE_HYDRAULICS_2_PUMP                    = 7
FAILURE_HYDRAULICS_2_ACCU                    = 8
FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE        = 9
FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE_SEVERE = 10
FAILURE_HYDRAULICS_2_INTERNAL_LEAKAGE        = 11


Damage = {
    {
        Failure = FAILURE_HYDRAULICS_EMERGE, Failure_name = "FAILURE_HYDRAULICS_EMERGE", Failure_editor_name = _("FAILURE_HYDRAULICS_EMERGE"),
        Element = 10, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_EMERGE_ACCU, Failure_name = "FAILURE_HYDRAULICS_EMERGE_ACCU", Failure_editor_name = _("FAILURE_HYDRAULICS_EMERGE_ACCU"),
        Element = 10, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_1_PUMP, Failure_name = "FAILURE_HYDRAULICS_1_PUMP", Failure_editor_name = _("FAILURE_HYDRAULICS_1_PUMP"),
        Element = 82, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_1_ACCU, Failure_name = "FAILURE_HYDRAULICS_1_ACCU", Failure_editor_name = _("FAILURE_HYDRAULICS_1_ACCU"),
        Element = 17, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE, Failure_name = "FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE", Failure_editor_name = _("FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE"),
        Element = 82, work_time_to_fail_probability = 0.8, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE_SEVERE, Failure_name = "FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE_SEVERE", Failure_editor_name = _("FAILURE_HYDRAULICS_1_EXTERNAL_LEAKAGE_SEVERE"),
        Element = 82, work_time_to_fail_probability = 0.7, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_1_INTERNAL_LEAKAGE, Failure_name = "FAILURE_HYDRAULICS_1_INTERNAL_LEAKAGE", Failure_editor_name = _("FAILURE_HYDRAULICS_1_INTERNAL_LEAKAGE"),
        Element = 82, work_time_to_fail_probability = 0.9, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_2_PUMP, Failure_name = "FAILURE_HYDRAULICS_2_PUMP", Failure_editor_name = _("FAILURE_HYDRAULICS_2_PUMP"),
        Element = 82, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_2_ACCU, Failure_name = "FAILURE_HYDRAULICS_2_ACCU", Failure_editor_name = _("FAILURE_HYDRAULICS_2_ACCU"),
        Element = 18, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE, Failure_name = "FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE", Failure_editor_name = _("FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE"),
        Element = 82, work_time_to_fail_probability = 0.8, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE_SEVERE, Failure_name = "FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE_SEVERE", Failure_editor_name = _("FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE_SEVERE"),
        Element = 82, work_time_to_fail_probability = 0.7, work_time_to_fail = 3600*300
    },
    {
        Failure = FAILURE_HYDRAULICS_2_INTERNAL_LEAKAGE, Failure_name = "FAILURE_HYDRAULICS_2_INTERNAL_LEAKAGE", Failure_editor_name = _("FAILURE_HYDRAULICS_2_EXTERNAL_LEAKAGE_SEVERE"),
        Element = 82, work_time_to_fail_probability = 0.9, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true -- close lua state after initialization
