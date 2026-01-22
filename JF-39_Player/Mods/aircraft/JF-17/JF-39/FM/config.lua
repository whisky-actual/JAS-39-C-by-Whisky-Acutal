JF39_FM =
{
    disable_built_in_oxygen_system = true,

    center_of_mass    = {0.25, -0.020, 0.00},
    moment_of_inertia = {12875.0, 85552.0, 75674.0, -1331.0},

    suspension =
    {
        ----------------------------------------------------------------
        -- NOSE WHEEL (stability-limited, anti-tip)
        ----------------------------------------------------------------
        {
            wheel_radius = 0.185,
            damper_coeff = 600.0,
            filter_yaw   = true,
            yaw_limit    = math.rad(65.0),
            moment_limit = 800.0,

            allowable_hard_contact_length = 0.25,

            anti_skid_installed   = true,
            wheel_brake_moment_max = 14000.0,

            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.45,
            amortizer_basic_length               = 0.52,
            amortizer_spring_force_factor        = 3.0e+6,
            amortizer_spring_force_factor_rate   = 4.0,
            amortizer_static_force               = 8500.0,
            amortizer_reduce_length              = 0.45,
            amortizer_direct_damper_force_factor = 45000.0,
            amortizer_back_damper_force_factor   = 45000.0,

            wheel_static_friction_factor = 0.55,
            wheel_side_friction_factor   = 0.85,
            wheel_roll_friction_factor   = 0.08,
            wheel_glide_friction_factor  = 0.75,

            wheel_damage_force_factor = 700.0,
            wheel_damage_speed        = 650,
            wheel_damage_speedX       = 650,

            arg_post             = 0,
            arg_amortizer        = 1,
            arg_wheel_rotation   = 101,
            arg_wheel_yaw        = 2,
            collision_shell_name = 'WHEEL_F',
        },

        ----------------------------------------------------------------
        -- LEFT MAIN WHEEL (Gripen STOL + anti-rollover)
        ----------------------------------------------------------------
        {
            mass         = 220,
            wheel_radius = 0.34,

            wheel_static_friction_factor = 0.68,
            wheel_side_friction_factor   = 0.95,
            wheel_roll_friction_factor   = 0.085,
            wheel_glide_friction_factor  = 1.00,

            allowable_hard_contact_length = 0.20,

            anti_skid_installed   = true,
            wheel_brake_moment_max = 52000.0,

            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.40,
            amortizer_basic_length               = 0.40,
            amortizer_spring_force_factor        = 8.5e+6,
            amortizer_spring_force_factor_rate   = 3.5,
            amortizer_static_force               = 4500.0,
            amortizer_reduce_length              = 0.25,
            amortizer_direct_damper_force_factor = 110000.0,
            amortizer_back_damper_force_factor   = 50000.0,

            wheel_damage_force_factor = 700.0,
            wheel_damage_speed        = 650,
            wheel_damage_speedX       = 650,

            arg_post             = 5,
            arg_amortizer        = 6,
            arg_wheel_rotation   = 102,
            arg_wheel_yaw        = -1,
            collision_shell_name = 'WHEEL_L',
        },

        ----------------------------------------------------------------
        -- RIGHT MAIN WHEEL (mirrored)
        ----------------------------------------------------------------
        {
            mass         = 220,
            wheel_radius = 0.34,

            wheel_static_friction_factor = 0.68,
            wheel_side_friction_factor   = 0.95,
            wheel_roll_friction_factor   = 0.085,
            wheel_glide_friction_factor  = 1.00,

            allowable_hard_contact_length = 0.20,

            anti_skid_installed   = true,
            wheel_brake_moment_max = 52000.0,

            amortizer_min_length                 = 0.0,
            amortizer_max_length                 = 0.40,
            amortizer_basic_length               = 0.40,
            amortizer_spring_force_factor        = 8.5e+6,
            amortizer_spring_force_factor_rate   = 3.5,
            amortizer_static_force               = 4500.0,
            amortizer_reduce_length              = 0.25,
            amortizer_direct_damper_force_factor = 110000.0,
            amortizer_back_damper_force_factor   = 50000.0,

            wheel_damage_force_factor = 700.0,
            wheel_damage_speed        = 650,
            wheel_damage_speedX       = 650,

            arg_post             = 3,
            arg_amortizer        = 4,
            arg_wheel_rotation   = 103,
            arg_wheel_yaw        = -1,
            collision_shell_name = 'WHEEL_R',
        },
    }
}
