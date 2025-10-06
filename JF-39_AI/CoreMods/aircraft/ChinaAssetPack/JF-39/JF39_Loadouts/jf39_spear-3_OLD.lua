local cm802akg_model = 'jf39_spear-3'
local cm802akg_disp = 'SPEAR-3 Air-to-Ground Glide Missile'
local cm802akg_mass = 90
local quad_pylon_mass = 145.0

local C802AKG_warhead =
{
    mass                 = 6.3, 
    caliber              = 180,
    expl_mass            = 6.3,
    piercing_mass        = 6.3*1.2,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 0.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 5.0,
    cumulative_thickness = 2.0, 
}
JF39_SPEAR3 =
{
	category		= CAT_MISSILES,
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},
	
	name			= cm802akg_disp,
	display_name	= _('AGM-84E'),
	user_name		= cm802akg_disp,
	display_name_short = "CM-802",
	
	scheme			= "AGM-84E",
	class_name		= "wAmmunitionAntiShip",
	model			= cm802akg_model,
	
	Escort		= 0,
	Head_Type	= 5,
	sigma		= {25, 25, 25},
	M			= 670.0,
	H_max		= 10000.0,
	H_min		= 500,
	Diam		= 360.0,
	Cx_pil		= 8,
	D_max		= 230000.0,
	D_min		= 15000.0,
	Head_Form	= 0,
	Life_Time	= 1850.0,
	Nr_max		= 18,
	v_min		= 150.0,
	v_mid		= 272.0,
	Mach_max	= 0.9,
	t_b			= 0.01,
	t_acc		= 5.0,
	t_marsh		= 1800.0,
	Range_max	= 230000.0,
	H_min_t		= 0.0,
	Fi_start	= 0.5,
	Fi_rak		= 3.14152,
	Fi_excort	= 1.05,
	Fi_search	= 99.9,
	OmViz_max	= 99.9,

	X_back			= -1.581,
	Y_back			= 0,
	Z_back			= 0.0,
	Reflection		= 0.25,
	KillDistance	= 0.0,
		
	Damage_correction_coeff = 0.7,
	
	add_attributes = {"Cruise missiles", "Anti-Ship missiles", "Air"},
	
	LaunchDistData =
	{
		17,		9,

				100,	150,	200,	250,	300,	350,	400,	450,	500,		
		100,	0,		0,		205025,	208800,	211725,	214900,	217775,	220750,	224250,	
		200,	0,		200075,	205325,	208675,	212075,	215225,	218150,	221100,	224625,	
		300,	0,		200325,	205175,	209000,	212400,	215575,	218525,	221450,	224525,	
		400,	195575,	200575,	205475,	209350,	212725,	215925,	218900,	221775,	224850,	
		500,	195800,	200825,	205775,	209675,	213075,	216250,	219225,	222125,	225125,	
		600,	196000,	200600,	206050,	209950,	213400,	216550,	219500,	222400,	225300,	
		700,	196200,	200900,	206350,	210300,	213700,	216900,	219850,	222650,	225600,	
		800,	196400,	201150,	206650,	210650,	214000,	217300,	220150,	222900,	225800,	
		900,	196650,	201400,	206950,	210950,	214350,	217550,	220400,	223150,	225950,	
		1000,	196850,	201700,	207200,	211300,	214650,	217900,	220650,	223400,	226250,	
		2000,	199900,	206300,	210600,	214300,	217300,	219900,	222500,	225000,	228000,	
		3000,	204800,	209300,	213100,	216700,	219500,	222000,	224200,	226800,	229900,	
		4000,	207500,	211700,	215100,	218500,	221800,	223900,	226100,	228700,	231900,	
		5000,	209500,	213500,	217000,	220200,	223800,	226100,	228100,	230700,	234000,	
		6000,	211250,	215000,	218500,	221750,	225250,	228000,	230250,	232750,	236000,	
		7000,	213000,	216750,	220250,	223250,	226750,	230250,	232250,	235000,	238250,	
		7500,	213750,	217500,	220750,	224000,	227250,	230750,	233250,	236000,	240500,	
	},

	MinLaunchDistData =
	{
		17,		9,

				100,	150,	200,	250,	300,	350,	400,	450,	500,		
		100,	0,		0,		21700,	21950,	16325,	16775,	17100,	17900,	24150,	
		200,	0,		21475,	21425,	15950,	16450,	16950,	17450,	17975,	24000,	
		300,	0,		21250,	15475,	16050,	16600,	17125,	17550,	18125,	18900,	
		400,	22250,	21025,	15575,	16175,	16725,	17250,	17700,	18300,	19225,	
		500,	22000,	20800,	15700,	16225,	16850,	17325,	17900,	18475,	19350,	
		600,	21800,	14950,	15750,	16400,	16950,	17500,	18000,	18550,	19250,	
		700,	21550,	15000,	15800,	16400,	17000,	17550,	18050,	18650,	19350,	
		800,	21350,	15100,	15900,	16550,	17100,	17650,	18150,	18700,	19450,	
		900,	21150,	15150,	16000,	16600,	17150,	17700,	18250,	18800,	19500,	
		1000,	20900,	15200,	16000,	16650,	17300,	17800,	18300,	18900,	19600,	
		2000,	14500,	15500,	16200,	16900,	17600,	18200,	18800,	19500,	20000,	
		3000,	14600,	15100,	16000,	16900,	17300,	18300,	18900,	19600,	21200,	
		4000,	14800,	15100,	15300,	15600,	15800,	16100,	16600,	19300,	21300,	
		5000,	14900,	15200,	15500,	15700,	15900,	16200,	16600,	17000,	21300,	
		6000,	15000,	15500,	15750,	15750,	16000,	16250,	16750,	17000,	17500,	
		7000,	15250,	15500,	15750,	16000,	16250,	16500,	16500,	17000,	17500,	
		7500,	15250,	15500,	15750,	16000,	16250,	16500,	16750,	17000,	18000,	
	},
	
	shape_table_data =
	{
		{
			name		= cm802akg_disp,
			file		= cm802akg_model,
			life		= 1,
			fire		= { 0, 1},
			username	= cm802akg_disp,
			index		= WSTYPE_PLACEHOLDER,
		},
	},
	
		controller = {
		boost_start	= 0,
		march_start = 0,
	},

	control_block = {
		default_cruise_height = 1000.0,
	},


	boost = {				--	air launch - no booster
		impulse								= 0,
		fuel_mass							= 0,
		work_time							= 0,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{0, 0, 0}},
		nozzle_orientationXYZ				= {{0, 0, 0}},
		tail_width							= 0.0,
		smoke_color							= {0.0, 0.0, 0.0},
		smoke_transparency					= 0.0,
		custom_smoke_dissipation_factor		= 0.0,
	},

	march = {
		impulse			= 3000,
		fuel_mass		= 68,
		work_time		= 9999,
		min_fuel_rate	= 0.005,
		min_thrust		= -100,
		max_thrust		= 5000,
		thrust_Tau		= 0.0018,

		nozzle_position						= {{-2.26, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.5,
		smoke_color							= {0.5, 0.5, 0.5},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,

		start_burn_effect			= 1,
		start_effect_delay			= {0.0,		0.3, 	0.8},
		start_effect_time			= {0.7,		1.0, 	0.1},
		start_effect_size			= {0.09,	0.104,	0.11},
		start_effect_smoke			= {0.01,	0.4, 	0.01},
		start_effect_x_pow			= {1.0,		1.0,	1.0},
		start_effect_x_dist			= {1.1,		0.9,	0.0},
		start_effect_x_shift		= {0.15,	0.15,	0.2},
	},

	engine_control = {
		default_speed	= 285,
		K				= 240,
		Kd				= 1.0,
		Ki				= 0.01,
		speed_delta		= 5,
	},


	seeker = {
		delay				= 0.0,
		op_time				= 800,
		activate_on_update	= 1,

		FOV					= math.rad(60),

		max_target_speed			= 33,
		max_target_speed_rnd_coeff	= 10,

		max_lock_dist		= 30000,
	},

	ins = {
		aim_sigma		= 350,
		check_AI		= 1,
		error_coeff		= 0.03,
	},

	fm = {
		mass        = 670,
		caliber     = 0.360,
		cx_coeff    = {1,0.39,0.38,0.236,1.31},
		L           = 5.145,
		I           = 1 / 12 * 670.0 * 5.145 * 5.145,
		Ma          = 0.68,
		Mw          = 1.116,
		wind_sigma	= 0.0,
		wind_time	= 1000.0,
		Sw			= 0.75,
		dCydA		= {0.07, 0.036},
		A			= 0.5,
		maxAoa		= 0.3,
		finsTau		= 0.02,
		Ma_x		= 3,
		Ma_z		= 3,
		Mw_x		= 2.6,
	},

	autopilot =
	{
		glide_height				= 1000,
		dont_climb_on_cruise_height	= 0,
		vel_proj_div 				= 6.0,
		default_glide_height		= 1000,
		pre_maneuver_glide_height	= 1000,
		skim_glide_height			= 8,
		use_start_bar_height		= 1,
		altim_vel_k					= 4,

		delay				= 1.0,
		op_time				= 9999,
		Kw					= 4.0,
		Ks					= 1.0,
		K					= 1.0,
		Kd 					= 0.0,
		Ki 					= 30.0,--10
		Kx					= 0.04,
		Kdx					= 0.001,
		w_limit				= math.rad(5),
		fins_limit			= math.rad(50),
		fins_limit_x		= math.rad(25),
		rotated_WLOS_input	= 0,
		conv_input			= 0,
		PN_dist_data 		= {	2000,	0,
								500,	0},

		max_climb_angle		= math.rad(10),
		max_dive_angle		= math.rad(-30),
		max_climb_ang_hdiff	= 180,
		max_dive_ang_hdiff	= -500,

		Ksd						= 0.0,
		Ksi						= 0.0,
		integr_val_limit		= 0.5,
		hor_err_limit			= 0.5,
		max_climb_vel			= 200,
		min_climb_vel			= 120,
		min_climb_vel_factor	= 0,
		max_climb_h				= 3000,
		min_climb_h				= 10000,
		min_climb_h_factor		= 0.5,
		
		inertial_km_error		= 4.0,
		glide_height_eq_error	= 0.02,

		
		vert_ctrl_data 		= {	100,	math.rad(-24),
								115,	math.rad(-16),
								130,	math.rad(-8),
								145,	math.rad(0),
								185,	math.rad(10),	},
	},

	final_autopilot = {
		delay				= 1.0,
		op_time				= 9999,
		Kw					= 1.0,
		Ks					= 5.0,
		K					= 5.0,
		Kd 					= 0.0,
		Ki 					= 0.0,
		Kx					= 0.0,
		Kix					= 0.0,
		w_limit				= math.rad(15),
		fins_limit			= math.rad(50),
		rotated_WLOS_input	= 0,
		conv_input			= 0,
		PN_dist_data 		= {	2000,	1,
								500,	1},

		add_err_val				= 0,
		add_err_vert			= 0,
		add_out_val				= 0.1,
		add_out_vert			= 1,
		loft_angle				= math.rad(8),
		loft_trig_angle			= math.rad(14),
		K_loft_err				= 1,
		loft_angle_vert			= 1,
		loft_active_by_default	= 0,
	},

	triggers_control = {
		action_wait_timer				= 5,	-- wait for dist functions n sen, then set default values
		default_sensor_tg_dist			= 10000, -- turn on seeker and start horiz. correction if target is locked
		default_final_maneuver_tg_dist	= 7000,
		default_straight_nav_tg_dist	= 7000,
		default_destruct_tg_dist		= 3000,	-- if seeker still can not find a target explode warhead after reaching pred. target point + n. km
		trigger_by_path					= 1,
		final_maneuver_trig_v_lim		= 3,
		use_horiz_dist					= 1,
		pre_maneuver_glide_height		= 1000,	-- triggers st nav instead of fin. maneuver if h>2*pre_maneuver_glide_height at fin. maneuver distance
		min_cruise_height				= 1000,
		min_cruise_height_trigger_sum	= 10000,
		min_cruise_height_trigger_mlt	= 285/33,
	},
	
	warhead		= predefined_warhead("C_802A"),
	warhead_air = predefined_warhead("C_802A"),
}

declare_weapon(JF39_SPEAR3)

declare_loadout({
    category         = CAT_MISSILES,
    CLSID            = 'DIS_CM-802AKG',	
	Count            = 4,
	Cx_pil           = 0.00043,
    Picture          = 'jf39_spear-3.png',
	displayName      = _(cm802akg_disp .. ' x4'),
	Weight           = cm802akg_mass + quad_pylon_mass,
    Elements = {
        {
            ShapeName = 'jf39_bru_61',
            IsAdapter = true
        },
        {
            DrawArgs	=	
            {
                [1]	=	{1,	1},
                [2]	=	{2,	1},
            }, -- end of DrawArgs
            Position	=	{-0.35,-0.05,0.20},
            ShapeName	=	ld10_model,
            Rotation    = 	{-45,0,0},
        },
        {
            DrawArgs	=	
            {
                [1]	=	{1,	1},
                [2]	=	{2,	1},
            }, -- end of DrawArgs
            Position	=	{-0.25,-0.29,0},
            ShapeName	=	ld10_model,
            Rotation    = 	{0,0,0},
        },
        {
			connector_name =	'AttachPoint003',		
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
        {
			connector_name =	'AttachPoint004',		
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
    },
	wsTypeOfWeapon   = JF39_SPEAR3.wsTypeOfWeapon,
	attribute        = {4, 4, 32, WSTYPE_PLACEHOLDER},
	ejectImpulse     = eject_speed_msl,
	ejectDirection   = {0, -1, 0},
})