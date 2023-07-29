
local jas_tank1100_name = 'Drop tank 1100 litre'
local pylon_mass = 0.0

declare_loadout(
    {
        category    = CAT_FUEL_TANKS,
        name        = jas_tank1100_name,
        displayName = _(jas_tank1100_name),
        Picture     = "jf39_tank1100.png",        
        attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        CLSID       = "DIS_TANK800",
        
        Weight_Empty = 95 + pylon_mass,
        Weight = 95 + 924 + pylon_mass,
        Cx_pil = 0.0014,
        shape_table_data =
        {
            {
                name = jas_tank1100_name,
                file = "jf39_tank1100",
                life = 1,
                fire = { 0, 1},
                username = "Tank1100L",
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "jf39_tank1100",
            },
        },
    }
)