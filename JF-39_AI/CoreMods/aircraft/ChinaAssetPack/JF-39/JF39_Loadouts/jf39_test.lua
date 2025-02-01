--[[
__count_wpn = 9000
function __counter_wpn()
	__count_wpn = __count_wpn + 1
	return __count_wpn
	-- return WSTYPE_PLACEHOLDER
end
]]--
tail_liquid = {0.9, 0.9, 0.9, 0.09 };
local pylon_dual_mass = 160.0
----------------------------------------------------------------------------------------
-- Meteor BVRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_meteor_name = 'TEST'
local jf39_meteor_name_short = 'TEST'
local jf39_meteor_name_loadout = 'TEST'

local jf39_meteor_warhead = enhanced_a2a_warhead(22.5, 200)
 
jf39_meteor = {
    category        = CAT_AIR_TO_AIR,
    name            = "jf39_meteor", -- = jf39_meteor_name_short,
    model           = 'jf39_meteor',
    displayName     = _(jf39_meteor_name),
    user_name       = _(jf39_meteor_name),
    display_name_short = _(jf39_meteor_name_short),
    wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
    
    Escort          = 0,
    Head_Type       = 2,
    sigma           = {5, 5, 5},
    M               = 225.0,
    H_max           = 25000.0,
    H_min           = 1.0,
    Diam            = 200.0,
    Cx_pil          = 3.64,
    D_max           = 38000.0,
    D_min           = 1000.0,
    Head_Form       = 1,
    Life_Time       = 110.0,
    Nr_max          = 36,
    v_min           = 140.0,
    v_mid           = 1000.0,
    Mach_max        = 5.0,
    t_b             = 0.0,
    t_acc           = 2.1,
    t_marsh         = 36.5,
    Range_max       = 180000.0,
    H_min_t         = 3.0,
    Fi_start        = 0.88,
    Fi_rak          = 3.14152,
    Fi_excort       = 1.0472,
    Fi_search       = 1.0472,
    OmViz_max       = 0.523599,
    --MEM_time        = 3,
    PN_gain         = 4,
    SeekerGen       = 4,
    ccm_k0          = 0.15,
    loft            = 1,
    hoj             = 1,
    loft_factor     = 2.5,
    exhaust1 = {1, 1, 1, 1 };
    X_back = -1.250,   	--pos in X axis(F/B)
    Y_back = -0.100,	--pos in Y axis(U/D)
    Z_back = 0.0,	--pos in Z axis(L/R)
    --tail_scale = 0.5,
    exhaust2 = {0.9, 0.9, 0.9, 0.1 };
    X_back_acc = -1.250,   	--pos in X axis(F/B)
    Y_back_acc = -0.100,	--pos in Y axis(U/D)
    Z_back_acc = 0.0,	        --pos in Z axis(L/R)
    Reflection = 0.12,
    KillDistance = 15.0,
    mass = 225.0,
    
    warhead         = jf39_meteor_warhead,
    warhead_air     = jf39_meteor_warhead,
    
    shape_table_data = {
        {
            name     = jf39_meteor_name_short,
            file     = 'jf39_meteor',
            life     = 1,
            fire     = {0, 1},
            username = jf39_meteor,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    --[[PN_coeffs = {4, 				-- Number of Entries	
			16000.0, 1.0,		-- Less 15 km to target Pn = 1
                        25000.0, 0.85,		-- Between 25 and 15 km  to target, Pn smoothly changes from 0.85 to 1.0.
                        40000.0, 0.65,		-- Between 40 and 25 km  to target, Pn smoothly changes from 0.65 to 0.85.
			90000.0, 0.30};	        -- Between 90 and 40 km  to target, Pn smoothly changes from 0.30 to 0.65. Longer than 90 km Pn = 0.30.]]
		
    supersonic_A_coef_skew = 0.16, -- slope of the polar drag coefficient curve at supersonic speeds
    nozzle_exit_area =	0.02835, -- nozzle exit area 
    
    class_name      = 'wAmmunitionSelfHoming',
    scheme          = 'aa_missile_amraam',

    controller = {
        boost_start = 0.3,
        march_start = 2.6,
    },

    boost = {
        impulse					= 252,
        fuel_mass				= 36.3,  
        work_time				= 2.1,     
        nozzle_position				= {{-1.330, -0.100, -0.005}},
        nozzle_orientationXYZ			= {{0.0, 0.0, 0.0}},
        nozzle_exit_area 			= 0.02835,
        tail_width				= 0.5,
        smoke_color				= {1.0, 1.0, 1.0},
        smoke_transparency			= 1.0,
        custom_smoke_dissipation_factor		= 0.2,
        smoke_opacity_type                      = 1,
    },

    march = {
        impulse					= 493,  
        fuel_mass				= 30.9, 
        work_time				= 36.5,
        effect_type                             = 1, 
        nozzle_position				= {{-1.450, -0.100, -0.005}},
        nozzle_orientationXYZ			= {{0.0, 0.0, 0.0}},
        nozzle_exit_area 			= 0.02835,
        tail_width				= 0.4,
        smoke_color				= {0.9, 0.9, 0.9},
        smoke_transparency			= 0.2,
        custom_smoke_dissipation_factor		= 0.2,
        --smoke_opacity_type                      = 1,
    },

     fm = {
        mass                = 225.0,
        caliber             = 0.200,
        wind_sigma          = 0.0,
        wind_time           = 0.0,
        tail_first          = 0,
        fins_part_val       = 0,
        rotated_fins_inp    = 0,
        delta_max           = math.rad(20),
        draw_fins_conv      = {math.rad(90),1,1},
        L                   = 0.200,
        S                   = 0.0314, 
        Ix                  = 1.95,    
        Iy                  = 140.1, 
        Iz                  = 140.1, 

        Mxd                 = 0.1 * 57.3,
        Mxw                 = -15.8,

        table_scale         = 0.2,
        table_degree_values = 1,
         --	Mach	  | 0.0		0.2	0.4	0.6	0.8	1.0	1.2	1.4	1.6	1.8	2.0	2.2	2.4	2.6	2.8	3.0	3.2	3.4	3.6	3.8	4.0	4.2	4.4	4.6	4.8	5.0 |
                Cx0     = { 0.606,	0.606,	0.606,	0.606,	0.946,	1.251,	1.172,	1.071,	0.943,	0.829,	0.742,	0.679,	0.635,	0.599,	0.568,	0.541,	0.516,	0.493,	0.471,	0.450,	0.431,	0.413,	0.397,	0.382,	0.368,	0.355  },
                CxB 	= { 0.021,	0.021,	0.021,	0.021,	0.021,	0.138,	0.153,	0.146,	0.1382,	0.1272,	0.1133,	0.0998,	0.0873,	0.079,	0.0728,	0.067,	0.0616,	0.0565,	0.0517,	0.0473,	0.043,	0.039,	0.0353,	0.0316,	0.0282,	0.0249 },
                K1	= { 0.0044,	0.0044,	0.0044,	0.0044,	0.0086,	0.0108,	0.008,  0.00447, 0.00302, 0.0027,  0.00246, 0.00228, 0.00212, 0.00198, 0.00188, 0.00178, 0.00168, 0.00158, 0.00148, 0.0014, 0.00132, 0.00124, 0.00116, 0.001104,0.00105, 0.001  },
		K2	= {-0.0047,    -0.0047,-0.0047,-0.0047,-0.0024,-0.0016,-0.0025,-0.00456,-0.00497,-0.00495,-0.00492,-0.00479,-0.00466,-0.00455,-0.00451,-0.00445,-0.00437,-0.00427,-0.00414,-0.00406,-0.00396,-0.00384,-0.00371,-0.00364,-0.00357,-0.0035 },
                Cya	= { 0.593,	0.593,	0.593,	0.593,	0.613,	0.618,	0.609,	0.597,	0.584,	0.564,	0.548,	0.533,	0.521,	0.51,	0.501,	0.493,	0.487,	0.481,	0.476,	0.471,	0.467,	0.463,	0.459,	0.455,	0.451,	0.447 },
		Cza	= { 0.593,	0.593,	0.593,	0.593,	0.613,	0.618,	0.609,	0.597,	0.584,	0.564,	0.548,	0.533,	0.521,	0.51,	0.501,	0.493,	0.487,	0.481,	0.476,	0.471,	0.467,	0.463,	0.459,	0.455,	0.451,	0.447 },
                Mya	= {-0.862,     -0.862, -0.862, -0.862, -0.943, -1.023, -0.958, -0.825, -0.719, -0.572, -0.471, -0.402, -0.354, -0.319, -0.293, -0.273, -0.255, -0.240, -0.225, -0.212, -0.199, -0.187, -0.175, -0.165, -0.156, -0.149 },
		Mza	= {-0.862,     -0.862, -0.862, -0.862, -0.943, -1.023, -0.958, -0.825, -0.719, -0.572, -0.471, -0.402, -0.354, -0.319, -0.293, -0.273, -0.255, -0.240, -0.225, -0.212, -0.199, -0.187, -0.175, -0.165, -0.156, -0.149 },
                Myw	= {-18.58,     -18.58, -18.58, -18.58, -19.04, -19.96,-16.109,-13.162, -7.511, -5.822, -5.027, -4.758, -4.503, -4.263, -4.037, -3.824, -3.623, -3.436, -3.257, -3.091, -2.934, -2.786, -2.647, -2.516, -2.394, -2.277 },
		Mzw	= {-18.58,     -18.58, -18.58, -18.58, -19.04, -19.96,-16.109,-13.162, -7.511, -5.822, -5.027, -4.758, -4.503, -4.263, -4.037, -3.824, -3.623, -3.436, -3.257, -3.091, -2.934, -2.786, -2.647, -2.516, -2.394, -2.277 },
                A1trim	= { 30,		30,	30,	30,	30,	31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },
		A2trim	= { 30,		30,	30,	30,	30,	31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },

        model_roll = math.rad(45),
        fins_stall = 1,
    },

    seeker = {
        delay                       = 1.0,
        op_time                     = 110,
        FOV                         = math.rad(120),
        max_w_LOS                   = math.rad(30),
        sens_near_dist              = 100,
        sens_far_dist               = 30000,
        ccm_k0                      = 0.15,
        aim_sigma                   = 4.0,
        height_error_k              = 20,
        height_error_max_vel        = 50,
        height_error_max_h          = 300,
        hoj                         = 1,
        rad_correction              = 1,
        active_radar_lock_dist      = 15000.0,
        active_dist_trig_by_default = 1,
    },

    autopilot = {
        delay                = 0.25,
        cmd_delay	     = 2.4,
        op_time              = 110,
        Tf                   = 0.1,
        Knav                 = 4.0,
        Kd                   = 180.0, 
        Ka                   = 16.0,
        T1                   = 309.0, 
        Tc                   = 0.06,
        Kx                   = 0.1,
        Krx                  = 2.0,
        gload_limit          = 36.0,
        fins_limit           = math.rad(24),
        fins_limit_x         = math.rad(5),
        null_roll            = math.rad(45),
        accel_coeffs	     = { 0, 11.5,-1.2,-0.25, 24.0,
                                 0.0314 * 0.75 * 0.0091 },
        
        loft_active          = 1,
        loft_factor          = 2.5,
        loft_sin             = math.sin(15/57.3),
        --loft_min_range       = 32000,
        loft_off_range       = 15000,
        dV0		     = 393,
    },
    
    actuator = {
        Tf                   = 0.005,
        D                    = 250.0,
        T1                   = 0.002,
        T2                   = 0.006,
        max_omega            = math.rad(400),
        max_delta            = math.rad(20),
        fin_stall            = 1,
        sim_count            = 4,
    },
    
    proximity_fuze = {
        radius      = 9.0,
        arm_delay   = 1.6,
    },
	
	ModelData = {   
    58 ,  -- model params count
    0.6 ,   -- characteristic square

    -- parameters of the dependence of Cx
    0.032 , -- Cx0 plateau at subsonic speeds (M << 1) cx_k0
    0.065 , -- peak height at wave crisis cx_k1
    0.02 ,  -- steepness of the front approaching the wave crisis cx_k2
   -0.071 , -- Cx0 plateau at supersonic speeds (M >> 1) cx_k3
    0.30  , -- steepness of decline after the wave crisis cx_k4
    0.84  , -- polar drag coefficient

    -- parameters of the dependence of Cy
    1.6 , -- Cy0 plateau at subsonic speeds (M << 1)
    0.8 , -- Cy0 plateau at supersonic speeds (M >> 1)
    1.2 , -- steepness of decline (front) after the wave crisis

    0.523599 , -- 7 Alfa_max  maximum balancing angle, radians
    0.0, -- angular velocity created by the gas rudder's moment

    -- t_statr   t_b      t_accel      t_march   t_inertial    t_break   t_end
         -1.0,   -1.0,       2.1,         36.5,      0.0,          0.0,      1.0e9,         -- time interval
          0.0,    0.0,       17.28,       0.85,      0.0,          0.0,        0.0,         -- fuel flow rate in seconds kg/sec
          0.0,    0.0,       42732.0,     4094.0,      0.0,        0.0,        0.0,         -- thrust

    1.0e9, -- self-destructive timer, sec
    110.0, -- power system working time, sec
    0, -- absolute altitude of self-destruction, m
    2.5, -- control activation delay time (evasion maneuver, safety), sec
    15000.0, -- target distance at launch, beyond which the missile performs a 'loft' maneuver, m
    15000.0, -- target distance at which the 'loft' maneuver ends and the missile switches to pure proportional navigation (should be greater or equal to the previous parameter), m
    0.261799,  -- sine of the ascent trajectory angle during the loft maneuver
    30.0, -- longitudinal acceleration of fuze arming
    0.0, -- speed module communicated by the catapult device, ejection charge, etc.
    1.19, -- characteristic of the SAM-MISSILE system, second-order filter coefficient K0
    1.0, -- characteristic of the SAM-MISSILE system, second-order filter coefficient K1
    2.0, -- characteristic of the SAM-MISSILE system, control loop bandwidth
    -- SAM. Data for calculating launch distances (indicator on the sight) 
    21.0, -- derivative of range by carrier speed at an altitude of 1 km, PPS
   -25.0, -- derivative of range by target speed at an altitude of 1 km, ZPS
   -3.0, -- derivative of range by height of target speed, ZPS
    60000.0, -- range at 180-degree angle (head-on), H=5000m, V=900km/h, m
    23000.0, -- range at 180-degree angle (pursuit), H=5000m, V=900km/h, m
    100000.0, -- range at 180-degree angle (head-on), H=10000m, V=900km/h, m
    40000.0, -- range at 0-degree angle (pursuit), H=10000m, V=900km/h, m
    38000.0, -- range at 180-degree angle, H=1000m, V=900km/h, m
    15000.0, -- range at 180-degree angle (pursuit), H=1000m, V=900km/h, m
    3500.0, -- offset backward relative to the zero rear point of the reach zone
    0.4, -- guaranteed range percentage from PPS range at an altitude of 1 km
   -0.015, -- derivative of guaranteed range percentage in PPS by height
    0.5, -- change in the slope coefficients of the curve for the upper and lower hemispheres from the carrier's altitude
},
}
declare_weapon(jf39_meteor) 
--jf39_meteor.shape_table_data.index = jf39_meteor.wsTypeOfWeapon[4]
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------