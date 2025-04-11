----------------------------------------------------------------------------------------
-- EAJP - Electronic Attack Jammer Pod
----------------------------------------------------------------------------------------
local kg600_name  = 'SAAB - EAJP'
local kg600_model = "kg600"
local pylon_mass  = 0.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _(kg600_name),
    Picture     = "kg600.png",
    attribute   = {wsType_Weapon, wsType_GContainer, wsType_Jam_Cont, WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_SPJ_POD",

    Weight = 0.00 + pylon_mass,
    Cx_pil = 0.0,
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
----------------------------------------------------------------------------------------
-- DLINK
----------------------------------------------------------------------------------------
local dlink_name = 'SAAB - DLP'
local dlink_model = "ANAWW_13"
local pylon_mass = 0.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _(dlink_name),
    Picture     = "akg_dlpod.png",
    attribute   = {wsType_Weapon,wsType_GContainer,wsType_Control_Cont,WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_AKG_DLPOD",
    
    Weight = 0.0 + pylon_mass,
    Cx_pil = 0.0,
    shape_table_data =
    {
        {
            name = dlink_name,
            file = dlink_model,
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
            ShapeName = dlink_model,
        },
    },
}
)
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.2.1                       --
----------------------------------------------------------------------------------------