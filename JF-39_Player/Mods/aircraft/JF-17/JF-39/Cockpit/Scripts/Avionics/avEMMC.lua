dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

overheat_time = 600.0
cooldown_time = 40.0


--------
-- 除 EMMC_FAILURE_EMMC 外, 均为外部设备状态
-- 故不应设置 Element, 此设备故障不应影响外部设备状态

EMMC_FAILURE_DADS = 0
EMMC_FAILURE_LANDING_GEAR = 1
EMMC_FAILURE_FUEL_LOW_LEVEL = 2
EMMC_FAILURE_FUEL_START_PUMP = 3
EMMC_FAILURE_FUEL_LOWER_PUMP = 4
EMMC_FAILURE_FUEL_UPPER_PUMP = 5
EMMC_FAILURE_CANOPY_UNLOCK = 6
EMMC_FAILURE_COCKPIT_PRESSURE_LOW = 7

EMMC_FAILURE_TRU = 8
EMMC_FAILURE_LWC = 9
EMMC_FAILURE_EMMC = 10
EMMC_FAILURE_PROBES_HEATING = 11
EMMC_FAILURE_STATIC_INVERTER = 12
EMMC_FAILURE_ECS_OFF = 13
EMMC_FAILURE_ELECT_EQUIP_HOT = 14

EMMC_FAILURE_SHARS = 15
EMMC_FAILURE_BAU = 16
EMMC_FAILURE_DADS_RPTU = 17
EMMC_FAILURE_DADS_LPTU = 18
EMMC_FAILURE_DADS_MPTU = 19

Damage = {
{
    Failure = EMMC_FAILURE_DADS,  Failure_name = "EMMC_FAILURE_DADS",  Failure_editor_name = _("EMMC_FAILURE_DADS"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_LANDING_GEAR,  Failure_name = "EMMC_FAILURE_LANDING_GEAR",  Failure_editor_name = _("EMMC_FAILURE_LANDING_GEAR"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_FUEL_LOW_LEVEL,  Failure_name = "EMMC_FAILURE_FUEL_LOW_LEVEL",  Failure_editor_name = _("EMMC_FAILURE_FUEL_LOW_LEVEL"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_FUEL_START_PUMP,  Failure_name = "EMMC_FAILURE_FUEL_START_PUMP",  Failure_editor_name = _("EMMC_FAILURE_FUEL_START_PUMP"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_FUEL_LOWER_PUMP,  Failure_name = "EMMC_FAILURE_FUEL_LOWER_PUMP",  Failure_editor_name = _("EMMC_FAILURE_FUEL_LOWER_PUMP"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_FUEL_UPPER_PUMP,  Failure_name = "EMMC_FAILURE_FUEL_UPPER_PUMP",  Failure_editor_name = _("EMMC_FAILURE_FUEL_UPPER_PUMP"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_CANOPY_UNLOCK,  Failure_name = "EMMC_FAILURE_CANOPY_UNLOCK",  Failure_editor_name = _("EMMC_FAILURE_CANOPY_UNLOCK"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_COCKPIT_PRESSURE_LOW,  Failure_name = "EMMC_FAILURE_COCKPIT_PRESSURE_LOW",  Failure_editor_name = _("EMMC_FAILURE_COCKPIT_PRESSURE_LOW"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_TRU,  Failure_name = "EMMC_FAILURE_TRU",  Failure_editor_name = _("EMMC_FAILURE_TRU"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_LWC,  Failure_name = "EMMC_FAILURE_LWC",  Failure_editor_name = _("EMMC_FAILURE_LWC"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_EMMC,  Failure_name = "EMMC_FAILURE_EMMC",  Failure_editor_name = _("EMMC_FAILURE_EMMC"),
    Element = damage_cells["BLADE_1_OUT"],     Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_PROBES_HEATING,  Failure_name = "EMMC_FAILURE_PROBES_HEATING",  Failure_editor_name = _("EMMC_FAILURE_PROBES_HEATING"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_STATIC_INVERTER,  Failure_name = "EMMC_FAILURE_STATIC_INVERTER",  Failure_editor_name = _("EMMC_FAILURE_STATIC_INVERTER"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_ECS_OFF,  Failure_name = "EMMC_FAILURE_ECS_OFF",  Failure_editor_name = _("EMMC_FAILURE_ECS_OFF"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_ELECT_EQUIP_HOT,  Failure_name = "EMMC_FAILURE_ELECT_EQUIP_HOT",  Failure_editor_name = _("EMMC_FAILURE_ELECT_EQUIP_HOT"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_SHARS,  Failure_name = "EMMC_FAILURE_SHARS",  Failure_editor_name = _("EMMC_FAILURE_SHARS"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_BAU,  Failure_name = "EMMC_FAILURE_BAU",  Failure_editor_name = _("EMMC_FAILURE_BAU"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DADS_RPTU,  Failure_name = "EMMC_FAILURE_DADS_RPTU",  Failure_editor_name = _("EMMC_FAILURE_DADS_RPTU"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DADS_LPTU,  Failure_name = "EMMC_FAILURE_DADS_LPTU",  Failure_editor_name = _("EMMC_FAILURE_DADS_LPTU"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = EMMC_FAILURE_DADS_MPTU,  Failure_name = "EMMC_FAILURE_DADS_MPTU",  Failure_editor_name = _("EMMC_FAILURE_DADS_MPTU"),
    Element = 1000,   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
}

need_to_be_closed = true -- close lua state after initialization
