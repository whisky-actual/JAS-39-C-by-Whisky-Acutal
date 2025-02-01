local cm802akg_use_scheme  = 0
local cm802akg_scheme_type = 1
----------------------------------------------------------------------------------------
-- CM802AKG
----------------------------------------------------------------------------------------
local missile_type = 
	{
		['CM802AKG_1'] = {picture = _('jf39_stormshadow.png') , shape = _('jf39_stormshadow'), display_name = _('1x Storm Shadow Long Range Cruise-missile'), cx_pil = 0.0001, mass = 1300},
		['CM802AKG_2'] = {picture = _('jf39_kepd350.png')	  , shape = _('jf39_kepd350'), display_name = _('1x KEPD 350 Long Range Cruise-missile'), cx_pil = 0.0001, mass = 1400},
	}
    
    local function JF39_CM802AKG(variant)
        local var = missile_type[variant]
        local cm802akg_disp = var.display_name
        local cm802akg_model = var.shape
        local cm802akg_mass = var.mass
        local icon = var.picture
        local pylon_mass = 50.0

local C802AKG_warhead =
{
    mass                 = 165, 
    caliber              = 360,
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 3.0, 1.0, 5.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 2.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}


CM_802AKG_AS = {
    category        = CAT_MISSILES,
    name            = cm802akg_name,
    model           = cm802akg_model,
    user_name       = _(cm802akg_disp),
    mass            = cm802akg_mass,
    wsTypeOfWeapon  = {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},
    add_attributes  = {"Cruise missiles"},

    Escort          = 1,
    Head_Type       = 8, -- TV
    sigma           = {8, 8, 8},
    M               = cm802akg_mass,

    H_max           = 10000.0,
    H_min           = -1,
    Diam            = 343.0,
    Cx_pil          = 1,
    D_max           = 220000.0,
    D_min           = 2000.0,
    Head_Form       = 0,
    Life_Time       = 660.0,
    Nr_max          = 15,
    v_min           = 270.0,
    v_mid           = 372.0,
    Mach_max        = 1.3,
    t_b             = 5.0,
    t_acc           = 0.0,
    t_marsh         = 1000.0,
    Range_max       = 220000.0,
    H_min_t         = 0.0,
    Fi_start        = 0.25,
    Fi_rak          = 3.14152,
    Fi_excort       = 3.14152,--0.35,
    Fi_search       = 99.9,
    OmViz_max       = 99.9,
    Stage_          = 1,
    Engine_Type     = 5,
    X_back          = -2.566,
    Y_back          = 0.0,
    Z_back          = 0.0,
    Reflection      = 0.09,
    KillDistance    = 0.0,

    warhead     = C802AKG_warhead,
    warhead_air = C802AKG_warhead,

    shape_table_data = {
        {
            name     = cm802akg_name,
            file     = cm802akg_model,
            life     = 1,
            fire     = {0, 1},
            username = cm802akg_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    LaunchDistData =
    {
    -- launch altitude: 500m - 7500m for C-802A
    -- http://www.sinaimg.cn/dy/slidenews/8_img/2011_45/22159_89924_239722.jpg
        12,        7,

                    100,         125,       150,         175,        200,       250,          300,
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
    },

    MinLaunchDistData =
    {
        20,        7,

                    100,      150,      200,      250,      300,      350,      400,   
          500,        0,    14540,     7320,    11250,     8260,     8680,     8970,    
          600,        0,    11400,     7290,     7780,     8230,     8650,     9040,    
          700,        0,     7410,     7410,     7890,     8350,     8770,     9160,    
          800,        0,     7800,     7525,     8025,     8475,     8900,     9300,    
          900,        0,     8325,     7650,     8125,     8575,     9025,     9425,    
         1000,        0,     9325,     7725,     8225,     8675,     9100,     9500,    
         2000,        0,     9200,     8100,     8250,     8825,     9225,     9725,    
         3000,     6050,     6900,     7650,     8200,     8550,     8950,     9350,    
         4000,     6350,     7000,     7500,     7950,     8300,     8650,     9000,    
         5000,     6600,     7300,     7100,     8000,     8500,     8800,     9200,    
         6000,    12750,     7500,     7250,     8250,     8750,     9000,     9500,    
         7000,    13250,     7750,     7250,     8500,     8750,     9250,     9750,    
         8000,    14250,     8250,     8500,     8750,     9250,     9500,    10000,    
         9000,    15000,    14000,     8750,     9250,     9500,    10000,    10500,    
        10000,    16000,    14750,     9250,     9500,    10000,    10250,    10750,    
        11000,    17000,    16000,    14500,    10500,    11000,    11000,    11500,    
        12000,    18500,    17500,    16000,    11000,    11500,    12000,    12500,    
        13000,    19500,    19000,    18000,    16500,    12500,    19500,    22500,    
        14000,    21000,    20500,    20000,    19000,    18000,    27000,    30000,    
        15000,    22500,    22500,    22000,    22000,    31000,    35500,    39000,    
    },
}

if not player_use_ed_wpn then
	declare_weapon(CM_802AKG_AS)
end

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_CM-802AKG',
    Picture      = icon,
    attribute    = clsid_cm802akg(player_use_ed_wpn),
    displayName  = _(cm802akg_disp),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = cm802akg_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = cm802akg_model,
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements
    --Required     = {"DIS_AKG_DLPOD"},
    ejectVelocity  = eject_speed_msl1,
    ejectDirection = {0, -1, 0},
})


------- CM-802AKG for AI only -------

local cm802akg_ai_name  = 'CM-802AKG_AI'
local cm802akg_ai_disp  = 'CM802AKG (DIS) for AI'

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_CM-802AKG_AI',
    Picture      = 'c802akg.png',
    attribute    = clsid_cm802akg(ai_use_ed_wpn),
    displayName  = _(cm802akg_ai_disp),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = cm802akg_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = cm802akg_model,
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements
    ejectVelocity  = eject_speed_msl1,
    ejectDirection = {0, -1, 0},
})