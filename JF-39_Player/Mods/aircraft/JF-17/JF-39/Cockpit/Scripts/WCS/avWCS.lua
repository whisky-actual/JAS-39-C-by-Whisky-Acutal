dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- render_debug_info = true

dtime = 1.0 / 32

c802ak_cruise_low  = 100.0
c802ak_cruise_med  = 2000.0
c802ak_cruise_high = 4000.0

jsow_jdam_range_type = 0
laser_aim_type       = 0

MWMMC_FAILURE     = 0
MWMMC_FAILURE_CPU = 1
MWMMC_FAILURE_IOC = 2
MWMMC_FAILURE_MBI = 3
MWMMC_FAILURE_AVI = 4
MWMMC_FAILURE_DMP = 5
MWMMC_FAILURE_PS  = 6

MWMMC_FAILURE_1553B_EMMC  = 7
MWMMC_FAILURE_1553B_FCS   = 8
MWMMC_FAILURE_1553B_IFF   = 9
MWMMC_FAILURE_1553B_ILS   = 10
MWMMC_FAILURE_1553B_INS   = 11
MWMMC_FAILURE_1553B_LMFCD = 12
MWMMC_FAILURE_1553B_CMFCD = 13
MWMMC_FAILURE_1553B_RMFCD = 14
MWMMC_FAILURE_1553B_RDR   = 15
MWMMC_FAILURE_1553B_OESP  = 16
MWMMC_FAILURE_1553B_RALT  = 17
MWMMC_FAILURE_1553B_RWR   = 18
MWMMC_FAILURE_1553B_SAIU  = 19
MWMMC_FAILURE_1553B_HUD   = 20
MWMMC_FAILURE_1553B_SPJ   = 21
MWMMC_FAILURE_1553B_TACAN = 22


SWMMC_FAILURE     = 23
SWMMC_FAILURE_CPU = 24
SWMMC_FAILURE_IOC = 25
SWMMC_FAILURE_MBI = 26
SWMMC_FAILURE_AVI = 27
SWMMC_FAILURE_DMP = 28
SWMMC_FAILURE_PS  = 29

SWMMC_FAILURE_CTVS  = 30
SWMMC_FAILURE_HUD   = 31
SWMMC_FAILURE_LMFCD = 32
SWMMC_FAILURE_CMFCD = 33
SWMMC_FAILURE_RMFCD = 34

-- 以下暂时放在SMMC处理
SWMMC_AAP_NO_RS422_COMM = 35
SWMMC_FAILURE_AAP       = 36
SWMMC_DVR_NO_RS422_COMM = 37
SWMMC_FAILURE_DVR       = 38
SWMMC_CSU_NO_RS422_COMM = 39
SWMMC_FAILURE_CSU       = 40

Damage = {
{
    Failure = MWMMC_FAILURE,  Failure_name = "MWMMC_FAILURE",  Failure_editor_name = _("MWMMC_FAILURE"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_CPU,  Failure_name = "MWMMC_FAILURE_CPU",  Failure_editor_name = _("MWMMC_FAILURE_CPU"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_IOC,  Failure_name = "MWMMC_FAILURE_IOC",  Failure_editor_name = _("MWMMC_FAILURE_IOC"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_MBI,  Failure_name = "MWMMC_FAILURE_MBI",  Failure_editor_name = _("MWMMC_FAILURE_MBI"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_AVI,  Failure_name = "MWMMC_FAILURE_AVI",  Failure_editor_name = _("MWMMC_FAILURE_AVI"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_DMP,  Failure_name = "MWMMC_FAILURE_DMP",  Failure_editor_name = _("MWMMC_FAILURE_DMP"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_PS,  Failure_name = "MWMMC_FAILURE_PS",  Failure_editor_name = _("MWMMC_FAILURE_PS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_EMMC,  Failure_name = "MWMMC_FAILURE_1553B_EMMC",  Failure_editor_name = _("MWMMC_FAILURE_1553B_EMMC"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_FCS,  Failure_name = "MWMMC_FAILURE_1553B_FCS",  Failure_editor_name = _("MWMMC_FAILURE_1553B_FCS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_IFF,  Failure_name = "MWMMC_FAILURE_1553B_IFF",  Failure_editor_name = _("MWMMC_FAILURE_1553B_IFF"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_ILS,  Failure_name = "MWMMC_FAILURE_1553B_ILS",  Failure_editor_name = _("MWMMC_FAILURE_1553B_ILS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_INS,  Failure_name = "MWMMC_FAILURE_1553B_INS",  Failure_editor_name = _("MWMMC_FAILURE_1553B_INS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_LMFCD,  Failure_name = "MWMMC_FAILURE_1553B_LMFCD",  Failure_editor_name = _("MWMMC_FAILURE_1553B_LMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_CMFCD,  Failure_name = "MWMMC_FAILURE_1553B_CMFCD",  Failure_editor_name = _("MWMMC_FAILURE_1553B_CMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_RMFCD,  Failure_name = "MWMMC_FAILURE_1553B_RMFCD",  Failure_editor_name = _("MWMMC_FAILURE_1553B_RMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_RDR,  Failure_name = "MWMMC_FAILURE_1553B_RDR",  Failure_editor_name = _("MWMMC_FAILURE_1553B_RDR"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_OESP,  Failure_name = "MWMMC_FAILURE_1553B_OESP",  Failure_editor_name = _("MWMMC_FAILURE_1553B_OESP"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_RALT,  Failure_name = "MWMMC_FAILURE_1553B_RALT",  Failure_editor_name = _("MWMMC_FAILURE_1553B_RALT"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_RWR,  Failure_name = "MWMMC_FAILURE_1553B_RWR",  Failure_editor_name = _("MWMMC_FAILURE_1553B_RWR"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_SAIU,  Failure_name = "MWMMC_FAILURE_1553B_SAIU",  Failure_editor_name = _("MWMMC_FAILURE_1553B_SAIU"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_HUD,  Failure_name = "MWMMC_FAILURE_1553B_HUD",  Failure_editor_name = _("MWMMC_FAILURE_1553B_HUD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_SPJ,  Failure_name = "MWMMC_FAILURE_1553B_SPJ",  Failure_editor_name = _("MWMMC_FAILURE_1553B_SPJ"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = MWMMC_FAILURE_1553B_TACAN,  Failure_name = "MWMMC_FAILURE_1553B_TACAN",  Failure_editor_name = _("MWMMC_FAILURE_1553B_TACAN"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},

{
    Failure = SWMMC_FAILURE,  Failure_name = "SWMMC_FAILURE",  Failure_editor_name = _("SWMMC_FAILURE"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_CPU,  Failure_name = "SWMMC_FAILURE_CPU",  Failure_editor_name = _("SWMMC_FAILURE_CPU"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_IOC,  Failure_name = "SWMMC_FAILURE_IOC",  Failure_editor_name = _("SWMMC_FAILURE_IOC"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_MBI,  Failure_name = "SWMMC_FAILURE_MBI",  Failure_editor_name = _("SWMMC_FAILURE_MBI"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_AVI,  Failure_name = "SWMMC_FAILURE_AVI",  Failure_editor_name = _("SWMMC_FAILURE_AVI"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_DMP,  Failure_name = "SWMMC_FAILURE_DMP",  Failure_editor_name = _("SWMMC_FAILURE_DMP"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_PS,  Failure_name = "SWMMC_FAILURE_PS",  Failure_editor_name = _("SWMMC_FAILURE_PS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_CTVS,  Failure_name = "SWMMC_FAILURE_CTVS",  Failure_editor_name = _("SWMMC_FAILURE_CTVS"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_HUD,  Failure_name = "SWMMC_FAILURE_HUD",  Failure_editor_name = _("SWMMC_FAILURE_HUD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_LMFCD,  Failure_name = "SWMMC_FAILURE_LMFCD",  Failure_editor_name = _("SWMMC_FAILURE_LMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_CMFCD,  Failure_name = "SWMMC_FAILURE_CMFCD",  Failure_editor_name = _("SWMMC_FAILURE_CMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_RMFCD,  Failure_name = "SWMMC_FAILURE_RMFCD",  Failure_editor_name = _("SWMMC_FAILURE_RMFCD"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_AAP_NO_RS422_COMM,  Failure_name = "SWMMC_AAP_NO_RS422_COMM",  Failure_editor_name = _("SWMMC_AAP_NO_RS422_COMM"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_AAP,  Failure_name = "SWMMC_FAILURE_AAP",  Failure_editor_name = _("SWMMC_FAILURE_AAP"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_DVR_NO_RS422_COMM,  Failure_name = "SWMMC_DVR_NO_RS422_COMM",  Failure_editor_name = _("SWMMC_DVR_NO_RS422_COMM"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_DVR,  Failure_name = "SWMMC_FAILURE_DVR",  Failure_editor_name = _("SWMMC_FAILURE_DVR"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_CSU_NO_RS422_COMM,  Failure_name = "SWMMC_CSU_NO_RS422_COMM",  Failure_editor_name = _("SWMMC_CSU_NO_RS422_COMM"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},
{
    Failure = SWMMC_FAILURE_CSU,  Failure_name = "SWMMC_FAILURE_CSU",  Failure_editor_name = _("SWMMC_FAILURE_CSU"),
    Element = damage_cells["FIN_R_TOP"],   Integrity_Treshold = 0.5, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300
},

}

need_to_be_closed = true
