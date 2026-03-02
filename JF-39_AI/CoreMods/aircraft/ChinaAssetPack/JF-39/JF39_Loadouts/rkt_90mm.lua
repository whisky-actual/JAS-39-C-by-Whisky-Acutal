
local pylon_mass    = 45.0
local hf20_pod_mass = 48.0

local brm1_name  = 'BRM-1_90MM'
local brm1_disp  = 'BRM-1 90mm Laser-guided Rocket'
local brm1_mass  = 16.8
local brm1_model = 'brm1_90'
local brm1_ltime = 90.0
local brm1_wtime = 1.0

local brm1_90_warhead =
{
    mass                 = 4.8, 
    caliber              = 90,
    expl_mass            = 1.3,
    piercing_mass        = 4.8-1.3-0.7,
    other_factors        = { 0.5, 0.5, 0.5 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 1.5,
    cumulative_thickness = 0.25, 
}

BRM_1_90 = 
{
    category        = CAT_MISSILES,
    name            = brm1_name,
    user_name       = _(brm1_disp),
    model           = brm1_model,
    mass            = brm1_mass,
    
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},

    Escort          = 1,
    Head_Type       = 4,
    M               = brm1_mass,
    sigma           = {1, 1, 1},
    H_max           = 8000.0,
    H_min           = 1.0,
    Diam            = 70.0,
    Cx_pil          = 0.00244140625,
    D_max           = 8000.0,
    D_min           = 500.0,
    Head_Form       = 1,
    Life_Time       = brm1_ltime,
    Nr_max          = 25,
    v_min           = 140.0,
    v_mid           = 500.0,
    Mach_max        = 3.0,
    t_b             = 0.0,
    t_acc           = 0.0,
    t_marsh         = 1.1,
    Range_max       = 8000.0,
    H_min_t         = 15.0,
    Fi_start        = 0.4,
    Fi_rak          = 3.14152,
    Fi_excort       = 1.05,
    Fi_search       = 0.7,
    OmViz_max       = 0.35,
    exhaust         = {0.78, 0.78, 0.78, 0.3};
    X_back          = -2.0,
    Y_back          = -0.0,
    Z_back          = 0.0, -- -0.1,
    Reflection      = 0.05,
    KillDistance    = 0.0,
    
    LaunchDistData  = 
    {        
        5,        3,
        
                   100,      200,      300,    
        1000,     9000,     9500,    10000,
        2000,     9500,    10000,    10500,
        3000,    10000,    10500,    11000,
        4000,    10500,    11000,    11500,
        5000,    11000,    11500,    12000,
    },
    
    shape_table_data =
    {
        {
            name     = brm1_name,
            file     = brm1_model,
            life     = 1,
            fire     = {0, 1},
            username = brm1_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    warhead     = brm1_90_warhead,
    warhead_air = brm1_90_warhead,
    
    scheme     = 'APKWS',
    class_name = 'wAmmunitionLaserHoming',

    fm = {
        mass        = brm1_mass,  
        caliber     = 0.09, 
        cx_coeff    = {1, 0.9, 0.6, 0.32, 2.1},
        L           = 1.25,
        I           = 1 / 12 * brm1_mass * 1.25 * 1.25,
        Ma          = 0.84,
        Mw          = 3.5,
        shapeName   = brm1_model,
        wind_sigma  = 6.0,
        wind_time   = brm1_wtime,
        dCydA       = {0.11, 0.11},
        A           = 0.36,
        Sw          = 0.04,
        maxAoa      = math.rad(8),
        finsTau     = 0.2,
        Mx0         = 0.3,
        Ma_x        = 2.2,
        Mw_x        = 1.32,
        I_x         = 1.21,
        --Mx_eng      = 1.0,
    },
    
    seeker = {
        delay               = 1.1,
        FOV                 = math.rad(40),
        max_seeker_range    = 13000,
    },

    autopilot = {
        delay               = 0.9,
        op_time             = brm1_ltime,
        dV_dt               = 20,
        Knav                = 12,
        Tf                  = 0.2,
        Kd                  = 150,
        Kdx                 = 0.2,
        Kix                 = 0.8,
        gload_limit         = 10,
        fins_limit          = math.rad(20),
        fins_limit_x        = math.rad(10),
    },

    march = {
        fuel_mass               = 2.3,
        impulse                 = 200,
        boost_time              = 0,
        work_time               = brm1_wtime,
        boost_factor            = 1,
        nozzle_position         = {{-0.65, 0, 0}},
        nozzle_orientationXYZ   = {{0, 0, 0}},
        tail_width              = 0.052,
        boost_tail              = 1,
        work_tail               = 1,
        smoke_color             = {0.9, 0.9, 0.9},
        smoke_transparency      = 0.5,
        custom_smoke_dissipation_factor = 0.2,
    },

    properties =
    {
        targeting_data =
        {
            fm_type = 2,
        },
    },
    
    settings = Get_LGU_GUISettings_Preset("WGU59")
}

declare_weapon(BRM_1_90)

declare_loadout({
    category        = CAT_ROCKETS,
    CLSID           = 'DIS_BRM1_90',
    wsTypeOfWeapon  = BRM_1_90.wsTypeOfWeapon,
    attribute       = {4, 4, 32, WSTYPE_PLACEHOLDER},
    Count           = 16,
    Cx_pil          = 0.002,
    Cx_item         = 0.,
    Picture         = "hf20_pod.png",
    displayName     = _("HF20 - 16 x " .. brm1_disp),
    Weight          = hf20_pod_mass + 16 * BRM_1_90.mass + pylon_mass,
    Elements        = RocketPod("hf20_pod", brm1_model, 16),
    Required        = {"DIS_WMD7"},
    JettisonSubmunitionOnly = false,
    settings        = Get_LGU_GUISettings_Preset("WGU59")
})

--=== guided rocket end ===---


--=== unguided rocket ===---


local rkt901he_name   = 'Rkt_90-1_HE'
local rkt901he_disp   = '90-1 90mm Rocket (HE)'
local rkt901he_short  = '90-1'
local rkt901he_mass   = 17.1
local rkt901he_model  = '90-1'
local rkt901he_wtime  = 1.6

local warhead_901he =
{
    mass                 = 7.9, 
    caliber              = 90,
    expl_mass            = 1.3,
    piercing_mass        = 7.9-1.3-0.4,
    other_factors        = { 1.33, 1.33, 1.33 },
    concrete_factors     = { 1.33, 1.33, 0.1 },
    concrete_obj_factor  = 0.1,
    obj_factors          = { 1.33, 1.33 },
    cumulative_factor    = 0,
    cumulative_thickness = 0
}

RKT_90_HE =
{
    category        = CAT_ROCKETS,
    name            = rkt901he_name,
    user_name       = _(rkt901he_disp),
    scheme          = "nurs-standard",
    class_name      = "wAmmunitionNURS",
    model           = rkt901he_model,
    mass            = rkt901he_mass,
    
    wsTypeOfWeapon  = {4, 7, 33, WSTYPE_PLACEHOLDER},

    shape_table_data =
    {
        {
            name     = rkt901he_name,
            file     = rkt901he_model,
            life     = 1,
            fire     = {0, 1},
            username = rkt901he_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    warhead     = warhead_901he,
    warhead_air = warhead_901he,
    
    properties = {
        dist_min =  600, -- min range, meters
        dist_max = 7000, -- max range, meters
    },
    
    fm = {
        mass                  = rkt901he_mass,
        caliber               = 0.09,
        cx_coeff              = {1, 0.9, 0.6, 0.32, 2.1},
        L                     = 1.25,
        I                     = 1 / 12 * rkt901he_mass * 1.25 * 1.25,
        Ma                    = 0.50851,
        Mw                    = 3.28844,
        shapeName             = rkt901he_model,
        wind_time             = rkt901he_wtime,
        wind_sigma            = 6,
        wind_sigma_z_coeff    = 1,
        impulse_factor        = 7.5,
    },
    
    engine = {
        length                  = 0.973,
        total_mass              = 10.5,
        fuel_mass               = 3.8,
        impulse                 = 200,
        boost_time              = 0,
        work_time               = rkt901he_wtime,
        boost_factor            = 1,
        nozzle_position         = {{-0.65, 0, 0}},
        nozzle_orientationXYZ   = {{0, 0, 0}},
        tail_width              = 0.052,
        boost_tail              = 1,
        work_tail               = 1,
        smoke_color             = {0.9, 0.9, 0.9},
        smoke_transparency      = 0.5,
        induced_RPS             = 33
    },
}

declare_weapon(RKT_90_HE)


declare_loadout({
    category        = CAT_ROCKETS,
    --CLSID           = 'DIS_RKT_90_UG',
    CLSID           = 'DIS_HF20_90_1_HE',
    wsTypeOfWeapon  = RKT_90_HE.wsTypeOfWeapon,
    attribute       = {4, 7, 32, WSTYPE_PLACEHOLDER},
    Count           = 16,
    Cx_pil          = 0.002,
    Cx_item         = 0.,
    Picture         = "hf20_pod.png",
    displayName     = _("HF20 - 16 x " .. rkt901he_disp),
    Weight          = hf20_pod_mass + 16 * rkt901he_mass + pylon_mass,
    Elements        = RocketPod("hf20_pod", rkt901he_model, 16),
    JettisonSubmunitionOnly = false,
})


--=== trajectory calc ref for brm1 ===---

local brm1ug_name  = 'BRM1_90MM_UG'
BRM_1_UG = 
{
    category        = CAT_ROCKETS,
    name            = brm1ug_name,
    user_name       = _(brm1ug_name),
    model           = brm1_model,
    mass            = brm1_mass,
    
    wsTypeOfWeapon  = {4, 7, 33, WSTYPE_PLACEHOLDER},
    
    shape_table_data =
    {
        {
            name     = brm1_name,
            file     = brm1_model,
            life     = 1,
            fire     = {0, 1},
            username = brm1_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    warhead     = brm1_90_warhead,
    warhead_air = brm1_90_warhead,
    
    scheme          = "nurs-standard",
    class_name      = "wAmmunitionNURS",
    
    properties = {
        dist_min =  600, -- min range, meters
        dist_max = 8000, -- max range, meters
    },
    
    fm = {
        mass                  = brm1_mass,
        caliber               = 0.09,
        cx_coeff              = {1, 0.9, 0.6, 0.3, 1.5},
        L                     = 1.25,
        I                     = 1 / 12 * brm1_mass * 1.25 * 1.25,
        Ma                    = 0.50851,
        Mw                    = 3.28844,
        shapeName             = brm1_model,
        wind_time             = rkt901he_wtime,
        wind_sigma            = 6,
        wind_sigma_z_coeff    = 1,
        impulse_factor        = 7.5,
    },
    
    engine = {
        total_mass              = 10.5,
        fuel_mass               = 4.0,
        impulse                 = 200,
        boost_time              = 0,
        work_time               = brm1_wtime,
        boost_factor            = 1,
        nozzle_position         = {{-0.95, 0, 0}},
        nozzle_orientationXYZ   = {{0, 0, 0}},
        tail_width              = 0.052,
        boost_tail              = 1,
        work_tail               = 1,
        smoke_color             = {0.9, 0.9, 0.9},
        smoke_transparency      = 0.5,
    },
}
declare_weapon(BRM_1_UG)
