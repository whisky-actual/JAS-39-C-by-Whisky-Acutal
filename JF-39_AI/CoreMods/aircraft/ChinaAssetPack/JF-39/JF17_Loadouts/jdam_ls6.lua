
local use_ed_wpn = false

local function clsid_ls6_100(use_ed)
    if use_ed then
        return "weapons.bombs.LS_6_100"
    else
        return "weapons.bombs.LS-6-100"
    end
end

local ls6_100_name  = 'LS-6-100'
local ls6_100_model = "ls-6-100"
local ls6_100_mass  = 88.0
local pylon_mass    = 45.0

local LS6_100_warhead = 
{
    mass                 = 40, 
    caliber              = 160,
    expl_mass            = 40,
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
            name        = ls6_100_name,
            file        = ls6_100_model,
            life        = 1,
            fire        = {0, 1},
            username    = ls6_100_name,
            index       = WSTYPE_PLACEHOLDER,
        },
    },

	LaunchDistData =
	{
		18,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	1090,	1890,	3760,	6310,	7350,	5760,	16090,	16910,	16850,	22820,	
		500,	1240,	1960,	3830,	6140,	8520,	13590,	13990,	13620,	22740,	22790,	
		700,	1000,	2120,	3960,	6680,	9620,	15840,	15840,	16160,	22840,	22840,	
		1000,	1860,	2380,	4380,	6920,	10020,	16100,	20560,	21900,	21920,	26160,	
		2000,	2400,	4850,	4950,	7850,	11300,	20200,	22850,	22900,	22900,	26750,	
		3000,	4550,	5950,	8550,	8600,	12200,	22900,	26650,	26700,	26750,	26750,	
		4000,	3850,	7050,	9350,	9400,	13150,	25750,	25800,	25850,	25900,	30350,	
		5000,	7300,	7400,	11900,	18700,	18800,	28500,	30200,	30300,	30300,	30400,	
		6000,	5600,	7300,	13000,	21100,	20000,	32000,	32000,	32000,	32100,	32200,	
		7000,	6800,	8700,	15400,	15400,	15400,	30500,	30500,	30500,	30700,	47600,	
		8000,	8000,	14200,	18600,	23200,	27200,	36200,	36200,	36200,	36400,	51200,	
		9000,	9200,	16400,	20800,	24200,	31800,	34200,	34200,	34200,	34200,	55000,	
		10000,	15600,	18000,	23200,	26400,	32800,	40200,	42800,	42800,	42800,	59000,	
		11000,	16500,	21000,	25500,	28500,	33500,	41000,	48000,	53500,	58000,	62500,	
		12000,	20000,	23000,	26000,	30500,	34500,	42500,	49500,	56000,	61000,	66500,	
		13000,	27000,	24500,	29000,	33000,	37000,	43000,	51000,	58000,	64500,	70000,	
		14000,	21000,	32000,	35500,	36500,	39000,	44000,	52000,	60000,	67500,	73500,	
		15000,	23000,	33000,	39000,	40000,	42000,	46500,	53000,	61500,	69500,	77000,	
	},

	MinLaunchDistData =
	{
		18,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	1020,	1020,	1290,	1560,	1800,	2050,	2200,	2400,	2600,	2750,	
		500,	1180,	1110,	1400,	1650,	1970,	2510,	2400,	2500,	2750,	2900,	
		700,	1100,	1260,	1580,	1840,	2200,	2840,	3140,	9160,	4060,	4380,	
		1000,	1040,	1400,	1760,	2040,	2420,	3100,	3680,	4040,	4420,	5000,	
		2000,	1250,	1900,	2050,	2450,	2800,	3700,	4400,	5550,	5350,	6150,	
		3000,	2550,	2150,	2150,	2500,	2850,	3800,	4700,	5400,	5950,	6700,	
		4000,	2550,	2250,	1900,	2350,	2700,	3750,	4400,	5400,	6150,	7450,	
		5000,	1400,	1900,	1500,	2300,	2900,	3400,	4000,	5400,	6400,	7500,	
		6000,	1800,	1300,	1600,	2200,	2400,	3200,	3300,	4600,	6200,	7500,	
		7000,	1200,	1300,	1700,	1700,	1700,	2400,	2400,	2400,	5600,	8000,	
		8000,	1200,	1600,	1800,	2000,	2200,	2600,	2600,	2600,	4200,	7800,	
		9000,	1400,	1800,	1800,	2000,	2400,	2600,	2600,	2600,	2600,	7600,	
		10000,	1800,	1800,	2000,	2200,	2400,	3800,	3000,	3000,	3000,	7600,	
		11000,	1500,	2000,	2000,	2000,	2500,	3000,	3000,	3500,	3500,	7500,	
		12000,	1500,	2000,	2000,	2000,	2500,	3000,	3000,	3500,	4000,	7500,	
		13000,	2000,	2000,	2500,	2500,	2500,	3000,	3500,	3500,	4000,	6500,	
		14000,	2000,	2500,	2500,	2500,	2500,	3000,	3500,	3500,	4000,	7500,	
		15000,	2000,	2500,	2500,	2500,	3000,	3000,	3500,	4000,	4000,	10500,	
	},

	MinTOF =
	{
		18,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	10.9,	7.6,	7,		6.7,	6.3,	6.2,	5.9,	5.8,	5.7,	5.5,		
		500,	12.6,	8.5,	7.8,	7.3,	7,		7.6,	6.5,	6.2,	6.1,	6.5,		
		700,	13,		10.1,	9.2,	8.5,	8.1,	8.7,	8.5,	24.6,	9.1,	9,		
		1000,	13.4,	12.1,	11,		10,		9.5,	9.9,	10.2,	10.1,	10.1,	10.5,		
		2000,	20,		18.8,	16.3,	14.7,	13.5,	13.3,	13.4,	14.7,	13.2,	13.7,		
		3000,	31.7,	24.5,	21.1,	19,		17.3,	16.3,	16.1,	15.9,	15.7,	15.9,		
		4000,	36.7,	30.8,	25.5,	23.2,	21.4,	19.5,	18.4,	18,		17.8,	18.5,		
		5000,	36.2,	36.2,	30.3,	26.9,	24.6,	22.9,	21.4,	20.4,	20.2,	20.2,		
		6000,	46.1,	41.5,	34.2,	30.5,	29.1,	26.4,	25.4,	23.2,	22.3,	22.1,		
		7000,	50.4,	47.2,	37.5,	35,		34.7,	31.8,	30.5,	30.7,	24.7,	24.5,		
		8000,	52.6,	54.2,	41.4,	37.9,	36.3,	34.6,	33,		32.3,	29,		26.4,		
		9000,	54.3,	58.5,	45.4,	41.4,	38.8,	38.1,	36.6,	35.5,	36.5,	28.8,		
		10000,	53.4,	60.8,	49.8,	44.4,	42.4,	38.2,	38.8,	38,		38.5,	31.6,		
		11000,	56,		62.5,	53.9,	48.9,	45.4,	43.4,	41.9,	40.3,	40.6,	34.6,		
		12000,	57.9,	62.5,	57.7,	52.1,	48.7,	46.8,	45.3,	43.7,	42.9,	37.8,		
		13000,	59,		64,		60.5,	54,		52.3,	50.8,	47.4,	47,		46.8,	43.3,		
		14000,	60.8,	64.4,	64.3,	57.3,	56.4,	54.4,	50.3,	49.9,	51,		45.4,		
		15000,	62.6,	66,		67.6,	61.1,	58.2,	57.9,	53.8,	52.8,	55.5,	44.7,		
	},

	AspectDistData =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,	
		400,	2,		9,		14,		23,		20,		20,		20,		24,		13,		10,
		500,	2,		10,		15,		24,		37,		23,		19,		24,		13,		14,
		700,	4,		10,		16,		24,		38,		29,		32,		32,		20,		18,
		1000,	6,		10,		17,		26,		38,		26,		33,		34,		36,		38,
		2000,	8,		10,		24,		29,		38,		20,		28,		34,		45,		45,
		3000,	10,		20,		24,		32,		40,		15,		22,		34,		45,		45,
		4000,	12,		20,		24,		33,		40,		15,		45,		36,		45,		45,	
		5000,	14,		20,		36,		40,		40,		40,		45,		36,		45,		45,	
		6000,	16,		18,		40,		40,		42,		45,		45,		36,		45,		45,	
		7000,	18,		38,		45,		35,		45,		45,		45,		45,		45,		45,	
		8000,	20,		22,		35,		35,		45,		45,		45,		45,		45,		35,	
		9000,	20,		22,		28,		28,		43,		45,		45,		45,		45,		35,	
		10000,	20,		22,		28,		33,		42,		45,		45,		45,		45,		35,	
		11000,	20,		22,		28,		34,		36,		38,		45,		45,		45,		45,	
		12000,	16,		21,		27,		33,		36,		38,		45,		45,		45,		45,	
	},

	MaxTOF =
	{
		18,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	11.4,	14.2,	24.8,	33.7,	27.6,	17.8,	65.9,	53.1,	49,		84.5,		
		500,	13,		15.8,	26,		28.6,	34.1,	48.8,	50.7,	39.8,	90.1,	63.7,		
		700,	11.3,	16.5,	24.6,	36.9,	46.1,	74.1,	62.7,	49.2,	72.7,	69.6,		
		1000,	19.3,	19.5,	29.1,	36.7,	49.4,	77.6,	88.3,	86.4,	84.8,	83.6,		
		2000,	26.3,	38.2,	30.7,	42.1,	55.9,	91,		91.7,	89.5,	84.3,	88.3,	
		3000,	40.2,	46.1,	59.7,	47.4,	57.6,	99.1,	108,	103.4,	116.7,	92.6,		
		4000,	38.1,	53.3,	60.6,	52.8,	62,		109.4,	99.7,	117.7,	91.9,	98.1,	
		5000,	57.2,	54.7,	78.1,	104,	100.2,	120.2,	117.1,	120.2,	136.6,	100,	
		6000,	53.6,	54.8,	83.2,	104.8,	103.7,	142.7,	122,	124.1,	142,	103,	
		7000,	60.8,	69,		93.8,	80.1,	73.1,	120.8,	119.1,	138.3,	102.3,	158.1,	
		8000,	67.7,	102.8,	109,	110.5,	134.5,	134.1,	143.5,	154.1,	156.8,	158.9,	
		9000,	74,		97.7,	119,	115.3,	131.1,	137.7,	135.6,	153.9,	109.5,	168.9,	
		10000,	107.1,	103.7,	126.3,	132,	134.8,	150.8,	151.4,	179.9,	173.6,	179.7,	
		11000,	110.7,	118.7,	133.9,	138.8,	136.9,	151.1,	166.9,	177.4,	182.1,	187.2,	
		12000,	123.1,	127.6,	136.9,	142.4,	132.3,	158.5,	170.2,	184.1,	188.9,	197.4,	
		13000,	128.2,	136,	143,	148.8,	159.8,	158.9,	174.9,	188,	199,	204.7,	
		14000,	135.4,	163.9,	155.1,	160,	161.7,	165,	177.7,	193.5,	206.8,	212.5,	
		15000,	145,	173.8,	163.8,	166.4,	170,	180.5,	182.6,	197.6,	209.5,	221.3,	
	},

	MidTOF =
	{
		18,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	11.1,	10,		13,		16.5,	15.9,	11.7,	41.6,	45.5,	38.3,	55.6,		
		500,	12.7,	10.8,	13.6,	16.2,	18.4,	26.1,	37.4,	22.1,	50.6,	49.1,		
		700,	11.2,	12.7,	14.4,	17.7,	20.8,	30.9,	28,		36.2,	6.2,	34.4,		
		1000,	16.7,	14.4,	16.5,	18.4,	22.1,	31.9,	37.7,	37.1,	34.9,	40.3,		
		2000,	20.7,	31.5,	20.2,	22.8,	25.6,	42.3,	43.2,	41.1,	37.4,	45.5,		
		3000,	36.3,	27.2,	33.9,	25.3,	28,		48.1,	51.9,	46.9,	44.1,	42,		
		4000,	36.8,	41.7,	37.6,	28.6,	30.2,	53.9,	46.6,	44.7,	42.5,	54.5,		
		5000,	45.9,	34.2,	52.4,	75.1,	42.3,	58.1,	54.7,	51.5,	49.5,	47.2,		
		6000,	44,		36.4,	55.5,	92.5,	44.1,	66.5,	55.6,	52.7,	51,		48.8,		
		7000,	47,		52.2,	56,		43.6,	36.5,	58.3,	51.3,	46.1,	47.3,	73.9,		
		8000,	49.6,	64,		65.1,	76.9,	62.9,	73.9,	61.5,	55.1,	52.9,	76.8,		
		9000,	54.5,	68.9,	79.2,	69,		91.4,	65.6,	56.2,	52.1,	47.7,	79.4,		
		10000,	69.3,	71.3,	83.3,	89,		83.9,	86.5,	71.5,	64.7,	58.6,	83.5,		
		11000,	70.1,	78.1,	86.4,	90.9,	82.6,	80.8,	82,		84.5,	81.6,	86.5,		
		12000,	78,		80.8,	84.6,	92.4,	83.3,	83.3,	82.1,	85.6,	84.7,	89.4,		
		13000,	102.7,	82.6,	89.3,	95.2,	95.3,	81.4,	83.9,	88.2,	88.8,	90.2,		
		14000,	78,		105.5,	105.4,	99.6,	95.5,	83.8,	84,		89.3,	91.2,	94,		
		15000,	81.5,	103.2,	112,	103.3,	100,	90.2,	85.3,	90.5,	91.4,	101,	
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
    --attribute        = LS_6_100.wsTypeOfWeapon,
    attribute        = clsid_ls6_100(use_ed_wpn),
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx,
    Picture          = "GBU54.png",
    displayName      = LS_6_100.user_name,
    Weight           = LS_6_100.mass + pylon_mass,
    Elements         = {{ShapeName = ls6_100_model}},
    ejectVelocity    = eject_speed_msl,
    ejectDirection   = {0, -1, 0},
})

ldout_cnt = 2

LS6_100_DUAL_L = {
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_100_DUAL_L",
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx * ldout_cnt + 0.00122,
    Picture          = "GBU54.png",
    displayName      = _(ls6_100_name .. " Dual"),
    Weight           = LS_6_100.mass * ldout_cnt + pylon_mass,
    Elements = {
        {
            ShapeName = "JF-17_GDJ-II19L",
            IsAdapter = true
        },
        {
            ShapeName = ls6_100_model,
            connector_name = "Pylon_GDJ-II19L_R",
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
        {
            ShapeName = ls6_100_model,
            connector_name = "Pylon_GDJ-II19L_L",
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    },
    --wsTypeOfWeapon   = LS_6_100.wsTypeOfWeapon,
    wsTypeOfWeapon   = clsid_ls6_100(use_ed_wpn),
    attribute        = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectVelocity    = eject_speed_msl,
    ejectDirection   = {0, -1, 0},
}
declare_loadout(LS6_100_DUAL_L)


LS6_100_DUAL_R = {
    category         = CAT_BOMBS,
    CLSID            = "DIS_LS_6_100_DUAL_R",
    Count            = ldout_cnt,
    Cx_pil           = LS_6_100.Cx * ldout_cnt + 0.00122,
    Picture          = "GBU54.png",
    displayName      = _(ls6_100_name .. " Dual"),
    Weight           = LS_6_100.mass * ldout_cnt + pylon_mass,
    Elements = {
        {
            ShapeName = "JF-17_GDJ-II19R",
            IsAdapter = true
        },
        {
            ShapeName = ls6_100_model,
            connector_name = "Pylon_GDJ-II19R_L",
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
        {
            ShapeName = ls6_100_model,
            connector_name = "Pylon_GDJ-II19R_R",
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    },
    --wsTypeOfWeapon   = LS_6_100.wsTypeOfWeapon,
    wsTypeOfWeapon   = clsid_ls6_100(use_ed_wpn),
    attribute        = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectVelocity    = eject_speed_msl,
    ejectDirection   = {0, -1, 0},
}
declare_loadout(LS6_100_DUAL_R)