
JF39_FM = 
{
    disable_built_in_oxygen_system = true,
    center_of_mass    = {0.25, -0.020, 0.00},
    moment_of_inertia = {12875.0, 85552.0, 75674.0, -1331.0}, -- Ix, Iy, Iz, Ixy

    suspension = {
        { -- NOSE WHEEL
            wheel_radius = 0.1845,
            damper_coeff = 300.0,
            filter_yaw   = true,
            yaw_limit    = math.rad(67.0),
            moment_limit = 750.0,
            
            allowable_hard_contact_length = 0.25,
            
            anti_skid_installed = true,
            wheel_brake_moment_max               = 8000.0,
            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.424,
            amortizer_basic_length               = 0.49,
            amortizer_spring_force_factor        = 1.2e+6,
            amortizer_spring_force_factor_rate   = 3.5,
            amortizer_static_force               = 6000.0,
            amortizer_reduce_length              = 0.424,
            amortizer_direct_damper_force_factor = 15000.0,
            amortizer_back_damper_force_factor   = 15000.0,
            
            wheel_static_friction_factor = 0.35,
            wheel_side_friction_factor   = 1.1,
            wheel_roll_friction_factor   = 0.06,
            wheel_glide_friction_factor  = 0.58,
            wheel_damage_force_factor    = 450.0,
            wheel_damage_speed           = 500,
            wheel_damage_speedX          = 500,

            arg_post             = 0,
            arg_amortizer        = 1,
            arg_wheel_rotation   = 101,
            arg_wheel_yaw        = 2,
            collision_shell_name = 'WHEEL_F',
        },
        { -- LEFT WHEEL
            mass         = 200,
            wheel_radius = 0.3245,
            wheel_static_friction_factor  = 0.42,
            wheel_side_friction_factor    = 0.95,
            wheel_roll_friction_factor    = 0.067,
            wheel_glide_friction_factor   = 0.8,
            
            allowable_hard_contact_length = 0.1,
            
            anti_skid_installed 				 = true,
			anti_skid_improved					 = true,
			anti_skid_gain						 = 400.0,
			
            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.35,
            amortizer_basic_length               = 0.35,
            amortizer_spring_force_factor        = 4.8e+6,
            amortizer_spring_force_factor_rate   = 3.0,
            amortizer_static_force               = 1000,
            amortizer_reduce_length              = 0.227,
            amortizer_direct_damper_force_factor = 60000,
            amortizer_back_damper_force_factor   = 20000,
            
            wheel_brake_moment_max               = 35000.0, 
            wheel_damage_force_factor            = 200,
            wheel_damage_speed                   = 500,
            wheel_damage_speedX                  = 500,

            arg_post             = 5,
            arg_amortizer        = 6,
            arg_wheel_rotation   = 102,
			arg_wheel_damage	= 136,
            --arg_wheel_yaw        = -1,
            collision_shell_name = 'WHEEL_L',
        },
        { -- RIGHT WHEEL
            mass         = 200,
            wheel_radius = 0.3245,
            wheel_static_friction_factor  = 0.42,
            wheel_side_friction_factor    = 0.95,
            wheel_roll_friction_factor    = 0.067,
            wheel_glide_friction_factor   = 0.8,
            
            allowable_hard_contact_length = 0.1,
            
            anti_skid_installed 				 = true,
			anti_skid_improved					 = true,
			anti_skid_gain						 = 400.0,
			
            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.35,
            amortizer_basic_length               = 0.35,
            amortizer_spring_force_factor        = 4.8e+6,
            amortizer_spring_force_factor_rate   = 3.0,
            amortizer_static_force               = 1000,
            amortizer_reduce_length              = 0.227,
            amortizer_direct_damper_force_factor = 60000,
            amortizer_back_damper_force_factor   = 20000,
            
            wheel_brake_moment_max               = 35000.0, 
            wheel_damage_force_factor            = 200,
            wheel_damage_speed                   = 500,
            wheel_damage_speedX                  = 500,

            arg_post             = 3,
            arg_amortizer        = 4,
            arg_wheel_rotation   = 103,
			arg_wheel_damage	= 135,
            --arg_wheel_yaw        = -1,
            collision_shell_name = 'WHEEL_R',
        },
    }
}
