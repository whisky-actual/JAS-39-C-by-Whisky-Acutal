local rb15f_name = 'Rb15F Mk4 Anti-Ship Missile'
local rb15f_mass = 650
local pylon_mass  = 1.0

local rb15f_warhead = 
{
    mass                 = 200, 
    caliber              = 500,
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 5.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 5.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}

RB15F_MK4 = {
    category       = CAT_MISSILES,
    name           = rb15f_name,
    user_name      = _(rb15f_name),
    model          = 'jf39_rbs-15',
    mass           = rb15f_mass,
    wsTypeOfWeapon = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},

    Escort         = 0,
    Head_Type      = 5,
    sigma          = {3, 3, 3},
    M              = rb15f_mass,
    H_max          = 15000.0,
    H_min          = 500,
    Diam           = 360.0,
    Cx_pil         = 7,
    D_max          = 300000.0,
    D_min          = 2000.0,
    Head_Form      = 1,
    Life_Time      = 2400.0,
    Nr_max         = 20,
    v_min          = 270.0,
    v_mid          = 372.0,
    Mach_max       = 1.3,
    t_b            = 5.0,
    t_acc          = 0.0,
    t_marsh        = 1800.0,
    Range_max      = 300000.0,
    H_min_t        = 0.0,
    Fi_start       = 0.25,
    Fi_rak         = 3.14152,
    Fi_excort      = 3.14152,
    Fi_search      = 99.9,
    OmViz_max      = 99.9,
    Stage_         = 1,
    Engine_Type    = 5,
    X_back         = -2.566,
    Y_back         = 0.0,
    Z_back         = 0.0,
    Reflection     = 0.05,
    KillDistance   = 0.0,

    manualWeaponFlag = 2,

    LaunchDistData =
    {
          2,        7,
                   100,      125,      150,      175,       200,       250,       300,
          500,  288000, 289000, 290000, 291000, 292000, 293000, 294000,
		15000,	290000,	291000,	292000,	293000,	294000,	294500,	295000,
    },

    warhead     = antiship_penetrating_warhead(200, 500),
    warhead_air = antiship_penetrating_warhead(200, 500),

    add_attributes = {"Cruise missiles"},

    shape_table_data = {
        {
            name     = rb15f_name,
            file     = 'jf39_rbs-15',
            life     = 0.6,
            fire     = {0, 1},
            username = rb15f_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    scheme            = "anti_ship_missile_prog_path_stpos_ctrl",
    class_name        = "wAmmunitionAntiShip",

    fm = {
        mass        = rb15f_mass,
        caliber     = 0.36,
        cx_coeff    = {1, 0.3, 0.65, 0.018, 1.6},
        L           = 5.145,
        I           = 1 / 12 * rb15f_mass * 5.145 * 5.145,
        Ma          = 0.6,
        Mw          = 1.116,
        wind_sigma  = 0.0,
        wind_time   = 1000.0,
        Sw          = 0.75,
        dCydA       = {0.07, 0.036},
        A           = 0.08,
        maxAoa      = 0.3,
        finsTau     = 0.05,
        Ma_x        = 3,
        Ma_z        = 3,
        Kw_x        = 0.05,
    },

    seeker = {
        delay                       = 0.0,
        op_time                     = 9999.0,
        FOV                         = math.rad(60.0),
        max_w_LOS                   = 0.06,
        max_target_speed            = 33.0,
        max_target_speed_rnd_coeff  = 10.0,
        ship_track_by_default       = 1,
        flag_dist                   = 5000.0,
        sens_near_dist              = 10.0,
        sens_far_dist               = 27000.0,
        primary_target_filter       = 1,
        add_y                       = 3.0,
    },

    autopilot =    --inertial autopilot + horiz correction when seeker is on
    {
        delay                     = 1.0,        -- time delay
        Kpv                       = 0.03,       -- vertical control PID 0.026
        Kdv                       = 6,         -- 8.0
        Kiv                       = 0.00002,    -- 0.000004
        Kph                       = 40.0,       -- horiz control PID 28.0
        Kdh                       = 5.0,        -- 3.0
        Kih                       = 0.0,
        cmd_K                     = 12.0,
        cmd_Kd                    = 10.0,
        glide_height              = 50.0,      -- cruise glide height --100
        use_current_height        = 0,          -- keep launch height
        max_vert_speed            = 50.0,      -- max vertical speed kept from launch height to glide height 70 --30
        altim_vel_k               = 2.0,        -- proximity sensor correction by velocity coeff 1
        finsLimit                 = 0.68,       -- max signal value from autopilot to fins
        inertial_km_error         = 0.01,       -- inertial guidance error coeff to 1 km flight distance
        max_heading_err_val       = 0.01,       -- 0.09
        skim_glide_height         = 5.0,
        pre_maneuver_glide_height = 5.0,
        vel_proj_div              = 2.5,
    },

    final_autopilot =        -- final stage guidance with terminal maneuver
    {
        delay               = 0,
        K                   = 60,       -- autopilot P
        Ki                  = 0,        -- I
        Kg                  = 15,       -- D
        finsLimit           = 0.68,
        useJumpByDefault    = 1,        --
        J_Power_K           = 2.0,      -- terminal maneuver params: P
        J_Diff_K            = 0.8,      -- D
        J_Int_K             = 0,        -- I
        J_Angle_K           = 0.8,     -- jump maneuver angle --0.68
        J_FinAngle_K        = 0.65,     -- jump inactivation trigger angle to target --0.32
        J_Angle_W           = 4.0,      -- max maneuver angle speed
        bang_bang           = 0,        -- use only -1, 1 values to control fins
        J_Trigger_Vert      = 1,        -- use global y axis
        loft_add_val        = 1,
    },

    triggers_control = {
        action_wait_timer               = 5,    -- wait for dist functions n sen, then set default values
        default_sensor_tg_dist          = 30000, -- turn on seeker and start horiz. correction if target is locked
        default_final_maneuver_tg_dist  = 5000,
        default_straight_nav_tg_dist    = 750,
        default_destruct_tg_dist        = 280000, -- if seeker still can not find a target explode warhead after reaching pred. target point + n. km
        trigger_by_path                 = 1,
        pre_maneuver_glide_height       = 5,    -- triggers st nav instead of fin. maneuver if h>2*pre_maneuver_glide_height at fin. maneuver distance --19
        use_horiz_dist                  = 1,
    },

    controller = {
        boost_start = 0.001,
        march_start = 0.01,
    },

    boost = {    --    air launch - no booster
        impulse                          = 0,
        fuel_mass                        = 0,
        work_time                        = 0,
        boost_time                       = 0,
        boost_factor                     = 0,
        nozzle_position                  = {{0, 0, 0}},
        nozzle_orientationXYZ            = {{0, 0, 0}},
        tail_width                       = 0.0,
        smoke_color                      = {0.0, 0.0, 0.0},
        smoke_transparency               = 0.0,
        custom_smoke_dissipation_factor  = 0.0,
    },

    march = {
        impulse          = 790,
        fuel_mass        = 120, 
        work_time        = 9999,
        min_fuel_rate    = 0.005,
        min_thrust       = 0,
        max_thrust       = 5000, 
        thrust_Tau       = 0.0017,

        nozzle_position                  = {{-2.566, 0.0, 0.0}},
        nozzle_orientationXYZ            = {{0.0, 0.0, 0.0}},
        tail_width                       = 0.5,
        smoke_color                      = {0.0, 0.0, 0.0},
        smoke_transparency               = 0.2,
        custom_smoke_dissipation_factor  = 0.2,

        start_burn_effect           = 0,
        start_effect_delay          = {0.0,   0.3,    0.8},
        start_effect_time           = {0.7,   1.0,    0.1},
        start_effect_size           = {0.09,  0.104,  0.11},
        start_effect_smoke          = {0.01,  0.4,    0.01},
        start_effect_x_pow          = {1.0,   1.0,    1.0},
        start_effect_x_dist         = {1.1,   0.9,    0.0},
        start_effect_x_shift        = {0.15,  0.15,   0.2},
    },

    engine_control = {
        default_speed    = 300,
        K                = 265,
        Kd               = 0.01,
        Ki               = 0.001,
    },

}

declare_weapon(RB15F_MK4)

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_C-802AK',
    Picture      = 'jf39_RBS-15.png',
    attribute    = RB15F_MK4.wsTypeOfWeapon,
    displayName  = _(rb15f_name),
    Cx_pil       = 0.002,
    Count        = 1,
    Weight       = rb15f_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = 'jf39_rbs-15',
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements

    ejectImpulse = 140,
})


