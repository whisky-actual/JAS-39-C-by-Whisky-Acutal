
local akd10_name = 'AKD-10'
local akd10_mass = 48
local akd10_diam = 170.0
local akd10_wh_m = 9.98
local pylon_mass = 10.0

local AKD10_warhead =
{
    mass                  = akd10_wh_m,
    expl_mass             = 5.67, -- Warhead 9,89 kg, explosive 5,67 kg 
    other_factors         = { 1.0, 1.0, 1.0 },
    concrete_factors      = { 1.0, 1.0, 1.0 },
    concrete_obj_factor   = 0.0,
    obj_factors           = { 1.0, 1.0 },
    cumulative_factor     = 3.0,
    cumulative_thickness  = 1.2,
    caliber               = akd10_diam,
    piercing_mass         = akd10_wh_m*0.2,
}


AKD_10 = {
    category        = CAT_MISSILES,
    name            = akd10_name,
    model           = 'akd-10',
    user_name       = _(akd10_name),
    mass            = akd10_mass,
    wsTypeOfWeapon  = { 4, 4, 8, WSTYPE_PLACEHOLDER },

    Escort       = 1,
    Head_Type    = 4,
    sigma        = {4, 4, 4},
    M            = akd10_mass,
    H_max        = 10000.0,
    H_min        = -1,
    Diam         = akd10_diam,
    Cx_pil       = 2,
    D_max        = 10000.0,
    D_min        = 3000.0,
    Head_Form    = 0,
    Life_Time    = 40.0,
    Nr_max       = 15,
    v_min        = 30.0,
    v_mid        = 250.0,
    Mach_max     = 1.6,
    t_b          = 0.0,
    t_acc        = 5.0,
    t_marsh      = 0.0,
    Range_max    = 10000.0,
    H_min_t      = 0.0,
    Fi_start     = 1.0,
    Fi_rak       = 3.14152,
    Fi_excort    = 0.8,
    Fi_search    = 99.9,
    OmViz_max    = 99.9,
    exhaust      = {0.9, 0.9, 0.85, 0.1};
    X_back       = -0.813,
    Y_back       = -0.089,
    Z_back       = 0.0,
    Reflection   = 0.015,
    KillDistance = 0.0,
    
    warhead     = AKD10_warhead,
    warhead_air = AKD10_warhead,

    shape_table_data = {
        {
            name     = akd10_name,
            file     = 'akd-10',
            life     = 1,
            fire     = {0, 1},
            username = akd10_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    
    class_name = "wAmmunitionSelfHoming",
    scheme     = "self_homing_gyrost_missile2",
    
    controller = {
        boost_start = 0.001,
        march_start = 2.001,
    },
	
    booster = {
        impulse                             = 208,
        fuel_mass                           = 12,
        work_time                           = 3,
        boost_time                          = 0,
        boost_factor                        = 0,
        nozzle_position                     = {{-0.78, -0.08, 0.0}},
        nozzle_orientationXYZ               = {{0.0, 0.0, 0.0}},
        tail_width                          = 0.1,
        smoke_color                         = {1.0, 1.0, 1.0},
        smoke_transparency                  = 0.9,
        custom_smoke_dissipation_factor     = 0.2,                
    },
    
    march = {
        impulse                              = 208,
        fuel_mass                            = 6,
        work_time                            = 3,
        boost_time                           = 0,
        boost_factor                         = 0,
        nozzle_position                      = {{-0.78, -0.08, 0.0}},
        nozzle_orientationXYZ                = {{0.0, 0.0, 0.0}},
        tail_width                           = 0.1,
        smoke_color                          = {1.0, 1.0, 1.0},
        smoke_transparency                   = 0.9,
        custom_smoke_dissipation_factor      = 0.2,    
    },
    
    fm = {
        mass        = akd10_mass,  
        caliber     = 0.275,  
        cx_coeff    = {1,0.4,0.4,0.2,1.3},
        L           = 1.8,
        I           = 1 / 12 * akd10_mass * 1.8 * 1.8,
        Ma          = 0.6,
        Mw          = 1.1,
        wind_sigma  = 0.0,
        wind_time   = 0.0,
        Sw          = 0.5,
        dCydA       = {0.07, 0.036},
        A           = 0.6,
        maxAoa      = 0.3,
        finsTau     = 0.1,
        lockRoll    = 1,
    },
    
    simple_seeker = {
        sensitivity = 0,
        delay       = 0.0,
        FOV         = math.rad(60),
        DGF         = {0.00, 0.11, 0.22, 0.33, 0.44, 0.55, 0.66, 0.77, 0.88, 1.00},
        RWF         = {1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 0.80, 0.70, 0.60, 0.10},
        maxW        = 0.18,
        stTime      = 0.5,
        opTime      = 60,
    },
    
    simple_gyrostab_seeker = {
        omega_max   = math.rad(8),
    },
    
    autopilot = {
        K                = 20.0,
        Kg               = 3.8,
        Ki               = 0.0002,
        finsLimit        = 0.22,
        useJumpByDefault = 1,
        J_Power_K        = 1.2,
        J_Diff_K         = 0.6,
        J_Int_K          = 0.0,
        J_Angle_K        = math.rad(12),
        J_FinAngle_K     = math.rad(16),
        J_Angle_W        = 3.5,
        delay            = 1.0,
    },
}

declare_weapon(AKD_10)

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_AKD-10',
    Picture      = 'akd10.png',
    attribute    = AKD_10.wsTypeOfWeapon,
    displayName  = _(akd10_name),
    Cx_pil       = 0.001,
    Count        = 1,
    Weight       = akd10_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = 'akd-10',
        },
    }, -- end of Elements
})
