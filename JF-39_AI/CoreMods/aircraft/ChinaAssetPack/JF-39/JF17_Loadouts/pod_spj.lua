
local kg600_name  = 'KG-600'
local kg600_model = "kg600"
local pylon_mass  = 50.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _(kg600_name),
    Picture     = "kg600.png",
    attribute   = {wsType_Weapon, wsType_GContainer, wsType_Jam_Cont, WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_SPJ_POD",

    Weight = 220 + pylon_mass,
    Cx_pil = 0.00064,--0.002197266, -- Ragnar: I've calculated it to be exactly this much // changed to F-5 tank Cx -- Teo// testing
    shape_table_data =
    {
        {
            name     = kg600_name,
            file     = kg600_model,
            life     = 1,
            fire     = { 0, 1},
            username = kg600_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    Elements =
    {
        [1] = {
            Position  = {0, 0, 0},
            ShapeName = kg600_model,
        },
    },
}
)
