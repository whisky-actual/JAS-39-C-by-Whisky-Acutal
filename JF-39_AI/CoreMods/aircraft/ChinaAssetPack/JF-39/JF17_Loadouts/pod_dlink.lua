
local dlink_name = 'DATA-LINK POD'
local pylon_mass = 50.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _(dlink_name),
    Picture     = "akg_dlpod.png",
    attribute   = {wsType_Weapon,wsType_GContainer,wsType_Control_Cont,WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_AKG_DLPOD",
    
    Weight = 245 + pylon_mass,
    Cx_pil = 0.0015,--0.002197266, -- Ragnar: I've calculated it to be exactly this much // changed to F-5 tank Cx -- Teo// testing
    shape_table_data =
    {
        {
            name = dlink_name,
            file = "dlpod_akg",
            life = 1,
            fire = {0, 1},
            username = dlink_name,
            index = WSTYPE_PLACEHOLDER,
        },
    },
    Elements =
    {
        [1] = {
            Position = {0, 0, 0},
            ShapeName = "dlpod_akg",
        },
    },
}
)

