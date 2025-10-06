dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

starter_fire_scale = 0.2
starter_fire_time  = 2.0
starter_smk_scale  = 0.7
starter_smk_time   = 2.0

starter_fire_pnt   = {-1.295, -0.579, -0.333}
starter_fire_rot   = {0.0, -60.0, -90.0}
starter_smk_pnt    = {-1.295, -1.475, -1.375}

nozzle_flame_type  = 0
nozzle_flame_delay = 10.0
nozzle_flame_time  = 10.0
nozzle_flame_scale = 1.0
nozzle_flame_pnt   = {-3.20, 0.18, 0.00}

surge_flame_duration  = 0.3
surge_flame_scale = 0.8
surge_flame_pnt   = {-15.5, 0.17539, 0.00}

eyes ={}
eyes[1] = {
    position      = {x = 2.932, y = -0.251, z =  0.602},
    orientation   = {azimuth = math.rad(3.0), elevation = 0},
    field_of_view = math.rad(20.0),
}
eyes[2] = {
    position      = {x = 2.932, y = -0.251, z = -0.602},
    orientation   = {azimuth = math.rad(-3.0), elevation = 0},
    field_of_view = math.rad(20.0),
}
surge_max_detect_distance = 15.0


-- failures
ENGINE_FAILURE_AB_IGNITION_UNIT = 0
ENGINE_FAILURE_APD88_STARTER = 1
ENGINE_FAILURE_N1_COMPRESSOR = 2
ENGINE_FAILURE_N2_COMPRESSOR = 3
ENGINE_FAILURE_N1_TURBINE = 4
ENGINE_FAILURE_N2_TURBINE = 5
ENGINE_FAILURE_COMBUSTOR = 6
ENGINE_FAILURE_NOZZLE_CONTROLLER = 7
ENGINE_FAILURE_DEEC = 8

Damage = {
    { Failure = ENGINE_FAILURE_AB_IGNITION_UNIT, Failure_name = "ENGINE_FAILURE_AB_IGNITION_UNIT", Failure_editor_name = _("ENGINE_FAILURE_AB_IGNITION_UNIT"), Element = damage_cells["ENGINE"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = ENGINE_FAILURE_APD88_STARTER,    Failure_name = "ENGINE_FAILURE_APD88_STARTER",    Failure_editor_name = _("ENGINE_FAILURE_APD88_STARTER"), Element = damage_cells["FUSELAGE_LEFT_SIDE"], Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    
    { Failure = ENGINE_FAILURE_N1_COMPRESSOR, Failure_name = "ENGINE_FAILURE_N1_COMPRESSOR", Failure_editor_name = _("ENGINE_FAILURE_N1_COMPRESSOR"), Element = damage_cells["FUSELAGE_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = ENGINE_FAILURE_N2_COMPRESSOR, Failure_name = "ENGINE_FAILURE_N2_COMPRESSOR", Failure_editor_name = _("ENGINE_FAILURE_N2_COMPRESSOR"), Element = damage_cells["FUSELAGE_RIGHT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    
    { Failure = ENGINE_FAILURE_N1_TURBINE, Failure_name = "ENGINE_FAILURE_N1_TURBINE", Failure_editor_name = _("ENGINE_FAILURE_N1_TURBINE"), Element = damage_cells["MTG_L_BOTTOM"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = ENGINE_FAILURE_N2_TURBINE, Failure_name = "ENGINE_FAILURE_N2_TURBINE", Failure_editor_name = _("ENGINE_FAILURE_N2_TURBINE"), Element = damage_cells["MTG_R_BOTTOM"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = ENGINE_FAILURE_COMBUSTOR,  Failure_name = "ENGINE_FAILURE_COMBUSTOR", Failure_editor_name = _("ENGINE_FAILURE_COMBUSTOR"), Element = damage_cells["MTG_L"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    
    { Failure = ENGINE_FAILURE_NOZZLE_CONTROLLER, Failure_name = "ENGINE_FAILURE_NOZZLE_CONTROLLER", Failure_editor_name = _("ENGINE_FAILURE_NOZZLE_CONTROLLER"), Element = damage_cells["FUEL_TANK_RIGHT_SIDE"], Integrity_Treshold = 0.85, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = ENGINE_FAILURE_DEEC, Failure_name = "ENGINE_FAILURE_DEEC", Failure_editor_name = _("ENGINE_FAILURE_DEEC"), Element = damage_cells["FUSELAGE_RIGHT_SIDE"], Integrity_Treshold = 0.85, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
}

need_to_be_closed = true