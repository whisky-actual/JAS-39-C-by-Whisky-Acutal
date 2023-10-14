--[[
local ld10_name  = 'Spear EW'
local ld10_model = 'jf39_spear-ew'
local ld10_mass  = 90
local pylon_mass = 25
local pylon_dual_mass = 160.0

local LD_10_warhead =
{
    mass                 = 6.3, 
    caliber              = 180,
    expl_mass            = 600.3,
    piercing_mass        = 6.3*1.2,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 0.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 5.0,
    cumulative_thickness = 2.0, 
}

local use_agm88_scheme_sead = true

LD_10_ARM = {
    category          = CAT_MISSILES,
    name              = ld10_name,
    model             = ld10_model,
    user_name         = _(ld10_name),
    wsTypeOfWeapon    = {4,4,8,WSTYPE_PLACEHOLDER},
    mass              = ld10_mass,

    Escort            = 0,
    Head_Type         = 3,
    sigma             = {10, 10, 10},
    M                 = ld10_mass,
    H_max             = 25000.0,
    H_min             = -1.0,
    Diam              = 203.0,
    Cx_pil            = 2.2,
    D_max             = 80000.0,
    D_min             = 700.0,
    Head_Form         = 1,
    Life_Time         = 180.0,
    Nr_max            = 25,
    v_min             = 140.0,
    v_mid             = 400.0,
    Mach_max          = 4.0,
    t_b               = 0.0,
    t_acc             = 3.0,
    t_marsh           = 5.0,
    Range_max         = 80000.0,
    H_min_t           = 1.0,
    Fi_start          = 0.5236,
    Fi_rak            = 3.14152,
    Fi_excort         = 1.05,
    Fi_search         = 1.05,
    OmViz_max         = 0.52,
    exhaust           = tail_solid1,
    X_back            = -1.74,
    Y_back            = -0.11,
    Z_back            = 0.0,
    Reflection        = 0.07,
    KillDistance      = 7.0,
    nozzle_exit_area  = 0.01219,

    shape_table_data = {
        {
            name     = ld10_name,
            file     = ld10_model,
            life     = 0.3,
            fire     = {0, 1},
            username = ld10_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    warhead     = LD_10_warhead,
    warhead_air = LD_10_warhead,

    LaunchDistData =
    {
        9,        6,
                   100,      150,      200,      250,      300,      350,
        1000,    22000,    23000,    26000,    26000,    27000,    30000,
        2000,    27000,    29000,    32000,    35000,    37000,    40000,
        4000,    32000,    35000,    37000,    40000,    42000,    45000,
        6000,    37000,    40000,    43000,    45000,    47000,    50000,
        7000,    43000,    45000,    47000,    50000,    55000,    60000,
        8000,    45000,    47000,    50000,    55000,    60000,    65000,
        9000,    50000,    52500,    55000,    58000,    65000,    70000,
       10000,    60000,    62500,    65000,    68000,    70000,    75000,
       12000,    65000,    66000,    67000,    70000,    75000,    80000,
    },

}

if use_agm88_scheme_sead then

    LD_10_ARM.class_name      = "wAmmunitionAntiRad"
    LD_10_ARM.scheme          = "anti_rad_missile"

    LD_10_ARM.controller = {
        boost_start = 0.5,
        march_start = 6.5,
    }

    LD_10_ARM.boost = {
        impulse                             = 242,
        fuel_mass                           = 57.6,
        work_time                           = 6.0,
        nozzle_position                     = {{-1.74, -0.11, 0}},
        nozzle_orientationXYZ               = {{0.0, 0.0, 0.0}},
        nozzle_exit_area                    = 0.01219,
        tail_width                          = 0.4,
        smoke_color                         = {1.0, 1.0, 1.0},
        smoke_transparency                  = 0.5,
        custom_smoke_dissipation_factor     = 0.2,
    }

    LD_10_ARM.march = {
        impulse                             = 236,
        fuel_mass                           = 11.6,
        work_time                           = 4.0,
        nozzle_position                     = {{-1.74, -0.11, 0}},
        nozzle_orientationXYZ               = {{0.0, 0.0, 0.0}},
        nozzle_exit_area                    = 0.01219,
        tail_width                          = 0.3,
        smoke_color                         = {1.0, 1.0, 1.0},
        smoke_transparency                  = 0.5,
        custom_smoke_dissipation_factor     = 0.2,
    }

    LD_10_ARM.fm = {
        mass                = ld10_mass,
        caliber             = 0.203,
        wind_sigma          = 0.0,
        wind_time           = 0.0,
        tail_first          = 1,
        fins_part_val       = 0,
        rotated_fins_inp    = 0,
        delta_max           = math.rad(20),
        draw_fins_conv      = {math.rad(90),1,1},
        L                   = 0.203,
        S                   = 0.0324,
        Ix                  = 1.5,
        Iy                  = 190,
        Iz                  = 190,

        Mxd                 = 0.1 * 57.3,
        Mxw                 = -15.8,

        table_scale         = 0.2,
        table_degree_values = 1,
        --    Mach      | 0.0        0.2        0.4        0.6        0.8        1.0        1.2        1.4        1.6        1.8        2.0        2.2        2.4        2.6        2.8        3.0        3.2        3.4        3.6        3.8        4.0     |
        Cx0 = {    0.4727,    0.4727,    0.4727,    0.4727,    0.4838,    0.7609,     0.8869,     0.86198,    0.81793,     0.76899,     0.72481,     0.68476,    0.64836,    0.61529,    0.58515,    0.55744,    0.53195,    0.50829,    0.48624,    0.46561,    0.4461,     0.42772,    0.41035,    0.3941,     0.37898,    0.366    },
        CxB = {    0.021,     0.021,     0.021,     0.021,     0.021,     0.138,      0.153,      0.146,      0.1382,      0.1272,      0.1167,      0.1073,     0.0987,     0.0909,     0.0837,     0.077,      0.0708,     0.065,      0.0595,     0.0544,     0.0495,     0.0449,     0.0406,     0.0364,     0.0324,     0.0286    },
        K1  = {    0.00264,   0.00264,   0.00264,   0.00264,   0.00264,   0.00264,    0.0022,     0.001873,   0.0016435,   0.0014752,   0.0013448,   0.0012436,  0.0011534,  0.0010742,  0.0010149,  0.0009484,  0.0009016,  0.0008476,  0.000795,   0.0007529,  0.0007122,  0.0006727,  0.0006343,  0.0006058,  0.0005781,  0.00056    },
        K2  = {    -0.00257,  -0.00257,  -0.00257,  -0.00257,  -0.00257,  -0.00265,   -0.002274,  -0.002034,  -0.0018241,  -0.0016225,  -0.0014468,  -0.001275,  -0.0011248, -0.0009777, -0.0008514, -0.0007274, -0.0006236, -0.0005217, -0.0004393, -0.0003584, -0.0002968, -0.0002363, -0.0001949, -0.0001546, -0.0001335, -0.000114    },
        Cya = {    0.3207,    0.3207,    0.3207,    0.3207,    0.3381,    0.4226,     0.4651,     0.5049,     0.5175,      0.5033,      0.4919,      0.4815,     0.4729,     0.4653,     0.4586,     0.4528,     0.4479,     0.444,      0.441,      0.4371,     0.4341,     0.4321,     0.43,       0.4271,     0.426,      0.424    },
        Cza = {    0.3207,    0.3207,    0.3207,    0.3207,    0.3381,    0.4226,     0.4651,     0.5049,     0.5175,      0.5033,      0.4919,      0.4815,     0.4729,     0.4653,     0.4586,     0.4528,     0.4479,     0.444,      0.441,      0.4371,     0.4341,     0.4321,     0.43,       0.4271,     0.426,      0.424    },
        Mya = {    -0.7724,   -0.7724,   -0.7724,   -0.7724,   -0.8442,   -1.0226,    -0.9581,    -0.85133,   -0.7413,     -0.59726,    -0.49729,    -0.42745,   -0.37784,   -0.3414,    -0.31341,   -0.29077,   -0.27141,   -0.25428,   -0.23854,   -0.22399,   -0.21035,   -0.19771,   -0.18616,   -0.1758,    -0.16696,   -0.16075    },
        Mza = {    -0.7724,   -0.7724,   -0.7724,   -0.7724,   -0.8442,   -1.0226,    -0.9581,    -0.85133,   -0.7413,     -0.59726,    -0.49729,    -0.42745,   -0.37784,   -0.3414,    -0.31341,   -0.29077,   -0.27141,   -0.25428,   -0.23854,   -0.22399,   -0.21035,   -0.19771,   -0.18616,   -0.1758,    -0.16696,   -0.16075    },
        Myw = {    -2.0,    -2.0},
        Mzw = {    -2.0,    -2.0},
        A1trim = { 4.0, 6.0, 10.0, 15.0},
        A2trim = { 4.0, 6.0, 10.0, 15.0},

        model_roll = math.rad(45),
        fins_stall = 1,
    }

    LD_10_ARM.proximity_fuze = {
        radius       = 8,
        arm_delay    = 1.6,
    }

    LD_10_ARM.seeker = {
        delay               = 2.4,
        op_time             = 240,
        FOV                 = math.rad(120),
        max_w_LOS           = math.rad(20),
        sens_near_dist      = 100,
        sens_far_dist       = 40000,

        keep_aim_time       = 5,
        pos_memory_time     = 150,
        err_correct_time    = 2.0,
        calc_aim_dist       = 200000,
        blind_rad_val       = 0.1,
        aim_y_offset        = 0.5,
        aim_sigma           = 2,

        ang_err_val         = math.rad(0.008),
        abs_err_val         = 2,
        
        lock_manual_target_types_only = 0,
        filter_ignore_strings = {"EWR", "ewr"},
    }

    LD_10_ARM.autopilot = {
        delay                = 1.0,
        x_channel_delay      = 1.0,
        op_time              = 240,
        Kconv                = 3.0,
        Knv                  = 0.0025,
        Kd                   = 0.4,
        Ki                   = 0.01,
        Kout                 = 1.0,
        Kx                   = 0.04,
        Krx                  = 2.0,
        fins_limit           = math.rad(20),
        fins_limit_x         = math.rad(5),
        Areq_limit           = 14.0,
        bang_bang            = 0,
        max_signal_Fi        = math.rad(12),
        rotate_fins_output   = 0,
        alg                  = 0,
        PN_dist_data         = {15000,    1,
                                 5000,    1},
        null_roll            = math.rad(45),
        
        min_a_conv_approach_vel = 100,

        K_heading_hor                = 0.5,
        K_heading_ver                = 0.3,
        K_loft                       = 15,
        loft_active_by_default       = 0,
        loft_min_trig_ang            = math.rad(5),
        loft_trig_ang                = math.rad(15),
        loft_trig_max_alt            = 3000,
        loft_trig_change_min_dist    = 20000,
        loft_trig_change_max_dist    = 40000,
        
        loft_min_dist                = 5000,
        loft_min_add_pitch           = math.rad(10),
        loft_add_pitch               = math.rad(15),
        
        min_horiz_time               = 3.0,
        max_pitch_cmd                = math.rad(40),
    }
    
    LD_10_ARM.conv =
    {
        seeker_add_pitch = math.rad(-20),
    }

else

    LD_10_ARM.class_name      = "wAmmunitionSelfHoming"
    LD_10_ARM.scheme          = "anti_radiation_missile2"

    LD_10_ARM.controller = {
        march_start = 0.021,
    }

    LD_10_ARM.march = {
        impulse                             = 205,
        fuel_mass                           = 70,
        work_time                           = 10,
        boost_time                          = 0,
        boost_factor                        = 0,
        nozzle_position                     = {{-1.74, -0.11, 0}},
        nozzle_orientationXYZ               = {{0.0, 0.0, 0.0}},
        nozzle_exit_area                    = 0.01219,
        tail_width                          = 0.3,
        smoke_color                         = {0.6, 0.6, 0.6},
        smoke_transparency                  = 0.8,
        custom_smoke_dissipation_factor     = 0.2,
    }

    LD_10_ARM.fm = {
        mass        = ld10_mass,
        caliber     = 0.203,
        cx_coeff    = {1, 0.4, 1.1, 0.5, 1.4},
        L           = 3.8,
        I           = 1 / 12 * ld10_mass * 3.8 * 3.8,
        Ma          = 0.3,
        Mw          = 1.116,
        wind_sigma  = 0.0,
        wind_time   = 0.0,
        Sw          = 0.85,
        dCydA       = {0.07, 0.036},
        A           = 0.36,
        maxAoa      = 0.28,
        finsTau     = 0.1,

        Ma_x        = 0.001,
        Kw_x        = 0.001,
        --I_x         = 50,
    }

    LD_10_ARM.radio_seeker = {
        FOV                 = math.rad(5),
        op_time             = 150,
        keep_aim_time       = 8,
        pos_memory_time     = 60,
        sens_near_dist      = 200.0,
        sens_far_dist       = 60000.0,
        err_correct_time    = 1.0,
        err_val             = 0.001,
        lock_err_val        = 0.01,
        calc_aim_dist       = 500000,
        blind_rad_val       = 0.2,
        blind_ctrl_dist     = 1000,
        aim_y_offset        = 2.0,
        min_sens_rad_val    = 0.00025,
    }

    LD_10_ARM.simple_gyrostab_seeker = {
        omega_max = math.rad(8)
    }

    LD_10_ARM.fuze_proximity = {
        ignore_inp_armed    = 1,
        arm_delay           = 10,
        radius              = 10,
    }

    LD_10_ARM.autopilot = {
        K                = 100.0,
        Kg               = 6.0,
        Ki               = 0.0,
        finsLimit        = 0.22,
        useJumpByDefault = 1,
        J_Power_K        = 1.2,
        J_Diff_K         = 0.4,
        J_Int_K          = 0.0,
        J_Angle_K        = math.rad(12),
        J_FinAngle_K     = math.rad(18),
        J_Angle_W        = 3.5,
        delay            = 1.0,
    }

    LD_10_ARM.start_helper = {
        delay               = 0.2,
        power               = 0.02,
        time                = 2,
        use_local_coord     = 0,
        max_vel             = 200,
        max_height          = 400,
        vh_logic_or         = 1,
    }
end

declare_weapon(LD_10_ARM)

--LD_10_ARM.shape_table_data.index = LD_10_ARM.wsTypeOfWeapon[4]

declare_loadout({
    category    = CAT_MISSILES,
    CLSID       = 'DIS_LD-10',
    Picture     = 'jf39_spear-ew.png',
    attribute   = LD_10_ARM.wsTypeOfWeapon,
    displayName = _(ld10_name),
    Cx_pil      = 0.00064453124,
    Count       = 1,
    Weight      = ld10_mass + pylon_mass,
    Elements    = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = ld10_model,
        },
    }, -- end of Elements
})


declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_LD-10_DUAL_L',
    Picture        = 'jf39_spear-ew.png',
    wsTypeOfWeapon = LD_10_ARM.wsTypeOfWeapon,
    attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
    displayName    = _(ld10_name .. ' x 3'),
    Cx_pil         = 0.00150390623,
    Count          = 3,
    Weight         = 2 * ld10_mass + pylon_dual_mass,
    Elements       = {
        { ShapeName = 'jf39_spear_triple_rack', IsAdapter = true, },
        {
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	0.25}, --1
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	-0.25}, --2
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.50, 0.0}, --3
			ShapeName	=	"jf39_spear-ew",
		},	
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
})

declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_LD-10_DUAL_R',
    Picture        = 'jf39_spear-ew.png',
    wsTypeOfWeapon = LD_10_ARM.wsTypeOfWeapon,
    attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
    displayName    = _(ld10_name .. ' x 3'),
    Cx_pil         = 0.00150390623,
    Count          = 3,
    Weight         = 2 * ld10_mass + pylon_dual_mass,
    Elements       = {
        { ShapeName = 'jf39_spear_triple_rack', IsAdapter = true, },
        {
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	0.25}, --1
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	-0.25}, --2
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.50, 0.0}, --3
			ShapeName	=	"jf39_spear-ew",
		},	
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
})
--]]

--------

local jf39_spear_name  = 'SPEAR-3 Anti-Radiation Missile'
local jf39_spear_mass  = 90
local jf39_spear_model = 'jf39_spear-ew'

local jf39_spear_warhead =
{
    mass                 = 100,--200 
    caliber              = 250,--500
    expl_mass            = 50,--100
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 5.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 5.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,  
}

jf39_spear_MISSILE =
{
	category        = CAT_MISSILES,
    name            = jf39_spear_name,
    user_name       = _(jf39_spear_name),
    model           = jf39_spear_model,
    mass            = jf39_spear_mass,
	scheme			= "sat_cruise_missile",             
	class_name		= "wAmmunitionCruise",     
	wsTypeOfWeapon  = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, WSTYPE_PLACEHOLDER},
    --add_attributes = {"Cruise missiles"},
    
    seeker = {
		coalition				= 2,
		coalition_rnd_coeff		= 5.0,
		can_update_target_pos	= 1,
	},
	
	Escort = 0,
    Head_Type = 3,
	sigma = {2, 2, 2},
    M = jf39_spear_mass,
    H_max = 15000.0,
    H_min = -1,
    Diam = 180.0,
    Cx_pil = 2,
    D_max = 225000.0,
    D_min = 500.0,
    Head_Form = 0,
    Life_Time = 750,
    Nr_max = 25,
    v_min = 50.0,
    v_mid = 320.0,
    Mach_max = 2.0,
    t_b = 0.0,
    t_acc = 1.0,
    t_marsh = 9999.0,
    Range_max = 225000.0,
    H_min_t = 0.0,
    Fi_start = 0.5,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 99.9,
    OmViz_max = 99.9,
	exhaust	= {1.0, 1.0, 1.0, 0.1},
	X_back	= -0.9,
	Y_back	= -0.15,
	Z_back 	= 0.0,
	Reflection	= 1.5,
	KillDistance= 0.0,

    warhead = jf39_spear_warhead,
	warhead_air = jf39_spear_warhead,

    shape_table_data =
	{
		{
			name     = jf39_spear_name,
			file     = jf39_spear_model,
			life     = 1,
			fire     = {0, 1},
			username = "SPEAREW",
			index    = WSTYPE_PLACEHOLDER,
		},
	},
	
	LaunchDistData = 
	{
		14,		8,
		
					50,		75,		100,	125,	150,	200,	250,	300,	
				
		100,		0,		0,		0,		132000,	136000,	141000,	145000,	148000,	
		200,		0,		0,		0,		133000,	137000,	142000,	145000,	148000,	
		300,		0,		0,		129000,	135000,	138000,	142000,	146000,	149000,	
		500,		0,		0,		133000,	136000,	139000,	143000,	146000,	149000,	
		600,		0,		128000,	134000,	137000,	139000,	143000,	147000,	149000,	
		800,		0,		131000,	135000,	138000,	140000,	144000,	147000,	149000,	
		900,		126000,	132000,	135000,	138000,	140000,	144000,	148000,	149000,	
		1000,		128000,	133000,	136000,	137000,	140000,	144000,	148000,	151000,	
		1100,		133000,	136000,	138000,	141000,	143000,	147000,	151000,	154000,	
		1200,		137000,	140000,	143000,	146000,	149000,	153000,	156000,	160000,	
		1300,		142000,	144000,	147000,	150000,	153000,	158000,	161000,	165000,	
		1400,		145000,	148000,	151000,	154000,	157000,	162000,	167000,	171000,	
		1500,		148000,	151000,	155000,	158000,	161000,	168000,	174000,	178000,	
		1600,		152000,	156000,	160000,	164000,	168000,	177000,	185000,	225000,	
	},

	controller = {
		boost_start	= 2.00,
		march_start = 5.00,
	},
	
	control_block ={
		seeker_activation_dist		= 40000, 
		default_cruise_height		= 10000, 
		obj_sensor					= 0,
		can_update_target_pos		= 1,
		turn_before_point_reach		= 1,
		turn_hor_N					= 0.8,
		turn_max_calc_angle_deg		= 90,
		turn_point_trigger_dist		= 100,
		use_horiz_dist				= 1,
	},

	fm = {
		mass        = 675,  
		caliber     = 0.343,  
		cx_coeff    = {1, 0.3, 0.65, 0.023, 1.6},
		L           = 4.37,
		I           = 1500,
		Ma          = 3,	
		Mw          = 10,
		wind_sigma	= 0.0,
		wind_time	= 0.0,
		Sw			= 1.2,
		dCydA		= {0.07, 0.036},
		A			= 0.08,
		maxAoa		= 0.2,
		finsTau		= 0.08,
		Ma_x		= 1.2,
		Ma_z		= 3,
		Mw_x		= 2.7,
	},
	
	boost = {	--	air launch - no booster
		impulse								= 100,
		fuel_mass							= 23,
		work_time							= 3,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{0, 0, 0}},
		nozzle_orientationXYZ				= {{0, 0, 0}},
		tail_width							= 0,
		smoke_color							= {0.0, 0.0, 0.0},
		smoke_transparency					= 0.0,
		custom_smoke_dissipation_factor		= 0.0,						
	},
	
	booster_animation = {
		start_val = 0,
	},
	
	play_booster_animation = {
		val = 0,
	},
	
	march = {
        impulse			= 600,
		fuel_mass		= 77.5,
		work_time		= 800,
		min_fuel_rate	= 0.005,
		min_thrust		= -100,
		max_thrust		= 1500,
		thrust_Tau		= 0.0017,
		
		nozzle_position						= {{0.8, 0.0, 0}},
		nozzle_orientationXYZ				= {{0.0, -180, 0.0}},
		tail_width							= 0.2,
		smoke_color							= {0.9, 0.9, 0.9},
		smoke_transparency					= 0.2,
		custom_smoke_dissipation_factor		= 0.2,		
		
		start_burn_effect			= 0,
		start_effect_delay			= {0.0,		0.3, 	0.8},
		start_effect_time			= {0.7,		1.0, 	0.1},
		start_effect_size			= {0.09,	0.104,	0.11},
		start_effect_smoke			= {0.01,	0.4, 	0.01},
		start_effect_x_pow			= {1.0,		1.0,	1.0},
		start_effect_x_dist			= {1.1,		0.9,	0.0},
		start_effect_x_shift		= {0.15,	0.15,	0.2},	
	},

    cruise_autopilot = {
		delay				= 1,
		Kp_hor_err			= 240,
		Kp_hor_err_croll	= 0.06,
		Kd_hor				= 0,
		Kp_ver				= 9,
		Kii_ver				= 0.2,
		Kd_ver				= 0,
		Kp_eng				= 265,
		Ki_eng				= 0.003,
		Kd_eng				= 0,
		Kp_ver_st1			= 0.009,
		Kd_ver_st1			= 0.015,
		Kp_ver_st2			= 0.00018,
		Kd_ver_st2			= 0.00005,
		
		auto_terrain_following			= 1,
		auto_terrain_following_height	= 50,
		
		alg_points_num			= 7,
		alg_calc_time			= 1.5,
		alg_vel_k				= 6,
		alg_div_k				= 2,
		alg_max_sin_climb		= 0.8,
		alg_section_temp_points	= 3,
		alg_tmp_point_vel_k		= 1.5,
		no_alg_vel_k			= 10,
		
		max_roll			= 0.8,
		max_start_y_vel		= 35,
		stab_vel			= 237.5,
		finsLimit			= 0.8,
		estimated_N_max		= 6,
		eng_min_thrust		= -100,
		eng_max_thrust		= 1500,		
	},
	
	final_autopilot =		{
		delay 				= 0,
		K					= 60,
		Ki					= 0,
		Kg					= 4,
		finsLimit			= 0.8,
		useJumpByDefault	= 1,
		J_Power_K			= 1.5,
		J_Diff_K			= 0.4,
		J_Int_K				= 0,
		J_Angle_K			= 0.18,
		J_FinAngle_K		= 0.32,
		J_Angle_W			= 0.8,
		J_Trigger_Vert		= 1,
		hKp_err				= 120,
		hKp_err_croll		= 0.04,
		hKd					= 0.005,
		max_roll			= 0.8,
	},
		
}

declare_weapon(jf39_spear_MISSILE)

declare_loadout({
    category        = CAT_MISSILES,
    CLSID           = 'DIS_LD-10',
    wsTypeOfWeapon  = jf39_spear_MISSILE.wsTypeOfWeapon,
    attribute       = {4, 4, 32, WSTYPE_PLACEHOLDER},
    Count           = 3,
    Cx_pil          = 0.0001,
    Picture         = "jf39_spear-ew.png",
    displayName     = _('3 x ' .. jf39_spear_name),
    Weight          = jf39_spear_mass * 3 + 90,
	ejectImpulse    = -140,
    ejectDirection = {0, -1, 0},	
	Elements = {
	
		{
			ShapeName	=	"jf39_spear_triple_rack",
			IsAdapter = true,
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	0.25}, --1
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.42,	-0.25}, --2
			ShapeName	=	"jf39_spear-ew",
		},
		
		{
			DrawArgs = {[1] = {1,1},[2] = {2,1},},
			Position	=	{-0.15,	-0.50, 0.0}, --3
			ShapeName	=	"jf39_spear-ew",
		},		
		
	},
    
    JettisonSubmunitionOnly = false,
})
--]]