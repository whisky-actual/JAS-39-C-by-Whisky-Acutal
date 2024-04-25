
local use_ed_wpn = true

local function clsid_kd63(use_ed)
    if use_ed then
        return "weapons.missiles.KD_63"
    else
        return "weapons.missiles.KD-63"
    end
end
local function clsid_kd63b(use_ed)
    if use_ed then
        return "weapons.missiles.KD_63B"
    else
        return "weapons.missiles.KD-63B"
    end
end

local kd63_name  = 'KD-63'
local kd63_model = 'kd63'
local kd63_mass  = 2000
local pylon_mass = 50.0

local KD63_warhead =
{
    mass                 = 500,
    caliber              = 760,
    expl_mass            = 300,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 5.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 2.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}


KD63_AS = {
    category        = CAT_MISSILES,
    name            = kd63_name,
    model           = kd63_model,
    user_name       = _(kd63_name),
    mass            = kd63_mass,
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},
    add_attributes  = {"Cruise missiles"},

    Escort          = 0,
    Head_Type       = 5,
    sigma           = {8, 8, 8},
    M               = kd63_mass,
    H_max           = 10000.0,
    H_min           = 500,
    Diam            = 760.0,
    Cx_pil          = 6,
    D_max           = 200000.0,
    D_min           = 20000.0,
    Head_Form       = 0,
    Life_Time       = 1850.0,
    Nr_max          = 18,
    v_min           = 170.0,
    v_mid           = 272.0,
    Mach_max        = 0.9,
    t_b             = 5.0,
    t_acc           = 0.0,
    t_marsh         = 1800.0,
    Range_max       = 200000.0,
    H_min_t         = 0.0,
    Fi_start        = 0.5,
    Fi_rak          = 3.14152,
    Fi_excort       = 1.05,
    Fi_search       = 99.9,
    OmViz_max       = 99.9,
    -- No exhaust (turbo)
    X_back          = -3.79,
    Y_back          = 0.0,
    Z_back          = 0.0,
    Reflection      = 0.121,
    KillDistance    = 0.0,

    shape_table_data = {
        {
            name     = kd63_name,
            file     = kd63_model,
            life     = 1,
            fire     = {0, 1},
            username = kd63_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    LaunchDistData =
    {
        13,     8,

                100,    150,    200,    250,    300,    350,    400,    450,        
        100,    0,      0,      183100, 186950, 189075, 191400, 192850, 194625, 
        200,    0,      0,      183350, 187225, 188925, 191250, 193125, 194825, 
        300,    0,      0,      183600, 187025, 189300, 191525, 193325, 194950, 
        500,    0,      179575, 183675, 187650, 189950, 192000, 193675, 195275, 
        700,    0,      180200, 184550, 188150, 190350, 192200, 193850, 195450, 
        1000,   0,      181000, 185750, 188700, 190700, 192450, 194050, 195700, 
        2000,   180700, 185100, 188200, 190500, 192450, 194050, 195500, 197050, 
        3000,   183500, 187200, 190000, 192200, 194200, 195800, 197200, 198700, 
        4000,   185400, 188800, 191700, 193900, 195800, 197600, 198900, 200500, 
        5000,   186800, 190300, 193000, 195300, 197400, 199300, 200700, 202300, 
        6000,   187750, 191500, 194250, 196500, 198750, 200750, 202250, 204000, 
        8000,   190500, 194000, 196500, 199000, 201500, 203500, 205500, 207500, 
        10000,  193000, 195500, 199000, 201000, 203500, 206000, 208500, 211500, 
    },

    MinLaunchDistData =
    {
        13,     8,

                100,    150,    200,    250,    300,    350,    400,    450,        
        100,    0,      0,      23850,  22950,  23200,  22975,  16675,  17525,  
        200,    0,      0,      23350,  22375,  16000,  16600,  17075,  17500,  
        300,    0,      0,      22725,  15475,  16175,  16525,  17100,  17250,  
        500,    0,      23900,  15125,  15800,  16275,  16850,  17300,  17800,  
        700,    0,      22850,  15250,  15850,  16400,  16900,  17350,  17700,  
        1000,   0,      14650,  15450,  15950,  16500,  16950,  17350,  17850,  
        2000,   14250,  15250,  16050,  16700,  17250,  17650,  18100,  18650,  
        3000,   14500,  15600,  16300,  17100,  17900,  18500,  19000,  19500,  
        4000,   14100,  15500,  16500,  17300,  18300,  18900,  19500,  20000,  
        5000,   14000,  15100,  16300,  17300,  18400,  19100,  19700,  20400,  
        6000,   14250,  15000,  16250,  17250,  18500,  19250,  19750,  21000,  
        8000,   14500,  14500,  16000,  17500,  18500,  19000,  20000,  21500,  
        10000,  14500,  15000,  15000,  15000,  15500,  19500,  15500,  22500,  
    },

    Damage_correction_coeff = 1.0,

    warhead        = KD63_warhead,
    warhead_air    = KD63_warhead,

    scheme     = "AGM-84E",
    class_name = "wAmmunitionAntiShip",

    controller = {
        boost_start = 0.0,
        march_start = 0.0,
    },
    
    control_block = {
        default_cruise_height = 600.0,
    },

    fm = {
        mass        = kd63_mass,
        caliber     = 0.76,
        cx_coeff    = {1,0.39,0.38,0.236,1.31},
        L           = 7,
        I           = 1 / 12 * kd63_mass * 7 * 7,
        Ma          = 0.68,
        Mw          = 1.116,
        wind_sigma  = 0.0,
        wind_time   = 1000.0,
        Sw          = 0.7,
        dCydA       = {0.07, 0.036},
        A           = 0.5,
        maxAoa      = 0.3,
        finsTau     = 0.05,
        Ma_x        = 3,
        Ma_z        = 3,
        Mw_x        = 2.6,
        
        addDeplSw            = 0.6,
        no_wings_A_mlt       = 7,
        wingsDeplProcTime    = 5,
        wingsDeplDelay       = 1,
    },
    
    seeker = {
        delay               = 0.0,
        op_time             = 800,
        activate_on_update  = 1,

        FOV                 = math.rad(60),

        max_target_speed            = 33,
        max_target_speed_rnd_coeff  = 10,

        max_lock_dist       = 30000,
    },

    ins = {
        aim_sigma       = 350,
        check_AI        = 1,
        error_coeff     = 0.03,
    },

    autopilot =
    {
        glide_height                = 600,
        dont_climb_on_cruise_height = 0,
        vel_proj_div                = 6.0,
        default_glide_height        = 600,
        pre_maneuver_glide_height   = 600,
        skim_glide_height           = 8,
        use_start_bar_height        = 1,
        altim_vel_k                 = 4,

        delay               = 0.5,
        op_time             = 9999,
        Kw                  = 2.4,
        Ks                  = 1.0,
        K                   = 1.0,
        Kd                  = 0.0,
        Ki                  = 10.0,
        Kx                  = 0.04,
        Kdx                 = 0.001,
        w_limit             = math.rad(2.5),
        fins_limit          = 1.4,
        fins_limit_x        = 0.5,
        rotated_WLOS_input  = 0,
        conv_input          = 0,
        PN_dist_data        = { 2000,   0,
                                500,    0},

        max_climb_angle     = math.rad(10),
        max_dive_angle      = math.rad(-30),
        max_climb_ang_hdiff = 180,
        max_dive_ang_hdiff  = -500,

        Ksd                     = 0.0,
        Ksi                     = 0.0,
        integr_val_limit        = 0.5,
        hor_err_limit           = 0.5,
        
        inertial_km_error       = 10.0,
        glide_height_eq_error   = 0.03,

        
        vert_ctrl_data      = { 100,    math.rad(-24),
                                115,    math.rad(-16),
                                130,    math.rad(-8),
                                145,    math.rad(0),
                                185,    math.rad(10),   },
                                        
        w_limit_data        = { 100,    math.rad(2),
                                185,    math.rad(6),    },
    },

    final_autopilot = {
        delay               = 0.0,
        op_time             = 9999,
        Kw                  = 1.0,
        Ks                  = 20.0,
        K                   = 5.0,
        Kd                  = 0.0,
        Ki                  = 0.0,
        Kx                  = 0.0,
        Kix                 = 0.0,
        w_limit             = math.rad(10),
        fins_limit          = 1.4,
        rotated_WLOS_input  = 0,
        conv_input          = 0,
        PN_dist_data        = { 2000,   1,
                                500,    1},

        add_err_val             = 0,
        add_err_vert            = 0,
        add_out_val             = 0.1,
        add_out_vert            = 1,
        loft_angle              = math.rad(6),
        loft_trig_angle         = math.rad(10),
        K_loft_err              = 1,
        loft_angle_vert         = 1,
        loft_active_by_default  = 0,
    },
    
    triggers_control = {
        action_wait_timer               = 5,    -- wait for dist functions n sen, then set default values
        default_sensor_tg_dist          = 11000, -- turn on seeker and start horiz. correction if target is locked
        default_final_maneuver_tg_dist  = 7000,
        default_straight_nav_tg_dist    = 7000,
        default_destruct_tg_dist        = 3000, -- if seeker still can not find a target explode warhead after reaching pred. target point + n. km
        trigger_by_path                 = 1,
        final_maneuver_trig_v_lim       = 3,
        use_horiz_dist                  = 1,
        pre_maneuver_glide_height       = 600,  -- triggers st nav instead of fin. maneuver if h>2*pre_maneuver_glide_height at fin. maneuver distance
        min_cruise_height               = 600,
        min_cruise_height_trigger_sum   = 11000,
        min_cruise_height_trigger_mlt   = 237/33,
        final_maneuver_trig_angle       = math.rad(48),
    },
    
    boost = {                --    air launch - no booster
        impulse                             = 0,
        fuel_mass                           = 0,
        work_time                           = 0,
        boost_time                          = 0,
        boost_factor                        = 0,
        nozzle_position                     = {{0, 0, 0}},
        nozzle_orientationXYZ               = {{0, 0, 0}},
        tail_width                          = 0.0,
        smoke_color                         = {0.0, 0.0, 0.0},
        smoke_transparency                  = 0.0,
        custom_smoke_dissipation_factor     = 0.0,
    },
    
    march = {
        impulse           = 3000,
        fuel_mass         = 500,
        work_time         = 9999,
        min_fuel_rate     = 0.005,
        min_thrust        = -100,
        max_thrust        = 20000,
        thrust_Tau        = 0.0018,
        
        nozzle_position                       = {{-3.79, 0.0, 0.0}},
        nozzle_orientationXYZ                 = {{0.0, 0.0, 0.0}},
        tail_width                            = 0.5,
        smoke_color                           = {0.5, 0.5, 0.5},
        smoke_transparency                    = 0.03,
        custom_smoke_dissipation_factor       = 0.2,    
        
        start_burn_effect            = 1,
        start_effect_delay           = {0.0,     0.3,     0.8},
        start_effect_time            = {0.7,     1.0,     0.1},
        start_effect_size            = {0.09,    0.104,   0.11},
        start_effect_smoke           = {0.01,    0.4,     0.01},
        start_effect_x_pow           = {1.0,     1.0,     1.0},
        start_effect_x_dist          = {1.1,     0.9,     0.0},
        start_effect_x_shift         = {0.15,    0.15,    0.2},
    },

    engine_control = {
        default_speed   = 250,
        K               = 240,
        Kd              = 1.0,
        Ki              = 0.01,
        speed_delta     = 5,
    },
}

if not use_ed_wpn then
    declare_weapon(KD63_AS)
end

declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_GDJ_KD63',
    Picture        = 'kd63.png',
    --wsTypeOfWeapon = KD63_AS.wsTypeOfWeapon,
    wsTypeOfWeapon = clsid_kd63(use_ed_wpn),
    attribute      = {4, 4, 32, WSTYPE_PLACEHOLDER},
    displayName    = _(kd63_name),
    Cx_pil         = 0.0023,
    Count          = 1,
    Weight         = kd63_mass + pylon_mass,
    Elements       = {
        {
            ShapeName = "adapter_gdj_kd63",
            IsAdapter = true,
        },
        {
            ShapeName = kd63_model,
            connector_name = "adapter_cnt",
        },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
    ejectVelocity = eject_speed_msl,
    Required      = {"DIS_AKG_DLPOD"},
})

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_KD63',
    Picture      = 'kd63.png',
    --attribute    = KD63_AS.wsTypeOfWeapon,
    attribute    = clsid_kd63(use_ed_wpn),
    displayName  = _(kd63_name),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = kd63_mass,
    Elements     = {
        {
            ShapeName = kd63_model,
            Position  = {0, 0, 0},
        },
    }, -- end of Elements
    ejectVelocity = eject_speed_msl,
    Required      = {"DIS_AKG_DLPOD"},
})

-- KD-63B
local kd63b_name  = 'KD-63B'
local kd63b_model = 'kd63b'

KD63B_AS = {}
copyTable(KD63B_AS, KD63_AS)
KD63B_AS.name           = kd63b_name
KD63B_AS.model          = kd63b_model
KD63B_AS.user_name      = _(kd63b_name)
KD63B_AS.wsTypeOfWeapon = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER}
KD63B_AS.shape_table_data[1].name     = kd63b_name
KD63B_AS.shape_table_data[1].file     = kd63b_model
KD63B_AS.shape_table_data[1].username = kd63b_name
KD63B_AS.shape_table_data[1].index    = WSTYPE_PLACEHOLDER

declare_weapon(KD63B_AS)


declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_GDJ_KD63B',
    Picture        = 'kd63b.png',
    --wsTypeOfWeapon = KD63B_AS.wsTypeOfWeapon,
    wsTypeOfWeapon = clsid_kd63b(use_ed_wpn),
    attribute      = {4, 4, 32, WSTYPE_PLACEHOLDER},
    displayName    = _(kd63b_name),
    Cx_pil         = 0.0023,
    Count          = 1,
    Weight         = kd63_mass + pylon_mass,
    Elements       = {
        {
            ShapeName = "adapter_gdj_kd63",
            IsAdapter = true,
        },
        {
            ShapeName = kd63b_model,
            connector_name = "adapter_cnt",
        },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
    ejectVelocity = eject_speed_msl,
    Required      = {"DIS_AKG_DLPOD"},
})

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_KD63B',
    Picture      = 'kd63b.png',
    attribute    = KD63B_AS.wsTypeOfWeapon,
    attribute    = clsid_kd63b(use_ed_wpn),
    displayName  = _(kd63b_name),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = kd63_mass,
    Elements     = {
        {
            ShapeName = kd63b_model,
            Position  = {0, 0, 0},
        },
    }, -- end of Elements
    ejectVelocity = eject_speed_msl,
    Required      = {"DIS_AKG_DLPOD"},
})
