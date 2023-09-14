
local pylon_mass = 0.0
local internal_tank_amount = 4500-2325
local ft800_name = 'Internal Tank'
local ft800_empty_name = 'Drop tank 1100 litres'
local ft1100_name = 'Drop tank 1700 litres'
local ft1100_empty_name = 'Drop tank 1700 litres + Internal'

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = ft800_empty_name,
        displayName = _(ft800_empty_name),
        Picture     = "jf39_tank1100.png",        
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK800_EMPTY",
        
        Weight_Empty = 45 + pylon_mass,
        Weight = 900 + pylon_mass,
        Capacity = 900 - 45,
        Cx_pil = 0.0014, --0.002197266,
        shape_table_data =
        {
            {
                name = ft800_empty_name,
                file = "jf39_tank1100",
                life = 1,
                fire = { 0, 1},
                username = ft800_empty_name,
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "tank800",
            },
        },
    }
)

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = ft1100_name,
        displayName = _(ft1100_name),
        Picture     = "jf39_tank1700.png",
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK1100",
        
        Weight_Empty = 45 + pylon_mass,
        Weight = 1370 + pylon_mass,
        Capacity = 1370 - 45,
        Cx_pil = 0.00148,
        shape_table_data =
        {
            {
                name = ft1100_name,
                file = "jf39_tank1700",
                life = 1,
                fire = { 0, 1},
                username = ft1100_name,
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "jf39_tank1700",
            },
        },
    }
)
----

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = ft800_name,
        displayName = _(ft800_name),
        Picture     = "jf39_tankint.png",        
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK800",
        
        Weight_Empty = 45 + pylon_mass,
        Weight = 1000 + pylon_mass + internal_tank_amount,
        Capacity = 1000 - 45 + internal_tank_amount,
        Cx_pil = -0.00348,
        shape_table_data =
        {
            {
                name = ft800_name,
                file = "na",
                life = 1,
                fire = { 0, 1},
                username = ft800_name,
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "na",
            },
        },
    }
)

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = ft1100_empty_name,
        displayName = _(ft1100_empty_name),
        Picture     = "jf39_tankdual.png",
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK1100_EMPTY",
        
        Weight_Empty = 45 + pylon_mass,
        Weight = 1370 + pylon_mass + internal_tank_amount,
        Capacity = 1370 - 45 + internal_tank_amount,
        Cx_pil = 0.00148,
        shape_table_data =
        {
            {
                name = ft1100_empty_name,
                file = "jf39_tank1700",
                life = 1,
                fire = { 0, 1},
                username = ft1100_empty_name,
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "jf39_tank1700",
            },
        },
    }
)