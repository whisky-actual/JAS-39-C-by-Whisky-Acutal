----------------------------------------------------------------------------------------
-- Meteor BVRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_meteor_name = 'Meteor BVRAAM Active Rdr AAM'
local jf39_meteor_name_short = 'Meteor BVRAAM'
local jf39_meteor_name_loadout = 'Meteor BVRAAM'

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
----------------------------------------------------------------------------------------
-- AIM-120B AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120b_name = 'jf39_aim-120b'
local jf39_aim120b_mass = 156.0
local jf39_aim120b_warhead = enhanced_a2a_warhead(11, 178)

local jf39_aim120b = {
    category        = CAT_AIR_TO_AIR,
    name            = jf39_aim120b_name,
	scheme			= "aa_missile_amraam2",
	class_name		= "wAmmunitionSelfHoming",	
    model           = 'aim-120b',
    user_name       = _(jf39_aim120b_name),
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
    mass            = jf39_aim120b_mass,

    Escort = 0,
    Head_Type = 2,
	sigma = {5, 5, 5},
    M = 157.85,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 169.0,
    Cx_pil = 2.5,
    D_max = 14000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.5,
    t_acc = 3.0,
    t_marsh = 5.0,
    Range_max = 57000.0,
    H_min_t = 3.0,
    Fi_start = 0.88,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05 };
    X_back = -1.99,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.07,
    KillDistance = 15.0,
	
	SeekerGen = 4,  -- Seeker generation
	ccm_k0 = 0.2,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	loft = 1,
	hoj = 1,
	loft_factor = 4.5,
	PN_gain = 4,
		
	supersonic_A_coef_skew = 0.1, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.011, -- площадь выходного сечения сопла
	
    warhead         = jf39_aim120b_warhead,
    warhead_air     = jf39_aim120b_warhead,

    shape_table_data = {
        {
            name     = jf39_aim120b_name,
            file     = 'aim-120b',
            life     = 1,
            fire     = {0, 1},
            username = "AIM120B",		--Shortened name for cockpit displays
            index    = WSTYPE_PLACEHOLDER,
        },
    },


	ModelData = {   58 ,  -- model params count
					0.5 ,   -- characteristic square (характеристическая площадь)
					
					-- параметры зависимости Сx
					0.026 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
					0.053 , -- Cx_k1 высота пика волнового кризиса
					0.01 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
					-0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
					0.075 , -- Cx_k4 крутизна спада за волновым кризисом 
					0.7 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
						
					-- параметры зависимости Cy
					1.5 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
					0.6	 , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
					1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
					
					0.5 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
					0.0, --угловая скорость создаваймая моментом газовых рулей
						
					-- Engine data. Time, fuel flow, thrust.	
					--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,		-1.0,	4.0,  		4.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					0.0,		0.0,	7.69,		3.94,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					0.0,		0.0,	19600.0,	10045.0,	0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					80.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					1.0, -- время задержки включения управления (маневр отлета, безопасности), сек
					25000,--40000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					15000,--40000, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.52356,--0.17,-- синус угла возвышения траектории набора горки
					50.0, -- продольное ускорения взведения взрывателя
					0.0,
					1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления				 
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					21.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					-25.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					-3.0, -- производная по высоте производной дальности по скорости цели, ЗПС
					33000.0, -- дальность ракурс 180 град (навстречу), Н=5000м, V=900км/ч, м
					10000.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м
					65000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
					19500.0, -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					21500.0, -- дальность ракурс 180 град (навстречу), Н=1000м, V=900км/ч, м
					6500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м 
					3000.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.4, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.015, -- производная процента гарантированной дальности в ППС по высоте
					0.5,
				},
				
	controller = {
		boost_start = 0.5,
		march_start = 2.6,
	},

	boost = {
		impulse								= 236,
		fuel_mass							= 18.21,
		work_time							= 2.1,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
		smoke_opacity_type 					= 1,
	},

	march = {
		impulse								= 227,
		fuel_mass							= 28.33,
		work_time							= 5.0,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
		smoke_opacity_type 					= 1,

--		fuel_rate_data	=	{	--t		rate
--								0.0,	2.0,
--								4.0,	1.8,
--							},
	},

	fm = {
		mass				= 157.85,
		caliber				= 0.178,
		wind_sigma			= 0.0,
		wind_time			= 0.0,
		tail_first			= 0,
		fins_part_val		= 0,
		rotated_fins_inp	= 0,
		delta_max			= math.rad(20),
		draw_fins_conv		= {math.rad(90),1,1},
		L					= 0.178,
		S					= 0.0248,
		Ix					= 1.24,
		Iy					= 130.12,
		Iz					= 130.12,

		Mxd					= 0.1 * 57.3,
		Mxw					= -15.8,

		table_scale	= 0.2,
		table_degree_values = 1,
	--	Mach	  | 0.0		0.2		0.4		0.6		0.8		1.0		1.2		1.4		1.6		1.8		2.0		2.2		2.4		2.6		2.8		3.0		3.2		3.4		3.6		3.8		4.0	 	4.2		4.4		4.6		4.8		5.0 |
		Cx0 	= {	0.515,	0.515,	0.515,	0.515,	0.527,	0.85,	0.949,	0.905,	0.8605,	0.8094,	0.7636,	0.7204,	0.6813,	0.6458,	0.6135,	0.5839,	0.5567,	0.5316,	0.5082,	0.4864,	0.4659,	0.4468,	0.4288,	0.4121,	0.3968,	0.384  },
		CxB 	= {	0.021,	0.021,	0.021,	0.021,	0.021,	0.138,	0.153,	0.146,	0.1382,	0.1272,	0.1167,	0.1073,	0.0987,	0.0909,	0.0837,	0.077,	0.0708,	0.065,	0.0595,	0.0544,	0.0495,	0.0449,	0.0406,	0.0364,	0.0324,	0.0286 },
		K1		= { 0.0039,	0.0039,	0.0039,	0.0039,	0.0039,	0.0048,	0.004,	0.00325,	0.002845,	0.002602,	0.002378,	0.002176,	0.001994,	0.001832,	0.001689,	0.001564,	0.001456,	0.001366,	0.00129,	0.001229,	0.001182,	0.001147,	0.001123,	0.001108,	0.001101,	0.0011 },
		K2		= { -0.0041,-0.0041,-0.0041,-0.0041,-0.0041,-0.0049,-0.0042,-0.0036,	-0.003121,	-0.002725,	-0.002408,	-0.00213,	-0.001888,	-0.001677,	-0.001494,	-0.001334,	-0.001196,	-0.001077,	-0.000973,	-0.000884,	-0.000808,	-0.000743,	-0.000689,	-0.000646,	-0.000615,	-0.0006 },
		Cya		= { 0.345,	0.345,	0.345,	0.345,	0.357,	0.401,	0.448,	0.495,	0.513,	0.506,	0.5,	0.495,	0.49,	0.486,	0.482,	0.478,	0.474,	0.471,	0.468,	0.465,	0.462,	0.46,	0.457,	0.455,	0.453,	0.451 },
		Cza		= { 0.345,	0.345,	0.345,	0.345,	0.357,	0.401,	0.448,	0.495,	0.513,	0.506,	0.5,	0.495,	0.49,	0.486,	0.482,	0.478,	0.474,	0.471,	0.468,	0.465,	0.462,	0.46,	0.457,	0.455,	0.453,	0.451 },
		Mya		= { -1.316,-1.316,	-1.316,	-1.316,	-1.458,	-1.982,	-1.418,	-1.0883,-0.9411,-0.8255,-0.733,	-0.6574,-0.5942,-0.5403,-0.4935,-0.4525,-0.4164,-0.3846,-0.3568,-0.3328,-0.3125,-0.2959,-0.283,-0.2739,-0.2683,-0.2665 },
		Mza		= { -1.316,-1.316,	-1.316,	-1.316,	-1.458,	-1.982,	-1.418,	-1.0883,-0.9411,-0.8255,-0.733,	-0.6574,-0.5942,-0.5403,-0.4935,-0.4525,-0.4164,-0.3846,-0.3568,-0.3328,-0.3125,-0.2959,-0.283,-0.2739,-0.2683,-0.2665 },
		Myw		= { -16.3145,-16.3145,-16.3145,-16.3145,-16.8944,-19.8659,-18.1868,-17.1716,-16.504,-15.88,-15.2958,-14.7478,-14.2328,-13.7477,-13.2901,-12.8574,-12.4477,-12.0593,-11.6911,-11.3421,-11.0121,-10.7015,-10.4118,-10.1458,-9.9098,-9.7256 },
		Mzw		= { -16.3145,-16.3145,-16.3145,-16.3145,-16.8944,-19.8659,-18.1868,-17.1716,-16.504,-15.88,-15.2958,-14.7478,-14.2328,-13.7477,-13.2901,-12.8574,-12.4477,-12.0593,-11.6911,-11.3421,-11.0121,-10.7015,-10.4118,-10.1458,-9.9098,-9.7256 },
		A1trim	= { 24,		24,		24,		24,		23.5,	23,		25.16,	27.23,	29.04,	30.6,	31.93,	33.08,	34.07,	34.95,	35.74,	36.45,	37.09,	37.68,	38.2,	38.66,	39.06,	39.39,	39.66,	39.85,	39.96,	40 },
		A2trim	= { 24,		24,		24,		24,		23.5,	23,		25.16,	27.23,	29.04,	30.6,	31.93,	33.08,	34.07,	34.95,	35.74,	36.45,	37.09,	37.68,	38.2,	38.66,	39.06,	39.39,	39.66,	39.85,	39.96,	40 },

		model_roll = math.rad(45),
		fins_stall = 1,
	},

	sensor = {
		delay						= 1.5,
		op_time						= 80,
		FOV							= math.rad(15),
		max_w_LOS					= math.rad(30),
		sens_near_dist				= 100,
		sens_far_dist				= 30000,
		ccm_k0						= 0.2,
		aim_sigma					= 4.0,
		height_error_k				= 25,
		height_error_max_vel		= 60,
		height_error_max_h			= 300,
		hoj							= 1,
	},
	
	gimbal = {
		delay				= 0,
		op_time				= 95,
		pitch_max			= math.rad(60),
		yaw_max				= math.rad(60),
		max_tracking_rate	= math.rad(30),
		tracking_gain		= 50,
	},

	autopilot = {
		delay				= 0.2,
		cmd_delay 			= 0.8,
		op_time				= 80,
		Tf					= 0.1,
		Knav				= 4.0,
		Kd					= 110.0,
		Ka					= 22.0,
		T1					= 292.0,
		Tc					= 0.04,
		Kx					= 0.1,
		Krx					= 2.0,
		gload_limit			= 30.0,
		fins_limit			= math.rad(18),
		fins_limit_x		= math.rad(5),
		null_roll			= math.rad(45),
		accel_coeffs		= { 0, 3.4, -0.4, -0.2, 13.6,
								0.0248 * 1.0 * 0.009 },

		loft_active			= 1,
		loft_factor			= 4.5,
		loft_sin			= math.sin(30/57.3),
		loft_off_range		= 15000,
		dV0					= 347,
	},

	actuator = {
		Tf					= 0.005,
		D					= 250.0,
		T1					= 0.002,
		T2					= 0.006,
		max_omega			= math.rad(400),
		max_delta			= math.rad(20),
		fin_stall			= 1,
		sim_count			= 4,
	},

	proximity_fuze = {
		radius		= 15.0,
		arm_delay	= 1.6,
	},
	
}
declare_weapon(jf39_aim120b)
----------------------------------------------------------------------------------------
-- AIM-120C-5 AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120c5_name = 'jf39_aim-120c5'
local jf39_aim120c5_mass = 161.5
local jf39_aim120c5_warhead = enhanced_a2a_warhead(9, 178)

local jf39_aim120c5 =  {
    category        = CAT_AIR_TO_AIR,
    name            = jf39_aim120c5_name,
	scheme			= "aa_missile_amraam2",
	class_name		= "wAmmunitionSelfHoming",	
    model           = 'aim-120c',
    user_name       = _(jf39_aim120c5_name),
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
    mass            = jf39_aim120c5_mass,

    Escort = 0,
    Head_Type = 2,
	sigma = {5, 5, 5},
    M = 161.48,
    H_max = 26000.0,
    H_min = 1.0,
    Diam = 160.0,
    Cx_pil = 2.5,
    D_max = 20000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.4,
    t_acc = 3.0,
    t_marsh = 6.0,
    Range_max = 80000.0,
    H_min_t = 1.0,
    Fi_start = 0.88,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05 };
    X_back = -1.98,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.07,
    KillDistance = 15.0,
	
	SeekerGen = 4,  -- Seeker generation
	ccm_k0 = 0.1,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	loft = 1,
	hoj = 1,
	loft_factor = 4.5,
	PN_gain = 4,
		
	supersonic_A_coef_skew = 0.1, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.011, -- площадь выходного сечения сопла
	
    warhead         = jf39_aim120c5_warhead,
    warhead_air     = jf39_aim120c5_warhead,

    shape_table_data = {
        {
            name     = jf39_aim120c5_name,
            file     = 'aim-120c',
            life     = 1,
            fire     = {0, 1},
            username = "AIM120C5",		--Shortened name for cockpit displays
            index    = WSTYPE_PLACEHOLDER,
        },
    },

	ModelData = {   58 ,  -- model params count
					0.4 ,   -- characteristic square (характеристическая площадь)
					
					-- параметры зависимости Сx
					0.029 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
					0.06 , -- Cx_k1 высота пика волнового кризиса
					0.01 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
					-0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
					0.08 , -- Cx_k4 крутизна спада за волновым кризисом 
					0.7 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
					
					-- параметры зависимости Cy
					1.4 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
					0.6	 , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
					1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
						
					0.5 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
					0.0, --угловая скорость создаваймая моментом газовых рулей
						
					-- Engine data. Time, fuel flow, thrust.	
					--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,		-1.0,	8.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					0.0,		0.0,	6.41,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					0.0,		0.0,	16325.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					100.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					1.0, -- время задержки включения управления (маневр отлета, безопасности), сек
					25000, --40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					15000, --40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.52356,--0.17, -- синус угла возвышения траектории набора горки
					50.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					21.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					-23.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					-3.0, -- производная по высоте производной дальности по скорости цели, ЗПС
					35000.0, -- дальность ракурс 180 град (навстречу), Н=5000м, V=900км/ч, м
					12000.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м
					75000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м 69km
					21500.0, -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					25000.0, -- дальность ракурс 180 град (навстречу), Н=1000м, V=900км/ч, м
					7500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м 
					4000.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.4, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.015, -- производная процента гарантированной дальности в ППС по высоте
					0.5,
				},
				
	controller = {
		boost_start = 0,
		march_start = 0.4,
	},

	boost = {
		impulse								= 0,
		fuel_mass							= 0,
		work_time							= 0.1,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
	},

	march = {
		impulse								= 234,
		fuel_mass							= 51.26,
		work_time							= 6.5,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
		smoke_opacity_type 					= 1,
	},

	fm = {
		mass				= 161.48,
		caliber				= 0.178,
		wind_sigma			= 0.0,
		wind_time			= 0.0,
		tail_first			= 0,
		fins_part_val		= 0,
		rotated_fins_inp	= 0,
		delta_max			= math.rad(20),
		draw_fins_conv		= {math.rad(90),1,1},
		L					= 0.178,
		S					= 0.0248,
		Ix					= 1.04,
		Iy					= 125.32,
		Iz					= 125.32,

		Mxd					= 0.1 * 57.3,
		Mxw					= -15.8,

		table_scale	= 0.2,
		table_degree_values = 1,
	--	Mach	  | 0.0		0.2		0.4		0.6		0.8		1.0		1.2		1.4		1.6		1.8		2.0		2.2		2.4		2.6		2.8		3.0		3.2		3.4		3.6		3.8		4.0	 	4.2		4.4		4.6		4.8		5.0 |
		Cx0 	= {	0.468,	0.468,	0.468,	0.468,	0.479,	0.751,	0.88,	0.8572,	0.8132,	0.7645,	0.7205,	0.6808,	0.6447,	0.6119,	0.582,	0.5545,	0.5292,	0.5057,	0.4838,	0.4633,	0.4439,	0.4256,	0.4083,	0.3921,	0.377,	0.364  },
		CxB 	= {	0.021,	0.021,	0.021,	0.021,	0.021,	0.138,	0.153,	0.146,	0.1382,	0.1272,	0.1167,	0.1073,	0.0987,	0.0909,	0.0837,	0.077,	0.0708,	0.065,	0.0595,	0.0544,	0.0495,	0.0449,	0.0406,	0.0364,	0.0324,	0.0286 },
		K1		= { 0.0025,	0.0025,	0.0025,	0.0025,	0.0025,	0.0024,	0.002,	 0.00172, 0.00151, 0.00135,0.00123, 0.00114, 0.00106, 0.00099,0.00094, 0.00088, 0.00084, 0.00079, 0.00074, 0.0007, 0.00066, 0.00062, 0.00058, 0.00055,0.00052, 0.0005  },
		K2		= {-0.0024,-0.0024,-0.0024,-0.0024,-0.0024,-0.0024,-0.00206,-0.00186,-0.00168,-0.0015,-0.00134,-0.00118,-0.00104,-0.0009,-0.00078,-0.00066,-0.00056,-0.00046,-0.00038,-0.0003,-0.00024,-0.00018,-0.00014,-0.0001,-0.00008,-0.00006 },
		Cya		= { 0.318,	0.318,	0.318,	0.318,	0.336,	0.425,	0.467,	0.506,	0.518,	0.503,	0.491,	0.48,	0.471,	0.463,	0.456,	0.45,	0.445,	0.441,	0.438,	0.434,	0.431,	0.429,	0.427,	0.424,	0.423,	0.421 },
		Cza		= { 0.318,	0.318,	0.318,	0.318,	0.336,	0.425,	0.467,	0.506,	0.518,	0.503,	0.491,	0.48,	0.471,	0.463,	0.456,	0.45,	0.445,	0.441,	0.438,	0.434,	0.431,	0.429,	0.427,	0.424,	0.423,	0.421 },
		Mya		= {-0.712, -0.712, -0.712, -0.712, -0.776, -0.916, -0.907, -0.825, -0.7191,-0.5719,-0.4711,-0.4019,-0.3538,-0.3193,-0.2934,-0.2728,-0.2553,-0.2398,-0.2254,-0.2119,-0.199, -0.1868,-0.1754,-0.1649,-0.1557,-0.149 },
		Mza		= {-0.712, -0.712, -0.712, -0.712, -0.776, -0.916, -0.907, -0.825, -0.7191,-0.5719,-0.4711,-0.4019,-0.3538,-0.3193,-0.2934,-0.2728,-0.2553,-0.2398,-0.2254,-0.2119,-0.199, -0.1868,-0.1754,-0.1649,-0.1557,-0.149 },
		Myw		= { -8.8081,-8.8081,-8.8081,-8.8081,-9.0256,-11.32,-10.0494,-10.0967,-10.111,-10.0959,-10.0547,-9.9906,-9.9065,-9.8052,-9.6892,-9.5609,-9.4224,-9.2756,-9.1223,-8.9639,-8.8019,-8.6373,-8.471,-8.3037,-8.1361,-7.9682 },
		Mzw		= { -8.8081,-8.8081,-8.8081,-8.8081,-9.0256,-11.32,-10.0494,-10.0967,-10.111,-10.0959,-10.0547,-9.9906,-9.9065,-9.8052,-9.6892,-9.5609,-9.4224,-9.2756,-9.1223,-8.9639,-8.8019,-8.6373,-8.471,-8.3037,-8.1361,-7.9682 },
		A1trim	= { 28,		28,		28,		28,		28,		31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },
		A2trim	= { 28,		28,		28,		28,		28,		31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },

		model_roll = math.rad(45),
		fins_stall = 1,
	},

	sensor = {
		delay						= 1.5,
		op_time						= 100,
		FOV							= math.rad(15),
		max_w_LOS					= math.rad(30),
		sens_near_dist				= 100,
		sens_far_dist				= 30000,
		ccm_k0						= 0.1,
		aim_sigma					= 3.5,
		height_error_k				= 20,
		height_error_max_vel		= 50,
		height_error_max_h			= 300,
		hoj							= 1,
	},
	
	gimbal = {
		delay				= 0,
		op_time				= 100,
		pitch_max			= math.rad(60),
		yaw_max				= math.rad(60),
		max_tracking_rate	= math.rad(30),
		tracking_gain		= 50,
	},

	autopilot = {
		delay				= 0.2,
		cmd_delay			= 0.8,
		op_time				= 100,
		Tf					= 0.1,
		Knav				= 4.0,
		Kd					= 180.0,
		Ka					= 16.0,
		T1					= 309.0,
		Tc					= 0.06,
		Kx					= 0.1,
		Krx					= 2.0,
		gload_limit			= 30.0,
		fins_limit			= math.rad(18),
		fins_limit_x		= math.rad(5),
		null_roll			= math.rad(45),
		accel_coeffs		= { 0, 11.5,-1.2,-0.25, 24.0,
								0.0248 * 0.75 * 0.0091 },

		loft_active			= 1,
		loft_factor			= 4.5,
		loft_sin			= math.sin(30/57.3),
		loft_off_range		= 15000,
		dV0					= 393,
	},

	actuator = {
		Tf					= 0.005,
		D					= 250.0,
		T1					= 0.002,
		T2					= 0.006,
		max_omega			= math.rad(400),
		max_delta			= math.rad(20),
		fin_stall			= 1,
		sim_count			= 4,
	},

	proximity_fuze = {
		radius		= 15.0,
		arm_delay	= 1.6,
	},
				
}
declare_weapon(jf39_aim120c5)
----------------------------------------------------------------------------------------
-- AIM-120C-7 AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120c7_name = 'jf39_aim-120c7'
local jf39_aim120c7_mass = 161.5
local jf39_aim120c7_warhead = enhanced_a2a_warhead(9, 178)

local jf39_aim120c7 = {
    category        = CAT_AIR_TO_AIR,
    name            = jf39_aim120c7_name,
	scheme			= "aa_missile_amraam2",
	class_name		= "wAmmunitionSelfHoming",		
    model           = 'aim-120c',
    user_name       = _(jf39_aim120c7_name),
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
    mass            = jf39_aim120c7_mass,

    Escort = 0,
    Head_Type = 2,
	sigma = {5, 5, 5},
    M = 161.48,
    H_max = 29000.0,
    H_min = 1.0,
    Diam = 160.0,
    Cx_pil = 2.5,
    D_max = 20000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.4,
    t_acc = 3.0,
    t_marsh = 6.0,
    Range_max = 90000.0,
    H_min_t = 1.0,
    Fi_start = 0.88,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05 };
    X_back = -1.98,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.07,
    KillDistance = 15.0,
	
	SeekerGen = 4,  -- Seeker generation
	ccm_k0 = 0.1,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	loft = 1,
	hoj = 1,
	loft_factor = 4.5,
	PN_gain = 4,
		
	supersonic_A_coef_skew = 0.1, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.011, -- площадь выходного сечения сопла
	
    warhead         = jf39_aim120c7_warhead,
    warhead_air     = jf39_aim120c7_warhead,

    shape_table_data = {
        {
            name     = jf39_aim120c7_name,
            file     = 'aim-120c',
            life     = 1,
            fire     = {0, 1},
            username = "AIM120C7",		--Shortened name for cockpit displays
            index    = WSTYPE_PLACEHOLDER,
        },
    },

	ModelData = {   58 ,  -- model params count
					0.4 ,   -- characteristic square (характеристическая площадь)
					
					-- параметры зависимости Сx
					0.029 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
					0.06 , -- Cx_k1 высота пика волнового кризиса
					0.01 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
					-0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
					0.08 , -- Cx_k4 крутизна спада за волновым кризисом 
					0.7 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
					
					-- параметры зависимости Cy
					1.4 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
					0.6	 , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
					1.2  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
						
					0.5 , -- 7 Alfa_max  максимальный балансировачный угол, радианы
					0.0, --угловая скорость создаваймая моментом газовых рулей
						
					-- Engine data. Time, fuel flow, thrust.	
					--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,		-1.0,	8.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					0.0,		0.0,	6.41,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					0.0,		0.0,	16325.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					100.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					1.0, -- время задержки включения управления (маневр отлета, безопасности), сек
					25000, --40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					15000, --40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.52356,--0.17, -- синус угла возвышения траектории набора горки
					50.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					21.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					-23.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					-3.0, -- производная по высоте производной дальности по скорости цели, ЗПС
					35000.0, -- дальность ракурс 180 град (навстречу), Н=5000м, V=900км/ч, м
					12000.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м
					75000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м 69km
					21500.0, -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					25000.0, -- дальность ракурс 180 град (навстречу), Н=1000м, V=900км/ч, м
					7500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м 
					4000.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.4, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.015, -- производная процента гарантированной дальности в ППС по высоте
					0.5,
				},
				
	controller = {
		boost_start = 0,
		march_start = 0.4,
	},

	boost = {
		impulse								= 0,
		fuel_mass							= 0,
		work_time							= 0.1,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
	},

	march = {
		impulse								= 234,
		fuel_mass							= 51.26,
		work_time							= 6.5,
		nozzle_position						= {{-1.9, 0, 0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		nozzle_exit_area 					= 0.0132,
		tail_width							= 0.4,
		smoke_color							= {0.8, 0.8, 0.8},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,
		smoke_opacity_type 					= 1,
	},

	fm = {
		mass				= 161.48,
		caliber				= 0.178,
		wind_sigma			= 0.0,
		wind_time			= 0.0,
		tail_first			= 0,
		fins_part_val		= 0,
		rotated_fins_inp	= 0,
		delta_max			= math.rad(20),
		draw_fins_conv		= {math.rad(90),1,1},
		L					= 0.178,
		S					= 0.0248,
		Ix					= 1.04,
		Iy					= 125.32,
		Iz					= 125.32,

		Mxd					= 0.1 * 57.3,
		Mxw					= -15.8,

		table_scale	= 0.2,
		table_degree_values = 1,
	--	Mach	  | 0.0		0.2		0.4		0.6		0.8		1.0		1.2		1.4		1.6		1.8		2.0		2.2		2.4		2.6		2.8		3.0		3.2		3.4		3.6		3.8		4.0	 	4.2		4.4		4.6		4.8		5.0 |
		Cx0 	= {	0.468,	0.468,	0.468,	0.468,	0.479,	0.751,	0.88,	0.8572,	0.8132,	0.7645,	0.7205,	0.6808,	0.6447,	0.6119,	0.582,	0.5545,	0.5292,	0.5057,	0.4838,	0.4633,	0.4439,	0.4256,	0.4083,	0.3921,	0.377,	0.364  },
		CxB 	= {	0.021,	0.021,	0.021,	0.021,	0.021,	0.138,	0.153,	0.146,	0.1382,	0.1272,	0.1167,	0.1073,	0.0987,	0.0909,	0.0837,	0.077,	0.0708,	0.065,	0.0595,	0.0544,	0.0495,	0.0449,	0.0406,	0.0364,	0.0324,	0.0286 },
		K1		= { 0.0025,	0.0025,	0.0025,	0.0025,	0.0025,	0.0024,	0.002,	 0.00172, 0.00151, 0.00135,0.00123, 0.00114, 0.00106, 0.00099,0.00094, 0.00088, 0.00084, 0.00079, 0.00074, 0.0007, 0.00066, 0.00062, 0.00058, 0.00055,0.00052, 0.0005  },
		K2		= {-0.0024,-0.0024,-0.0024,-0.0024,-0.0024,-0.0024,-0.00206,-0.00186,-0.00168,-0.0015,-0.00134,-0.00118,-0.00104,-0.0009,-0.00078,-0.00066,-0.00056,-0.00046,-0.00038,-0.0003,-0.00024,-0.00018,-0.00014,-0.0001,-0.00008,-0.00006 },
		Cya		= { 0.318,	0.318,	0.318,	0.318,	0.336,	0.425,	0.467,	0.506,	0.518,	0.503,	0.491,	0.48,	0.471,	0.463,	0.456,	0.45,	0.445,	0.441,	0.438,	0.434,	0.431,	0.429,	0.427,	0.424,	0.423,	0.421 },
		Cza		= { 0.318,	0.318,	0.318,	0.318,	0.336,	0.425,	0.467,	0.506,	0.518,	0.503,	0.491,	0.48,	0.471,	0.463,	0.456,	0.45,	0.445,	0.441,	0.438,	0.434,	0.431,	0.429,	0.427,	0.424,	0.423,	0.421 },
		Mya		= {-0.712, -0.712, -0.712, -0.712, -0.776, -0.916, -0.907, -0.825, -0.7191,-0.5719,-0.4711,-0.4019,-0.3538,-0.3193,-0.2934,-0.2728,-0.2553,-0.2398,-0.2254,-0.2119,-0.199, -0.1868,-0.1754,-0.1649,-0.1557,-0.149 },
		Mza		= {-0.712, -0.712, -0.712, -0.712, -0.776, -0.916, -0.907, -0.825, -0.7191,-0.5719,-0.4711,-0.4019,-0.3538,-0.3193,-0.2934,-0.2728,-0.2553,-0.2398,-0.2254,-0.2119,-0.199, -0.1868,-0.1754,-0.1649,-0.1557,-0.149 },
		Myw		= { -8.8081,-8.8081,-8.8081,-8.8081,-9.0256,-11.32,-10.0494,-10.0967,-10.111,-10.0959,-10.0547,-9.9906,-9.9065,-9.8052,-9.6892,-9.5609,-9.4224,-9.2756,-9.1223,-8.9639,-8.8019,-8.6373,-8.471,-8.3037,-8.1361,-7.9682 },
		Mzw		= { -8.8081,-8.8081,-8.8081,-8.8081,-9.0256,-11.32,-10.0494,-10.0967,-10.111,-10.0959,-10.0547,-9.9906,-9.9065,-9.8052,-9.6892,-9.5609,-9.4224,-9.2756,-9.1223,-8.9639,-8.8019,-8.6373,-8.471,-8.3037,-8.1361,-7.9682 },
		A1trim	= { 28,		28,		28,		28,		28,		31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },
		A2trim	= { 28,		28,		28,		28,		28,		31.2,	32.74,	33.39,	33.7,	33.89,	34.04,	34.18,	34.31,	34.44,	34.57,	34.7,	34.83,	34.96,	35.09,	35.22,	35.35,	35.48,	35.61,	35.74,	35.87,	36 },

		model_roll = math.rad(45),
		fins_stall = 1,
	},

	sensor = {
		delay						= 1.5,
		op_time						= 100,
		FOV							= math.rad(15),
		max_w_LOS					= math.rad(30),
		sens_near_dist				= 100,
		sens_far_dist				= 30000,
		ccm_k0						= 0.08,
		aim_sigma					= 3.0,
		height_error_k				= 20,
		height_error_max_vel		= 50,
		height_error_max_h			= 300,
		hoj							= 1,
	},
	
	gimbal = {
		delay				= 0,
		op_time				= 100,
		pitch_max			= math.rad(60),
		yaw_max				= math.rad(60),
		max_tracking_rate	= math.rad(30),
		tracking_gain		= 50,
	},

	autopilot = {
		delay				= 0.2,
		cmd_delay			= 0.8,
		op_time				= 100,
		Tf					= 0.1,
		Knav				= 4.0,
		Kd					= 180.0,
		Ka					= 16.0,
		T1					= 309.0,
		Tc					= 0.06,
		Kx					= 0.1,
		Krx					= 2.0,
		gload_limit			= 30.0,
		fins_limit			= math.rad(18),
		fins_limit_x		= math.rad(5),
		null_roll			= math.rad(45),
		accel_coeffs		= { 0, 11.5,-1.2,-0.25, 24.0,
								0.0248 * 0.75 * 0.0091 },

		loft_active			= 1,
		loft_factor			= 4.5,
		loft_sin			= math.sin(30/57.3),
		loft_off_range		= 15000,
		dV0					= 393,
	},

	actuator = {
		Tf					= 0.005,
		D					= 250.0,
		T1					= 0.002,
		T2					= 0.006,
		max_omega			= math.rad(400),
		max_delta			= math.rad(20),
		fin_stall			= 1,
		sim_count			= 4,
	},

	proximity_fuze = {
		radius		= 15.0,
		arm_delay	= 1.6,
	},
	
}
declare_weapon(jf39_aim120c7)
----------------------------------------------------------------------------------------
--                            File by whisky.actual@gmail.com                         --
----------------------------------------------------------------------------------------
