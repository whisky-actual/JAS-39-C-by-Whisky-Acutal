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

    Weight = 220 + pylon_mass,
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
-- Ligthing
----------------------------------------------------------------------------------------
local wmd7_name = 'AN/AAQ-28 LITENING III'
local wmd7_disp = 'AN/AAQ-28 LITENING III'
local pylon_mass = 0.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _(wmd7_disp),
    Picture     = "aaq-28.png",
    attribute   = {wsType_Weapon,wsType_GContainer,wsType_Control_Cont,WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_WMD7",

    Weight = 208 + pylon_mass,
    Cx_pil = 0.000244 * 0.8,
    shape_table_data =
    {
        {
            name = wmd7_name,
            file = "aaq-28 litening",
            life = 1,
            fire = { 0, 1},
            username = wmd7_name,
            index = WSTYPE_PLACEHOLDER,
        },
    },
    Elements =
    {
        [1] = {
            Position = {0, 0, 0},
            ShapeName = "aaq-28 litening",
        },
    },
    Sensors  = 
    {
        OPTIC = {"Litening AN/AAQ-28 FLIR", "Litening AN/AAQ-28 CCD TV"}
        --OPTIC = {"WMD7 FLIR", "WMD7 CCD TV"},
        --OPTIC = {"LANTIRN AAQ-14 FLIR"}
    },
    laserRanger = true,
    laserDesignator = true,
}
)
----------------------------------------------------------------------------------------
-- DLINK
----------------------------------------------------------------------------------------
local dlink_name = 'SAAB - DLP'
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
            file = "ANAWW_13",
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
            ShapeName = "ANAWW_13",
        },
    },
}
)
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.1                       --
----------------------------------------------------------------------------------------