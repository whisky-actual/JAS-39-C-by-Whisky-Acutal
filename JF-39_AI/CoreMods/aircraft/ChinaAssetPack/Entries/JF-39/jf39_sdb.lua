local ls6_250_name  = 'GBU-39 SDB 285lb Guided Glide-Bomb'
local ls6_250_mass  = 275.0
local pylon_mass = 45.0
local ls6_250_model = "jf39_gbu-39"

local LS6_250_warhead = 
{
    mass                 = 100, 
    caliber              = 299,
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 3.0, 1.0 },
    cumulative_factor    = 3.0,
    cumulative_thickness = 0.0,
}

LS_6_250 =
{
    category        = CAT_MISSILES,
    name            = ls6_250_name,
    user_name       = _(ls6_250_name),
    scheme          = "AGM-154C",
    class_name      = "wAmmunitionCruise",
    model           = 'jf39_gbu-39',
    mass            = ls6_250_mass,
    
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},

    Escort          = 0,
    Head_Type       = 5,
    sigma           = {20, 20, 20},
    M               = ls6_250_mass,
    H_max           = 28000.0,
    H_min           = 100,
    Diam            = 299.0,
    Cx_pil          = 8,
    D_max           = 130000.0,
    D_min           = 5000.0,
    Head_Form       = 1,
    Life_Time       = 9999,
    Nr_max          = 10,
    v_min           = 10.0,
    v_mid           = 200.0,
    Mach_max        = 1.7,
    t_b             = 0.0,
    t_acc           = 0.0,
    t_marsh         = 0.0,
    Range_max       = 140000.0,
    H_min_t         = 0.0,
    Fi_start        = 3.14152,
    Fi_rak          = 3.14152,
    Fi_excort       = 3.14152,
    Fi_search       = 99.9,
    OmViz_max       = 99.9,
    X_back          = 0.0,
    Y_back          = 0.0,
    Z_back          = 0.0,
    Reflection      = 0.03,
    KillDistance    = 0.0,
    
    LaunchDistData =
    {
        17,        10,
        
                 100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        100,     0,        0,        0,        0,        10000,    19000,    25000,    30000,    33000,    37000,
        200,     0,        0,        0,        10000,    16000,    24000,    30000,    34000,    38000,    41000,
        500,     0,        0,        0,        12000,    24000,    32000,    38000,    42000,    45000,    48000,
        800,     0,        0,        0,        15000,    27000,    35000,    40000,    44000,    48000,    51000,
        1000,    0,        0,        0,        17000,    29000,    36000,    42000,    46000,    49000,    53000,
        2000,    0,        0,        14000,    24000,    37000,    43000,    50000,    54000,    57000,    60000,
        3000,    0,        0,        21000,    32000,    42000,    51000,    57000,    61000,    65000,    69000,
        4000,    11000,    11000,    27000,    40000,    51000,    58000,    64000,    69000,    73000,    76000,
        5000,    21000,    22000,    28000,    48000,    58000,    64000,    70000,    76000,    79000,    84000,
        6000,    25000,    25000,    28000,    50000,    60000,    67000,    76000,    81000,    86000,    91000,
        7000,    34000,    34000,    35000,    51000,    62000,    68000,    83000,    88000,    93000,    97000,
        8000,    36000,    37000,    38000,    52000,    63000,    69000,    88000,    94000,    99000,    104000,
        9000,    43000,    44000,    45000,    53000,    64000,    71000,    94000,    99000,    104000,   110000,
        10000,   61000,    68000,    76000,    84000,    91000,    95000,    98000,    104000,   108000,   114000,
        11000,   67000,    74000,    81000,    89000,    95000,    99000,    101000,   106000,   112000,   114000,
        13000,   76000,    83000,    91000,    98000,    105000,   109000,   110000,   112000,   116000,   121000,
        15000,   83000,    91000,    98000,    106000,   113000,   115000,   117000,   119000,   122000,   125000,
    },
    
    shape_table_data =
    {
        {
            name     = ls6_250_name,
            file     = ls6_250_model,
            life     = 1,
            fire     = { 0, 1},
            username = ls6_250_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
        
    fm = {
        mass                = ls6_250_mass,
        caliber             = 0.299,
        cx_coeff            = {1, 0.8, 0.8, 0.15, 1.5},
        L                   = 2.48,
        I                   = 1 / 12 * ls6_250_mass * 2.48 * 2.48,
        Ma                  = 2,
        Mw                  = 7,
        wind_sigma          = 0.0,
        wind_time           = 0.0,
        Sw                  = 1.1,
        dCydA               = {0.07, 0.036},
        A                   = 0.1,
        maxAoa              = 0.4,
        finsTau             = 1.2,
        Ma_x                = 2,
        Ma_z                = 2,
        Mw_x                = 1.4,
        
        addDeplSw           = 0.6,
        no_wings_A_mlt      = 2,
        wingsDeplProcTime   = 5,
        wingsDeplDelay      = 9999,
        no_wings_cx_coeff   = {1, 0.4, 0.8, 0.10, 1.5},
    },
    
    simple_seeker = {
        sensitivity  = 0,
        delay        = 2.5,
        FOV          = 0.6,
        maxW         = 500,
        opTime       = 9999,
    },
    
    control_block = {
        seeker_activation_dist       = 7000,
        default_cruise_height        = -1,
        obj_sensor                   = 1,
        can_update_target_pos        = 0,
        turn_before_point_reach      = 1,
        turn_hor_N                   = 2.2,
        turn_max_calc_angle_deg      = 90,
        turn_point_trigger_dist      = 100,
    },
    
    autopilot = {
        delay                        = 2.5,
        K                            = 500 / 2.0,
        Ki                           = 0.00005,
        Kg                           = 8 / 2.0,
        nw_K                         = 30 / 2.0,
        nw_Ki                        = 0.0,
        nw_Kg                        = 25 / 2.0,
        finsLimit                    = 0.8,
        useJumpByDefault             = 0,
        J_Power_K                    = 6 / 2.0,
        J_Diff_K                     = 3 / 2.0,
        J_Int_K                      = 0.0,
        J_Angle_W                    = 0.1,
        hKp_err                      = 460,
        hKp_err_croll                = 0.012,
        hKd                          = -0.008,
        max_roll                     = 1.3,
        egm_Angle_K                  = 0.2,
        egm_FinAngle_K               = 0.3,
        egm_add_power_K              = 0.2,
        wings_depl_fins_limit_K      = 0.3,
        err_new_wlos_k               = 0.8,
        err_aoaz_k                   = 28,
        err_aoaz_sign_k              = 0.18,
		fins_limit			= math.rad(30),
		fins_limit_x		= math.rad(5),
		null_roll			= math.rad(-45),
    },
        
    warhead     = LS6_250_warhead,
    warhead_air = LS6_250_warhead,
}

declare_weapon(LS_6_250)

declare_loadout({
    category         = CAT_BOMBS,
    CLSID            = 'DIS_LS_6_250',
	wsTypeOfWeapon   = LS_6_250.wsTypeOfWeapon,
	attribute        = {4, 4, 32, WSTYPE_PLACEHOLDER},
    Count            = 2,
    Cx_pil           = 0.0012,
    Picture          = "jf39_gbu39.png",
    displayName      = _(ls6_250_name .. "GBU-39 SDB x2"),
    Weight           = LS_6_250.mass * 2 + pylon_mass,
    ejectImpulse     = eject_speed * LS_6_250.mass,
    ejectDirection   = {0, -2, 0},
    Elements = {
        {
            ShapeName = "BRU_33A",
            IsAdapter = true
        },
        {
			connector_name =	"Point01",
			ShapeName	=	"ls6_250_model",
        },
        {
			connector_name =	"Point02",		
			ShapeName	=	"ls6_250_model",
        },
    },
})

local ldout_cnt = 4

declare_loadout({
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_250_DUAL_L",
	wsTypeOfWeapon   = LS_6_250.wsTypeOfWeapon,
	attribute        = {4, 4, 32, WSTYPE_PLACEHOLDER},
	Count            = 4,--ldout_cnt,
	Cx_pil           = 0.0012 * ldout_cnt + 0.00122,
    Picture          = "jf39_gbu39.png",
	displayName      = _(ls6_250_name .. "GBU-39 SDB x4"),
	Weight           = LS_6_250.mass * ldout_cnt + pylon_mass,
	ejectImpulse     = eject_speed * LS_6_250.mass,
	ejectDirection   = {0, -2, 0},
    Elements = {
        {
            ShapeName = "jf39_bru_61",
            IsAdapter = true
        },
        {
			connector_name =	"AttachPoint001",
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint002",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint003",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint004",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
    },
})

declare_loadout({
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_250_DUAL_R",
	wsTypeOfWeapon   = LS_6_250.wsTypeOfWeapon,
	attribute        = {4, 4, 32, WSTYPE_PLACEHOLDER},
	Count            = 4,--ldout_cnt,
	Cx_pil           = 0.0012 * ldout_cnt + 0.00122,
    Picture          = "jf39_gbu39.png",
	displayName      = _(ls6_250_name .. "GBU-39 SDB x4"),
	Weight           = LS_6_250.mass * ldout_cnt + pylon_mass,
	ejectImpulse     = eject_speed * LS_6_250.mass,
    ejectDirection   = {0, -2, 0},	
    Elements = {
        {
            ShapeName = "jf39_bru_61",
            IsAdapter = true
        },
        {
			connector_name =	"AttachPoint001",
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint002",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint003",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint004",		
			ShapeName	=	"ls6_250_model",
			Rotation = {0,0,0},
        },
    },
})
--[[
local ls6_100_name  = 'LS-6-100'
local ls6_100_model = "jf39_gbu-39"
local ls6_100_mass  = 129.0
local pylon_mass    = 45.0

local LS6_100_warhead = 
{
    mass                 = 100, 
    caliber              = 299,
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 3.0, 1.0 },
    cumulative_factor    = 3.0,
    cumulative_thickness = 0.0,
}

LS_6_100 =
{
    category        = CAT_BOMBS,
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, WSTYPE_PLACEHOLDER},
    type            = 4,
    mass            = ls6_100_mass,
    hMin            = 400.0,
    hMax            = 15000.0,
    Cx              = 0.00043,
    VyHold          = -100.0,
    Ag              = -1.23,

    name            = ls6_100_name,
    model           = ls6_100_model,
    user_name       = _(ls6_100_name),
    scheme          = "bomb_jdam_laser",
    class_name      = "wAmmunitionLaserHoming",

    shape_table_data =
    {
        {
            name        = ls6_100_mass,
            file        = ls6_100_model,
            life        = 1,
            fire        = {0, 1},
            username    = ls6_100_mass,
            index       = WSTYPE_PLACEHOLDER,
        },
    },

    LaunchDistData =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    740,    1930,    4060,    6680,    9390,    9600,    9960,    14460,    14500,    14060,
        500,    930,    2010,    4000,    6860,    13940,    16560,    18830,    17900,    18370,    17940,
        600,    1290,    2000,    4480,    7050,    13800,    16980,    17870,    17890,    17910,    17950,
        700,    1060,    1890,    4230,    7680,    14080,    17330,    19700,    21630,    21650,    21680,
        800,    1750,    2250,    4425,    7150,    14950,    17675,    19800,    22300,    22850,    22875,
        900,    1500,    1975,    5300,    7050,    15275,    18075,    19950,    19975,    22850,    22875,
        1000,    1525,    2125,    4600,    7525,    15625,    16275,    16300,    17175,    22875,    22900,
        2000,    2450,    5075,    8750,    8800,    18700,    21925,    24475,    26775,    28700,    30725,
        3000,    5000,    6600,    11200,    16200,    22100,    25250,    28050,    30550,    32750,    34800,
        4000,    4650,    7300,    13050,    18700,    24600,    28750,    31700,    34200,    36650,    38800,
        5000,    6200,    8000,    12500,    20800,    27800,    32400,    35400,    37700,    39600,    41500,
        6000,    7750,    12500,    15500,    23000,    29750,    35250,    39000,    41250,    43500,    45500,
        7000,    14000,    15000,    17000,    23750,    31750,    38250,    42500,    45000,    47250,    49500,
        8000,    16750,    17500,    19500,    25000,    33500,    40500,    45250,    48500,    50750,    53500,
        9000,    19750,    20500,    22500,    25750,    34750,    42500,    48500,    51750,    54500,    57500,
        10000,    22750,    24000,    25500,    27000,    35500,    44000,    50250,    54750,    57750,    61250,
        11000,    25500,    27000,    28500,    30000,    36000,    45000,    52500,    57000,    60500,    64500,
        12000,    28000,    29000,    31500,    33000,    36000,    45500,    53500,    59500,    64000,    67500,
        13000,    29500,    33000,    35000,    36500,    38000,    46000,    54500,    61500,    66500,    71000,
        14000,    29500,    32000,    37500,    40000,    41500,    46000,    55000,    63500,    69000,    75000,
        15000,    30500,    35000,    39500,    43000,    45500,    46000,    55500,    64500,    71000,    77000,
    },

    MinLaunchDistData =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    700,    970,    1250,    1560,    2010,    2300,    2600,    9380,    10030,    3610,
        500,    880,    1040,    1320,    1660,    2400,    2860,    16850,    3480,    10290,    4020,
        600,    840,    1100,    1420,    1730,    2470,    2990,    3340,    3620,    3900,    4200,
        700,    1030,    1130,    1450,    1820,    2570,    3100,    3570,    3990,    4290,    4610,
        800,    1700,    1175,    1525,    1825,    2700,    3225,    3675,    4150,    4500,    4850,
        900,    900,    1200,    1600,    1875,    2750,    3325,    3775,    4125,    4625,    4975,
        1000,    925,    1225,    1575,    1925,    2825,    3275,    3650,    4050,    4750,    5125,
        2000,    1775,    1375,    1875,    2075,    3625,    3975,    4700,    5375,    5975,    6625,
        3000,    950,    1050,    1650,    2200,    2900,    4050,    5050,    5950,    6700,    7450,
        4000,    2300,    4750,    2350,    2850,    3500,    3250,    5050,    6150,    7150,    8050,
        5000,    2100,    4700,    2400,    3100,    3700,    4500,    4300,    6100,    7300,    8400,
        6000,    2000,    4500,    2500,    12750,    4000,    4750,    5750,    5250,    7250,    8500,
        7000,    2000,    2500,    2500,    3250,    4000,    5000,    6000,    3000,    6500,    8500,
        8000,    2000,    3000,    3000,    3500,    4500,    5000,    5750,    7000,    3500,    7750,
        9000,    1750,    3000,    3500,    4000,    4750,    5500,    6250,    7250,    3750,    6250,
        10000,    2000,    3500,    3750,    4250,    5000,    5750,    6500,    7750,    3750,    4500,
        11000,    2000,    4000,    4500,    4500,    5000,    6000,    7000,    8000,    4000,    4500,
        12000,    2500,    4000,    4500,    4500,    5500,    6000,    7000,    9000,    4500,    4500,
        13000,    2500,    4000,    5500,    5500,    5500,    6500,    7500,    9500,    4500,    5500,
        14000,    2000,    4000,    5500,    5500,    6000,    6500,    8000,    10000,    4500,    6000,
        15000,    2000,    4500,    6000,    6500,    6500,    7000,    8500,    11000,    5000,    15500,
    },

    AspectDistData =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    2,        14,        24,        33,        20,        38,        19,        6,        3,        21,
        500,    11,        7,        25,        33,        18,        34,        27,        4,        26,        17,
        600,    14,        18,        23,        33,        23,        44,        41,        17,        5,        5,
        700,    14,        10,        32,        28,        26,        45,        41,        37,        21,        26,
        800,    2,        7,        25,        34,        20,        45,        45,        37,        26,        21,
        900,    9,        26,        21,        35,        18,        45,        39,        43,        37,        38,
        1000,    4,        28,        28,        34,        18,        45,        45,        44,        45,        40,
        2000,    24,        25,        20,        36,        45,        45,        45,        45,        45,        45,
        3000,    38,        4,        28,        45,        45,        45,        45,        45,        45,        45,
        4000,    45,        18,        45,        45,        45,        45,        45,        45,        45,        45,
        5000,    45,        29,        45,        45,        45,        45,        45,        45,        45,        37,
        6000,    45,        45,        45,        45,        45,        45,        45,        45,        45,        20,
        7000,    45,        45,        45,        45,        45,        45,        45,        45,        45,        26,
        8000,    45,        45,        45,        45,        45,        45,        45,        45,        45,        10,
        9000,    45,        45,        45,        45,        45,        45,        45,        45,        45,        6,
        10000,    45,        5,        45,        45,        45,        45,        45,        45,        45,        9,
        11000,    45,        45,        45,        45,        15,        45,        45,        45,        45,        11,
        12000,    45,        45,        45,        45,        29,        45,        45,        45,        45,        10,
        13000,    45,        45,        45,        45,        45,        45,        45,        45,        33,        13,
        14000,    45,        45,        45,        45,        45,        45,        45,        45,        5,        7,
        15000,    45,        45,        45,        45,        45,        45,        45,        45,        13,        45,
    },

    MaxTOF =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    8.3,    17.5,    32.2,    39.5,    36.4,    31.7,    30,        43.6,    40.4,    36.5,
        500,    10.2,    17.9,    25.9,    41.7,    76.2,    63.4,    72.7,    57,        59,        49.7,
        600,    14.9,    15.2,    37.1,    42.8,    71.6,    69.8,    61.2,    56.6,    53,        49.7,
        700,    12.3,    13.6,    27,        54.6,    74.9,    71.2,    74.7,    80.3,    68.3,    71.9,
        800,    19.2,    17.2,    28.2,    40.1,    74.1,    72.7,    74.9,    81.6,    85.4,    68.7,
        900,    17.2,    14.7,    43,        38.6,    74.8,    74.5,    76.5,    74.6,    84.2,    68.3,
        1000,    17.9,    16.5,    29.1,    42.1,    77.4,    66.8,    61.1,    52.3,    83.4,    77.9,
        2000,    28.1,    41.9,    56.3,    51.2,    87.5,    87.9,    91.4,    96.8,    102.7,    107.8,
        3000,    49.5,    57.7,    71.9,    87,        100.6,    99.3,    104.1,    109.8,    116.6,    121.4,
        4000,    48,        60.1,    84.2,    94.5,    107.6,    111.2,    116.2,    122.1,    129.2,    134,
        5000,    60.7,    72.1,    90.4,    107.1,    120.7,    126.2,    127.9,    134,    138.5,    141.9,
        6000,    73.4,    89.5,    85.8,    111.5,    127.2,    135.2,    139.8,    142.7,    146.7,    148.3,
        7000,    92.9,    98.3,    102.1,    110.6,    127.7,    145.1,    152.3,    154.6,    156.2,    157.1,
        8000,    104.8,    106.2,    124,    117.4,    137.6,    152.7,    161,    165.2,    164.8,    166.9,
        9000,    116.6,    116.6,    138.9,    120.7,    142.3,    159.8,    174.1,    175.7,    176.5,    178.4,
        10000,    127.7,    130.8,    146,    124.4,    144.3,    164.7,    177.4,    185.3,    185.4,    188.4,
        11000,    134.8,    135.9,    147.5,    139.2,    146.1,    167.3,    185.8,    190.6,    191.6,    195.8,
        12000,    142.9,    144.2,    152.4,    161.2,    144.9,    167.2,    185.8,    198.1,    202.8,    202.1,
        13000,    136.8,    149.5,    159.9,    168.7,    176.3,    169.5,    187.1,    203,    208.5,    211.8,
        14000,    132.1,    145,    161.1,    175.3,    185.9,    170,    187,    209.7,    215.2,    225.4,
        15000,    133.8,    146.5,    161.3,    178.7,    193.7,    172.5,    188.8,    211.1,    220.3,    228.4,
    },

    MinTOF =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    8.2,    7.4,    6.9,    6.7,    7,        6.9,    6.9,    25.6,    25.8,    7.2,
        500,    9.9,    8.2,    7.5,    7.2,    8.3,    8.6,    56.9,    8.4,    26.4,    8.2,
        600,    10.1,    9,        8.2,    7.7,    8.7,    9,        9,        8.8,    8.7,    8.6,
        700,    12.1,    9.7,    8.9,    8.3,    9.1,    9.4,    9.7,    9.8,    9.7,    9.5,
        800,    19,        10.4,    9.4,    8.7,    9.6,    9.9,    10,        10.3,    10.2,    10.1,
        900,    12.5,    11.1,    10.1,    9.2,    10,        10.3,    10.4,    10.3,    10.6,    10.4,
        1000,    13.2,    11.7,    10.6,    9.7,    10.4,    10.3,    10.2,    10.2,    10.9,    10.8,
        2000,    26.2,    17.9,    15.9,    14.3,    14.5,    13.8,    14,        14.3,    14.6,    14.8,
        3000,    28.4,    24.2,    21.1,    18.4,    16.8,    16.3,    16.6,    17,        17.3,    17.5,
        4000,    38.4,    46.5,    24.5,    22.2,    20.4,    18.9,    18.9,    19.1,    19.6,    19.8,
        5000,    40.7,    50.4,    28.8,    25.7,    23.6,    22.4,    20.9,    21.3,    21.6,    21.9,
        6000,    43.6,    54,        32.8,    66.9,    26.8,    25.2,    24.4,    23.1,    23.6,    23.8,
        7000,    46.2,    45.7,    36.9,    32.3,    29.8,    28.1,    27.1,    28.2,    25.3,    25.8,
        8000,    48.7,    54.2,    40,        35.6,    32.7,    30.8,    29.4,    29,        30.9,    27.5,
        9000,    51.7,    55.5,    43.5,    38.6,    35.6,    33.6,    32.2,    31.5,    33.7,    30.8,
        10000,    53.2,    55.8,    47,        41.6,    38.4,    36.3,    34.8,    34.2,    37.2,    37.4,
        11000,    55.2,    58.8,    50.6,    44.3,    41.2,    39,        37.5,    36.9,    40.4,    41.5,
        12000,    56.5,    59.3,    53.3,    47.4,    43.9,    41.6,    40.1,    39.7,    43.2,    45.7,
        13000,    59,        61,        60.6,    50.1,    46.6,    44.2,    42.8,    42.3,    47.3,    47.7,
        14000,    61.2,    63.6,    61.7,    52.7,    49.3,    46.9,    45.4,    44.9,    51.6,    51.2,
        15000,    63.1,    65,        66.8,    55.9,    51.9,    49.5,    48.1,    47.6,    55,        45.9,
    },

    MidTOF =
    {
        21,        10,

                100,    150,    200,    250,    300,    350,    400,    450,    500,    550,
        400,    8.2,    10.1,    14,        17.5,    20.6,    18.7,    17.6,    34,        33,        20.3,
        500,    10.1,    10.8,    13.9,    17.9,    32.1,    32.2,    61.5,    29.8,    40,        26.4,
        600,    12.1,    11.5,    15.8,    19,        30.5,    33.7,    31.9,    29.8,    28.3,    26.6,
        700,    12.2,    11.3,    14.9,    20.6,    32.6,    34.1,    35.5,    36.7,    34.9,    32.8,
        800,    19.1,    12.9,    15.6,    18.8,    35.6,    36,        36,        38.6,    37.3,    35.2,
        900,    14.5,    12.4,    18.7,    18.8,    36.5,    37.2,    36.9,    33.9,    37.2,    35.2,
        1000,    15.3,    13.2,    16.4,    20.1,    38.1,    32.4,    29.6,    29,        37.3,    35.2,
        2000,    26.9,    27.8,    34,        24,        49,        48,        47.9,    49.2,    49.5,    50,
        3000,    34.1,    32.8,    45.6,    49.3,    55.9,    55.2,    55.4,    57,        56.9,    57.7,
        4000,    39.1,    51.2,    62.3,    79.8,    65.5,    60.3,    62.5,    63.3,    64.9,    64.7,
        5000,    43.4,    54,        65.9,    68,        76.6,    72.4,    67.8,    69.8,    69.1,    69,
        6000,    51.8,    75.5,    52.8,    82.3,    79.1,    80,        79.2,    73.6,    75.5,    74,
        7000,    74.4,    75.7,    68.4,    68.8,    79.9,    82.4,    88.3,    75,        78.5,    80.2,
        8000,    86.4,    86.1,    74.7,    67.8,    85.3,    87,        93.2,    91.1,    76.2,    81.4,
        9000,    96.1,    96.7,    80.7,    70,        80.4,    91,        104.3,    96.4,    81.9,    83,
        10000,    106.1,    108.8,    109,    103.5,    82,        90.9,    106.3,    101.8,    84.4,    83.3,
        11000,    114.6,    118.2,    118.7,    112.3,    117.6,    102.9,    114.1,    105.5,    86.8,    85.5,
        12000,    95.8,    104.5,    126.1,    121.3,    116.9,    104.1,    108.6,    112.4,    93.7,    87.6,
        13000,    102.5,    104.9,    137,    134.3,    120.7,    114.8,    109.2,    111.4,    93.3,    92,
        14000,    114.4,    128.7,    141.8,    141.6,    133.3,    102.7,    108,    115.1,    96.1,    96.5,
        15000,    110.5,    112.8,    137.8,    149.6,    147.3,    101.5,    108.5,    116.3,    99.6,    115.1,
    },

    fm = {
        mass           = ls6_100_mass,
        caliber        = 0.160,
        cx_coeff       = {1, 0.45, 0.8, 0.15, 1.55},
        L              = 0.160/5,
        I              = 26.5,
        I_x            = 0.282,
        wind_time      = 0.0,
        wind_sigma     = 0.0,
        dCydA          = {0.04, 0.022},
        A              = 0.6,
        maxAoa         = math.rad(25),
        finsTau        = 0.1,
        fins_gain      = 100,
        ideal_fins     = 1,
        Sw             = 0.059*5,
        Ma             = 6.3,
        Mw             = 3.0,
        Ma_x           = 9.5,
        Mw_x           = 3.5,
        model_roll     = math.rad(-45),
    },

    seeker = {
        CEP                 = 5.0,
        coalition           = 2,
        coalition_rnd_coeff = 5.0,
    },

    laser_seeker = {
        delay               = 2.0,
        FOV                 = math.rad(35),
        max_seeker_range    = 4500,
    },

    autopilot = {
        delay               = 1.0,
        op_time             = 9000,
        Tf                  = 0.05,
        Knav                = 3.0,
        Kd                  = 390 / 2.8, -- 480
        Ka                  = 6.0 / 2.8, -- 6.0
        Tc                  = 0.1,
        Kx                  = 0.1,
        Krx                 = 4.0,
        gload_limit         = 3.0,
        fins_limit          = math.rad(30),
        fins_limit_x        = math.rad(5),
        null_roll           = math.rad(-45),
        KD0                 = 0.059 / ls6_100_mass,
        KDI                 = 0.6 * ls6_100_mass / 0.3,
        KLM                 = 0.7 * 0.059 * 5 / ls6_100_mass,
    },

    targeting_data =
    {
        char_time = 20.5,
    },

    warhead = LS6_100_warhead,
}

declare_weapon(LS_6_100)

local ldout_cnt = 1

declare_loadout({
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_100",
    attribute        = LS_6_100.wsTypeOfWeapon,
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx,
    Picture          = "jf39_gbu39.png",
    displayName      = LS_6_100.user_name,
    Weight           = LS_6_100.mass + pylon_mass,
    Elements         = {{ShapeName = ls6_100_model}},
    ejectImpulse     = eject_speed * LS_6_100.mass,
    ejectDirection   = {0, -2, 0},
})

ldout_cnt = 4

LS6_100_DUAL_L = {
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_100_DUAL_L",
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx * ldout_cnt + 0.00122,
    Picture          = "jf39_gbu39.png",
    displayName      = _(ls6_100_name .. " Dual"),
    Weight           = LS_6_100.mass * ldout_cnt + pylon_mass,
    Elements = {
        {
            ShapeName = "jf39_bru_61",
            IsAdapter = true
        },
        {
			connector_name =	"AttachPoint001",
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint002",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint003",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint004",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
    },
    wsTypeOfWeapon   = LS_6_100.wsTypeOfWeapon,
    attribute        = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse     = eject_speed * LS_6_100.mass,
    ejectDirection   = {0, -2, 0},
}
declare_loadout(LS6_100_DUAL_L)


LS6_100_DUAL_R = {
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_100_DUAL_R",
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx * ldout_cnt + 0.00122,
    Picture          = "jf39_gbu39.png",
    displayName      = _(ls6_100_name .. " Dual"),
    Weight           = LS_6_100.mass * ldout_cnt + pylon_mass,
    Elements = {
        {
            ShapeName = "jf39_bru_61",
            IsAdapter = true
        },
        {
			connector_name =	"AttachPoint001",
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint002",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint003",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
        {
			connector_name =	"AttachPoint004",		
			ShapeName	=	"ls6_100_model",
			Rotation = {0,0,0},
        },
    },
    wsTypeOfWeapon   = LS_6_100.wsTypeOfWeapon,
    attribute        = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse     = eject_speed * LS_6_100.mass,
    ejectDirection   = {0, -2, 0},
}
declare_loadout(LS6_100_DUAL_R)
--]]