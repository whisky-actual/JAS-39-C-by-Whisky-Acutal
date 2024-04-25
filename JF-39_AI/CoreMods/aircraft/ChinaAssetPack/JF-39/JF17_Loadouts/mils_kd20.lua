local use_ed_wpn = true

local function clsid_kd20(use_ed)
    if use_ed then
        return "weapons.missiles.KD_20"
    else
        return "weapons.missiles.KD-20"
    end
end

local kd20_use_scheme = true

local kd20_name  = 'KD-20'
local kd20_model = 'kd20'
local kd20_mass  = 1700
local pylon_mass = 50.0

local KD20_warhead =
{
    mass                 = 500,
    caliber              = 550,
    expl_mass            = 300,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 3.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.07,
}

KD20_AS = {
    category       = CAT_MISSILES,
    name           = kd20_name,
    user_name      = _(kd20_name),
    display_name   = _(kd20_name),
    mass           = kd20_mass,
    model          = kd20_model,
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, WSTYPE_PLACEHOLDER},

    Escort         = 0,
    Head_Type      = 5, -- 5,
    sigma          = {8, 8, 8},
    M              = kd20_mass,
    H_max          = 13000.0,
    H_min          = -1,
    Diam           = 600.0,
    Cx_pil         = 2,
    D_max          = 2500000.0,
    D_min          = 20000.0,
    Head_Form      = 0,
    Life_Time      = 10000.0,
    Nr_max         = 16,
    v_min          = 170.0,
    v_mid          = 220.0,
    Mach_max       = 0.9,
    t_b            = 3.0,
    t_acc          = 0.0,
    t_marsh        = 10000.0,
    Range_max      = 2500000.0,
    H_min_t        = 0.0,
    Fi_start       = 3.14152,
    Fi_rak         = 3.14152,
    Fi_excort      = 3.14152, -- 0.35,
    Fi_search      = 99.9,
    OmViz_max      = 99.9,
    Stage_         = 1,
    Engine_Type    = 5,
    X_back         = -3.825,
    Y_back         = 0.0,
    Z_back         = 0.0,
    Reflection     = 0.1691,
    KillDistance   = 0.0,

    --[[LaunchDistData =
    {
        -- launch altitude: 500m - 7500m
        -- http://www.sinaimg.cn/dy/slidenews/8_img/2011_45/22159_89924_239722.jpg
          12,        7,
                   100,      125,      150,      175,       200,       250,       300,
         500,    150000,      155000,    160000,      165000,     170000,    175000,       180000,
         600,    152000,      157000,    162000,      167000,     172000,    177000,       182000,
         700,    154000,      159000,    164000,      169000,     174000,    179000,       184000,
         800,    156000,      161000,    166000,      171000,     176000,    181000,       186000,
         900,    158000,      163000,    168000,      173000,     178000,    183000,       188000,
        1000,    160000,      165000,    170000,      175000,     180000,    185000,       190000,
        1200,    163000,      168000,    173000,      178000,     183000,    188000,       193000,
        2200,    170000,      175000,    180000,      185000,     189000,    194000,       199000,
        3200,    176000,      181000,    186000,      191000,     194000,    199000,       204000,
        4200,    181000,      186000,    191000,      196000,     199000,    203000,       208000,
        5200,    185000,      190000,    195000,      199000,     203000,    207000,       212000,
        7500,    190000,      195000,    200000,      204000,     208000,    212000,       217000,

    },]]

    LaunchDistData =
    {
        4,      4,

                100,        125,        175,        250,        
        500,    0,          0,          2500000,    2520000,    
        2000,   2500000,    2500000,    2510000,    2540000,    
        7000,   2540000,    2550000,    2550000,    2560000,    
        12500,  2570000,    2570000,    2580000,    2590000,    
    },
    
    MinLaunchDistData =
    {
        4,      4,

                100,        125,        175,        250,        
        500,    0,          0,          20000,      21000,  
        2000,   24000,      25000,      26000,      27000,  
        7000,   15000,      15000,      16000,      17000,  
        12500,  16000,      18000,      19000,      20000,  
    },

    warhead     = KD20_warhead,
    warhead_air = KD20_warhead,

    add_attributes = {"Cruise missiles"},

    encyclopediaAnimation = {
        args = {
            [25] = 1.000000, -- wings open
        },
    },

    shape_table_data = {
        {
            name     = kd20_name,
            file     = kd20_model,
            life     = 0.6,
            fire     = {0, 1},
            username = kd20_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    --
    -- scheme            = "cruise_missile",
    -- class_name        = "wAmmunitionCruise",

}

if kd20_use_scheme then

    KD20_AS.Escort     = 0
    KD20_AS.scheme     = "sat_cruise_missile"
    KD20_AS.class_name = "wAmmunitionSelfHoming"
    
    KD20_AS.controller = {
        boost_start = 0.0,
        march_start = 0.8,
    }
    
    KD20_AS.fm = {
        mass        = kd20_mass,  
        caliber     = 0.60,  
        cx_coeff    = {1, 0.3, 0.65, 0.023, 1.6},
        L           = 6.8,
        I           = 1 / 12 * kd20_mass * 6.8 * 6.8,
        Ma          = 3,
        Mw          = 10,
        wind_sigma  = 0.0,
        wind_time   = 0.0,
        Sw          = 1.5,
        dCydA       = {0.07, 0.036},
        A           = 0.08,
        maxAoa      = 0.2,
        finsTau     = 0.08,
        Ma_x        = 1.2,
        Ma_z        = 3,
        Mw_x        = 2.7,
        
        addDeplSw           = 0.8,
        no_wings_A_mlt      = 7,
        wingsDeplProcTime   = 5,
        wingsDeplDelay      = 1,
    }
    
    KD20_AS.seeker = {
        coalition                = 1,
        coalition_rnd_coeff      = 5.0,
        can_update_target_pos    = 1,
    }
    
    KD20_AS.control_block = {
        seeker_activation_dist   = 20000,
        default_cruise_height    = 50,
        obj_sensor               = 0,
        can_update_target_pos    = 1,
        turn_before_point_reach  = 1,
        turn_hor_N               = 0.8,
        turn_max_calc_angle_deg  = 90,
        turn_point_trigger_dist  = 100,
        use_horiz_dist           = 1,
    }
    
    KD20_AS.final_autopilot = {
        delay               = 0,
        K                   = 72,
        Ki                  = 0,
        Kg                  = 4,
        finsLimit           = 0.72,
        useJumpByDefault    = 1,
        J_Power_K           = 2.2,
        J_Diff_K            = 0.4,
        J_Int_K             = 0.001,
        J_Angle_K           = 0.18,
        J_FinAngle_K        = 0.32,
        J_Angle_W           = 0.8,
        J_Trigger_Vert      = 1,
        hKp_err             = 120,
        hKp_err_croll       = 0.04,
        hKd                 = 0.005,
        max_roll            = 0.8,
    }
    
    KD20_AS.cruise_autopilot = {
        delay               = 1,
        Kp_hor_err          = 240,
        Kp_hor_err_croll    = 0.06,
        Kd_hor              = 0,
        Kp_ver              = 9,
        Kii_ver             = 0.2,
        Kd_ver              = 0,
        Kp_eng              = 265,
        Ki_eng              = 0.003,
        Kd_eng              = 0,
        Kp_ver_st1          = 0.009,
        Kd_ver_st1          = 0.015,
        Kp_ver_st2          = 0.00018,
        Kd_ver_st2          = 0.00005,
        
        auto_terrain_following           = 1,
        auto_terrain_following_height    = 70,
        
        alg_points_num           = 7,
        alg_calc_time            = 1.5,
        alg_vel_k                = 6,
        alg_div_k                = 2,
        alg_max_sin_climb        = 0.8,
        alg_section_temp_points  = 3,
        alg_tmp_point_vel_k      = 1.5,
        no_alg_vel_k             = 10,
        
        max_roll                 = 0.8,
        max_start_y_vel          = 35,
        stab_vel                 = 220,
        finsLimit                = 0.72,
        estimated_N_max          = 6,
        eng_min_thrust           = -120,
        eng_max_thrust           = 3923,        
    }
    
    KD20_AS.boost = { -- air launch - no booster
        impulse                              = 0,
        fuel_mass                            = 0,
        work_time                            = 0,
        boost_time                           = 0,
        boost_factor                         = 0,
        nozzle_position                      = {{0, 0, 0}},
        nozzle_orientationXYZ                = {{0, 0, 0}},
        tail_width                           = 0,
        smoke_color                          = {0.0, 0.0, 0.0},
        smoke_transparency                   = 0.0,
        custom_smoke_dissipation_factor      = 0.0,                
    }
    
    KD20_AS.booster_animation = {
        start_val = 0,
    }
    
    KD20_AS.play_booster_animation = {
        val = 0,
    }

    KD20_AS.march = {
        impulse         = 3000,
        fuel_mass       = 400.0,
        work_time       = 999999,
        min_fuel_rate   = 0.005,
        min_thrust      = -100,
        max_thrust      = 3000,
        thrust_Tau      = 0.0017,
        
        nozzle_position                  = {{-3.825, 0.0, 0.0}},
        nozzle_orientationXYZ            = {{0.0, 0.0, 0.0}},
        tail_width                       = 0.5,
        smoke_color                      = {0.5, 0.5, 0.5},
        smoke_transparency               = 0.03,
        custom_smoke_dissipation_factor  = 0.2,

        start_burn_effect           = 0,
        start_effect_delay          = {0.0,   0.3,    0.8},
        start_effect_time           = {0.7,   1.0,    0.1},
        start_effect_size           = {0.09,  0.104,  0.11},
        start_effect_smoke          = {0.01,  0.4,    0.01},
        start_effect_x_pow          = {1.0,   1.0,    1.0},
        start_effect_x_dist         = {1.1,   0.9,    0.0},
        start_effect_x_shift        = {0.15,  0.15,   0.2},
        
    }
    
end

if not use_ed_wpn then
    declare_weapon(KD20_AS)
end

declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_DF4A_KD20',
    Picture        = 'kd20.png',
    --wsTypeOfWeapon = KD20_AS.wsTypeOfWeapon,
    wsTypeOfWeapon = clsid_kd20(use_ed_wpn),
    attribute      = {4, 4, 32, WSTYPE_PLACEHOLDER},
    displayName    = _(kd20_name),
    Cx_pil         = 0.0023,
    Count          = 1,
    Weight         = kd20_mass + pylon_mass,
    Elements       = {
        {
            ShapeName = "adapter_df4a",
            IsAdapter = true,
            animation = {
                arg_num    = 1,
                rate_out   = 17.0,
                rate_in    = 1.0,
                init_value = 0.0
            }
        },
        {
            ShapeName = kd20_model,
            connector_name = "adapter_cnt",
        },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
    ejectVelocity = eject_speed_msl,
})


declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_KD20',
    Picture      = 'kd20.png',
    --attribute    = KD20_AS.wsTypeOfWeapon,
    attribute    = clsid_kd20(use_ed_wpn),
    displayName  = _(kd20_name),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = kd20_mass,
    Elements     = {
        {
            ShapeName = kd20_model,
            Position  = {0, 0, 0},
        },
    }, -- end of Elements
    ejectVelocity = eject_speed_msl,
})
