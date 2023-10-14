

cpt_args =
{
    -- put down cpt args here
    -- since arg id is known, so explicitly written here
    TEST_CPT_ARG = -1,

    ENGINE_RPM_N2    = 40,

    CANOPY_GLASS_DM  = 50,
    WS_GLASS_DM      = 51,

    CANOPY_GLASS_FOG = 52,
    WS_GLASS_FOG     = 53,
    
    -- 起落架指示灯
    LG_LIGHT_RED    = 100,
    LG_LIGHT_LEFT   = 101,
    LG_LIGHT_NOSE   = 102,
    LG_LIGHT_RIGHT  = 103,

    LG_LIGHT_S_B    = 104,
    LG_LIGHT_D_CH   = 105,
    LG_LIGHT_TEF    = 106,

    LG_LIGHT_HANDLE = 107,

    LG_LIGHT_BRT    = 108,

    -- FCS Reset
    FCS_LIGHT_RESET = 110,

    -- 仪表、面板背光、泛光照明
    LIGHT_BL_CONSOLES  = 120,
    LIGHT_BL_INST_DISP = 121,
    LIGHT_BL_CLOCK     = 122,

    LIGHT_FLOOD_ALL    = 125,

    -- 左上告警面板
    WARNING_LIGHT_MASTER = 130,
    WARNING_LIGHT_FIRE   = 131,
    WARNING_LIGHT_FCS    = 132,

    -- MFCD Backlight
    MFCD_BACKLIGHT_L_ONOFF = 140,
    MFCD_BACKLIGHT_L_BRT   = 141,
    MFCD_BACKLIGHT_C_ONOFF = 142,
    MFCD_BACKLIGHT_C_BRT   = 143,
    MFCD_BACKLIGHT_R_ONOFF = 144,
    MFCD_BACKLIGHT_R_BRT   = 145,

    -- UFCP按键灯
    UFCP_BTN_LIGHT_OAP   = 150,
    UFCP_BTN_LIGHT_MRK   = 151,
    UFCP_BTN_LIGHT_PU    = 152,
    UFCP_BTN_LIGHT_HNS   = 153,
    UFCP_BTN_LIGHT_AP    = 154,
    UFCP_BTN_LIGHT_FPM   = 155,
    UFCP_BTN_LIGHT_NULL1 = 156,
    UFCP_BTN_LIGHT_NULL2 = 157,

    UFCP_BTN_LIGHT_BRT   = 158,

    -- 右上状态指示灯
    STATE_LIGHT_PITCH_TRIM = 160,
    STATE_LIGHT_ROLL_TRIM  = 161,
    STATE_LIGHT_YAW_TRIM   = 162,

    STATE_LIGHT_AA   = 163,
    STATE_LIGHT_AG1  = 164,
    STATE_LIGHT_AG2  = 165,
    STATE_LIGHT_EFCS = 166,

    STATE_LIGHT_TANK_N3  = 167,
    STATE_LIGHT_TANK_N1  = 168,
    STATE_LIGHT_WING_DT  = 169,
    STATE_LIGHT_CTR_DT   = 170,
    STATE_LIGHT_CTR_NULL = 171,

    STATE_LIGHT_START    = 172,
    STATE_LIGHT_AB       = 173,
    STATE_LIGHT_COMBAT   = 174,
    STATE_LIGHT_EMG_HYD  = 175,
    STATE_LIGHT_NWS      = 176,
    STATE_LIGHT_ADVISORY = 177,

    STATE_LIGHT_BRT      = 178,

    CANOPY_STATE         = 181,

    -- 右下告警面板
    WARNING_LIGHT_NULL    = 200,
    WARNING_LIGHT_OXY_LOW = 201,
    WARNING_LIGHT_CANOPY  = 202,
    WARNING_LIGHT_HYD_LOW = 203,

    WARNING_LIGHT_AIR_DATA    = 204,
    WARNING_LIGHT_LOW_FUEL    = 205,
    WARNING_LIGHT_CABIN_PRESS = 206,
    WARNING_LIGHT_REDUCE_RPM  = 207,

    WARNING_LIGHT_CONFIG    = 208,
    WARNING_LIGHT_FUEL_PUMP = 209,
    WARNING_LIGHT_AC_SYS    = 210,
    WARNING_LIGHT_OIL       = 211,

    WARNING_LIGHT_DL         = 212,
    WARNING_LIGHT_START_PUMP = 213,
    WARNING_LIGHT_DC_GEN     = 214,
    WARNING_LIGHT_STARTER    = 215,

    WARNING_LIGHT_FCS_3    = 216,
    WARNING_LIGHT_BRAKE    = 217,
    WARNING_LIGHT_BATT     = 218,
    WARNING_LIGHT_ENG_TEMP = 219,

    WARNING_LIGHT_FCS_2      = 220,
    WARNING_LIGHT_ANTI_SKID  = 221,
    WARNING_LIGHT_TRU        = 222,
    WARNING_LIGHT_ANTI_SURGE = 223,

    WARNING_LIGHT_FCS_1      = 224,
    WARNING_LIGHT_NWS        = 225,
    WARNING_LIGHT_STATIC_INV = 226,
    WARNING_LIGHT_ANTI_ICING = 227,

    WARNING_LIGHT_ROLL_CAS = 228,
    WARNING_LIGHT_ECS      = 229,
    WARNING_LIGHT_EMMC     = 230,
    WARNING_LIGHT_SEC      = 231,

    WARNING_LIGHT_YAW_CAS   = 232,
    WARNING_LIGHT_EQUIP_HOT = 233,
    WARNING_LIGHT_LWC       = 234,
    WARNING_LIGHT_EDU       = 235,

    WARNING_LIGHT_AUTOPILOT  = 236,
    WARNING_LIGHT_PITOT_HEAT = 237,
    WARNING_LIGHT_AVIONS     = 238,
    WARNING_LIGHT_DEEC       = 239,

    WARNING_LIGHT_EFCS = 240,
    WARNING_LIGHT_SEAT = 241,

    WARNING_LIGHT_OXY_BLINK     = 242,
    WARNING_LIGHT_OXY_BLINK_BRT = 244,

    WARNING_LIGHT_BRT       = 243, -- 告警灯亮度独立控制

    --
    STICK_MOVE_PITCH = 250,
    STICK_MOVE_BANK  = 251,

    THROTTLE_MOVE    = 254,

    PEDDLE_BRAKE_L   = 256,
    PEDDLE_BRAKE_R   = 257,
    PEDDLE_MOVE_FB   = 258,
    PEDDLE_MOVE_LR   = 259,


    -- AAP按键灯
    AAP_BTN_LIGHT_ACMI  = 260,
    AAP_BTN_LIGHT_NULL1 = 261,
    AAP_BTN_LIGHT_NULL2 = 262,
    AAP_BTN_LIGHT_NULL3 = 263,

    AAP_BTN_LIGHT_HMD   = 264,
    AAP_BTN_LIGHT_SPJ   = 265,
    AAP_BTN_LIGHT_CLDP  = 266,
    AAP_BTN_LIGHT_IRST  = 267,

    AAP_BTN_LIGHT_RDR   = 268,
    AAP_BTN_LIGHT_SLNK  = 269,
    AAP_BTN_LIGHT_OESP  = 270,
    AAP_BTN_LIGHT_RWR   = 271,

    AAP_BTN_LIGHT_COM1  = 272,
    AAP_BTN_LIGHT_COM2  = 273,
    AAP_BTN_LIGHT_NAV   = 274,
    AAP_BTN_LIGHT_IFF   = 275,

    AAP_BTN_LIGHT_INS   = 276,
    AAP_BTN_LIGHT_VMMC1 = 277,
    AAP_BTN_LIGHT_VMMC2 = 278,
    AAP_BTN_LIGHT_SAIU  = 279,

    AAP_BTN_LIGHT_CMBT  = 280,
    AAP_BTN_LIGHT_TRAIN = 281,

    AAP_BTN_LIGHT_BRT   = 282,

    -- 右下供氧、气液仪表
    GUAGE_OXYGEN_NEEDLE = 290,
    GUAGE_PNEU_NEEDLE_M = 291,
    GUAGE_PNEU_NEEDLE_E = 292,

    MAG_HDG_BACKUP      = 293,

    RADIO_PAD_ERR_LIGHT = 295,

    --
    EJECT_SEAT_UP_DOWN  = 300,

    MIRROR_RIGHT        = 960,
    MIRROR_CENTER       = 961,
    MIRROR_LEFT         = 962,

    LIGHT_FLOOD_RIGHT_1 = 965,
    LIGHT_FLOOD_RIGHT_2 = 966,
    LIGHT_FLOOD_LEFT_1  = 967,
    LIGHT_FLOOD_LEFT_2  = 968,

    LIGHT_FLASH         = 969,

    STICK_SHOW_HIDE     = 970,

    STICK_AP_DISENGAGE  = 971,

    -- Eject Seat
    ESEAT_ARM_STARTER   = 972,
    ESEAT_ARM_IGNITOR   = 973,
    ESEAT_POS_ADJUST    = 980,
    ESEAT_EJECT_HANDLE  = 981,

    -- DTC card eject
    DTC_CARD_EJECT      = 974,

    -- Oxygen
    OXYGEN_TUBE_CNT     = 975,
    OXYGEN_SUPPLY_VALVE = 976,
    OXYGEN_100_O2       = 977,
    OXYGEN_SEAT_EMER    = 978,
    G_SUIT_TUBE_CNT     = 979,

}

-- 可点击
for i=500,999 do
    cpt_args['PTN_' .. i] = i
end

-- 机身模型
ext_args =
{
    -- put down external args here
    -- since arg id is known, so explicitly written here
    NLG               = 0,
    NLG_COMPRESS      = 1,
    NLG_TURN          = 2,
    MLG_R             = 3,
    MLG_R_COMPRESS    = 4,
    MLG_L             = 5,
    MLG_L_COMPRESS    = 6,
    TEF_R             = 9,
    TEF_L             = 10,
    AIL_R             = 11,
    AIL_L             = 12,
    STAB_R            = 15,
    STAB_L            = 16,
    RUDDER            = 18,
    AAR_ENABLE        = 22,
    WHEEL_CHOCK       = 23,
    INLET_COVER       = 24,
    AFTERBURNER_FLAME = 29,
    TAIL_NUM_UNIT     = 32,
    TAIL_NUM_TENTH    = 31,
    TAIL_NUM_HUNDRED  = 52,
    CANOPY            = 38,
    ANTI_COLLISION    = 83,
    NOZZLE            = 90,
    CREW_LADDER       = 91,
    NLG_WHEEL         = 101,
    MLG_L_WHEEL       = 102,
    MLG_R_WHEEL       = 103,
    HIDE              = 114,
    MLG_R_DOOR        = 115,
    MLG_L_DOOR        = 116,
    LEF_R_IN          = 130,
    LEF_R_OUT         = 131,
    LEF_L_IN          = 132,
    LEF_L_OUT         = 133,
    SPD_BRK_R_UP      = 182,
    SPD_BRK_R_DN      = 184,
    SPD_BRK_L_UP      = 186,
    SPD_BRK_L_DN      = 188,
    NAV_LIGHT_L       = 190,
    NAV_LIGHT_R       = 191,
    NAV_LIGHT_VERTICAL_STAB = 192,
    ANTI_COLLISION_STROBE   = 195,
    FORM_LIGHT_L    = 200,
    FORM_LIGHT_R    = 201,
    TAXI_LIGHT      = 208,
    LANDING_LIGHT   = 209,
    MLG_R_IND_LIGHT = 210,
    MLG_L_IND_LIGHT = 211,

    AAR_LIGHT_MECH  = 419,
    AAR_LIGHT_BRT   = 900,
    AAR_PROBE       = 901,

    HDPT_2    = 309,
    HDPT_3    = 310,
    HDPT_4    = 311,
    HDPT_5    = 312,
    HDPT_6    = 313,

    TURBO_FAN = 325,

    CHUTE_AI_DEPLOY   = 35,
    CHUTE_AI_SHAKE_EL = 36,
    CHUTE_AI_SHAKE_AZ = 37,
    CHUTE_AI_SWING_EL = 334,
    CHUTE_AI_SWING_AZ = 335,

    CHUTE_PLAYER_DEPLOY = 611,
    CHUTE_PLAYER_SHOW   = 612,
    CHUTE_PLAYER_COVER  = 613,

    AOA_SENSOR_R = 602,
    AOA_SENSOR_L = 604,

    --damage arg
    NOSE_CENTER      = 82,
    NOSE_LEFT_SIDE   = 150,
    NOSE_RIGHT_SIDE  = 149,
    COCKPIT          = 65,
    CABIN_LEFT_SIDE  = 298,
    CABIN_RIGHT_SIDE = 301,
    CABIN_BOTTOM     = 299,
    GUN              = 296,
    FRONT_GEAR_BOX   = 265,
    FUSELAGE_LEFT_SIDE  = 154,
    FUSELAGE_RIGHT_SIDE = 153,
    ENGINE          = 271,
    MTG_L_BOTTOM    = 166,
    MTG_R_BOTTOM    = 160,
    LEFT_GEAR_BOX   = 267,
    RIGHT_GEAR_BOX  = 266,
    MTG_L           = 168,
    MTG_R           = 162,
    AIR_BRAKE_L     = 189,
    AIR_BRAKE_R     = 187,
    WING_L_PART_OUT = 232,
    WING_R_PART_OUT = 222,
    WING_L_OUT      = 223,
    WING_R_OUT      = 213,
    AILERON_L       = 226,
    AILERON_R       = 216,
    WING_L_PART_CENTER = 185,
    WING_R_PART_CENTER = 183,
    WING_L_CENTER  = 224,
    WING_R_CENTER  = 214,
    WING_L_PART_IN = 230,
    WING_R_PART_IN = 220,
    WING_L_IN      = 225,
    WING_R_IN      = 215,
    FLAP_L         = 228,
    FLAP_R         = 218,
    FIN_R_TOP      = 241,
    FIN_R_CENTER   = 242,
    Line_KIL_L     = 246,
    Line_KIL_R     = 243,
    ELEVATOR_L_OUT = 239,
    ELEVATOR_R_OUT = 237,
    ELEVATOR_L_IN  = 240,
    ELEVATOR_R_IN  = 238,
    RUDDER         = 247,
    TAIL                 = 155,
    TAIL_LEFT_SIDE       = 158,
    TAIL_RIGHT_SIDE      = 157,
    TAIL_BOTTOM          = 159,
    NOSE_BOTTOM          = 148,
    FUEL_TANK_LEFT_SIDE  = 303,
    FUEL_TANK_RIGHT_SIDE = 302,
    ROTOR           = 147,
    BLADE_1_IN      = 227,
    BLADE_1_CENTER  = 231,
    BLADE_1_OUT     = 229,
    BLADE_2_IN      = 217,
    BLADE_2_CENTER  = 221,
    BLADE_2_OUT     = 219,
    BLADE_3_CENTER  = 156,
    FUSELAGE_BOTTOM = 152,
    WHEEL_F         = 134,
    WHEEL_L         = 136,
    WHEEL_R         = 135,
    FUSELAGE_TOP    = 151,
    TAIL_TOP        = 300,

    -- customized
    EXHAUST_GATE    = 910,

    MFCD_SCREEN     = 990,
    WINDSHIELD_FOG  = 991,
    CANOPY_FOG      = 992,

    STICK_MOVE_FB   = 995,
    STICK_MOVE_LR   = 996,
    THROTTLE_MOVE   = 997,

    ---- test
    -- 951-959
    -- 961-966
}
