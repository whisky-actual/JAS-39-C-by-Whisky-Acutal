dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- render_debug_info = true

dtime = 1.0 / 32

overheat_time = 450.0
cooldown_time = 40.0

default_range  = 40000.0

performance = {
    scan_speed = math.rad(60.0),
    beam_width = math.rad(3.0),
    track_azimuth_limits         = {-math.rad(60.0), math.rad(60.0)},
    track_elevation_limits       = {-math.rad(60.0), math.rad(60.0)},
    roll_compensation_limits     = {-math.rad(60.0), math.rad(60.0)},
    pitch_compensation_limits    = {-math.rad(60.0), math.rad(60.0)},
    distance_limits              = {10.0, 512000.0},
    ground_clutter = {
        sea          = {0.0, 0.0, 0.0},
        land         = {0.0, 0.0, 0.0},
        artificial   = {0.0, 0.0, 0.0},
        max_distance = 10000.0,
        rays_density = 0.5,
    },
}

INCT = {
    RWS = {
        az_limits = {-math.rad(60.0), math.rad(60.0)},
        el_limits = {-math.rad(30.0), math.rad(30.0)},
        bar_selection  = {1,2,4},
        az_selection   = {math.rad(10.0), math.rad(30.0), math.rad(60.0)},
        prf_selection  = {0, 1, 2},
        contact_history_selection = {1,2,4},
        range_selection = {10000.0, 40000.0, 80000.0,160000.0},
        default_range = 40000.0,
    }
}

AG = {
    resolution   = 0.0,
    focus_factor = -0.05,
    factor_exp   = 4.0,
    factor_dbs1  = 8.0,
    factor_dbs2  = 32.0,
	ag_gain      = 8.0,
}


------
RDR_FAILURE_ARRAY = 0
RDR_FAILURE_PEDESTAL = 1
RDR_FAILURE_SERVOLOOP = 2
RDR_FAILURE_RX_FRONT_END = 3
RDR_FAILURE_RECEIVER = 4
RDR_FAILURE_TRANSMITTER = 5
RDR_FAILURE_PROCESSOR = 6
RDR_FAILURE_ANTENNA_DEGRATION = 7
RDR_FAILURE_RX_FRONT_END_DEGRATION = 8
RDR_FAILURE_RECEIVER_DEGRATION = 9
RDR_FAILURE_TRANSMITTER_DEGRATION = 10
RDR_FAILURE_PROCESSOR_DEGRATION = 11
RDR_FAILURE_TRANSMITTER_OVERHEAT =12
RDR_FAILURE_PROCESSOR_OVERHEAT =13
RDR_FAILURE_SERVO_OVERHEAT = 14
RDR_FAILURE_PREESURIZATION = 15
RDR_FAILURE_DEGRATED_PERFORMANCE = 16

Damage = {
-- RDR_FAILURE_ARRAY
{
    Failure = RDR_FAILURE_ARRAY,  Failure_name = "RDR_FAILURE_ARRAY",  Failure_editor_name = _("RDR_FAILURE_ARRAY"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_ARRAY,  Failure_name = "RDR_FAILURE_ARRAY",  Failure_editor_name = _("RDR_FAILURE_ARRAY"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_ARRAY,  Failure_name = "RDR_FAILURE_ARRAY",  Failure_editor_name = _("RDR_FAILURE_ARRAY"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_PEDESTAL
{
    Failure = RDR_FAILURE_PEDESTAL,  Failure_name = "RDR_FAILURE_PEDESTAL",  Failure_editor_name = _("RDR_FAILURE_PEDESTAL"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PEDESTAL,  Failure_name = "RDR_FAILURE_PEDESTAL",  Failure_editor_name = _("RDR_FAILURE_PEDESTAL"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PEDESTAL,  Failure_name = "RDR_FAILURE_PEDESTAL",  Failure_editor_name = _("RDR_FAILURE_PEDESTAL"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_SERVOLOOP
{
    Failure = RDR_FAILURE_SERVOLOOP,  Failure_name = "RDR_FAILURE_SERVOLOOP",  Failure_editor_name = _("RDR_FAILURE_SERVOLOOP"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_SERVOLOOP,  Failure_name = "RDR_FAILURE_SERVOLOOP",  Failure_editor_name = _("RDR_FAILURE_SERVOLOOP"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_SERVOLOOP,  Failure_name = "RDR_FAILURE_SERVOLOOP",  Failure_editor_name = _("RDR_FAILURE_SERVOLOOP"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_RX_FRONT_END
{
    Failure = RDR_FAILURE_RX_FRONT_END,  Failure_name = "RDR_FAILURE_RX_FRONT_END",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RX_FRONT_END,  Failure_name = "RDR_FAILURE_RX_FRONT_END",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RX_FRONT_END,  Failure_name = "RDR_FAILURE_RX_FRONT_END",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_RECEIVER
{
    Failure = RDR_FAILURE_RECEIVER,  Failure_name = "RDR_FAILURE_RECEIVER",  Failure_editor_name = _("RDR_FAILURE_RECEIVER"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RECEIVER,  Failure_name = "RDR_FAILURE_RECEIVER",  Failure_editor_name = _("RDR_FAILURE_RECEIVER"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RECEIVER,  Failure_name = "RDR_FAILURE_RECEIVER",  Failure_editor_name = _("RDR_FAILURE_RECEIVER"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_TRANSMITTER
{
    Failure = RDR_FAILURE_TRANSMITTER,  Failure_name = "RDR_FAILURE_TRANSMITTER",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_TRANSMITTER,  Failure_name = "RDR_FAILURE_TRANSMITTER",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_TRANSMITTER,  Failure_name = "RDR_FAILURE_TRANSMITTER",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_PROCESSOR
{
    Failure = RDR_FAILURE_PROCESSOR,  Failure_name = "RDR_FAILURE_PROCESSOR",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.1, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PROCESSOR,  Failure_name = "RDR_FAILURE_PROCESSOR",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.1, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PROCESSOR,  Failure_name = "RDR_FAILURE_PROCESSOR",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_PROCESSOR_DEGRATION
{
    Failure = RDR_FAILURE_PROCESSOR_DEGRATION,  Failure_name = "RDR_FAILURE_PROCESSOR_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR_DEGRATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PROCESSOR_DEGRATION,  Failure_name = "RDR_FAILURE_PROCESSOR_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR_DEGRATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PROCESSOR_DEGRATION,  Failure_name = "RDR_FAILURE_PROCESSOR_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR_DEGRATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_ANTENNA_DEGRATION
{
    Failure = RDR_FAILURE_ANTENNA_DEGRATION,  Failure_name = "RDR_FAILURE_ANTENNA_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_ANTENNA_DEGRATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_ANTENNA_DEGRATION,  Failure_name = "RDR_FAILURE_ANTENNA_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_ANTENNA_DEGRATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_ANTENNA_DEGRATION,  Failure_name = "RDR_FAILURE_ANTENNA_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_ANTENNA_DEGRATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.3, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_RX_FRONT_END_DEGRATION
{
    Failure = RDR_FAILURE_RX_FRONT_END_DEGRATION,  Failure_name = "RDR_FAILURE_RX_FRONT_END_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END_DEGRATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RX_FRONT_END_DEGRATION,  Failure_name = "RDR_FAILURE_RX_FRONT_END_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END_DEGRATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RX_FRONT_END_DEGRATION,  Failure_name = "RDR_FAILURE_RX_FRONT_END_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RX_FRONT_END_DEGRATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_RECEIVER_DEGRATION
{
    Failure = RDR_FAILURE_RECEIVER_DEGRATION,  Failure_name = "RDR_FAILURE_RECEIVER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RECEIVER_DEGRATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RECEIVER_DEGRATION,  Failure_name = "RDR_FAILURE_RECEIVER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RECEIVER_DEGRATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_RECEIVER_DEGRATION,  Failure_name = "RDR_FAILURE_RECEIVER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_RECEIVER_DEGRATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_TRANSMITTER_DEGRATION
{
    Failure = RDR_FAILURE_TRANSMITTER_DEGRATION,  Failure_name = "RDR_FAILURE_TRANSMITTER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER_DEGRATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_TRANSMITTER_DEGRATION,  Failure_name = "RDR_FAILURE_TRANSMITTER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER_DEGRATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_TRANSMITTER_DEGRATION,  Failure_name = "RDR_FAILURE_TRANSMITTER_DEGRATION",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER_DEGRATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},

--[[
-- 过热由环控控制
{
    Failure = RDR_FAILURE_TRANSMITTER_OVERHEAT,  Failure_name = "RDR_FAILURE_TRANSMITTER_OVERHEAT",  Failure_editor_name = _("RDR_FAILURE_TRANSMITTER_OVERHEAT"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PROCESSOR_OVERHEAT,  Failure_name = "RDR_FAILURE_PROCESSOR_OVERHEAT",  Failure_editor_name = _("RDR_FAILURE_PROCESSOR_OVERHEAT"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_SERVO_OVERHEAT,  Failure_name = "RDR_FAILURE_SERVO_OVERHEAT",  Failure_editor_name = _("RDR_FAILURE_SERVO_OVERHEAT"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
]]

-- RDR_FAILURE_PREESURIZATION
{
    Failure = RDR_FAILURE_PREESURIZATION,  Failure_name = "RDR_FAILURE_PREESURIZATION",  Failure_editor_name = _("RDR_FAILURE_PREESURIZATION"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PREESURIZATION,  Failure_name = "RDR_FAILURE_PREESURIZATION",  Failure_editor_name = _("RDR_FAILURE_PREESURIZATION"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_PREESURIZATION,  Failure_name = "RDR_FAILURE_PREESURIZATION",  Failure_editor_name = _("RDR_FAILURE_PREESURIZATION"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.6, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
-- RDR_FAILURE_DEGRATED_PERFORMANCE
{
    Failure = RDR_FAILURE_DEGRATED_PERFORMANCE,  Failure_name = "RDR_FAILURE_DEGRATED_PERFORMANCE",  Failure_editor_name = _("RDR_FAILURE_DEGRATED_PERFORMANCE"),
    Element = damage_cells["FRONT"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_DEGRATED_PERFORMANCE,  Failure_name = "RDR_FAILURE_DEGRATED_PERFORMANCE",  Failure_editor_name = _("RDR_FAILURE_DEGRATED_PERFORMANCE"),
    Element = damage_cells["NOSE_LEFT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RDR_FAILURE_DEGRATED_PERFORMANCE,  Failure_name = "RDR_FAILURE_DEGRATED_PERFORMANCE",  Failure_editor_name = _("RDR_FAILURE_DEGRATED_PERFORMANCE"),
    Element = damage_cells["NOSE_RIGHT_SIDE"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
}

need_to_be_closed = true -- close lua state after initialization
