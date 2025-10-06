dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")


local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

dtime = 0.1

overheat_time = 600.0
cooldown_time = 20.0

need_to_be_closed = true


-- failures
FCS_FAILURE_COMP_1 = 0
FCS_FAILURE_COMP_2 = 1
FCS_FAILURE_COMP_3 = 2
FCS_FAILURE_COMP_4 = 3

FCS_FAILURE_L_ELEVATOR_ELEC_A = 4
FCS_FAILURE_L_ELEVATOR_ELEC_B = 5
FCS_FAILURE_L_ELEVATOR_ELEC_C = 6
FCS_FAILURE_L_ELEVATOR_ELEC_D = 7

FCS_FAILURE_R_ELEVATOR_ELEC_A = 8
FCS_FAILURE_R_ELEVATOR_ELEC_B = 9
FCS_FAILURE_R_ELEVATOR_ELEC_C = 10
FCS_FAILURE_R_ELEVATOR_ELEC_D = 11

FCS_FAILURE_L_ELEVATOR_HYD_1 = 12
FCS_FAILURE_L_ELEVATOR_HYD_2 = 13

FCS_FAILURE_R_ELEVATOR_HYD_1 = 14
FCS_FAILURE_R_ELEVATOR_HYD_2 = 15

FCS_FAILURE_ROLL_ELEC_SERVO_1 = 16
FCS_FAILURE_ROLL_ELEC_SERVO_2 = 17

FCS_FAILURE_YAW_ELEC_SERVO_1 = 18
FCS_FAILURE_YAW_ELEC_SERVO_2 = 19

FCS_FAILURE_PITCH_RATE_GYRO_1 = 20
FCS_FAILURE_PITCH_RATE_GYRO_2 = 21
FCS_FAILURE_PITCH_RATE_GYRO_3 = 22
FCS_FAILURE_PITCH_RATE_GYRO_4 = 23

FCS_FAILURE_ROLL_RATE_GYRO_1 = 24
FCS_FAILURE_ROLL_RATE_GYRO_2 = 25

FCS_FAILURE_YAW_RATE_GYRO_1 = 26
FCS_FAILURE_YAW_RATE_GYRO_2 = 27

FCS_FAILURE_NZ_SENSOR_1 = 28
FCS_FAILURE_NZ_SENSOR_2 = 29
FCS_FAILURE_NZ_SENSOR_3 = 30
FCS_FAILURE_NZ_SENSOR_4 = 31

FCS_FAILURE_NY_SENSOR_1 = 32
FCS_FAILURE_NY_SENSOR_2 = 33

FCS_FAILURE_PITCH_LVDT_1 = 34
FCS_FAILURE_PITCH_LVDT_2 = 35
FCS_FAILURE_PITCH_LVDT_3 = 36
FCS_FAILURE_PITCH_LVDT_4 = 37

FCS_FAILURE_ROLL_LVDT_1 = 38
FCS_FAILURE_ROLL_LVDT_2 = 39

FCS_FAILURE_YAW_LVDT_1 = 40
FCS_FAILURE_YAW_LVDT_2 = 41

FCS_FAILURE_AOA_SENSOR_1 = 42
FCS_FAILURE_AOA_SENSOR_2 = 43
FCS_FAILURE_AOA_SENSOR_3 = 44

FCS_FAILURE_Q_SENSOR_1 = 45
FCS_FAILURE_Q_SENSOR_2 = 46
FCS_FAILURE_Q_SENSOR_3 = 47
FCS_FAILURE_Q_SENSOR_4 = 48

FCS_FAILURE_P_SENSOR_1 = 49
FCS_FAILURE_P_SENSOR_2 = 50
FCS_FAILURE_P_SENSOR_3 = 51
FCS_FAILURE_P_SENSOR_4 = 52

FCS_FAILURE_ROLL_AUGD_1 = 53
FCS_FAILURE_ROLL_AUGD_2 = 54

FCS_FAILURE_YAW_AUGD_1 = 55
FCS_FAILURE_YAW_AUGD_2 = 56

FCS_FAILURE_EFCS_1 = 57
FCS_FAILURE_EFCS_2 = 58

FCS_FAILURE_WOW_1 = 59
FCS_FAILURE_WOW_2 = 60
FCS_FAILURE_WOW_3 = 61
FCS_FAILURE_WOW_4 = 62

FCS_FAILURE_LG_1 = 63
FCS_FAILURE_LG_2 = 64
FCS_FAILURE_LG_3 = 65
FCS_FAILURE_LG_4 = 66

Damage = {
    { Failure = FCS_FAILURE_COMP_1, Failure_name = "FCS_FAILURE_COMP_1", Failure_editor_name = _("FCS_FAILURE_COMP_1"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_COMP_2, Failure_name = "FCS_FAILURE_COMP_2", Failure_editor_name = _("FCS_FAILURE_COMP_2"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.65, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_COMP_3, Failure_name = "FCS_FAILURE_COMP_3", Failure_editor_name = _("FCS_FAILURE_COMP_3"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_COMP_4, Failure_name = "FCS_FAILURE_COMP_4", Failure_editor_name = _("FCS_FAILURE_COMP_4"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.65, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_L_ELEVATOR_ELEC_A, Failure_name = "FCS_FAILURE_L_ELEVATOR_ELEC_A", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_ELEC_A"), Element = damage_cells["ELEVATOR_L_IN"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_L_ELEVATOR_ELEC_B, Failure_name = "FCS_FAILURE_L_ELEVATOR_ELEC_B", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_ELEC_B"), Element = damage_cells["ELEVATOR_L_IN"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_L_ELEVATOR_ELEC_C, Failure_name = "FCS_FAILURE_L_ELEVATOR_ELEC_C", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_ELEC_C"), Element = damage_cells["ELEVATOR_L_OUT"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_L_ELEVATOR_ELEC_D, Failure_name = "FCS_FAILURE_L_ELEVATOR_ELEC_D", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_ELEC_D"), Element = damage_cells["ELEVATOR_L_OUT"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_R_ELEVATOR_ELEC_A, Failure_name = "FCS_FAILURE_R_ELEVATOR_ELEC_A", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_ELEC_A"), Element = damage_cells["ELEVATOR_R_IN"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_R_ELEVATOR_ELEC_B, Failure_name = "FCS_FAILURE_R_ELEVATOR_ELEC_B", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_ELEC_B"), Element = damage_cells["ELEVATOR_R_IN"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_R_ELEVATOR_ELEC_C, Failure_name = "FCS_FAILURE_R_ELEVATOR_ELEC_C", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_ELEC_C"), Element = damage_cells["ELEVATOR_R_OUT"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_R_ELEVATOR_ELEC_D, Failure_name = "FCS_FAILURE_R_ELEVATOR_ELEC_D", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_ELEC_D"), Element = damage_cells["ELEVATOR_R_OUT"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_L_ELEVATOR_HYD_1, Failure_name = "FCS_FAILURE_L_ELEVATOR_HYD_1", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_HYD_1"), Element = damage_cells["ELEVATOR_L_IN"], Integrity_Treshold = 0.65, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_L_ELEVATOR_HYD_2, Failure_name = "FCS_FAILURE_L_ELEVATOR_HYD_2", Failure_editor_name = _("FCS_FAILURE_L_ELEVATOR_HYD_2"), Element = damage_cells["ELEVATOR_L_IN"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_R_ELEVATOR_HYD_1, Failure_name = "FCS_FAILURE_R_ELEVATOR_HYD_1", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_HYD_1"), Element = damage_cells["ELEVATOR_R_IN"], Integrity_Treshold = 0.65, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_R_ELEVATOR_HYD_2, Failure_name = "FCS_FAILURE_R_ELEVATOR_HYD_2", Failure_editor_name = _("FCS_FAILURE_R_ELEVATOR_HYD_2"), Element = damage_cells["ELEVATOR_R_IN"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_ROLL_ELEC_SERVO_1, Failure_name = "FCS_FAILURE_ROLL_ELEC_SERVO_1", Failure_editor_name = _("FCS_FAILURE_ROLL_ELEC_SERVO_1"), Element = damage_cells["AILERON_L"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_ROLL_ELEC_SERVO_2, Failure_name = "FCS_FAILURE_ROLL_ELEC_SERVO_2", Failure_editor_name = _("FCS_FAILURE_ROLL_ELEC_SERVO_2"), Element = damage_cells["AILERON_R"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_YAW_ELEC_SERVO_1, Failure_name = "FCS_FAILURE_YAW_ELEC_SERVO_1", Failure_editor_name = _("FCS_FAILURE_YAW_ELEC_SERVO_1"), Element = damage_cells["FIN_R_CENTER"], Integrity_Treshold = 0.75, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_YAW_ELEC_SERVO_2, Failure_name = "FCS_FAILURE_YAW_ELEC_SERVO_2", Failure_editor_name = _("FCS_FAILURE_YAW_ELEC_SERVO_2"), Element = damage_cells["FIN_R_CENTER"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_PITCH_RATE_GYRO_1, Failure_name = "FCS_FAILURE_PITCH_RATE_GYRO_1", Failure_editor_name = _("FCS_FAILURE_PITCH_RATE_GYRO_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_RATE_GYRO_2, Failure_name = "FCS_FAILURE_PITCH_RATE_GYRO_2", Failure_editor_name = _("FCS_FAILURE_PITCH_RATE_GYRO_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_RATE_GYRO_3, Failure_name = "FCS_FAILURE_PITCH_RATE_GYRO_3", Failure_editor_name = _("FCS_FAILURE_PITCH_RATE_GYRO_3"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_RATE_GYRO_4, Failure_name = "FCS_FAILURE_PITCH_RATE_GYRO_4", Failure_editor_name = _("FCS_FAILURE_PITCH_RATE_GYRO_4"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_ROLL_RATE_GYRO_1, Failure_name = "FCS_FAILURE_ROLL_RATE_GYRO_1", Failure_editor_name = _("FCS_FAILURE_ROLL_RATE_GYRO_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_ROLL_RATE_GYRO_2, Failure_name = "FCS_FAILURE_ROLL_RATE_GYRO_2", Failure_editor_name = _("FCS_FAILURE_ROLL_RATE_GYRO_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_YAW_RATE_GYRO_1, Failure_name = "FCS_FAILURE_YAW_RATE_GYRO_1", Failure_editor_name = _("FCS_FAILURE_YAW_RATE_GYRO_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_YAW_RATE_GYRO_2, Failure_name = "FCS_FAILURE_YAW_RATE_GYRO_2", Failure_editor_name = _("FCS_FAILURE_YAW_RATE_GYRO_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_NZ_SENSOR_1, Failure_name = "FCS_FAILURE_NZ_SENSOR_1", Failure_editor_name = _("FCS_FAILURE_NZ_SENSOR_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_NZ_SENSOR_2, Failure_name = "FCS_FAILURE_NZ_SENSOR_2", Failure_editor_name = _("FCS_FAILURE_NZ_SENSOR_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_NZ_SENSOR_3, Failure_name = "FCS_FAILURE_NZ_SENSOR_3", Failure_editor_name = _("FCS_FAILURE_NZ_SENSOR_3"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.25, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_NZ_SENSOR_4, Failure_name = "FCS_FAILURE_NZ_SENSOR_4", Failure_editor_name = _("FCS_FAILURE_NZ_SENSOR_4"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_NY_SENSOR_1, Failure_name = "FCS_FAILURE_NY_SENSOR_1", Failure_editor_name = _("FCS_FAILURE_NY_SENSOR_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_NY_SENSOR_2, Failure_name = "FCS_FAILURE_NY_SENSOR_2", Failure_editor_name = _("FCS_FAILURE_NY_SENSOR_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_PITCH_LVDT_1, Failure_name = "FCS_FAILURE_PITCH_LVDT_1", Failure_editor_name = _("FCS_FAILURE_PITCH_LVDT_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_LVDT_2, Failure_name = "FCS_FAILURE_PITCH_LVDT_2", Failure_editor_name = _("FCS_FAILURE_PITCH_LVDT_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_LVDT_3, Failure_name = "FCS_FAILURE_PITCH_LVDT_3", Failure_editor_name = _("FCS_FAILURE_PITCH_LVDT_3"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.25, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_PITCH_LVDT_4, Failure_name = "FCS_FAILURE_PITCH_LVDT_4", Failure_editor_name = _("FCS_FAILURE_PITCH_LVDT_4"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_ROLL_LVDT_1, Failure_name = "FCS_FAILURE_ROLL_LVDT_1", Failure_editor_name = _("FCS_FAILURE_ROLL_LVDT_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.15, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_ROLL_LVDT_2, Failure_name = "FCS_FAILURE_ROLL_LVDT_2", Failure_editor_name = _("FCS_FAILURE_ROLL_LVDT_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_YAW_LVDT_1, Failure_name = "FCS_FAILURE_YAW_LVDT_1", Failure_editor_name = _("FCS_FAILURE_YAW_LVDT_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.25, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_YAW_LVDT_2, Failure_name = "FCS_FAILURE_YAW_LVDT_2", Failure_editor_name = _("FCS_FAILURE_YAW_LVDT_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_AOA_SENSOR_1, Failure_name = "FCS_FAILURE_AOA_SENSOR_1", Failure_editor_name = _("FCS_FAILURE_AOA_SENSOR_1"), Element = damage_cells["NOSE_CENTER"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_AOA_SENSOR_2, Failure_name = "FCS_FAILURE_AOA_SENSOR_2", Failure_editor_name = _("FCS_FAILURE_AOA_SENSOR_2"), Element = damage_cells["NOSE_CENTER"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_AOA_SENSOR_3, Failure_name = "FCS_FAILURE_AOA_SENSOR_3", Failure_editor_name = _("FCS_FAILURE_AOA_SENSOR_3"), Element = damage_cells["NOSE_CENTER"], Integrity_Treshold = 0.75, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_Q_SENSOR_1, Failure_name = "FCS_FAILURE_Q_SENSOR_1", Failure_editor_name = _("FCS_FAILURE_Q_SENSOR_1"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_Q_SENSOR_2, Failure_name = "FCS_FAILURE_Q_SENSOR_2", Failure_editor_name = _("FCS_FAILURE_Q_SENSOR_2"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_Q_SENSOR_3, Failure_name = "FCS_FAILURE_Q_SENSOR_3", Failure_editor_name = _("FCS_FAILURE_Q_SENSOR_3"), Element = damage_cells["NOSE_RIGHT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_Q_SENSOR_4, Failure_name = "FCS_FAILURE_Q_SENSOR_4", Failure_editor_name = _("FCS_FAILURE_Q_SENSOR_4"), Element = damage_cells["NOSE_RIGHT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_P_SENSOR_1, Failure_name = "FCS_FAILURE_P_SENSOR_1", Failure_editor_name = _("FCS_FAILURE_P_SENSOR_1"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_P_SENSOR_2, Failure_name = "FCS_FAILURE_P_SENSOR_2", Failure_editor_name = _("FCS_FAILURE_P_SENSOR_2"), Element = damage_cells["NOSE_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_P_SENSOR_3, Failure_name = "FCS_FAILURE_P_SENSOR_3", Failure_editor_name = _("FCS_FAILURE_P_SENSOR_3"), Element = damage_cells["NOSE_RIGHT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_P_SENSOR_4, Failure_name = "FCS_FAILURE_P_SENSOR_4", Failure_editor_name = _("FCS_FAILURE_P_SENSOR_4"), Element = damage_cells["NOSE_RIGHT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_ROLL_AUGD_1, Failure_name = "FCS_FAILURE_ROLL_AUGD_1", Failure_editor_name = _("FCS_FAILURE_ROLL_AUGD_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.65, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_ROLL_AUGD_2, Failure_name = "FCS_FAILURE_ROLL_AUGD_2", Failure_editor_name = _("FCS_FAILURE_ROLL_AUGD_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.45, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_YAW_AUGD_1, Failure_name = "FCS_FAILURE_YAW_AUGD_1", Failure_editor_name = _("FCS_FAILURE_YAW_AUGD_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.35, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_YAW_AUGD_2, Failure_name = "FCS_FAILURE_YAW_AUGD_2", Failure_editor_name = _("FCS_FAILURE_YAW_AUGD_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_EFCS_1, Failure_name = "FCS_FAILURE_EFCS_1", Failure_editor_name = _("FCS_FAILURE_EFCS_1"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.1, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_EFCS_2, Failure_name = "FCS_FAILURE_EFCS_2", Failure_editor_name = _("FCS_FAILURE_EFCS_2"), Element = damage_cells["CABIN_LEFT_SIDE"], Integrity_Treshold = 0.2, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_WOW_1, Failure_name = "FCS_FAILURE_WOW_1", Failure_editor_name = _("FCS_FAILURE_WOW_1"), Element = damage_cells["LEFT_GEAR_BOX"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_WOW_2, Failure_name = "FCS_FAILURE_WOW_2", Failure_editor_name = _("FCS_FAILURE_WOW_2"), Element = damage_cells["LEFT_GEAR_BOX"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_WOW_3, Failure_name = "FCS_FAILURE_WOW_3", Failure_editor_name = _("FCS_FAILURE_WOW_3"), Element = damage_cells["RIGHT_GEAR_BOX"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_WOW_4, Failure_name = "FCS_FAILURE_WOW_4", Failure_editor_name = _("FCS_FAILURE_WOW_4"), Element = damage_cells["RIGHT_GEAR_BOX"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},

    { Failure = FCS_FAILURE_LG_1, Failure_name = "FCS_FAILURE_LG_1", Failure_editor_name = _("FCS_FAILURE_LG_1"), Element = damage_cells["FUSELAGE_RIGHT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_LG_2, Failure_name = "FCS_FAILURE_LG_2", Failure_editor_name = _("FCS_FAILURE_LG_2"), Element = damage_cells["FUSELAGE_RIGHT_SIDE"], Integrity_Treshold = 0.95, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_LG_3, Failure_name = "FCS_FAILURE_LG_3", Failure_editor_name = _("FCS_FAILURE_LG_3"), Element = damage_cells["FUSELAGE_LEFT_SIDE"], Integrity_Treshold = 0.55, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
    { Failure = FCS_FAILURE_LG_4, Failure_name = "FCS_FAILURE_LG_4", Failure_editor_name = _("FCS_FAILURE_LG_4"), Element = damage_cells["FUSELAGE_LEFT_SIDE"], Integrity_Treshold = 0.85, Slope_param = 1.0, work_time_to_fail_probability = 0.01, work_time_to_fail = 3600*300,},
}

need_to_be_closed = true
