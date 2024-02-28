dofile('Scripts/Database/Weapons/warheads.lua')

--[[
function copyTable(target, src)
    for i, v in pairs(src) do
        if type(v) == 'table' then
            if not target[i] then
                target[i] = { }
            end
            copyTable(target[i], v)
        else
            target[i] = v
        end
    end
end
]]

--[[ Rockets ]]
-- S-13
B13_5_S13OF_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "{B13_5_S13OF_DUAL_L}",
    Picture     = "b13_dual.png",
    displayName = _("2 x B-13L - 5 S-13 OF"),
    Cx_pil      = 0.0004,
    Count       = 10,
    Weight      = 32 + 2*(160+5*69),
    JettisonSubmunitionOnly = true,

    Elements = --RocketContainer("UB-13"),
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            payload_CLSID = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_out"
        },
        {
            payload_CLSID = "{FC56DF80-9B09-44C5-8976-DCFAFF219062}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 7, 33, 33},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER}, -- 4 for 2nd in rockets.lua
}
declare_loadout(B13_5_S13OF_DUAL_L)


B13_5_S13OF_DUAL_R = {}
copyTable(B13_5_S13OF_DUAL_R, B13_5_S13OF_DUAL_L)
B13_5_S13OF_DUAL_R.CLSID = "{B13_5_S13OF_DUAL_R}"
B13_5_S13OF_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
B13_5_S13OF_DUAL_R.Elements[2].connector_name = "Pylon_out"
B13_5_S13OF_DUAL_R.Elements[3].connector_name = "Pylon_in"
B13_5_S13OF_DUAL_R.attribute = B13_5_S13OF_DUAL_L.attribute
declare_loadout(B13_5_S13OF_DUAL_R)


-- S-25
S25_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "{S25_DUAL_L}",
    Picture     = "s25_dual.png",
    displayName = _("2 x S-25"),
    Cx_pil      = 0.0004,
    Weight      = 32+2*(370+65),
    Count       = 2,
    JettisonSubmunitionOnly = true,

    Elements =
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            payload_CLSID = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_out"
        },
        {
            payload_CLSID = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 7, 33, 35},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER},
}
declare_loadout(S25_DUAL_L)


S25_DUAL_R = {}
copyTable(S25_DUAL_R, S25_DUAL_L)
S25_DUAL_R.CLSID = "{S25_DUAL_R}"
S25_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
S25_DUAL_R.Elements[2].connector_name = "Pylon_out"
S25_DUAL_R.Elements[3].connector_name = "Pylon_in"
S25_DUAL_R.attribute = S25_DUAL_L.attribute
declare_loadout(S25_DUAL_R)


-- S-8KOM
B8M1_20_S8KOM_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "{B8M1_20_S8KOM_DUAL_L}",
    Picture     = "b8v20a_dual.png",
    displayName = _("2 x B-8M1 - 20 S-8KOM"),
    Cx_pil      = 0.0004,
    Count       = 40,
    Weight      = 32+2*(137.5 + 20 * 16.7),
    JettisonSubmunitionOnly = true,

    Elements = --RocketContainer("UB-13"),
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true,
        },
        {
            payload_CLSID = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_out",
        },
        {
            payload_CLSID = "{F72F47E5-C83A-4B85-96ED-D3E46671EE9A}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_in",
        },
    },
    wsTypeOfWeapon = {4, 7, 33, 32},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER}, -- 4 for 2nd in rockets.lua
}
declare_loadout(B8M1_20_S8KOM_DUAL_L)


B8M1_20_S8KOM_DUAL_R = {}
copyTable(B8M1_20_S8KOM_DUAL_R, B8M1_20_S8KOM_DUAL_L)
B8M1_20_S8KOM_DUAL_R.CLSID = "{B8M1_20_S8KOM_DUAL_R}"
B8M1_20_S8KOM_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
B8M1_20_S8KOM_DUAL_R.Elements[2].connector_name = "Pylon_out"
B8M1_20_S8KOM_DUAL_R.Elements[3].connector_name = "Pylon_in"
B8M1_20_S8KOM_DUAL_R.attribute = B8M1_20_S8KOM_DUAL_L.attribute
declare_loadout(B8M1_20_S8KOM_DUAL_R)


-- S-8TsM
B8M1_20_S8TsM_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "{B8M1_20_S8TsM_DUAL_L}",
    Picture     = "b8v20a_dual.png",
    displayName = _("2 x B-8M1 - 20 S-8TsM"),
    Cx_pil      = 0.0004,
    Count       = 40,
    Weight      = 32+2*(137.5 + 20 * 11.1),
    JettisonSubmunitionOnly = true,

    Elements = --RocketContainer("UB-13"),
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true,
        },
        {
            payload_CLSID = "{3DFB7320-AB0E-11d7-9897-000476191836}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_out",
        },
        {
            payload_CLSID = "{3DFB7320-AB0E-11d7-9897-000476191836}",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_in",
        },
    },
    wsTypeOfWeapon = {4, 7, 33, 30},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER}, -- 4 for 2nd in rockets.lua
}
declare_loadout(B8M1_20_S8TsM_DUAL_L)


B8M1_20_S8TsM_DUAL_R = {}
copyTable(B8M1_20_S8TsM_DUAL_R, B8M1_20_S8TsM_DUAL_L)
B8M1_20_S8TsM_DUAL_R.CLSID = "{B8M1_20_S8TsM_DUAL_R}"
B8M1_20_S8TsM_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
B8M1_20_S8TsM_DUAL_R.Elements[2].connector_name = "Pylon_out"
B8M1_20_S8TsM_DUAL_R.Elements[3].connector_name = "Pylon_in"
B8M1_20_S8TsM_DUAL_R.attribute = B8M1_20_S8TsM_DUAL_L.attribute
declare_loadout(B8M1_20_S8TsM_DUAL_R)


-- S-8OFP2
B8M1_20_S8OFP2_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "{B8M1_20_S8OFP2_DUAL_L}",
    Picture     = "b8v20a_dual.png",
    displayName = _("2 x B-8M1 - 20 S-8OFP2"),
    Cx_pil      = 0.0004,
    Count       = 40,
    Weight      = 32+2*(137.5 + 20 * 16.7),
    JettisonSubmunitionOnly = true,

    Elements = --RocketContainer("UB-13"),
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true,
        },
        {
            payload_CLSID = "B-8M1 - 20 S-8OFP2",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_out",
        },
        {
            payload_CLSID = "B-8M1 - 20 S-8OFP2",
            DrawArgs = {{3,0.5}},
            connector_name = "Pylon_in",
        },
    },
    wsTypeOfWeapon = {4, 7, 33, 155},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER}, -- 4 for 2nd in rockets.lua
}
declare_loadout(B8M1_20_S8OFP2_DUAL_L)


B8M1_20_S8OFP2_DUAL_R = {}
copyTable(B8M1_20_S8OFP2_DUAL_R, B8M1_20_S8OFP2_DUAL_L)
B8M1_20_S8OFP2_DUAL_R.CLSID = "{B8M1_20_S8OFP2_DUAL_R}"
B8M1_20_S8OFP2_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
B8M1_20_S8OFP2_DUAL_R.Elements[2].connector_name = "Pylon_out"
B8M1_20_S8OFP2_DUAL_R.Elements[3].connector_name = "Pylon_in"
B8M1_20_S8OFP2_DUAL_R.attribute = B8M1_20_S8OFP2_DUAL_L.attribute
declare_loadout(B8M1_20_S8OFP2_DUAL_R)



JF17_LAU68_MK5_DUAL_L = {
    category    = CAT_ROCKETS,
    CLSID       = "DIS_LAU68_MK5_DUAL_GDJ_II19_L",
    Picture     = "LAU68.png",
    displayName = _("GDJ-II19 - 2 x LAU68 MK5"),
    Cx_pil      = 0.00244140625 + 2*0.00146484375,
    Count       = 2,
    Weight      = 32 + 2*114.53,
    JettisonSubmunitionOnly = true,

    Elements = --RocketContainer("UB-13"),
    {
        {
            ShapeName = "JF-17_GDJ-II19L",
            IsAdapter = true
        },
        {
            payload_CLSID = "{174C6E6D-0C3D-42ff-BCB3-0853CB371F5C}",
            connector_name = "Pylon_GDJ-II19L_L"
        },
        {
            payload_CLSID = "{174C6E6D-0C3D-42ff-BCB3-0853CB371F5C}",
            connector_name = "Pylon_GDJ-II19L_R"
        },
    },
    wsTypeOfWeapon = {4, 7,	33,	145},
    attribute      = {4, 7, 32, WSTYPE_PLACEHOLDER},
}
declare_loadout(JF17_LAU68_MK5_DUAL_L)


JF17_LAU68_MK5_DUAL_R = {}
copyTable(JF17_LAU68_MK5_DUAL_R, JF17_LAU68_MK5_DUAL_L)
JF17_LAU68_MK5_DUAL_R.CLSID = "DIS_LAU68_MK5_DUAL_GDJ_II19_R"
JF17_LAU68_MK5_DUAL_R.Elements[1].ShapeName = "JF-17_GDJ-II19R"
JF17_LAU68_MK5_DUAL_R.Elements[2].connector_name = "Pylon_GDJ-II19R_R"
JF17_LAU68_MK5_DUAL_R.Elements[3].connector_name = "Pylon_GDJ-II19R_L"
JF17_LAU68_MK5_DUAL_R.attribute = JF17_LAU68_MK5_DUAL_L.attribute
declare_loadout(JF17_LAU68_MK5_DUAL_R)
