dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

dtime = 0.25

EMMC_FAILURE_BATTERY_DC1 = 0
EMMC_FAILURE_BATTERY_DC2 = 1
EMMC_FAILURE_BATTERY_FCS1 = 2
EMMC_FAILURE_BATTERY_FCS2 = 3
EMMC_FAILURE_DC_GENERATOR_VOLTAGE_LOW = 4
EMMC_FAILURE_DC_GENERATOR_VOLTAGE_HIGH = 5
EMMC_FAILURE_DC_GENERATOR = 6
EMMC_FAILURE_DC_GENERATOR_CONTROLLER = 7
EMMC_FAILURE_DC_GENERATOR_SUBSYSTEM = 8
EMMC_FAILURE_AC_GENERATOR_FEED_LINE = 9
EMMC_FAILURE_AC_GENERATOR_CONTROLLER = 10
EMMC_FAILURE_AC_GENERATOR = 11
EMMC_FAILURE_AC_GENERATOR_SUBSYSTEM = 12
EMMC_FAILURE_TRU_AC2DC28V = 13
EMMC_FAILURE_SCU_AC2AC36V = 14
EMMC_FAILURE_SCU_DC2AC36V = 15
EMMC_FAILURE_SCU_DC2AC115V = 16
EMMC_FAILURE_AC_GROUND = 17

Damage = {
{
    Failure = EMMC_FAILURE_BATTERY_DC1,               Failure_name = "EMMC_FAILURE_BATTERY_DC1",               Failure_editor_name = _("EMMC_FAILURE_BATTERY_DC1"),
    Element = damage_cells["CABIN_BOTTOM"],    Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_BATTERY_DC2,               Failure_name = "EMMC_FAILURE_BATTERY_DC2",               Failure_editor_name = _("EMMC_FAILURE_BATTERY_DC2"),
    Element = damage_cells["CABIN_BOTTOM"],    Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_BATTERY_FCS1,              Failure_name = "EMMC_FAILURE_BATTERY_FCS1",              Failure_editor_name = _("EMMC_FAILURE_BATTERY_FCS1"),
    Element = damage_cells["BLADE_1_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_BATTERY_FCS2,              Failure_name = "EMMC_FAILURE_BATTERY_FCS2",              Failure_editor_name = _("EMMC_FAILURE_BATTERY_FCS2"),
    Element = damage_cells["BLADE_1_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DC_GENERATOR_VOLTAGE_LOW,  Failure_name = "EMMC_FAILURE_DC_GENERATOR_VOLTAGE_LOW",  Failure_editor_name = _("EMMC_FAILURE_DC_GENERATOR_VOLTAGE_LOW"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DC_GENERATOR_VOLTAGE_HIGH, Failure_name = "EMMC_FAILURE_DC_GENERATOR_VOLTAGE_HIGH", Failure_editor_name = _("EMMC_FAILURE_DC_GENERATOR_VOLTAGE_HIGH"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DC_GENERATOR,              Failure_name = "EMMC_FAILURE_DC_GENERATOR",              Failure_editor_name = _("EMMC_FAILURE_DC_GENERATOR"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DC_GENERATOR_CONTROLLER,   Failure_name = "EMMC_FAILURE_DC_GENERATOR_CONTROLLER",   Failure_editor_name = _("EMMC_FAILURE_DC_GENERATOR_CONTROLLER"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DC_GENERATOR_SUBSYSTEM,    Failure_name = "EMMC_FAILURE_DC_GENERATOR_SUBSYSTEM",    Failure_editor_name = _("EMMC_FAILURE_DC_GENERATOR_SUBSYSTEM"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_AC_GENERATOR_FEED_LINE,    Failure_name = "EMMC_FAILURE_AC_GENERATOR_FEED_LINE",    Failure_editor_name = _("EMMC_FAILURE_AC_GENERATOR_FEED_LINE"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_AC_GENERATOR_CONTROLLER,   Failure_name = "EMMC_FAILURE_AC_GENERATOR_CONTROLLER",   Failure_editor_name = _("EMMC_FAILURE_AC_GENERATOR_CONTROLLER"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_AC_GENERATOR,              Failure_name = "EMMC_FAILURE_AC_GENERATOR",              Failure_editor_name = _("EMMC_FAILURE_AC_GENERATOR"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_AC_GENERATOR_SUBSYSTEM,    Failure_name = "EMMC_FAILURE_AC_GENERATOR_SUBSYSTEM",    Failure_editor_name = _("EMMC_FAILURE_AC_GENERATOR_SUBSYSTEM"),
    Element = damage_cells["MAIN"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_TRU_AC2DC28V,              Failure_name = "EMMC_FAILURE_TRU_AC2DC28V",              Failure_editor_name = _("EMMC_FAILURE_TRU_AC2DC28V"),
    Element = damage_cells["BLADE_2_IN"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_SCU_AC2AC36V,              Failure_name = "EMMC_FAILURE_SCU_AC2AC36V",              Failure_editor_name = _("EMMC_FAILURE_SCU_AC2AC36V"),
    Element = damage_cells["BLADE_2_IN"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_SCU_DC2AC36V,              Failure_name = "EMMC_FAILURE_SCU_DC2AC36V",              Failure_editor_name = _("EMMC_FAILURE_SCU_DC2AC36V"),
    Element = damage_cells["BLADE_2_IN"],   Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_SCU_DC2AC115V,             Failure_name = "EMMC_FAILURE_SCU_DC2AC115V",             Failure_editor_name = _("EMMC_FAILURE_SCU_DC2AC115V"),
    Element = damage_cells["BLADE_2_IN"],   Integrity_Treshold = 0.4, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_AC_GROUND,                 Failure_name = "EMMC_FAILURE_AC_GROUND",                 Failure_editor_name = _("EMMC_FAILURE_AC_GROUND"),
    Element = damage_cells["BLADE_2_OUT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},

}

need_to_be_closed = true -- close lua state after initialization
