
local yj12_name  = 'YJ-12'
local yj12_model = 'yj12'
local yj12_mass  = 1750.0
local pylon_mass = 50.0

local YJ12_warhead =
{
    mass                 = 200,
    caliber              = 480,
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 3.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}

local yj12_use_scheme = true

YJ12_AS = {
    category       = CAT_MISSILES,
    name           = yj12_name,
    user_name      = _(yj12_name),
    display_name   = _(yj12_name),
    model          = yj12_model,
    mass           = yj12_mass,
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AS_Missile, WSTYPE_PLACEHOLDER},

    Escort         = 0,
    Head_Type      = 5, -- 5,
    sigma          = {8, 8, 8},
    M              = yj12_mass,
    H_max          = 15000.0,
    H_min          = -1,
    Diam           = 756.0,
    Cx_pil         = 1,
    D_max          = 400000.0,
    D_min          = 10000.0,
    Head_Form      = 1,
    Life_Time      = 1850.0,
    Nr_max         = 15,
    v_min          = 170.0,
    v_mid          = 850.0,
    Mach_max       = 3.5,
    t_b            = 2.0,
    t_acc          = 5.0,
    t_marsh        = 1800.0,
    Range_max      = 400000.0,
    H_min_t        = 0.0,
    Fi_start       = 3.14152,
    Fi_rak         = 3.14152,
    Fi_excort      = 3.14152, -- 0.35,
    Fi_search      = 99.9,
    OmViz_max      = 99.9,
    Stage_         = 2,
    Engine_Type    = 5,
    X_back         = -2.5,
    Y_back         = 0.0,
    Z_back         = 0.0,
    X_back_acc     = -3.5,
    Y_back_acc     = 0.0,
    Z_back_acc     = 0.0,
    exhaust1       = tail_solid,
    Reflection     = 1.0,
    KillDistance   = 0.0,

    manualWeaponFlag = 2,
    
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

    warhead     = YJ12_warhead,
    warhead_air = YJ12_warhead,

    --add_attributes = {"Anti-Ship missiles"},
    add_attributes = {"Cruise missiles"},

    shape_table_data = {
        {
            name     = yj12_name,
            file     = yj12_model,
            life     = 4,
            fire     = {0, 1},
            username = yj12_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
}

if yj12_use_scheme then
    YJ12_AS.class_name      = 'wAmmunitionSelfHoming'
    YJ12_AS.scheme          = 'anti_ship_missile_ramjet'
    
    YJ12_AS.controller = {
        boost_start = 1.000,
        march_start = 6.500,
    }

    YJ12_AS.boost = {
        impulse                              = 250,
        fuel_mass                            = 360,
        work_time                            = 5,
        boost_time                           = 0,
        boost_factor                         = 0,
        nozzle_position                      = {{-3.5, 0, 0}},
        nozzle_orientationXYZ                = {{0.0, 0.0, 0.0}},
        tail_width                           = 0.8,
        smoke_color                          = {1, 1, 1},
        smoke_transparency                   = 1.0,
        custom_smoke_dissipation_factor      = 0.2,
        effect_type                          = 0,
    }

    YJ12_AS.march = {
        impulse                              = 0,
        fuel_mass                            = 550,
        work_time                            = 0,
        boost_time                           = 0,
        boost_factor                         = 0,
        nozzle_position                      = {{-2.5, 0, 0}},
        nozzle_orientationXYZ                = {{0.0, 0.0, 0.0}},
        tail_width                           = 0.2,
        smoke_color                          = {0.9, 0.9, 0.9},
        smoke_transparency                   = 0.1,
        custom_smoke_dissipation_factor      = 0.45,
        effect_type                          = 1,
        min_start_speed                      = 500,
        
        inlet_area = 0.028 * 4,
        Tchamb_max = 2770,
        LHVof_fuel = 43e6,
        AFR_stoich = 23,
        AEC        = 1.35,        
    }

    YJ12_AS.fm = {
        mass        = yj12_mass,
        caliber     = 0.480,
        cx_coeff    = {1,1.0,0.85,0.5,1.5},
        L           = 7.0,
        I           = 1 / 12 * yj12_mass * 7.0 * 7.0,
        Ma          = 0.4,
        Mw          = 1.2,
        wind_sigma  = 0.0,
        wind_time   = 0.0,
        Sw          = 0.7,
        dCydA       = {0.07, 0.036},
        A           = 0.36,
        maxAoa      = 0.28,
        finsTau     = 0.1,
        lockRoll    = 1,

        Ma_x        = 0.001,
        Mw_x        = 0.15,
        I_x         = 60,
    }
        
    YJ12_AS.fuze_proximity = {
        ignore_inp_armed = 1,
    }

    YJ12_AS.seeker = {
        delay                        = 1.0,
        op_time                      = 900.0,
        FOV                          = math.rad(60),
        max_w_LOS                    = 0.05,
        max_target_speed             = 33.0,
        max_target_speed_rnd_coeff   = 10.0,
        ship_track_by_default        = 0,
        flag_dist                    = 5000.0,
        sens_near_dist               = 10.0,
        sens_far_dist                = 80000.0,
        primary_target_filter        = 0,
        add_y                        = 0.0,
    }

    YJ12_AS.autopilot =
    {
        glide_height                = 2000.0,
        dont_climb_on_cruise_height = 0,
        vel_proj_div                = 25.0,
        default_glide_height        = 2000.0,
        pre_maneuver_glide_height   = 1000.0,
        skim_glide_height           = 200.0,
        use_start_bar_height        = 1,
        altim_vel_k                 = 5.0,

        delay                 = 1.0,
        op_time               = 900,
        Kw                    = 1,
        Ks                    = 8,
        K                     = 50.0,
        Kd                    = 0.1,
        Ki                    = 0.0,
        Kx                    = 0.04,
        Kdx                   = 0.001,
        w_limit               = math.rad(8),
        fins_limit            = math.rad(45),
        fins_limit_x          = math.rad(25),
        rotated_WLOS_input    = 0,
        conv_input            = 0,
        fins_q_div            = 1,
        PN_dist_data          = {2000,    0,
                                  500,    0},

        max_climb_angle       = math.rad(10),
        max_dive_angle        = math.rad(-35),
        max_climb_ang_hdiff   = 200,
        max_dive_ang_hdiff    = -200,

        Ksd                   = 0.1,
        Ksi                   = 0.0,
        integr_val_limit      = 0.5,
        hor_err_limit         = 0.5,
                
        inertial_km_error     = 2.0, -- m for 1000m dist
        glide_height_eq_error = 0.5, -- percent
    }

    YJ12_AS.final_autopilot = {
        delay                = 1.0,
        op_time              = 900,
        Kw                   = 2,
        Ks                   = 10,
        K                    = 60.0,
        Kd                   = 0.15,
        Ki                   = 0.0,
        Kx                   = 0.0,
        Kix                  = 0.0,
        w_limit              = math.rad(25),
        fins_limit           = math.rad(45),
        rotated_WLOS_input   = 0,
        conv_input           = 0,
        fins_q_div           = 1,
        PN_dist_data         = {100000,    0,
								 80000,	 0.5,
								 50000,	 0.8,
                                 15000,    1},

        add_err_val          = 0.014,
        add_err_vert         = 1,
        add_out_val          = 0,
        add_out_vert         = 0,
        loft_angle           = 0,
        loft_trig_angle      = 0,
        K_loft_err           = 0,
        loft_angle_vert      = 0,
    }

    YJ12_AS.triggers_control = {
        action_wait_timer                 = 3,    -- wait for dist functions n sen, then set default values
        default_sensor_tg_dist            = 60000, -- turn on seeker and start horiz. correction if target is locked
        final_maneuver_by_default         = 1,
        default_final_maneuver_tg_dist    = 30000,
        default_destruct_tg_dist          = 2000,    -- if seeker still can not find a target explode warhead after reaching pred. target point + n. km
        trigger_by_path                   = 1,
    }

    YJ12_AS.encyclopediaAnimation = {
        args = {
            [1] = 1.00,
        },
    }

end


declare_weapon(YJ12_AS)

declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_DF4B_YJ12',
    Picture        = 'yj12.png',
    wsTypeOfWeapon = YJ12_AS.wsTypeOfWeapon,
    attribute      = {4, 4, 32, WSTYPE_PLACEHOLDER},
    displayName    = _(yj12_name),
    Cx_pil         = 0.0023,
    Count          = 1,
    Weight         = yj12_mass + pylon_mass,
    Elements       = {
        {
            ShapeName = "adapter_df4b",
            IsAdapter = true,
            animation = {
                arg_num    = 1,
                rate_out   = 17.0,
                rate_in    = 1.0,
                init_value = 0.0
            }
        },
        {
            ShapeName = yj12_model,
            connector_name = "adapter_cnt",
        },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
    ejectVelocity = eject_speed_msl,
})


declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_YJ12',
    Picture      = 'yj12.png',
    attribute    = YJ12_AS.wsTypeOfWeapon,
    displayName  = _(yj12_name),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = yj12_mass,
    Elements     = {
        {
            ShapeName = yj12_model,
            Position  = {0, 0, 0},
        },
    }, -- end of Elements
    ejectVelocity = eject_speed_msl,
})
