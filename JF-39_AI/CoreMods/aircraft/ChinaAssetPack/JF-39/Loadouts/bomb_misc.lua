
local function bombs_in_hatch_block(tbl,x0,y0,z0,dy,dz,collumns,layers,count,shape)
    local col = 1
    local layer = 1
    while count > 0 and layer < layers + 1 do
        tbl[#tbl + 1] = {
            Position  = {
                x0,
                y0 + (layer - 1) * dy,
                z0 + (col - 1) * dz,
            },
            ShapeName = shape
        }
                
        col = col + 1
        if col > collumns then
           layer = layer + 1
           col = 1
        end
        count = count - 1
    end
    return count
end

local function h6_bay_hatch(shapename,col,row,layer,gap_y)
    local cols = col
    local rows = row
    local layers = layer

    if cols > 2 then cols = 2 end
    if rows > 3 then rows = 3 end
    if layers > 4 then layers = 4 end

    local count = cols * rows * layers

    local dx    = 2.2
    local dy    = -gap_y
    local dz    = 1.0

    local x0    = 2.2
    local y0    = -0.32 -- -dy * layers - 0.64
    local z0    = -0.5

    y0 = gap_y * (layers - 1) + y0

    local elems = {}

    while count > 0 do
          count = bombs_in_hatch_block(elems,x0,y0,z0,dy,dz,cols,layers,count,shapename)
          x0    = x0 - dx
    end

    return elems
end

---------------------------------------------

--[[ Bombs ]]
-- FAB-250
FAB_250_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "{FAB_250_DUAL_L}",
    Picture     = "fab250_dual.png",
    displayName = _("2 x FAB-250"),
    Cx_pil      = 0.0004,
    Count       = 2,
    Weight      = 32 + 250*2,
    JettisonSubmunitionOnly = true,

    Elements =
    {
        {
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            },
            -- ShapeName = "FAB-250-N1",
            -- Position  = {0,-0.654936/2,0.654936/2},
            payload_CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
            connector_name = "Pylon_out"
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            },
            -- ShapeName = "FAB-250-N1",
            -- Position  = {0,-0.654936/2,-0.654936/2},
            payload_CLSID = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}",
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 5, 9, 6},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(FAB_250_DUAL_L)


FAB_250_DUAL_R = {}
copyTable(FAB_250_DUAL_R, FAB_250_DUAL_L)
FAB_250_DUAL_R.CLSID = "{FAB_250_DUAL_R}"
FAB_250_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
-- FAB_250_DUAL_R.Elements[2].Position = {0,-0.654936/2,-0.654936/2}
-- FAB_250_DUAL_R.Elements[3].Position = {0,-0.654936/2, 0.654936/2}
FAB_250_DUAL_R.Elements[2].connector_name = "Pylon_out"
FAB_250_DUAL_R.Elements[3].connector_name = "Pylon_in"
FAB_250_DUAL_R.attribute = FAB_250_DUAL_L.attribute
declare_loadout(FAB_250_DUAL_R)


-- FAB-500
FAB_500_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "{FAB_500_DUAL_L}",
    Picture     = "fab500_dual.png",
    displayName = _("2 x FAB-500"),
    Cx_pil      = 0.0004,
    Count       = 2,
    Weight      = 32 + 506*2,
    JettisonSubmunitionOnly = true,

    Elements =
    {
        {
            -- Position  = {0, 0, 0},
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            },
            -- ShapeName = "FAB-500-N3",
            -- Position  = {0,-0.654936/2,0.654936/2},
            payload_CLSID = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
            connector_name = "Pylon_out"
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            },
            -- ShapeName = "FAB-500-N3",
            -- Position  = {0,-0.654936/2,-0.654936/2},
            payload_CLSID = "{37DCC01E-9E02-432F-B61D-10C166CA2798}",
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 5, 9, 7},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(FAB_500_DUAL_L)


FAB_500_DUAL_R = {}
copyTable(FAB_500_DUAL_R, FAB_500_DUAL_L)
FAB_500_DUAL_R.CLSID = "{FAB_500_DUAL_R}"
FAB_500_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
-- FAB_500_DUAL_R.Elements[2].Position = {0,-0.654936/2,-0.654936/2}
-- FAB_500_DUAL_R.Elements[3].Position = {0,-0.654936/2, 0.654936/2}
FAB_500_DUAL_R.Elements[2].connector_name = "Pylon_out"
FAB_500_DUAL_R.Elements[3].connector_name = "Pylon_in"
FAB_500_DUAL_R.attribute = FAB_500_DUAL_L.attribute
declare_loadout(FAB_500_DUAL_R)


-- RBK-250
RBK_250_PTAB25M_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "{RBK_250_PTAB25M_DUAL_L}",
    Picture     = "rbk250_dual.png",
    displayName = _("2 x RBK-250 PTAB-2.5M"),
    Cx_pil      = 0.0004,
    Count       = 2,
    Weight      = 32 + 273*2,
    JettisonSubmunitionOnly = true,

    Elements =
    {
        {
            -- Position  = {0, 0, 0},
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
                [3] = {3, 1},
            }, -- end of DrawArgs
            -- ShapeName = "RBK_250_PTAB_25M_cassette",
            -- Position  = {0.325000*3/4,-0.325000,0.654936/2},
            payload_CLSID = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
            connector_name = "Pylon_out"
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
                [3] = {3, -1},
            }, -- end of DrawArgs
            -- ShapeName = "RBK_250_PTAB_25M_cassette",
            -- Position  = {0.325000*3/4,-0.325000,-0.654936/2},
            payload_CLSID = "{4203753F-8198-4E85-9924-6F8FF679F9FF}",
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 5, 38, 18},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(RBK_250_PTAB25M_DUAL_L)


RBK_250_PTAB25M_DUAL_R = {}
copyTable(RBK_250_PTAB25M_DUAL_R, RBK_250_PTAB25M_DUAL_L)
RBK_250_PTAB25M_DUAL_R.CLSID = "{RBK_250_PTAB25M_DUAL_R}"
RBK_250_PTAB25M_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
-- RBK_250_PTAB25M_DUAL_R.Elements[2].DrawArgs[3] = {3, -1}
-- RBK_250_PTAB25M_DUAL_R.Elements[2].Position = {0.325000*3/4,-0.325000,-0.654936/2}
-- RBK_250_PTAB25M_DUAL_R.Elements[3].DrawArgs[3] = {3, 1}
-- RBK_250_PTAB25M_DUAL_R.Elements[3].Position = {0.325000*3/4,-0.325000, 0.654936/2}
RBK_250_PTAB25M_DUAL_R.Elements[2].connector_name = "Pylon_out"
RBK_250_PTAB25M_DUAL_R.Elements[3].connector_name = "Pylon_in"
RBK_250_PTAB25M_DUAL_R.attribute = RBK_250_PTAB25M_DUAL_L.attribute
declare_loadout(RBK_250_PTAB25M_DUAL_R)


-- RBK-500
RBK_500_PTAB105_DUAL_L = {
    category     = CAT_BOMBS,
    CLSID        = "{RBK_500_PTAB105_DUAL_L}",
    Picture      = "rbk500_dual.png",
    displayName  = _("2 x RBK-500-255 PTAB-10-5"),
    Cx_pil       = 0.0004,
    Count        = 2,
    Weight       = 32 + 253*2,
    Weight_Empty = 32,
    JettisonSubmunitionOnly = true,

    Elements =
    {
        {
            -- Position  = {0, 0, 0},
            ShapeName = "J-11A_twinpylon_l",
            IsAdapter = true
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
                [3] = {3, 1},
            }, -- end of DrawArgs
            -- ShapeName = "RBK_500_255_PTAB_10_5_cassette",
            -- Position  = {0.325000*3/4,-0.4,0.654936/2},
            payload_CLSID = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
            connector_name = "Pylon_out"
        },
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
                [3] = {3, -1},
            }, -- end of DrawArgs
            -- ShapeName = "RBK_500_255_PTAB_10_5_cassette",
            -- Position  = {0.325000*3/4,-0.4,-0.654936/2},
            payload_CLSID = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}",
            connector_name = "Pylon_in"
        },
    },
    wsTypeOfWeapon = {4, 5, 38, 20},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(RBK_500_PTAB105_DUAL_L)


RBK_500_PTAB105_DUAL_R = {}
copyTable(RBK_500_PTAB105_DUAL_R, RBK_500_PTAB105_DUAL_L)
RBK_500_PTAB105_DUAL_R.CLSID = "{RBK_500_PTAB105_DUAL_R}"
RBK_500_PTAB105_DUAL_R.Elements[1].ShapeName = "J-11A_twinpylon_r"
-- RBK_500_PTAB105_DUAL_R.Elements[2].DrawArgs[3] = {3, -1}
-- RBK_500_PTAB105_DUAL_R.Elements[2].Position = {0.325000*3/4,-0.4,-0.654936/2}
-- RBK_500_PTAB105_DUAL_R.Elements[3].DrawArgs[3] = {3, 1}
-- RBK_500_PTAB105_DUAL_R.Elements[3].Position = {0.325000*3/4,-0.4, 0.654936/2}
RBK_500_PTAB105_DUAL_R.Elements[2].connector_name = "Pylon_out"
RBK_500_PTAB105_DUAL_R.Elements[3].connector_name = "Pylon_in"
RBK_500_PTAB105_DUAL_R.attribute = RBK_500_PTAB105_DUAL_L.attribute
declare_loadout(RBK_500_PTAB105_DUAL_R)


-- customized MK-20
JF17_MK_20 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MK_20",
    Picture     = "Mk20.png",
    displayName = _("Mk-20"),
    Count       = 1,
    Weight      = 222,
    Cx_pil      = 0.000413,

    Elements =
    {
        [1] =
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = "ROCKEYE",
        },
    }, -- end of Elements
    attribute    = {4, 5, 38, 45},
    ejectImpulse = 140,
}
declare_loadout(JF17_MK_20)


-- customized GBU-10/12/16
JF17_GBU_10 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_GBU_10",
    Picture     = "GBU10.png",
    displayName = _("GBU-10"),
    Count       = 1,
    Weight      = 1162,
    Cx_pil      = 0.000793,

    Elements =
    {
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = "GBU-10",
        },
    },
    attribute    = {4, 5, 36, 36},
    Required     = {"DIS_WMD7"},
    ejectImpulse = 140,
}
declare_loadout(JF17_GBU_10)

JF17_GBU_16 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_GBU_16",
    Picture     = "GBU16.png",
    displayName = _("GBU-16"),
    Count       = 1,
    Weight      = 564,
    Cx_pil      = 0.000413,

    Elements =
    {
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = "GBU-16",
        },
    },
    attribute    = {4, 5, 36, 39},
    Required     = {"DIS_WMD7"},
    ejectImpulse = 140,
}
declare_loadout(JF17_GBU_16)

JF17_GBU_12 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_GBU_12",
    Picture     = "GBU12.png",
    displayName = _("GBU-12"),
    Count       = 1,
    Weight      = 275,
    Cx_pil      = 0.000413,

    Elements =
    {
        {
            DrawArgs =
            {
                [1] = {1, 1},
                [2] = {2, 1},
            }, -- end of DrawArgs
            Position  = {0, 0, 0},
            ShapeName = "GBU-12",
        },
    },
    attribute    = {4, 5, 36, 38},
    Required     = {"DIS_WMD7"},
    ejectImpulse = 140,
}
declare_loadout(JF17_GBU_12)


---- customized dual rack
-- gdj-ii19 dual mk82 left/right
JF17_MK_82_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MK_82_DUAL_GDJ_II19_L",
    Picture     = "mk82.png",
    displayName = _("BRU-33 - 2 x Mk-82"),
    Count       = 2,
    Weight      = 79 + 2 * 241,
    Cx_pil      = 0.00025 * 2 + 0.00122,

    JettisonSubmunitionOnly = true,
    Elements =
    {
        {ShapeName = "BRU_33A", IsAdapter      = true},
        {ShapeName = "MK-82", connector_name = "Point02"},
        {ShapeName = "MK-82", connector_name = "Point01"}
    },

    wsTypeOfWeapon = {4, 5, 9, 31},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(JF17_MK_82_DUAL_L)

JF17_MK_82_DUAL_R = {}
copyTable(JF17_MK_82_DUAL_R, JF17_MK_82_DUAL_L)
JF17_MK_82_DUAL_R.CLSID = "DIS_MK_82_DUAL_GDJ_II19_R"
JF17_MK_82_DUAL_R.Elements[1].ShapeName = "BRU_33A"
JF17_MK_82_DUAL_R.Elements[2].connector_name = "Point02"
JF17_MK_82_DUAL_R.Elements[3].connector_name = "Point01"
JF17_MK_82_DUAL_R.attribute = JF17_MK_82_DUAL_L.attribute
declare_loadout(JF17_MK_82_DUAL_R)


-- gdj-ii19 dual mk82snakeeye left/right
JF17_MK_82S_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MK_82S_DUAL_GDJ_II19_L",
    Picture     = "mk82AIR.png",
    displayName = _("BRU-33 - 2 x Mk-82 SnakeEye"),
    Count       = 2,
    Weight      = 79 + 2 * 232,
    Cx_pil      = 0.00035 * 2 + 0.00122,

    JettisonSubmunitionOnly = true,
    Elements =
    {
        {ShapeName = "BRU_33A", IsAdapter      = true},
        {ShapeName = "MK-82_Snakeye", connector_name = "Point02"},
        {ShapeName = "MK-82_Snakeye", connector_name = "Point01"}
    },

    wsTypeOfWeapon = {4, 5, 9, 79},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(JF17_MK_82S_DUAL_L)

JF17_MK_82S_DUAL_R = {}
copyTable(JF17_MK_82S_DUAL_R, JF17_MK_82S_DUAL_L)
JF17_MK_82S_DUAL_R.CLSID = "DIS_MK_82S_DUAL_GDJ_II19_R"
JF17_MK_82S_DUAL_R.Elements[1].ShapeName = "BRU_33A"
JF17_MK_82S_DUAL_R.Elements[2].connector_name = "Point02"
JF17_MK_82S_DUAL_R.Elements[3].connector_name = "Point01"
JF17_MK_82S_DUAL_R.attribute = JF17_MK_82S_DUAL_L.attribute
declare_loadout(JF17_MK_82S_DUAL_R)


-- gdj-ii19 dual mk20 left/right
JF17_MK_20_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MK_20_DUAL_GDJ_II19_L",
    Picture     = "Mk20.png",
    displayName = _("BRU-33 - 2 x Mk-20"),
    Count       = 2,
    Weight      = 79 + 2 * 222,
    Cx_pil      = 0.000413 * 2 + 0.00122,

    JettisonSubmunitionOnly = true,
    Elements =
    {
        {ShapeName = "BRU_33A", IsAdapter      = true},
        {ShapeName = "ROCKEYE", connector_name = "Point02"},
        {ShapeName = "ROCKEYE", connector_name = "Point01"}
    },

    wsTypeOfWeapon = {4, 5, 38, 45},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(JF17_MK_20_DUAL_L)

JF17_MK_20_DUAL_R = {}
copyTable(JF17_MK_20_DUAL_R, JF17_MK_20_DUAL_L)
JF17_MK_20_DUAL_R.CLSID = "DIS_MK_20_DUAL_GDJ_II19_R"
JF17_MK_20_DUAL_R.Elements[1].ShapeName = "BRU_33A"
JF17_MK_20_DUAL_R.Elements[2].connector_name = "Point02"
JF17_MK_20_DUAL_R.Elements[3].connector_name = "Point01"
JF17_MK_20_DUAL_R.attribute = JF17_MK_20_DUAL_L.attribute
declare_loadout(JF17_MK_20_DUAL_R)



-- gdj-ii19 dual gbu12 left/right
JF17_GBU_12_DUAL_L = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_GBU_12_DUAL_GDJ_II19_L",
    Picture     = "GBU12.png",
    displayName = _("BRU-33 - 2 x GBU-12"),
    Count       = 2,
    Weight      = 79 + 2 * 275,
    Cx_pil      = 0.000413 * 2 + 0.00122,

    JettisonSubmunitionOnly = true,
    Elements =
    {
        {ShapeName = "BRU_33A", IsAdapter      = true},
        {ShapeName = "GBU-12", connector_name = "Point02"},
        {ShapeName = "GBU-12", connector_name = "Point01"}
    },

    wsTypeOfWeapon = {4, 5, 36, 38},
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    Required       = {"DIS_WMD7"},
    ejectImpulse   = 140,
}
declare_loadout(JF17_GBU_12_DUAL_L)

JF17_GBU_12_DUAL_R = {}
copyTable(JF17_GBU_12_DUAL_R, JF17_GBU_12_DUAL_L)
JF17_GBU_12_DUAL_R.CLSID = "DIS_GBU_12_DUAL_GDJ_II19_R"
JF17_GBU_12_DUAL_R.Elements[1].ShapeName = "BRU_33A"
JF17_GBU_12_DUAL_R.Elements[2].connector_name = "Point02"
JF17_GBU_12_DUAL_R.Elements[3].connector_name = "Point01"
JF17_GBU_12_DUAL_R.attribute = JF17_GBU_12_DUAL_L.attribute
declare_loadout(JF17_GBU_12_DUAL_R)


------------------------------------------------------------------

local bomb_250_2_name  = "250-2"
local bomb_250_2_model = "250-2"
local bomb_250_2_disp  = "250-2 - 250kg GP Bombs HD"
local bomb_250_2_mass  = 250.0

local BOMB_250_2 = {
    category  = CAT_BOMBS,
    name      = bomb_250_2_name,
    model     = bomb_250_2_model,
    user_name = _(bomb_250_2_disp),

    type           = 0,    
    mass           = bomb_250_2_mass,
    hMin           = 200.0,
    hMax           = 20000.0,
    Cx             = 0.000999,
    VyHold         = -100.0,
    Ag             = -1.23,
    Reflection     = 0.02,
    warhead        = warheads["FAB_250"],

    wsTypeOfWeapon = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    
    shape_table_data =
    {
        {
            name     = bomb_250_2_name,
            file     = bomb_250_2_model,
            life     = 1,
            fire     = {0, 1},
            username = bomb_250_2_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    scheme         = "bomb-common",
    class_name     = "wAmmunition",

    fm =
    {
        mass            = bomb_250_2_mass,
        caliber         = 0.325000,
        cx_coeff        = {1.000000, 0.390000, 0.380000, 0.236000, 1.310000},
        L               = 1.480000,
        I               = 43.077867,
        Ma              = 0.141338,
        Mw              = 2.244756,
        wind_sigma      = 30.000000,
    },
 
    targeting_data = {
        char_time = 20.56, -- characteristic time for sights 
    },
}
declare_weapon(BOMB_250_2)

declare_loadout(
{
    category        = CAT_BOMBS,
    CLSID           = "DIS_BOMB_250_2",
    attribute       = BOMB_250_2.wsTypeOfWeapon,
    Count           = 1,
    Cx_pil          = BOMB_250_2.Cx,
    Picture         = "rus_FAB-250n-1.png",
    displayName     = BOMB_250_2.user_name,
    Weight          = BOMB_250_2.mass,
    Elements  = {
        {
            ShapeName = bomb_250_2_model,
        }, 
    },
    ejectImpulse    = 140,
}
)

H6_250_2_N12 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_H6_250_2_N12",
    Picture     = "rus_FAB-250n-1.png",
    displayName = _("12 x " .. bomb_250_2_disp),
    Count       = 12,
    Weight      = 3000,
    Cx_pil      = 0.0,

    Elements    = h6_bay_hatch(bomb_250_2_model, 2, 3, 2, 0.32),

    wsTypeOfWeapon = BOMB_250_2.wsTypeOfWeapon,
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(H6_250_2_N12)

H6_250_2_N24 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_H6_250_2_N24",
    Picture     = "rus_FAB-250n-1.png",
    displayName = _("24 x " .. bomb_250_2_disp),
    Count       = 24,
    Weight      = 6000,
    Cx_pil      = 0.0,

    Elements    = h6_bay_hatch(bomb_250_2_model, 2, 3, 4, 0.32),

    wsTypeOfWeapon = BOMB_250_2.wsTypeOfWeapon,
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(H6_250_2_N24)

MER6_250_2_N6 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MER6_250_2_N6",
    Picture     = "rus_FAB-250n-1.png",
    displayName = _("MER6 - 6 x " .. bomb_250_2_disp),
    Count       = 6,
    Weight      = 1500 + 50,
    Cx_pil      = 6.5 * BOMB_250_2.Cx,

    Elements    = {
        {ShapeName = "mbd3-u6-68", IsAdapter = true},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_001"},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_002"},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_003"},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_004"},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_005"},
        {ShapeName = bomb_250_2_model, connector_name = "fab_100-250_006"},
    },

    wsTypeOfWeapon = BOMB_250_2.wsTypeOfWeapon,
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(MER6_250_2_N6)

--------------------------------------

local bomb_250_3_name  = "250-3"
local bomb_250_3_model = "250-3"
local bomb_250_3_disp  = "250-3 - 250kg GP Bombs LD"
local bomb_250_3_mass  = 250.0

local BOMB_250_3 = {
    category  = CAT_BOMBS,
    name      = bomb_250_3_name,
    model     = bomb_250_3_model,
    user_name = _(bomb_250_3_disp),

    type           = 0,    
    mass           = bomb_250_3_mass,
    hMin           = 100.0,
    hMax           = 10000.0,
    Cx             = 0.00025,
    VyHold         = -100.0,
    Ag             = -1.23,
    Reflection     = 0.02,
    warhead        = warheads["FAB_250"],

    wsTypeOfWeapon = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    
    shape_table_data =
    {
        {
            name     = bomb_250_3_name,
            file     = bomb_250_3_model,
            life     = 1,
            fire     = {0, 1},
            username = bomb_250_3_name,
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    scheme         = "bomb-common",
    class_name     = "wAmmunition",

    fm =
    {
        mass            = bomb_250_3_mass,
        caliber         = 0.273,
        cx_coeff        = {1.0, 0.29, 0.71, 0.14, 1.28},
        L               = 2.21,
        I               = 94.425933,
        Ma              = 2.746331,
        Mw              = 2.146083,
        wind_time       = 1000.0,
        wind_sigma      = 80.0
    },
 
    targeting_data = {
        char_time = 20.32, -- characteristic time for sights 
    },
}
declare_weapon(BOMB_250_3)

declare_loadout(
{
    category        = CAT_BOMBS,
    CLSID           = "DIS_BOMB_250_3",
    attribute       = BOMB_250_3.wsTypeOfWeapon,
    Count           = 1,
    Cx_pil          = BOMB_250_3.Cx,
    Picture         = "rus_FAB-250n-1.png",
    displayName     = BOMB_250_3.user_name,
    Weight          = BOMB_250_3.mass,
    Elements  = {
        {
            ShapeName = bomb_250_3_model,
        }, 
    },
    ejectImpulse    = 140,
}
)

MER6_250_3_N6 = {
    category    = CAT_BOMBS,
    CLSID       = "DIS_MER6_250_3_N6",
    Picture     = "rus_FAB-250n-1.png",
    displayName = _("MER6 - 6 x " .. bomb_250_3_disp),
    Count       = 6,
    Weight      = 1500 + 50,
    Cx_pil      = 6.5 * BOMB_250_3.Cx,

    Elements    = {
        {ShapeName = "gdj-iv1", IsAdapter = true},
        {ShapeName = bomb_250_3_model, connector_name = "Point005"},
        {ShapeName = bomb_250_3_model, connector_name = "Point003"},
        {ShapeName = bomb_250_3_model, connector_name = "Point006"},
        {ShapeName = bomb_250_3_model, connector_name = "Point002"},
        {ShapeName = bomb_250_3_model, connector_name = "Point004"},
        {ShapeName = bomb_250_3_model, connector_name = "Point001"},
    },

    wsTypeOfWeapon = BOMB_250_3.wsTypeOfWeapon,
    attribute      = {4, 5, 32, WSTYPE_PLACEHOLDER},
    ejectImpulse   = 140,
}
declare_loadout(MER6_250_3_N6)

----------------------------------------------------------------------------------------
-- JF-39 Files
----------------------------------------------------------------------------------------
local JF39_GBU_24 =
{
    category		= CAT_BOMBS,
    wsTypeOfWeapon	= {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, GBU_24},
    type    = 4,
    mass    = 934.0,
    hMin    = 1000.0,
    hMax    = 40000.0,
    Cx      = 0.00051,
    VyHold  = -100.0,
    Ag      = -2.0,
        
	name			= "JF39_GBU_24",
	model			= "GBU-24",
	user_name		= _("GBU-24A/B Paveway III"),
	scheme			= "bomb-paveway-III",
	class_name		= "wAmmunitionLaserHoming",
		
	shape_table_data =
	{
		{
			name		= "JF39_GBU_24",
			file		= "GBU-24",
			life		= 1,
			fire		= {0, 1},
			username	= _("GBU-24A/B Paveway III"),
			index		= JF39_GBU_24,
		},
	},
		
	seeker = {
		delay	= 6.5,	
		FOV		= math.rad(90),
		max_seeker_range	= 22500,
		max_dist_to_emitter	= 49000,	
	},
	
	fm =
    {
        mass			= 1087.0,
		wind_time		= 1000.0,
		wind_sigma		= 0,
		A				= 0.6,
		maxAoa			= math.rad(25),
		finsTau			= 0.1,
		dCydA			= {0.066, 0.036},
		caliber			= 0.457,
		cx_coeff        = {1.037, 0.91, 0.9, 0.382, 1.34},
		L               = 4.368,
		I				= 1 / 12 * 934.0 * 4.368 * 4.368,
		Sm				= 0.164,
		Sw				= 0.85,
		Ma				= 0.85,
		Mw				= 4.55,
		Ma_x			= 0.9,
		Ma_z			= 0.5,
		Mw_x			= 2.0,
		model_roll 		= math.rad(45),
    },
	
	autopilot = {
		delay				= 2,
		op_time				= 120,
		Knav				= 4,
		Kbias				= 0,
		Kpitch				= 2,
		Tf					= 0.2,
		Kd					= 2,
		Ki					= 10,
		Kdx					= 0.2,
		Kix					= 0.8,
		null_roll			= math.rad(45),
		fins_limit			= math.rad(20),
		fins_limit_x		= math.rad(10),
	},
	
		
	targeting_data = 
	{
		char_time		= 20.33,
	},
	
    warhead = predefined_warhead("BLU_109"),
		
	LaunchDistData =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		6400,	8750,	10800,	12300,	13200,	14050,	15300,	
		2000,	2750,	4500,	6600,	9100,	11750,	14100,	15750,	16600,	17450,	18950,	
		3000,	3850,	5800,	8550,	11450,	14450,	17000,	18650,	19500,	20700,	22150,	
		4000,	5050,	7300,	10200,	13550,	16900,	19700,	21350,	22200,	23750,	25700,	
		5000,	6400,	9200,	12100,	15400,	19000,	21800,	23700,	25100,	26300,	27600,	
		6000,	8300,	11000,	13800,	17500,	21300,	24000,	25200,	26400,	27800,	29100,	
		7000,	10200,	12800,	15600,	19400,	23300,	25300,	26500,	27800,	29000,	30600,	
		8000,	11900,	14600,	17400,	21200,	24800,	26400,	27600,	28900,	30300,	31900,	
		9000,	13400,	16400,	19200,	23200,	25800,	27200,	28600,	29800,	31400,	33200,	
		10000,	15200,	18000,	21200,	24600,	26600,	28000,	29200,	30800,	32600,	34800,	
		11000,	16800,	19800,	23000,	25200,	27200,	28600,	30000,	31800,	34000,	36200,	
		12000,	18500,	20500,	23500,	25500,	27500,	29000,	30500,	32500,	34500,	37000,	
		13000,	19500,	21500,	24000,	26000,	28000,	29500,	31500,	33500,	36000,	38500,	
		14000,	20000,	22500,	24500,	26500,	29000,	30500,	32000,	34500,	37500,	40000,	
		15000,	20500,	22500,	25000,	27500,	29500,	31000,	33000,	35500,	38500,	41000,	
	},

	MinLaunchDistData =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		5050,	5450,	5900,	6200,	7500,	7850,	8300,	
		2000,	1850,	3550,	4600,	5300,	5900,	6400,	7450,	7850,	8200,	8700,	
		3000,	2750,	3800,	4550,	5300,	5900,	6500,	7750,	8050,	8450,	8900,	
		4000,	2850,	3600,	4400,	5250,	6000,	6600,	7100,	7600,	8550,	9000,	
		5000,	1800,	3100,	4300,	5400,	6400,	7200,	8000,	8900,	9200,	9500,	
		6000,	1600,	3000,	4300,	5800,	7000,	8000,	8900,	9600,	10000,	10400,	
		7000,	1400,	2800,	4500,	6100,	7600,	8600,	9600,	10400,	10800,	11300,	
		8000,	1500,	2800,	4600,	6300,	7900,	9100,	10200,	11100,	11500,	12000,	
		9000,	1600,	2600,	4600,	6600,	8200,	9400,	10600,	11600,	12400,	12800,	
		10000,	1600,	2600,	4800,	6800,	8400,	9800,	10800,	12200,	13200,	13600,	
		11000,	1600,	2600,	4800,	6800,	8600,	10000,	11200,	12800,	13800,	14400,	
		12000,	1500,	2000,	4500,	6500,	8500,	10000,	11500,	13500,	14500,	15000,	
		13000,	1500,	2500,	5000,	7000,	9000,	10500,	12500,	14000,	15500,	16000,	
		14000,	1500,	2000,	5000,	7500,	9500,	11000,	12500,	14500,	16000,	16500,	
		15000,	1500,	2000,	5000,	7500,	9500,	11500,	13000,	15000,	16500,	17500,	
	},

	AspectDistData =
	{
		10,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		4,		13,		16,		18,		19,		20,		23,		
		2000,	4,		5,		10,		17,		21,		25,		26,		27,		28,		30,		
		3000,	7,		10,		17,		23,		29,		30,		30,		30,		30,		30,		
		4000,	11,		15,		22,		29,		30,		30,		30,		30,		30,		30,		
		5000,	17,		19,		24,		30,		30,		30,		30,		30,		30,		30,		
		6000,	20,		24,		29,		30,		30,		30,		30,		30,		30,		30,		
		7000,	23,		29,		30,		30,		30,		30,		30,		30,		30,		30,		
		8000,	27,		30,		30,		30,		30,		30,		30,		30,		30,		30,		
		9000,	30,		30,		30,		30,		30,		30,		30,		30,		30,		30,		
		10000,	30,		30,		30,		30,		30,		30,		30,		30,		30,		30,			
	},

	MaxTOF =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		30.3,	36.6,	41,		44.1,	46.2,	47.9,	49.6,		
		2000,	26.3,	32.6,	37.9,	44.1,	50.1,	54.8,	58.1,	59.9,	61,		62.9,		
		3000,	34.3,	40.8,	49.8,	56,		62.1,	66.7,	69.6,	71.3,	72.8,	74.2,		
		4000,	41.7,	49.4,	59.5,	66.5,	72.6,	77.5,	80.3,	81.4,	83.5,	87.3,		
		5000,	48.4,	57.8,	65.6,	72.5,	80.2,	84.9,	89.3,	92.4,	91,		90.7,		
		6000,	58.9,	67.1,	73.7,	82.2,	89.5,	92.7,	93.1,	94.1,	94.4,	93.6,		
		7000,	69.1,	75.8,	82.7,	90.3,	96.6,	95.1,	96.4,	97.4,	96.3,	96.7,		
		8000,	77.3,	83.9,	91.2,	97.7,	98.2,	97.4,	99.1,	99.6,	99.1,	98.6,		
		9000,	83.4,	91.5,	98.1,	103.6,	99,		98.7,	101.8,	100.8,	100.6,	100.3,	
		10000,	91.4,	96.9,	106,	102.4,	100.5,	100.8,	102.5,	102.8,	102.6,	103.6,	
		11000,	97.5,	103.6,	108.1,	101.2,	101.7,	102.3,	103.9,	104.8,	105.5,	105.3,	
		12000,	104,	102.4,	103.4,	100.2,	101.3,	102.1,	103.8,	104.6,	102.5,	103.2,	
		13000,	105.7,	103.1,	102.5,	101.3,	102.1,	102.8,	106.9,	105.8,	105.3,	105.3,	
		14000,	105.1,	105.9,	103.5,	102.8,	106.5,	106.6,	106.7,	106.5,	108.1,	107.4,	
		15000,	106.1,	104.1,	105.3,	107.2,	107.7,	107.3,	109.1,	107.2,	108.1,	106.8,	
	},

	MinTOF =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		22.7,	21,		20.3,	19.8,	23,		23.1,	22.6,		
		2000,	22.4,	25.5,	25.7,	24.8,	23.9,	23.3,	24.5,	24.9,	24.9,	24,		
		3000,	28.4,	29.1,	28.1,	27.3,	26.5,	25.9,	26.9,	27.1,	26.6,	25.6,		
		4000,	32.3,	32.1,	31.4,	30.4,	29.4,	28.7,	28.5,	28.8,	28.5,	27.5,		
		5000,	33.8,	33.1,	32.3,	31.9,	31.4,	31.2,	31.9,	33.1,	31.6,	30.3,		
		6000,	37.7,	37.2,	36.3,	34.8,	34.4,	34.3,	35.3,	35.8,	34.3,	33.3,		
		7000,	41.5,	41,		39.5,	38,		37.4,	37.3,	38.5,	38.5,	37.1,	36.2,		
		8000,	43.9,	43.9,	42.5,	41.2,	40.1,	40.2,	41.6,	41.1,	39.8,	38.8,		
		9000,	46.2,	47.1,	45.7,	43.9,	43,		42.9,	44.6,	43.5,	42.7,	41.5,		
		10000,	48.8,	49.7,	48.1,	46.8,	46.1,	45.9,	47.3,	46,		45.4,	44,		
		11000,	51.3,	52.2,	50.9,	49.9,	49.3,	49.6,	49.9,	48.5,	47.7,	46.3,		
		12000,	53.9,	56.1,	54,		53.4,	52.5,	52.9,	52.4,	51.1,	50,		48.2,		
		13000,	56.3,	57.4,	55.9,	55.3,	54.7,	55.2,	54.1,	53.5,	52.4,	50.2,		
		14000,	58.7,	60.7,	58.5,	57.4,	57.1,	57.5,	57.1,	55.8,	54.2,	51.7,		
		15000,	61.1,	63.2,	61.1,	60.2,	60,		59.6,	59.2,	57.9,	55.8,	53.5,		
	},

	MidTOF =
	{
		15,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		1000,	0,		0,		0,		26.4,	28,		29.4,	30.4,	33.3,	34.1,	34.5,		
		2000,	23.4,	28.5,	30.7,	32.6,	34.4,	35.9,	38.4,	39.4,	39.9,	40.3,		
		3000,	30.9,	33.4,	35.4,	37.3,	39.2,	40.8,	43.5,	44.2,	44.8,	45,		
		4000,	35.8,	37.5,	39.1,	41.4,	43.5,	45.2,	46.6,	47.6,	49.1,	50.1,		
		5000,	36.2,	38.7,	41.3,	44.1,	47.1,	49.4,	52.1,	54.5,	53.7,	53,		
		6000,	41,		42.8,	44.9,	48.6,	51.9,	54.4,	56.1,	57.3,	56.8,	55.9,		
		7000,	45.6,	46.6,	48.9,	52.5,	56.2,	57.5,	59.5,	60.3,	59.3,	58.6,		
		8000,	50.2,	50.6,	52.6,	56,		59.3,	60.3,	62.5,	62.8,	61.7,	60.5,		
		9000,	54.2,	54.1,	56.1,	60.1,	61.7,	62.4,	65,		64.6,	64,		62.4,		
		10000,	58.2,	57.7,	60.2,	63,		63.7,	64.8,	66.3,	66.7,	66,		64.4,		
		11000,	61.6,	61.5,	63.5,	64.5,	65.6,	66.8,	68.2,	68.6,	67.8,	65.7,		
		12000,	64.9,	62.7,	64.4,	65.1,	66.6,	68,		69.5,	70.1,	68,		65.8,		
		13000,	67.3,	66.1,	66.7,	67.3,	68.7,	70,		72.1,	71.4,	69.7,	67,		
		14000,	69.1,	68.2,	68.5,	69.4,	71.4,	72.2,	72.8,	72.1,	70.5,	67.6,		
		15000,	71,		69.6,	70.4,	71.7,	73,		74,		74.5,	72.5,	70.7,	68.3,		
	},
		
	RminData2 =
	{
		-146356.31270000,82646.75092000,112340.96900000,-28962.59088000,-17739.69543,
		175.85574650,-101.03009410,-117.70350860,14.54850724,28.56994842,
		-917.60012760,577.13806310,480.14127520,67.50346081,-199.89963320,
		-5530.45020200,3272.64799300,3613.24623900,-373.75098310,-929.87752560,
		-0.02262513,0.01302401,0.01486420,-0.00130473,-0.00393015,
		7.22189171,-4.26769438,-4.48681798,0.21373875,1.31130470,
		275.75821760,-158.36887550,-183.03538710,16.39617352,48.07594727,
		-0.50249733,0.28990827,0.34283930,-0.05251892,-0.07712489,
		1.58148141,-0.88909388,-1.02417602,0.03021565,0.30443487,
		40.22842599,-23.39008641,-26.78275173,3.39371612,6.47928897,
		1.89E-06,-1.08E-06,-1.24E-06,8.67E-08,3.40E-07,-- 0.00000189,-0.00000108,-0.00000124,0.00000009,0.00000034,
		-0.00863639,0.00506976,0.00546466,-0.00033295,-0.00154718,
		-1.28559456,0.68871250,0.85791274,-0.06742341,-0.22725797,
		-0.00001560,0.00000871,0.00001000,0.00000025,-0.00000330,
		0.00003900,-0.00002330,-0.00002690,0.00000454,0.00000585,
		0.00075366,-0.00042950,-0.00050622,0.00005530,0.00012670,
		-0.03012861,0.01825167,0.02044013,-0.00397505,-0.00417777,
		-0.01131633,0.00627514,0.00742931,-0.00034369,-0.00212573,
		-0.74465749,0.42947508,0.49519711,-0.04795907,-0.12807253,
		-0.00640544,0.00367421,0.00419582,-0.00024879,-0.00117769,	
	},
		
	RmaxData2 =
	{
		-2883852.74400000,1660901.69900000,1889373.96700000,-144240.37890000,-516207.7218,
		-183.56060890,104.56497140,124.79531500,-17.92312518,-28.28512215,
		23435.40708000,-13524.00271000,-15408.30948000,1290.91737500,4165.81161100,
		14477.13490000,-7626.93492500,-10564.27691000,1538.71765000,2366.43508600,
		0.05519391,-0.03142290,-0.03698952,0.00399749,0.00922139,
		-61.16475129,35.26502398,40.30086897,-3.47249846,-10.80599263,
		349.84538060,-199.35766380,-226.68977060,16.97311365,60.49216309,
		-0.07207219,0.05609074,0.03490497,0.01786464,-0.02531217,
		-4.37107153,2.43812234,3.00528430,-0.33944842,-0.73560898,
		26.89024523,-18.24989706,-12.31308713,-3.26606389,6.00888896,
		-3.57471E-06,2.02985E-06,2.39645E-06,-2.46304E-07,-6.04721E-07,-- -0.0000035747,0.00000203,0.00000240,-0.0000002463,-0.0000006047,
		0.05000359,-0.02873136,-0.03303127,0.00293394,0.00877467,
		-5.68515341,3.22643863,3.72575828,-0.24674647,-1.03443977,
		0.00001022,-0.00000583,-0.00000687,0.00000034,0.00000198,
		0.00025244,-0.00014403,-0.00016997,0.00001756,0.00004340,
		0.00040488,-0.00024261,-0.00025219,-0.00000233,0.00008568,
		-0.07561615,0.04689312,0.04303065,0.00223037,-0.01501086,
		-0.02253811,0.01274051,0.01484516,-0.00152846,-0.00370505,
		-0.93366279,0.52969018,0.60437106,-0.03896344,-0.16591618,
		0.00565333,-0.00306802,-0.00396902,0.00046385,0.00093852,	
	},
		
	LoftData2 =
	{
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,	
	},
}

declare_weapon(JF39_GBU_24)

declare_loadout({
	category 		= CAT_BOMBS,
	CLSID	 		= 'DIS_TYPE200',
	attribute		= JF39_GBU_24.wsTypeOfWeapon,
	Count 			= 1,
	Cx				= 0.000793,
	Picture			= "gbu24.png",
	displayName		= _("GBU-24A/B Paveway III - 2000lb Laser Guided Bomb"),
	Weight			= 1087,
	Elements  		= {{ShapeName = "gbu-24"}},
	settings		= Get_Combined_GUISettings_Preset("Paveway_III")
})
----------------------------------------------------------------------------------------
-- jf39_gbu_31_v_4b
----------------------------------------------------------------------------------------
jf39_gbu_31_v_4b =
{
	category		= CAT_BOMBS,
	wsTypeOfWeapon	= {wsType_Weapon, wsType_Bomb, wsType_Bomb_Guided, WSTYPE_PLACEHOLDER},
	type			= 6,
	mass			= 970.0,
	hMin			= 400.0,
	hMax			= 15000.0,
	Cx				= 0.00264,
	VyHold			= -100.0,
	Ag				= -1.23,
	
	name			= "jf39_gbu_31_v_4b",
	model			= "GBU31_V_3B_BLU109",
	user_name		= _("GBU-31(V)4/B"),
	scheme			= "bomb_jdam",
	class_name		= "wAmmunitionChangeableTrajectory",
	
	LaunchDistData =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	1030,	1670,	3050,	5060,	8240,	14110,	16270,	22020,	24100,	24130,	
		500,	1150,	1400,	3080,	5210,	9080,	14430,	18980,	22770,	26240,	30620,	
		600,	1260,	1520,	3210,	5260,	8250,	14760,	19290,	21160,	26550,	29800,	
		700,	1370,	1650,	3330,	5390,	8430,	15080,	19620,	23410,	26860,	29800,	
		800,	1450,	1775,	3450,	5575,	8450,	15375,	19925,	23700,	27175,	29800,	
		900,	1575,	2075,	3600,	5675,	8550,	15675,	20225,	24000,	27525,	29825,	
		1000,	1650,	2575,	3750,	5825,	8675,	16000,	20525,	24325,	27875,	29825,	
		2000,	2550,	3550,	5550,	6725,	13375,	18825,	23450,	27350,	29825,	29875,	
		3000,	2700,	2750,	6750,	11250,	16150,	21300,	25950,	26000,	26050,	29900,	
		4000,	4450,	6000,	7250,	12550,	18000,	23450,	27050,	27050,	27100,	31450,	
		5000,	5500,	6900,	9900,	12900,	19600,	25400,	30700,	32800,	32800,	32900,	
		6000,	5250,	8000,	9000,	12500,	20500,	26750,	32500,	36500,	36750,	36500,	
		7000,	7750,	9250,	9250,	12750,	21750,	28000,	34250,	36500,	36750,	36750,	
		8000,	8750,	10250,	12000,	13500,	22500,	29000,	32500,	32750,	32750,	38750,	
		9000,	10250,	11750,	13250,	17000,	23000,	29750,	33750,	33750,	34000,	40750,	
		10000,	11500,	13250,	14750,	17250,	23500,	30250,	35250,	35250,	35250,	42000,	
		11000,	13000,	14500,	16000,	18000,	23500,	30500,	38000,	43000,	43000,	43500,	
		12000,	14500,	16000,	17500,	19000,	23500,	30500,	38000,	46000,	54500,	63000,	
		13000,	15500,	17500,	19000,	21000,	23500,	30500,	38000,	46500,	55500,	64500,	
		14000,	17000,	19000,	21000,	22500,	24500,	30000,	38000,	46500,	56000,	65500,	
		15000,	18500,	21000,	23000,	24000,	26000,	30000,	37500,	46500,	56500,	66000,	
	},

	MinLaunchDistData =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	730,	990,	1250,	1530,	1850,	2530,	3070,	3800,	4280,	4670,	
		500,	790,	1040,	1340,	1630,	2000,	2570,	3210,	3790,	4340,	16850,	
		600,	830,	1100,	1410,	1700,	2020,	2650,	3280,	3750,	4410,	4940,	
		700,	1020,	1160,	1470,	1780,	2100,	2730,	3360,	3970,	4530,	5050,	
		800,	1100,	1200,	1525,	1850,	2175,	2800,	3450,	4075,	4650,	5175,	
		900,	1250,	1300,	1575,	1900,	2225,	2875,	3525,	4175,	4775,	5300,	
		1000,	1300,	1325,	1625,	1950,	2275,	2975,	3600,	4250,	4875,	5400,	
		2000,	1825,	1450,	3100,	2175,	2825,	3375,	4025,	4825,	5625,	6225,	
		3000,	1100,	1650,	2050,	2400,	2950,	3450,	4150,	4650,	5450,	6650,	
		4000,	2350,	4200,	2200,	2750,	2800,	3900,	4400,	4450,	5250,	6700,	
		5000,	2300,	4600,	2700,	2900,	3600,	4100,	4700,	5400,	5200,	6400,	
		6000,	2000,	4500,	2750,	3000,	3750,	4500,	5000,	5750,	6500,	6250,	
		7000,	2000,	3750,	2750,	3000,	3750,	4500,	5250,	6000,	6750,	7750,	
		8000,	2000,	3250,	3000,	3250,	4000,	4500,	5250,	5750,	7000,	8500,	
		9000,	2000,	3250,	3250,	3500,	4000,	4750,	5250,	6000,	7250,	9000,	
		10000,	1750,	3250,	3500,	3500,	4250,	4750,	5500,	6250,	7750,	9500,	
		11000,	1500,	3000,	3000,	3500,	4000,	4500,	5500,	7000,	8500,	10500,	
		12000,	1000,	2500,	3000,	3500,	4000,	4500,	6000,	7500,	10000,	12500,	
		13000,	1000,	2500,	3500,	3500,	4000,	4500,	6000,	8000,	11000,	13500,	
		14000,	1500,	2500,	3500,	3500,	4000,	5000,	6000,	8500,	11500,	14500,	
		15000,	1500,	2000,	3000,	3500,	4000,	5000,	6000,	9000,	13000,	15500,	
	},

	AspectDistData =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	7,		4,		14,		18,		23,		28,		36,		28,		21,		9,		
		500,	8,		11,		13,		17,		21,		28,		23,		15,		33,		37,		
		600,	10,		13,		12,		18,		23,		29,		34,		41,		37,		23,		
		700,	7,		14,		11,		18,		23,		30,		35,		34,		44,		45,		
		800,	8,		16,		12,		18,		23,		30,		35,		40,		44,		44,		
		900,	4,		7,		10,		17,		29,		30,		35,		41,		44,		43,		
		1000,	5,		7,		13,		26,		23,		30,		35,		40,		45,		42,		
		2000,	8,		25,		25,		30,		30,		35,		39,		43,		45,		45,		
		3000,	23,		42,		35,		35,		35,		38,		42,		45,		45,		45,		
		4000,	22,		8,		45,		39,		39,		41,		45,		45,		45,		45,		
		5000,	30,		17,		8,		45,		41,		43,		45,		45,		45,		45,		
		6000,	44,		24,		8,		45,		44,		45,		45,		45,		45,		45,		
		7000,	44,		32,		17,		45,		45,		45,		45,		45,		45,		45,		
		8000,	45,		41,		23,		45,		45,		45,		45,		45,		45,		45,		
		9000,	45,		45,		29,		45,		45,		45,		45,		45,		45,		38,		
		10000,	45,		45,		34,		45,		45,		45,		45,		45,		45,		39,		
		11000,	45,		45,		42,		45,		45,		45,		45,		45,		45,		39,		
		12000,	45,		45,		44,		45,		45,		45,		45,		45,		45,		45,		
		13000,	45,		45,		45,		45,		45,		28,		45,		45,		45,		13,		
		14000,	45,		45,		45,		45,		45,		45,		31,		45,		45,		6,		
		15000,	45,		45,		45,		45,		45,		45,		21,		45,		14,		7,		
	},
	
	MaxTOF =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	11.7,	13.4,	23,		23.9,	32.4,	51.5,	51,		68,		69,		62,		
		500,	13.2,	10.3,	18.1,	27.4,	50.1,	59.1,	63.4,	71.1,	78.2,	89.6,	
		600,	14.7,	11.3,	19.2,	26.7,	36.4,	59.1,	64.1,	75.8,	79.1,	84.4,	
		700,	16,		12.3,	20.4,	28.4,	38.2,	60.3,	65.5,	73.3,	79.9,	83.7,	
		800,	17.2,	13.4,	21.7,	28.7,	39.2,	60.6,	66.5,	74.1,	80.9,	83,		
		900,	18.6,	16.9,	22.8,	29.1,	36.5,	61.8,	67.4,	75,		82,		82.5,	
		1000,	19.7,	24.7,	24.2,	36.1,	39.4,	62.4,	68.4,	76,		82.9,	117.6,	
		2000,	30.2,	33.2,	42.7,	34.8,	63.2,	70.3,	80.5,	91.1,	105,	77.2,	
		3000,	33.4,	28.3,	38.9,	59.7,	70,		78.1,	87.9,	88.7,	80,		83.8,	
		4000,	49.3,	54.7,	55.9,	60,		75.1,	83.9,	90.1,	91.5,	81.8,	84.7,	
		5000,	58.6,	59.4,	73,		63.1,	79.8,	90.8,	101.9,	106.2,	140.7,	83.2,	
		6000,	49.4,	65.4,	75.4,	58.4,	85.6,	94.9,	106.3,	117.7,	149,	96.8,	
		7000,	66,		72.2,	72.6,	50.6,	93.1,	97.9,	110.9,	116.2,	98.2,	90.6,	
		8000,	68.5,	74,		76,		52.4,	106.3,	101.4,	106.1,	90.7,	84,		94.5,	
		9000,	79.3,	79.5,	84,		75.7,	123.9,	103.8,	108.1,	112.9,	88.2,	100.7,	
		10000,	88.4,	85.7,	90.6,	77.2,	89,		103.6,	110.7,	112.2,	91.4,	97.6,	
		11000,	87,		89.1,	93.3,	87.7,	87.8,	102.7,	122.5,	129.6,	126.4,	102.2,	
		12000,	93,		94.2,	97.5,	99,		87.8,	102,	121.1,	135.4,	152.9,	161.1,	
		13000,	94.8,	98.9,	101.2,	108.1,	88.8,	102.2,	117.9,	133.9,	147.4,	165.3,	
		14000,	100.1,	103.3,	108.5,	111.1,	104.4,	99.1,	115.9,	131.7,	146.4,	167.1,	
		15000,	105.2,	111,	115.2,	113.4,	117.1,	100.6,	112.8,	131.3,	151.7,	167.7,	
	},

	MinTOF =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	8.5,	7.8,	7.2,	6.7,	6.6,	7.4,	7.9,	8.8,	9,		9,		
		500,	9.5,	8.7,	8.1,	7.4,	7.2,	7.7,	8.3,	8.8,	9.2,	38.6,	
		600,	10.4,	9.5,	8.7,	8.1,	7.6,	8,		8.6,	8.8,	9.4,	9.5,	
		700,	12.1,	10.4,	9.4,	8.8,	8.1,	8.4,	8.9,	9.4,	9.7,	9.8,	
		800,	13.4,	11.2,	10.1,	9.4,	8.7,	8.8,	9.2,	9.7,	10,		10.1,	
		900,	16.2,	11.8,	10.8,	10.2,	9.2,	9.2,	9.6,	10,		10.3,	10.4,	
		1000,	17.2,	12.5,	11.5,	10.6,	9.7,	9.6,	9.9,	10.3,	10.6,	10.6,	
		2000,	26.3,	19.4,	19,		16.1,	14.7,	13.4,	12.9,	13,		13.2,	13.1,	
		3000,	29.3,	25.3,	22.4,	20.6,	18.8,	17.2,	16.1,	15.3,	14.9,	15.2,	
		4000,	39.1,	44.2,	27.2,	24.4,	23.1,	20.8,	19.5,	18.5,	17.5,	17.2,	
		5000,	41.7,	49.4,	30.8,	28.1,	25.8,	24,		22.6,	21.4,	20.6,	19.4,	
		6000,	45,		53.4,	35.4,	32.5,	29.2,	27.1,	25.6,	24.3,	23.2,	22.5,	
		7000,	48.1,	54.3,	40.7,	37.1,	32.9,	30.3,	28.4,	27.1,	25.9,	24.9,	
		8000,	50.8,	55.7,	44.6,	40.5,	35.7,	33.5,	31.5,	30.3,	28.7,	27.4,	
		9000,	50.7,	57.6,	48.7,	41.8,	39.7,	36.2,	34.6,	33.3,	31.6,	30,		
		10000,	53.9,	55.5,	47.4,	45.4,	41.5,	39.3,	37.5,	36.2,	34.3,	32.6,	
		11000,	57.2,	58.3,	50.9,	49.1,	47.1,	43,		40.6,	38.5,	36.7,	35,		
		12000,	65.6,	61.4,	54.6,	54.9,	50.9,	46.2,	43.1,	41.2,	38.8,	37.4,	
		13000,	63.8,	64.6,	58.9,	56.5,	54.1,	51.3,	46.5,	43.9,	41.1,	39.8,	
		14000,	62.3,	69.4,	62.1,	61.9,	54.6,	51.8,	50,		46.6,	43.7,	42.2,	
		15000,	65.7,	70.7,	65.4,	65.3,	62,		58.8,	56,		49.6,	45.8,	44.6,	
	},

	MidTOF =
	{
		21,		10,

				100,	150,	200,	250,	300,	350,	400,	450,	500,	550,		
		400,	9.8,	10.5,	11.1,	13.7,	17.9,	26.3,	27.1,	34.1,	34.5,	32.1,	
		500,	11,		9.1,	11.1,	14.1,	20.1,	26.8,	31.8,	35.2,	37.9,	60.4,	
		600,	12.3,	10,		11.9,	14.3,	17.7,	27.3,	32.3,	32.3,	38.1,	40,		
		700,	14.9,	10.8,	12.4,	14.8,	18.3,	28.3,	32.8,	36.1,	38.5,	40,		
		800,	15.7,	11.5,	12.9,	15.3,	18.4,	28.8,	33.3,	36.6,	39,		40,		
		900,	17.2,	12.8,	13.7,	15.8,	18.6,	29.9,	33.8,	37.1,	39.6,	40,		
		1000,	18.1,	14.8,	14.5,	16.2,	19.1,	30.2,	34.3,	37.6,	40.6,	40,		
		2000,	27.4,	20.6,	27.2,	19.4,	30.6,	36.6,	40.9,	43.3,	43.1,	39.9,	
		3000,	33.1,	25.3,	26.4,	32.1,	37.9,	42.6,	44.8,	39.3,	36.7,	39.6,	
		4000,	38.8,	48.9,	29.1,	37.4,	41,		47.3,	46.9,	39.8,	37.3,	40.9,	
		5000,	43,		53.1,	48,		39.1,	47.9,	52.1,	52.4,	49.6,	44.2,	41.3,	
		6000,	45.9,	54.7,	48.8,	39.2,	50.6,	53.1,	55.7,	54.8,	50.8,	44.7,	
		7000,	49.8,	56.8,	60.5,	41,		54.7,	53.8,	58.4,	54.4,	50.1,	46.1,	
		8000,	58.9,	59.9,	60,		43.8,	53,		55,		53,		48.2,	45,		48.5,	
		9000,	63.8,	68,		66.5,	62.7,	52.9,	56.4,	54.2,	49.6,	46.7,	50.6,	
		10000,	66.5,	71.2,	73.2,	58.6,	56,		57.7,	57.4,	51.5,	48,		51.9,	
		11000,	65.9,	73.3,	74.2,	62.3,	54.9,	56.1,	62.1,	61.9,	56.4,	53.8,	
		12000,	71.6,	73.2,	77,		76.6,	54.8,	56.7,	61.5,	65.9,	73.1,	77.2,	
		13000,	73.4,	78,		79.7,	79.5,	55.7,	56.7,	60.7,	66.8,	73.3,	79.8,	
		14000,	78.3,	79.3,	81.1,	80.4,	57.9,	57.5,	59.8,	65.7,	72.9,	79.9,	
		15000,	82,		81.9,	83.1,	81.2,	61.5,	58.1,	59.7,	66.5,	75.5,	81.5,	
	},
	
	warhead	= predefined_warhead("BLU_109"),
	
	fm =
    {
		mass			= 970.0,
		caliber			= 0.368,
		cx_coeff		= {1, 0.45, 0.8, 0.15, 1.55},
		L				= 0.368,
		I				= 592.5,
		I_x				= 32.5,
		wind_time		= 0.0,
		wind_sigma		= 0.0,
		dCydA			= {0.066, 0.036},
		A				= 0.6,
		maxAoa			= math.rad(25),
		finsTau			= 0.1,
		fins_gain		= 100,
		ideal_fins 		= 1,
		Sw				= 0.1*5,
		Ma				= 6.3,
		Mw				= 3.0,
		Ma_x			= 1.5,
		Mw_x			= 6.5,
		model_roll 		= math.rad(-45),
    },
	
	seeker = {
		CEP 					= 5.0,
		coalition				= 2,
		coalition_rnd_coeff		= 5.0,
	},
	
	autopilot = {
		delay				= 1.0,
		op_time				= 9000,
		Tf					= 0.05,
		Knav				= 3.0,
		Kd					= 890.0,
		Ka					= 12.0,
		Tc					= 0.1,
		Kx					= 0.4,
		Krx					= 4.0,
		gload_limit			= 3.0,
		fins_limit			= math.rad(35),
		fins_limit_x		= math.rad(5),
		null_roll			= math.rad(-45),
		KD0					= 0.1 / 970,
		KDI					= 0.6 * 970 / 0.5,
		KLM					= 1.3 * 0.1 * 5 / 970,
	},
	
	shape_table_data =
	{
		{
			name		= "jf39_gbu_31_v_4b",
			file		= "GBU31_V_3B_BLU109",
			life		= 1,
			fire		= {0, 1},
			username	= _("GBU-31(V)4/B"),
			index		= WSTYPE_PLACEHOLDER,
		},
	},
	
	targeting_data = 
	{
		char_time		= 20.5,
	}
}

declare_weapon(jf39_gbu_31_v_4b)

declare_loadout({
	category 		= CAT_BOMBS,
	CLSID	 		= "DIS_LS_6_100",
	attribute		= jf39_gbu_31_v_4b.wsTypeOfWeapon,
	Count 			= 1,
	Cx_pil			= jf39_gbu_31_v_4b.Cx,
	Picture			= "GBU-31V3B.png",
	displayName		= _("GBU-31(V)4/B - JDAM, 2000lb GPS Guided Penetrator Bomb"),
	Weight			= jf39_gbu_31_v_4b.mass,
	Elements  		= {{ShapeName = "GBU31_V_3B_BLU109"}},
})
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.0.1                       --
----------------------------------------------------------------------------------------