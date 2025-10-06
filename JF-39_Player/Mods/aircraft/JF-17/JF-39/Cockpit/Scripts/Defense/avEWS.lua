dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 0.25
max_num_contact = 20

bit_timer = 45.0

range_error_init = 0.5
range_error_duration = 10.0

-- debug_eye = true

eyes ={}
eyes[1] = {
    position      = {x = -3.971, y = 3.103, z =  0.05},
    orientation   = {azimuth = math.rad(45), elevation = 0},
    field_of_view = math.rad(120) 
}
eyes[2] = {
    position      = {x = -3.971, y = 3.103, z = -0.05},
    orientation   = {azimuth = math.rad(-45), elevation = 0},
    field_of_view = math.rad(120) 
}
eyes[3] = {
    position      = {x = -4.811, y = 3.103, z =  0.05},
    orientation   = {azimuth = math.rad(135), elevation = 0},
    field_of_view = math.rad(120) 
}
eyes[4] = {
    position      = {x = -4.811, y = 3.103, z = -0.05},
    orientation   = {azimuth = math.rad(-135), elevation = 0},
    field_of_view = math.rad(120) 
}

MaxThreats = 64
EmitterLiveTime = 8
RWR_detection_ceoff = 0.95


-- customized rwr symbol
sfile = LockOn_Options.script_path.."/../../Doc/customerRWR.lua"
fattr = lfs.attributes(sfile)
found_file = false
if fattr and fattr.mode == 'file' then
    found_file = true
else
    sfile = LockOn_Options.script_path.."/Defense/customerRWR.lua"
    fattr = lfs.attributes(sfile)
    if fattr and fattr.mode == 'file' then
        found_file = true
    end
end
if found_file == true then
    local func, err = loadfile(sfile)
    if func then
        func()
    else
        print("ERROR loadfile: ", err, sfile)
    end
end


-- 损毁定义
RWR_FAILURE_ANTENNA_FRONT_RIGHT = 0
RWR_FAILURE_ANTENNA_FRONT_LEFT = 1
RWR_FAILURE_ANTENNA_REAR_RIGHT = 2
RWR_FAILURE_ANTENNA_REAR_LEFT = 3

-- classified
RWR_FAILURE_RECEIVER_XX1 = 4
RWR_FAILURE_RECEIVER_XX2 = 5
RWR_FAILURE_RECEIVER_XX3 = 6
--

RWR_FAILURE_DB_NOT_LOADED = 7
RWR_FAILURE_COMPUTER = 8

Damage = {
{
    Failure = RWR_FAILURE_ANTENNA_FRONT_LEFT,  Failure_name = "RWR_FAILURE_ANTENNA_FRONT_LEFT",  Failure_editor_name = _("RWR_FAILURE_ANTENNA_FRONT_LEFT"), 
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_ANTENNA_REAR_LEFT,   Failure_name = "RWR_FAILURE_ANTENNA_REAR_LEFT",   Failure_editor_name = _("RWR_FAILURE_ANTENNA_REAR_LEFT"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_ANTENNA_FRONT_RIGHT, Failure_name = "RWR_FAILURE_ANTENNA_FRONT_RIGHT", Failure_editor_name = _("RWR_FAILURE_ANTENNA_FRONT_RIGHT"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_ANTENNA_REAR_RIGHT,  Failure_name = "RWR_FAILURE_ANTENNA_REAR_RIGHT",  Failure_editor_name = _("RWR_FAILURE_ANTENNA_REAR_RIGHT"), 
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_RECEIVER_XX1,        Failure_name = "RWR_FAILURE_RECEIVER_XX1",        Failure_editor_name = _("RWR_FAILURE_RECEIVER_XX1"), 
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_RECEIVER_XX2,        Failure_name = "RWR_FAILURE_RECEIVER_XX2",        Failure_editor_name = _("RWR_FAILURE_RECEIVER_XX2"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_RECEIVER_XX3,        Failure_name = "RWR_FAILURE_RECEIVER_XX3",        Failure_editor_name = _("RWR_FAILURE_RECEIVER_XX3"), 
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_DB_NOT_LOADED,       Failure_name = "RWR_FAILURE_DB_NOT_LOADED",       Failure_editor_name = _("RWR_FAILURE_DB_NOT_LOADED"), 
    Element = 1000, Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.05, work_time_to_fail = 3600*300
},
{
    Failure = RWR_FAILURE_COMPUTER,            Failure_name = "RWR_FAILURE_COMPUTER",            Failure_editor_name = _("RWR_FAILURE_COMPUTER"), 
    Element = 1000, Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},

}

need_to_be_closed = true
