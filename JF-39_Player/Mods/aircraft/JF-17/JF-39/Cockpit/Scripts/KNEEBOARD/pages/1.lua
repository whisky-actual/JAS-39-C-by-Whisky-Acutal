dofile(LockOn_Options.script_path .. "KNEEBOARD/kneeboard_defs.lua")

KBDBase          = CreateElement "ceSimple"
KBDBase.name     = "KBDBase"
KBDBase.init_pos = {0, 0}
AddElement(KBDBase)


local DIST_Y  = 0.15
local DIST_Y1 = 0.12
local DIST_Y2 = 0.20
local BIAS_Y  = 0.01

-- Page for OESP
local LINE_1_Y  = KBD_TITLE_Y - DIST_Y
local LINE_2_Y  = LINE_1_Y - DIST_Y
local LINE_3_Y  = LINE_2_Y - DIST_Y
local LINE_4_Y  = LINE_3_Y - DIST_Y

local LINE_5_Y  = LINE_4_Y - DIST_Y1

local LINE_6_Y  = LINE_5_Y  - DIST_Y2
local LINE_7_Y  = LINE_6_Y  - DIST_Y2 - BIAS_Y
local LINE_8_Y  = LINE_7_Y  - DIST_Y2 - BIAS_Y
local LINE_9_Y  = LINE_8_Y  - DIST_Y2 - BIAS_Y
local LINE_10_Y = LINE_9_Y  - DIST_Y2 - BIAS_Y
local LINE_11_Y = LINE_10_Y - DIST_Y2 - BIAS_Y
local LINE_12_Y = LINE_11_Y - DIST_Y2 - BIAS_Y
local LINE_13_Y = LINE_12_Y - DIST_Y2 - BIAS_Y
local LINE_14_Y = LINE_13_Y - DIST_Y2 - BIAS_Y
local LINE_15_Y = LINE_14_Y - DIST_Y2 - BIAS_Y

local LINE_X_1 = -0.8
local LINE_X_2 = -0.6
local LINE_X_3 = -0.4
local LINE_X_4 = -0.2
local LINE_X_5 = 0.0
local LINE_X_6 = 0.2
local LINE_X_7 = 0.4
local LINE_X_8 = 0.6
local LINE_X_9 = 0.8


local text_str = {
    -- Title
    {
        init_pos = {KBD_TITLE_X, KBD_TITLE_Y}, value = "NAV AND APPROACH", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF_X15,
    },
    
    -- Sub Title
    {
        init_pos = {LINE_X_1, LINE_1_Y}, value = "FOR INS ALIGNMENT:", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF_X10,
    },
    
    {
        init_pos = {LINE_X_2, LINE_2_Y}, value = "LAT", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {(LINE_X_4+LINE_X_5)/2, LINE_2_Y}, value = "LONG", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_7, LINE_2_Y}, value = "ALT", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_9, LINE_2_Y}, value = "HDG", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_2, LINE_3_Y}, value = "XXX.XX.XXX", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_ins_coord", 0},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {(LINE_X_4+LINE_X_5)/2, LINE_3_Y}, value = "XX.XX.XXX", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_ins_coord", 1},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_7, LINE_3_Y}, value = "XXXXX", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_ins_coord", 2},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_9, LINE_3_Y}, value = "XXX", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_ins_coord", 3},}, mat = KBD_FONT_D,
    },
    
    -- APR Channels
    {
        init_pos = {LINE_X_1, LINE_5_Y}, value = "AIRFIELD INFO:", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF_X10,
    },
    --{
    --    init_pos = {LINE_X_1, LINE_6_Y}, value = "ID:   AF NAME      RWY     ILS", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
    --},
    {
        init_pos = {LINE_X_1, LINE_6_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 0},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_7_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 1},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_8_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 2},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_9_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 3},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_10_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 4},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_11_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 5},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_12_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 6},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_13_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 7},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_14_Y}, value = "ID:  NAME", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_apr_names", 8},}, mat = KBD_FONT_D,
    },
    
}


AddStrTblElements(text_str, KBDBase.name)