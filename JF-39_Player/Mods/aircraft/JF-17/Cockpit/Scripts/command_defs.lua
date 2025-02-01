start_command = 3000
deka_counter = start_command

local function dcounter()
    deka_counter = deka_counter + 1
    return deka_counter
end

-- 按键部分
start_command = 10000
deka_counter = start_command

key_cmds = {
    -- preset by ED
    FlashLight    = 3256,
    MirrorToggle  = 1625,

    -----------------------
    -- EFM cmds starts here
    -----------------------
    --flight control axis
    JoystickLeftEngineThrottle  = dcounter(),
    JoystickRightEngineThrottle = dcounter(),

    --flight control keyboard
    PitchDownStart = dcounter(),
    PitchDownEnd   = dcounter(),
    PitchUpStart   = dcounter(),
    PitchUpEnd     = dcounter(),
    RollLeftStart  = dcounter(),
    RollLeftEnd    = dcounter(),
    RollRightStart = dcounter(),
    RollRightEnd   = dcounter(),
    YawLeftStart   = dcounter(),
    YawLeftEnd     = dcounter(),
    YawRightStart  = dcounter(),
    YawRightEnd    = dcounter(),
    THROTTLE_UP    = dcounter(),
    THROTTLE_DN    = dcounter(),

    --cockpit controls
    Gear           = dcounter(),
    GearUp         = dcounter(),
    GearDown       = dcounter(),
    ParkingBrake   = dcounter(),
    Canopy         = dcounter(),
    CanopyJettison = dcounter(),

    Chute = dcounter(),

    AirBrake    = dcounter(),
    AirBrakeOn  = dcounter(),
    AirBrakeOff = dcounter(),

    WheelBrakeD = dcounter(),
    WheelBrakeU = dcounter(),

    WheelBrakeLeftD  = dcounter(),
    WheelBrakeLeftU  = dcounter(),
    WheelBrakeRightD = dcounter(),
    WheelBrakeRightU = dcounter(),

    FLAP    = dcounter(),
    FLAP_UP = dcounter(),
    FLAP_DN = dcounter(),

    Eject = dcounter(),

    --FCS
    ALT_Hold    = dcounter(),
    ATT_Hold    = dcounter(),
    DIRECT_LINK = dcounter(),
    CAT_Toggle  = dcounter(),

    --Engine
    ENGINE_IDLE = dcounter(),
    ENGINE_OFF  = dcounter(),

    ----------------------
    -- ASM cmd starts here
    ----------------------
    -- 非可点击部分, 驾驶杆、油门杆、脚舵
    -- 驾驶杆
    HOTAS_Stick_S1_Forward   = dcounter(), --S1, 传感器选择
    HOTAS_Stick_S1_Backward  = dcounter(),
    HOTAS_Stick_S1_Left      = dcounter(),
    HOTAS_Stick_S1_Right     = dcounter(),
    HOTAS_Stick_S1_Press     = dcounter(),

    HOTAS_Stick_S2_Forward   = dcounter(), --S2, 传感器控制
    HOTAS_Stick_S2_Backward  = dcounter(),
    HOTAS_Stick_S2_Left      = dcounter(),
    HOTAS_Stick_S2_Right     = dcounter(),
    HOTAS_Stick_S2_Press     = dcounter(),

    HOTAS_Stick_S3 = dcounter(), --S3, 导弹发射
    HOTAS_Stick_S4 = dcounter(), --S4, 机炮发射
    HOTAS_Stick_S5 = dcounter(), --S5, 抛弃当前选定武器

    HOTAS_Stick_S6_Up    = dcounter(), --S6, Trim
    HOTAS_Stick_S6_Down  = dcounter(),
    HOTAS_Stick_S6_Left  = dcounter(),
    HOTAS_Stick_S6_Right = dcounter(),

    HOTAS_Stick_S7 = dcounter(), --s7, 自动驾驶断开
    HOTAS_Stick_S8 = dcounter(), --s8, 循环选择导弹类型

    -- 油门杆
    HOTAS_Throttle_T1_Forward   = dcounter(), --T1, 主模式开关
    HOTAS_Throttle_T1_Center    = dcounter(), --T1, 主模式开关
    HOTAS_Throttle_T1_Backward  = dcounter(),

    HOTAS_Throttle_T1_MMS_Cycle_Next = dcounter(), --T1, 主模式开关循环
    HOTAS_Throttle_T1_MMS_Cycle_Prev = dcounter(), --T1, 主模式开关循环

    HOTAS_Throttle_T2_Forward   = dcounter(), --T2, 干扰投放/位标器解锁
    HOTAS_Throttle_T2_Backward  = dcounter(),
    HOTAS_Throttle_T2_Center    = dcounter(),
    HOTAS_Throttle_T2_Press     = dcounter(),

    HOTAS_Throttle_T3_Forward   = dcounter(),
    HOTAS_Throttle_T3_Backward  = dcounter(),

    HOTAS_Throttle_T4_Forward   = dcounter(), --T4, 电台发话/IFF
    HOTAS_Throttle_T4_Backward  = dcounter(),
    HOTAS_Throttle_T4_Center    = dcounter(),
    HOTAS_Throttle_T4_Press     = dcounter(),

    HOTAS_Throttle_T5_Up    = dcounter(), --T5, TDC控制
    HOTAS_Throttle_T5_Down  = dcounter(),
    HOTAS_Throttle_T5_UD_Stop = dcounter(),

    HOTAS_Throttle_T5_Left  = dcounter(),
    HOTAS_Throttle_T5_Right = dcounter(),
    HOTAS_Throttle_T5_LR_Stop = dcounter(),

    HOTAS_Throttle_T5_Press = dcounter(),


    Gun_OnOff = dcounter(); -- FOR TEST ONLY, TO BE REMOVED

    -- 脚舵
    HOTAS_Pedal_Brake       = dcounter(), -- 双主轮刹车到底
    HOTAS_Pedal_Brake_Left  = dcounter(), -- 左主轮刹车到底
    HOTAS_Pedal_Brake_Right = dcounter(), -- 右主轮刹车到底

    -- 通信
    --Radio_Trigger_Comm1    = dcounter(),
    --Radio_Trigger_Comm2    = dcounter(),
    Radio_Trigger_Intercom = dcounter(), -- use iCommandToggleCommandMenu instead
    --Radio_Trigger_UHF      = dcounter(),
    --Radio_Trigger_VHF      = dcounter(),

    -- Nav
    Nav_Wpt_Next = dcounter(),
    Nav_Wpt_Prev = dcounter(),

    -- OESP
    OESP_Prog_Disp = dcounter(), -- deprecated

    -- 传感器 天线高低角 键盘控制 (for game play)
    Sensor_Antenna_Up    = dcounter(),
    Sensor_Antenna_Down  = dcounter(),
    Sensor_Antenna_Left  = dcounter(),
    Sensor_Antenna_Right = dcounter(),

    Sensor_ZoomIn  = dcounter(),  -- 光学传感器FOV减小
    Sensor_ZoomOut = dcounter(),  -- 光学传感器FOV增大

    Laser_OnOff = dcounter(), -- 激光开启关闭

    PrevOESPProg = dcounter(),
    NextOESPProg = dcounter(),

    MasterArmToggle   = dcounter(),
    AfterburnerToggle = dcounter(),

    BackupReticle_OFF  = dcounter(),
    BackupReticle_BOMB = dcounter(),
    BackupReticle_IR   = dcounter(),
    BackupReticle_GUN  = dcounter(),

    AutoPilot_OnOff   = dcounter(),
    AutoPilot_Att_Alt = dcounter(),
    AutoPilot_Att     = dcounter(),
    AutoPilot_Alt     = dcounter(),

    -- 座椅高度调节
    SeatAdjustment_Up     = dcounter(),
    SeatAdjustment_Down   = dcounter(),

    DTC_Install = dcounter(),
    DTC_Remove  = dcounter(),

    HUD_BRT_Inc = dcounter(),
    HUD_BRT_Dec = dcounter(),

    UFCP_BRT_Inc = dcounter(),
    UFCP_BRT_Dec = dcounter(),

    RADIO_Mode_CW  = dcounter(),
    RADIO_Mode_CCW = dcounter(),

    Stick_Show_Hide_Toggle = dcounter(),

    FCS_AA_AG_Toggle   = dcounter(),
    FCS_AG1_AG2_Toggle = dcounter(),

    SMS_Jett_Emerge_Shortcut = dcounter(),

    HOTAS_Throttle_T4_Forward_VOIP_down    = dcounter(),
    HOTAS_Throttle_T4_Forward_VOIP_up      = dcounter(),
    HOTAS_Throttle_T4_Backward_VOIP_down   = dcounter(),
    HOTAS_Throttle_T4_Backward_VOIP_up     = dcounter(),

    HOTAS_Throttle_T4_Forward_w_VOIP_down  = dcounter(),
    HOTAS_Throttle_T4_Forward_w_VOIP_up    = dcounter(),
    HOTAS_Throttle_T4_Backward_w_VOIP_down = dcounter(),
    HOTAS_Throttle_T4_Backward_w_VOIP_up   = dcounter(),

    ACP_Com1_Vol_Inc    = dcounter(),
    ACP_Com1_Vol_Dec    = dcounter(),
    ACP_Com2_Vol_Inc    = dcounter(),
    ACP_Com2_Vol_Dec    = dcounter(),
    ACP_TCN_ILS_Vol_Inc = dcounter(),
    ACP_TCN_ILS_Vol_Dec = dcounter(),
    ACP_MSL_Vol_Inc     = dcounter(),
    ACP_MSL_Vol_Dec     = dcounter(),

    OESP_Flare_Emerge_Shortcut = dcounter(),

    HUD_CONT_Inc = dcounter(),
    HUD_CONT_Dec = dcounter(),

    ---- Ext Commands
    SMS_Gun_Feed  = dcounter(),
    SMS_Gun_Mode  = dcounter(),
    SMS_Gun_Limit = dcounter(),

    SMS_WP_AA_Cycle  = dcounter(),
    SMS_WP_AA_Prep   = dcounter(),
    SMS_WP_AA_TgtS   = dcounter(),
    SMS_Pylon_Cycle  = dcounter(),
    SMS_Jett_Pylon   = dcounter(),

    RDR_MM_Input   = dcounter(),
    RDR_SM_Input   = dcounter(),
    RDR_MM_Next    = dcounter(),
    RDR_MM_Prev    = dcounter(),
    RDR_SM_Next    = dcounter(),
    RDR_SM_Prev    = dcounter(),
    RDR_Bar_Cycle  = dcounter(),
    RDR_PRF_Cycle  = dcounter(),
    RDR_STBY       = dcounter(),
    RDR_SIL        = dcounter(),

    EWS_OPEN_PRTY_Toggle = dcounter(),

    DTC_Channel_Copy      = dcounter(),
    DTC_Channel_Paste     = dcounter(),
    DTC_Channel_Clean     = dcounter(),
    DTC_Channel_ID        = dcounter(),
    DTC_Channel_Coord_NS  = dcounter(),
    DTC_Channel_Coord_EW  = dcounter(),
    DTC_Channel_Coord_Alt = dcounter(),

    DTC_QFE_Setting  = dcounter(),
    DTC_FUEL_Bingo   = dcounter(),

    NAV_Submode    = dcounter(),
    NAV_WPT_ID     = dcounter(),
    NAV_APR_ID     = dcounter(),
    NAV_APR_Stage  = dcounter(),
    NAV_APR_Signal = dcounter(),
    NAV_APR_Rwy    = dcounter(),

    NAV_APR_TCN_ID    = dcounter(),
    NAV_APR_TCN_Chnl  = dcounter(),
    NAV_APR_TCN_Alt   = dcounter(),
    NAV_APR_ILS_ID    = dcounter(),
    NAV_APR_ILS_Freq  = dcounter(),
    NAV_APR_ILS_Alt   = dcounter(),
    NAV_APR_FAF_Side  = dcounter(),
    NAV_APR_FAF_Range = dcounter(),

    NAV_TCN_ProgID  = dcounter(),
    NAV_TCN_Channel = dcounter(),
    NAV_TCN_Mode    = dcounter(),
    NAV_TCN_Band    = dcounter(),
    NAV_TCN_Course  = dcounter(),
    NAV_TCN_StaAlt  = dcounter(),
    NAV_TCN_MagVar  = dcounter(),

    COMM1_Chnl_Input = dcounter(),
    COMM1_Freq_Input = dcounter(),

    COMM2_Chnl_Input = dcounter(),
    COMM2_Freq_Input = dcounter(),

    DL_Net_Chnl_Input   = dcounter(),
    DL_Net_MS_Input     = dcounter(),
    DL_Net_Join_Input   = dcounter(),

    OESP_Select_Prog_Type  = dcounter(),

    DTC_FUEL_Min             = dcounter(),
    DTC_FUEL_Bingo_Fuel_Rate = dcounter(),

    SMS_WP_AA_Set = dcounter(),

    ---- Ext Virtual Axis Cmds
    HOTAS_Throttle_Inv_Abs = dcounter(),

    OESP_Select_Mode_Type  = dcounter(),


    IFF_INT_Mode_Set = dcounter(),
    IFF_TRS_Mode_Set = dcounter(),

    IFF_INT_M1_Code  = dcounter(),
    IFF_INT_M2_Code  = dcounter(),
    IFF_INT_M3_Code  = dcounter(),
    IFF_INT_M6_Code  = dcounter(),

    IFF_TRS_M1_Code  = dcounter(),
    IFF_TRS_M3_Code  = dcounter(),
    IFF_TRS_M6_Code  = dcounter(),

    AAP_INS    = dcounter(),
    AAP_WMMC1  = dcounter(),
    AAP_WMMC2  = dcounter(),
    AAP_SAIU   = dcounter(),
    AAP_COM1   = dcounter(),
    AAP_COM2   = dcounter(),
    AAP_NAV    = dcounter(),
    AAP_IFF    = dcounter(),
    AAP_RDR    = dcounter(),
    AAP_SLNK   = dcounter(),
    AAP_OESP   = dcounter(),
    AAP_RWR    = dcounter(),
    AAP_HMD    = dcounter(),
    AAP_SPJ    = dcounter(),
    AAP_CLDP   = dcounter(),
    AAP_IRST   = dcounter(),
    AAP_ACMI   = dcounter(),
    AAP_CMBT   = dcounter(),
    AAP_TRAIN  = dcounter(),
    AAP_OFF    = dcounter(),

    FCS_AP_OnOff   = dcounter(),
    FCS_AP_Att_Alt = dcounter(),
    FCS_AP_Att     = dcounter(),
    FCS_AP_Alt     = dcounter(),

    QFE_Knob_Inc = dcounter(),
    QFE_Knob_Dec = dcounter(),

    Light_Inst_Knob_Inc    = dcounter(),
    Light_Inst_Knob_Dec    = dcounter(),
    Light_Console_Knob_Inc = dcounter(),
    Light_Console_Knob_Dec = dcounter(),
    Light_Flood_Knob_Inc   = dcounter(),
    Light_Flood_Knob_Dec   = dcounter(),
    Light_AAR_Knob_Inc     = dcounter(),
    Light_AAR_Knob_Dec     = dcounter(),

    RAlt_Set_Alt_Min       = dcounter(),     
}

-- 开车/关车部分集成指令
macro_cmds = {
    AutoStart_Engine_Start        = dcounter(),
    AutoStart_INS_Coord           = dcounter(),
    AutoStart_INS_Hdg             = dcounter(),
    AutoStart_FCS_Cfg             = dcounter(),

    AutoStop_Throttle_Off         = dcounter(),

    AutoStart_Remove_Cover_Ladder = dcounter(),
}

start_command = 11000
deka_counter = start_command

mission_cfg_cmds = {
    MSCMD_IFF_Disable_M1 = dcounter(),
    MSCMD_IFF_Disable_M2 = dcounter(),
    MSCMD_IFF_Disable_M3 = dcounter(),
    MSCMD_IFF_Disable_M6 = dcounter(),
}


-- 可点击部分
start_command = 3001
deka_counter = start_command
click_cmds = {}
for i=500,999 do
    click_cmds['PNT_' .. tostring(i)] = dcounter()
end


-- 轴命令值是写死的, 不可自定义值, 只可自定义名称
-- start_command = 2000
-- deka_counter = start_command
axis_cmd = {
    HOTAS_StickPitch_Abs = 2001, -- iCommandPlanePitch --俯仰轴
    HOTAS_StickRoll_Abs  = 2002, -- iCommandPlanePitch --滚转轴
    HOTAS_PedalYaw_Abs   = 2003, -- iCommandPlaneRudder -- 脚蹬轴
    HOTAS_Throttle_Abs   = 2004, -- iCommandPlaneThrustCommon, -- 油门轴

    Sensor_AZ_Axis_Abs          = 2027, -- iCommandPlaneRadarHorizontalAbs
    HOTAS_Throttle_T6_Abs       = 2028, -- iCommandPlaneRadarVerticalAbs, --T6天线控制轴，控制移动方向和速度
    HOTAS_Throttle_T6_Abs_Slide = 2131, -- iCommand_TDC_AbsolutePositionVertical --T6天线控制轴，绝对位置

    -- TDC 轴控制
    TDC_X_Abs = 2033, -- iCommandPlaneSelecterHorizontalAbs
    TDC_Y_Abs = 2034, -- iCommandPlaneSelecterVerticalAbs

    -- Customized Axis Cmd Start (iCommandDebugAxis1/2088 - iCommandDebugAxis10/2097)
    UFCP_HUD_Brt_Abs   = 2088,
    UFCP_Brt_Abs       = 2089,
    -- UFCP_HUD_Stby_Ret_Abs = , -- not enough axis cmd
    -- UFCP_HUD_Cont_Abs  = , -- not enough axis cmd

    ACP_Com1_Vol_Abs    = 2090,
    ACP_Com2_Vol_Abs    = 2091,
    ACP_TCN_ILS_Vol_Abs = 2092,
    ACP_MSL_Vol_Abs     = 2093,

    Cpt_Light_Inst_Abs    = 2094,
    Cpt_Light_Console_Abs = 2095,
    Cpt_Light_Flood_Abs   = 2096,
    Ext_Light_AAR_Abs     = 2097,
    -- Customized Axis Cmd End (iCommandDebugAxis1/2088 - iCommandDebugAxis10/2097)

    --
    WheelBrake_Abs      = 2101,
    WheelBrakeLeft_Abs  = 2112,
    WheelBrakeRight_Abs = 2113,

}


-- 命令对应的名字，用于本地化
cmd_names = {

    PrevOESPProg = "Prev OESP Program",
    NextOESPProg = "Next OESP Program",

    AfterburnerToggle = "Afterburner Toggle (ON/OFF)",

    QFE_Knob_Inc = "QFE Setting Knob - Inc",
    QFE_Knob_Dec = "QFE Setting Knob - Dec",

    Light_Inst_Knob_Inc    = "Inst. Light Knob - Inc",
    Light_Inst_Knob_Dec    = "Inst. Light Knob - Dec",
    Light_Console_Knob_Inc = "Console Light Knob - Inc",
    Light_Console_Knob_Dec = "Console Light Knob - Dec",
    Light_Flood_Knob_Inc   = "Flood Light Knob - Inc",
    Light_Flood_Knob_Dec   = "Flood Light Knob - Dec",
    Light_AAR_Knob_Inc     = "AAR Light Knob - Inc",
    Light_AAR_Knob_Dec     = "AAR Light Knob - Dec",

    MasterArmToggle = "Master Arm Toggle (ARM/OFF)",

    BackupReticle_OFF  = "Backup SAIU - OFF",
    BackupReticle_BOMB = "Backup SAIU - BOMB",
    BackupReticle_IR   = "Backup SAIU - IR",
    BackupReticle_GUN  = "Backup SAIU - GUN",

    AutoPilot_OnOff   = "AutoPilot - Off/On (ATT)",
    AutoPilot_Att_Alt = "AutoPilot - ATT/ALT",
    AutoPilot_Att     = "AutoPilot - ATT",
    AutoPilot_Alt     = "AutoPilot - ALT",

    SeatAdjustment_Up   = "Seat Adjustment - UP",
    SeatAdjustment_Down = "Seat Adjustment - DOWN",

    Sensor_Up    = "Sensor (WMD7/TV) Up / T6: Radar Ant Elev Up",
    Sensor_Down  = "Sensor (WMD7/TV) Down / T6: Radar Ant Elev Down",
    Sensor_Left  = "Sensor (WMD7/TV) Left / Gain Dec",
    Sensor_Right = "Sensor (WMD7/TV) Right / Gain Inc",

    AirBrake     = "Speed Brake Toggle",
    AirBrakeOn   = "Speed Brake On",
    AirBrakeOff  = "Speed Brake Off",
    AirBrakeSpec = "Speed Brake On/Off",

    DTC_Install  = "Install DTC Card",
    DTC_Remove   = "Remove DTC Card",

    HUD_BRT_Inc  = "HUD Brightness - Inc",
    HUD_BRT_Dec  = "HUD Brightness - Dec",

    HUD_CONT_Inc = "HUD Contrast - Inc",
    HUD_CONT_Dec = "HUD Contrast - Dec",

    UFCP_BRT_Inc = "UFCP Brightness - Inc",
    UFCP_BRT_Dec = "UFCP Brightness - Dec",
    
    RADIO_Mode_CW   = "Radio Mode Selector - CW",
    RADIO_Mode_CCW  = "Radio Mode Selector - CCW",

    Stick_Show_Hide_Toggle = "Show/Hide Stick",

    SMS_Jett_Emerge_Shortcut = "Emergency Jettison Shortcut",
    OESP_Flare_Emerge_Shortcut = "Emergency Flare Shortcut",

    ---- 驾驶杆
    HOTAS_Stick_S1_Forward   = "S1_Forward: DGFT - Dogfight Mode", --S1, 传感器选择
    HOTAS_Stick_S1_Backward  = "S1_Backward: Cycle MFCD Select - Left-Center-Right",
    HOTAS_Stick_S1_Left      = "S1_Left: Cycle MFCD Select - Left Direction",
    HOTAS_Stick_S1_Right     = "S1_Right: Cycle MFCD Select - Right Direction",
    HOTAS_Stick_S1_Press     = "S1_Press: DGFT Returns to Prev Master Mode/MFCDs Restore to Default Pages",

    HOTAS_Stick_S2_Forward   = "S2_Forward: INTC Increase Range/DGFT BS Submode", --S2, 传感器控制
    HOTAS_Stick_S2_Backward  = "S2_Backward: INTC Decrease Range/DGFT VERT Submode",
    HOTAS_Stick_S2_Left      = "S2_Left: INTC RWS/TWS/VS Switch/DGFT SA",
    HOTAS_Stick_S2_Right     = "S2_Right: INTC Change Azimth Range/DGFT HA",
    HOTAS_Stick_S2_Press     = "S2_Press: Unlock Target/DGFT BS Wide Narrow Switch",

    HOTAS_Stick_S3 = "S3: Weapon Launch", --S3, 导弹发射
    HOTAS_Stick_S4 = "S4: Fire Main Gun", --S4, 机炮发射
    HOTAS_Stick_S5 = "S5: Change/Unselect Weapon Station / NWS", --S5, 抛弃当前选定武器

    HOTAS_Stick_S6_Up    = "S6_Up: Trim Nose Down", --S6, Trim
    HOTAS_Stick_S6_Down  = "S6_Down: Trim Nose Up",
    HOTAS_Stick_S6_Left  = "S6_Left: Trim Roll Left",
    HOTAS_Stick_S6_Right = "S6_Right: Trim Roll Right",

    HOTAS_Stick_S7 = "S7: AutoPilot Off", --s7, 自动驾驶断开
    HOTAS_Stick_S8 = "S8: Change Weapons", --s8, 循环选择导弹类型

    -- 油门杆
    HOTAS_Throttle_T1_Center    = "T1_Center: NAV - Navigation Mode", --T1, 主模式开关
    HOTAS_Throttle_T1_Forward   = "T1_Forward: BVR - INTC Mode", --T1, 主模式开关
    HOTAS_Throttle_T1_Backward  = "T1_Backward: AG - Air-To-Ground Mode",
    HOTAS_Throttle_T1_Fwd_Cent  = "T1: Forward (INTC) / Center (NAV)",
    HOTAS_Throttle_T1_Bwd_Cent  = "T1: Backward (AG) / Center (NAV)",

    HOTAS_Throttle_T1_MMS_Cycle_Next = "Master Mode Switch - Next Mode", --T1, 主模式开关循环
    HOTAS_Throttle_T1_MMS_Cycle_Prev = "Master Mode Switch - Prev Mode", --T1, 主模式开关循环

    HOTAS_Throttle_T2_Forward   = "T2_Forward: SPJ Standby/Jam", --T2, 干扰投放/位标器解锁
    HOTAS_Throttle_T2_Backward  = "T2_Backward: Countermeasures Dispense",
    HOTAS_Throttle_T2_Center    = "T2_Center: TODO",
    HOTAS_Throttle_T2_Press     = "T2_Press: AG Manual Mode/DGFT Missile Designator Control",

    HOTAS_Throttle_T3_Forward   = "T3_Forward: Speed Brake On",
    HOTAS_Throttle_T3_Backward  = "T3_Backward: Speed Brake Off",

    HOTAS_Throttle_T4_Forward   = "T4_Forward: Radio Comm 1", --T4, 电台发话/IFF
    HOTAS_Throttle_T4_Backward  = "T4_Backward: Radio Comm 2",
    HOTAS_Throttle_T4_Center    = "T4_Center: TODO",
    HOTAS_Throttle_T4_Press     = "T4_Press: IFF Interrogation Start/Stop",

    HOTAS_Throttle_T4_Forward_VOIP     = "T4_Forward: Radio Comm 1 VOIP", --T4, 电台发话/IFF
    HOTAS_Throttle_T4_Backward_VOIP    = "T4_Backward: Radio Comm 2 VOIP",
    HOTAS_Throttle_T4_Forward_w_VOIP   = "T4_Forward: Radio Comm 1 (w/ VOIP)", --T4, 电台发话/IFF
    HOTAS_Throttle_T4_Backward_w_VOIP  = "T4_Backward: Radio Comm 2 (w/ VOIP)",

    HOTAS_Throttle_T5_Up    = "T5_Up: TDC Up", --T5, TDC控制
    HOTAS_Throttle_T5_Down  = "T5_Down: TDC Down",
    HOTAS_Throttle_T5_Left  = "T5_Left: TDC Left",
    HOTAS_Throttle_T5_Right = "T5_Right: TDC Right",
    HOTAS_Throttle_T5_Press = "T5_Press: Lock Target",

    HOTAS_Throttle_T6       = "T6_Axis: Antenna Elevation",
    HOTAS_Throttle_T6_Slide = "T6_Axis: Antenna Elevation (Slide)",

    -- below are for all clickable cmds
    PNT_500 = "Backup SAIU Knob Selector",
    PNT_501 = "Landing Gear Indicator Light Test Button",
    PNT_502 = "Landing Gear Override Button Cover",
    PNT_503 = "Landing Gear Override Button",
    PNT_504 = "Landing Gear Indicator Light Knob",
    PNT_505 = "Landing Gear Lever",

    PNT_506 = "Ground Jettison Switch",
    PNT_507 = "Emergency Jettison Button Cover",
    PNT_508 = "Emergency Jettison Button",

    PNT_509 = "Master Arm Switch",

    PNT_510 = "Brake Test",
    PNT_511 = "Brake Park/Norm",
    PNT_512 = "Light Switch - Land/Off/Taxi",

    PNT_513 = "Flap Switch - Up/Down",

    -- FUEL
    PNT_514 = "Feed Cut-off Valve Cover",
    PNT_515 = "Feed Cut-off Valve",
    PNT_516 = "Active Fuel Cut-off Valve Cover",
    PNT_517 = "Active Fuel Cut-off Valve",
    PNT_518 = "Fuel Pump Switch",
    PNT_564 = "AAR Switch",

    -- ENG
    PNT_519 = "Engine Control Switch",
    PNT_520 = "Air Start Button",
    PNT_521 = "Ground Start Button",
    PNT_522 = "Engine Mode Switch",
    PNT_523 = "SEC EEC Switch",
    PNT_524 = "Afterburner Switch",
    PNT_525 = "Anti-Surge Switch",
    PNT_526 = "Start Mode Selector - START/ENG COLD/STARTER COLD",

    -- FCS
    PNT_527 = "Record Switch",
    PNT_528 = "EFCS Switch",
    PNT_529 = "Yaw/Roll CAS Switch",
    PNT_530 = "Direct Mode Switch",
    PNT_531 = "BIT Button",

    PNT_532 = "Yaw Trim Switch",
    PNT_544 = "FCS Reset Button",
    PNT_533 = "Flight Test Switch 1",
    PNT_534 = "Flight Test Switch 2",
    PNT_535 = "AG1/AG2 Switch",
    PNT_536 = "AA/AG Switch",

    -- MISC
    PNT_537 = "Flare Dispense Button Cover",
    PNT_538 = "Flare Dispense Button",
    PNT_539 = "Emergency Hydraulic Pump Switch",
    PNT_540 = "SHARS Switch",

    PNT_541 = "Ejection Seat Zeroizer Function",
    PNT_542 = "Zeroizer Button Cover",
    PNT_543 = "Zeroizer Button",

    -- COMM
    PNT_545 = "Radio Volume Knob",
    PNT_546 = "Squelch OFF/SQL/ACKN",
    PNT_547 = "Radio Mode Selector",
    PNT_548 = "Radio Control Handover",

    PNT_549 = "Radio Button 1/TONE",
    PNT_550 = "Radio Button 2/-",
    PNT_551 = "Radio Button 3/+",
    PNT_552 = "Radio Button 4/H",
    PNT_553 = "Radio Button 5/A",
    PNT_554 = "Radio Button 6/M",
    PNT_555 = "Radio Button 7/P",
    PNT_556 = "Radio Button 8/C",
    PNT_557 = "Radio Button 9/T",
    PNT_558 = "Radio Button <-/MAN",
    PNT_559 = "Radio Button 0/PRE",
    PNT_560 = "Radio Button ->/ENT",

    PNT_561 = "Air Start Button Cover",
    PNT_562 = "CSS Handle",

    PNT_563 = "P.H. Test Switch",

    PNT_570 = "Throttle Friction Handle",
    PNT_571 = "Throttle Uncage: Stop To Idle",
    PNT_572 = "Throttle Cage: Idle To Stop",
    PNT_573 = "Throttle Emergency Button",

    -- UFCP
    PNT_700 = "UFCP Button PFL/1",
    PNT_701 = "UFCP Button VRC/2",
    PNT_702 = "UFCP Button 3",
    PNT_703 = "UFCP Button L1",
    PNT_704 = "UFCP Button R1",
    PNT_705 = "UFCP Button OAP",
    PNT_706 = "UFCP Button MRK",
    PNT_707 = "UFCP Button DST/4",
    PNT_708 = "UFCP Button TOT/5",
    PNT_709 = "UFCP Button TOD/6",
    PNT_710 = "UFCP Button L2",
    PNT_711 = "UFCP Button R2",
    PNT_712 = "UFCP Button P.U",
    PNT_713 = "UFCP Button HNS",
    PNT_714 = "UFCP Button FUL/7",
    PNT_715 = "UFCP Button IFF/8",
    PNT_716 = "UFCP Button 9",
    PNT_717 = "UFCP Button L3",
    PNT_718 = "UFCP Button R3",
    PNT_719 = "UFCP Button A/P",
    PNT_720 = "UFCP Button FPM",
    PNT_721 = "UFCP Button RTN",
    PNT_722 = "UFCP Button 0",
    PNT_723 = "UFCP Button N/A",
    PNT_724 = "UFCP Button L4",
    PNT_725 = "UFCP Button R4",
    PNT_726 = "UFCP Button N/A",
    PNT_727 = "UFCP Button N/A",

    PNT_728 = "HUD Contrast Knob",
    PNT_729 = "HUD Brightness Knob",
    PNT_730 = "+/,/- Switch",
    PNT_731 = "HUD Backup Reticle Knob",
    PNT_732 = "UFCP Brightness Knob",

    PNT_733 = "Deploy/Jettison Parachute",

    -- LMFCD
    PNT_734 = "Left MFCD Sym +",
    PNT_735 = "Left MFCD Sym -",
    PNT_736 = "Left MFCD U1",
    PNT_737 = "Left MFCD U2",
    PNT_738 = "Left MFCD U3",
    PNT_739 = "Left MFCD U4",
    PNT_740 = "Left MFCD U5",
    PNT_741 = "Left MFCD Power",
    PNT_742 = "Left MFCD L1",
    PNT_743 = "Left MFCD L2",
    PNT_744 = "Left MFCD L3",
    PNT_745 = "Left MFCD L4",
    PNT_746 = "Left MFCD L5",
    PNT_747 = "Left MFCD L6",
    PNT_748 = "Left MFCD L7",
    PNT_749 = "Left MFCD L8",
    PNT_750 = "Left MFCD R1",
    PNT_751 = "Left MFCD R2",
    PNT_752 = "Left MFCD R3",
    PNT_753 = "Left MFCD R4",
    PNT_754 = "Left MFCD R5",
    PNT_755 = "Left MFCD R6",
    PNT_756 = "Left MFCD R7",
    PNT_757 = "Left MFCD R8",
    PNT_758 = "Left MFCD Cont +",
    PNT_759 = "Left MFCD Cont -",
    PNT_760 = "Left MFCD D1",
    PNT_761 = "Left MFCD D2",
    PNT_762 = "Left MFCD D3",
    PNT_763 = "Left MFCD D4",
    PNT_764 = "Left MFCD D5",
    PNT_765 = "Left MFCD Brt +",
    PNT_766 = "Left MFCD Brt -",

    -- CMFCD
    PNT_767 = "Center MFCD Sym +",
    PNT_768 = "Center MFCD Sym -",
    PNT_769 = "Center MFCD U1",
    PNT_770 = "Center MFCD U2",
    PNT_771 = "Center MFCD U3",
    PNT_772 = "Center MFCD U4",
    PNT_773 = "Center MFCD U5",
    PNT_774 = "Center MFCD Power",
    PNT_775 = "Center MFCD L1",
    PNT_776 = "Center MFCD L2",
    PNT_777 = "Center MFCD L3",
    PNT_778 = "Center MFCD L4",
    PNT_779 = "Center MFCD L5",
    PNT_780 = "Center MFCD L6",
    PNT_781 = "Center MFCD L7",
    PNT_782 = "Center MFCD L8",
    PNT_783 = "Center MFCD R1",
    PNT_784 = "Center MFCD R2",
    PNT_785 = "Center MFCD R3",
    PNT_786 = "Center MFCD R4",
    PNT_787 = "Center MFCD R5",
    PNT_788 = "Center MFCD R6",
    PNT_789 = "Center MFCD R7",
    PNT_790 = "Center MFCD R8",
    PNT_791 = "Center MFCD D1",
    PNT_792 = "Center MFCD D2",
    PNT_793 = "Center MFCD D3",
    PNT_794 = "Center MFCD D4",
    PNT_795 = "Center MFCD D5",
    PNT_796 = "Center MFCD Cont +",
    PNT_797 = "Center MFCD Cont -",
    PNT_798 = "Center MFCD Brt +",
    PNT_799 = "Center MFCD Brt -",

    -- RMFCD
    PNT_800 = "Right MFCD Sym +",
    PNT_801 = "Right MFCD Sym -",
    PNT_802 = "Right MFCD U1",
    PNT_803 = "Right MFCD U2",
    PNT_804 = "Right MFCD U3",
    PNT_805 = "Right MFCD U4",
    PNT_806 = "Right MFCD U5",
    PNT_807 = "Right MFCD Power",
    PNT_808 = "Right MFCD L1",
    PNT_809 = "Right MFCD L2",
    PNT_810 = "Right MFCD L3",
    PNT_811 = "Right MFCD L4",
    PNT_812 = "Right MFCD L5",
    PNT_813 = "Right MFCD L6",
    PNT_814 = "Right MFCD L7",
    PNT_815 = "Right MFCD L8",
    PNT_816 = "Right MFCD R1",
    PNT_817 = "Right MFCD R2",
    PNT_818 = "Right MFCD R3",
    PNT_819 = "Right MFCD R4",
    PNT_820 = "Right MFCD R5",
    PNT_821 = "Right MFCD R6",
    PNT_822 = "Right MFCD R7",
    PNT_823 = "Right MFCD R8",
    PNT_824 = "Right MFCD D1",
    PNT_825 = "Right MFCD D2",
    PNT_826 = "Right MFCD D3",
    PNT_827 = "Right MFCD D4",
    PNT_828 = "Right MFCD D5",
    PNT_829 = "Right MFCD Cont +",
    PNT_830 = "Right MFCD Cont -",
    PNT_831 = "Right MFCD Brt +",
    PNT_832 = "Right MFCD Brt -",


    PNT_840 = "BARO Altitude Setting Knob",
    PNT_841 = "Emergency Brake Handle",
    PNT_842 = "Master Warning",
    PNT_843 = "Fire Warning",
    PNT_844 = "FCS Warning",

    PNT_845 = 'Digital Clock Switch',
    PNT_846 = 'Digital Clock Brightness +',
    PNT_847 = 'Digital Clock Brightness -',
    PNT_848 = 'Digital Clock UTC',
    PNT_849 = 'Digital Clock CHR',

    PNT_900 = "Warning Panel Day/Night Switch",
    PNT_901 = "Warning Panel Brightness Knob",
    PNT_902 = "Warning Panel Test Button",
    PNT_903 = "Oxygen Indicator Brightness Knob",
    PNT_904 = "Battery Switch",
    PNT_905 = "Main AC Gen Switch",
    PNT_906 = "DC Gen Switch",
    PNT_907 = "HUD/MFCD Day/Night Switch",--whisky.actual@gmail.com
    PNT_908 = "INS Mode Knob Selector",

    -- AAP
    PNT_909 = "Brightness Knob",
    PNT_910 = "HUD Symbology Reject Switch",
    PNT_911 = "AAP ACMI",
    PNT_912 = "AAP N/A",
    PNT_913 = "AAP N/A",
    PNT_914 = "AAP N/A",
    PNT_915 = "AAP HMD",--whisky.actual@gmail.com
    PNT_916 = "AAP SPJ",
    PNT_917 = "AAP CLDP",
    PNT_918 = "AAP IRST",
    PNT_919 = "AAP RDR",
    PNT_920 = "AAP SLNK",
    PNT_921 = "AAP OESP",
    PNT_922 = "AAP RWR",
    PNT_923 = "AAP COM1",
    PNT_924 = "AAP COM2",
    PNT_925 = "AAP NAV",
    PNT_926 = "AAP IFF",
    PNT_927 = "AAP INS",
    PNT_928 = "AAP WMMC1",
    PNT_929 = "AAP WMMC2",
    PNT_930 = "AAP SAIU",
    PNT_931 = "AAP CMBT",
    PNT_932 = "AAP TRAIN",
    PNT_933 = "AAP OFF",

    -- ACP
    PNT_934 = "COM1 Volume Knob",
    PNT_935 = "Intercom Switch",
    PNT_936 = "Radio Top/Bottom Antenna Switch",
    PNT_937 = "Speaker Control Box Audio Channel Switch",
    PNT_938 = "COM2 Volume Knob",
    PNT_939 = "TCN/ILS Volume Knob",
    PNT_940 = "MSL Volume Knob",

    -- ECS
    PNT_941 = "Air Temp Knob Selector",
    PNT_942 = "ECS Mode Knob Selector",
    PNT_943 = "Defog Switch",

    -- Lights
    PNT_944 = "Inst. Light Knob",
    PNT_945 = "Console Light Knob",
    PNT_946 = "Flood Light Knob",

    PNT_947 = "Exterior Light Master Switch",
    PNT_948 = "Formation Light Knob Selector",
    PNT_949 = "Anti-Collision Light Knob Selector",
    PNT_950 = "Navigation Light Switch - Bright/Off/Dim",
    PNT_951 = "Navigation Light Switch - Flash/Steady",
    PNT_952 = "Light Switch - Tow/Off/Anti-Collision",

    PNT_963 = 'AAR Light Switch',
    PNT_964 = 'AAR Light Brightness Knob',

    -- DTC
    PNT_953 = "DTC Card Insertion",
    PNT_974 = "DTC Card Ejection",

    -- Emergency LG
    PNT_954 = "Emergency Landing Gear Cover",
    PNT_955 = "Emergency Landing Gear Handle",

    -- Canopy
    PNT_957 = "Canopy Seal Handle",
    PNT_958 = "Canopy Open/Close Handle",
    PNT_959 = "Canopy Manual Open/Close Crank",

    -- Mirror
    PNT_960 = "Mirror Right",
    PNT_961 = "Mirror Center",
    PNT_962 = "Mirror Left",

    -- Flood light
    PNT_965 = "Flood Light Direction",
    PNT_966 = "Flood Light Direction",
    PNT_967 = "Flood Light Direction",
    PNT_968 = "Flood Light Direction",

    -- Flash light
    PNT_969 = "Flash Light",

    -- Stick
    PNT_970 = "Stick Show/Hide",
    PNT_971 = "A/P Disengage",

    -- Eject Seat
    PNT_972 = "Eject Seat Safe/Arm Handle",
    PNT_973 = "Eject Seat Firing Handle Safety Pin",
    PNT_980 = "Eject Seat Position Adjust Switch",
    PNT_981 = "Eject Seat Firing Handle",

    -- Oxy
    PNT_975 = "Oxygen Tube Connector",
    PNT_976 = "Oxygen Supply Valve",
    PNT_977 = "Oxygen 100% O2",
    PNT_978 = "Eject Seat Emergency O2",
    PNT_979 = "G-Suit Connector",
}
----------------------------------------------------------------------------------------
-- JF-39
----------------------------------------------------------------------------------------
start_command   = 4200
local __count = start_command-1
local function __counter()
	__count = __count + 1
	return __count
end

device_commands =
{
	--JF39_HMD	= __counter(),
    JF39_MFCD   = __counter(),
}
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------