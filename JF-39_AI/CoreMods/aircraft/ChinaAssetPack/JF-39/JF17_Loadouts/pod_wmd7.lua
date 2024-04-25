
local wmd7_name = 'WMD7 POD'
local wmd7_disp = 'WMD7 FLIR/LDT POD'
local pylon_mass = 50.0

declare_loadout(
{
    category    = CAT_PODS,
    displayName = _('AVIC '..wmd7_disp),
    Picture     = "wmd7.png",
    attribute   = {wsType_Weapon,wsType_GContainer,wsType_Control_Cont,WSTYPE_PLACEHOLDER},
    CLSID       = "DIS_WMD7",

    Weight = 245 + pylon_mass,
    Cx_pil = 0.00105,--0.002197266, -- Ragnar: I've calculated it to be exactly this much // changed to F-5 tank Cx -- Teo// testing
    shape_table_data =
    {
        {
            name = wmd7_name,
            file = "wmd7",
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
            ShapeName = "wmd7",
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
