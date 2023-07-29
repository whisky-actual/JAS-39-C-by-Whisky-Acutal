local jas_tank1700_name = 'Drop tank 1700 litre'
local pylon_mass = 0.0

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = jas_tank1700_name,
        displayName = _(jas_tank1700_name),
        Picture     = "jf39_tank1700.png",
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK1100",
        
        Weight_Empty = 145 + pylon_mass,
        Weight = 145 + 1388 + pylon_mass,
        Cx_pil = 0.00148,
        shape_table_data =
        {
            {
                name = jas_tank1700_name,
                file = "jf39_tank1700",
                life = 1,
                fire = { 0, 1},
                username = "Tank1700L",
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