
--- ECM pod of J-11A
declare_loadout(
    {
        category = CAT_PODS,
        CLSID = "{RKL609_L}",
        attribute = {wsType_Weapon, wsType_GContainer, wsType_Jam_Cont, WSTYPE_PLACEHOLDER},
        Picture = "L005.png",
        displayName = _("RKL609 ECM Pod (Left)"),
        Weight = 150,
        Cx_pil = 0.000244140625,
        shape_table_data =
        {
            {
                file = "",
                life = 1,
                fire = { 0, 1},
                username = "RKL609_L",
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "",
            },
        },
    }
)

declare_loadout(
    {
        category = CAT_PODS,
        CLSID = "{RKL609_R}",
        attribute = {wsType_Weapon, wsType_GContainer, wsType_Jam_Cont, WSTYPE_PLACEHOLDER},
        Picture = "L005.png",
        displayName = _("RKL609 ECM Pod (Right)"),
        Weight = 150,
        Cx_pil = 0.000244140625,
        shape_table_data =
        {
            {
                file = "",
                life = 1,
                fire = { 0, 1},
                username = "RKL609_R",
                index = WSTYPE_PLACEHOLDER,
            },
        },
        Elements =
        {
            {
                Position = {0, 0, 0},
                ShapeName = "",
            },
        },
    }
)



