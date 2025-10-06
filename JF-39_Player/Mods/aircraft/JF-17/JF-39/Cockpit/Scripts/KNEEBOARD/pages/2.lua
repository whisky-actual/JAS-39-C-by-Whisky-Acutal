dofile(LockOn_Options.script_path .. "KNEEBOARD/kneeboard_defs.lua")

KBDBase          = CreateElement "ceSimple"
KBDBase.name     = "KBDBase"
KBDBase.init_pos = {0, 0}
AddElement(KBDBase)

local DIST_Y = 0.15

-- Page for OESP
local LINE_1_Y = KBD_TITLE_Y - 2 * DIST_Y
local LINE_2_Y = LINE_1_Y - DIST_Y

local LINE_3_Y = LINE_2_Y - 2 * DIST_Y
local LINE_4_Y = LINE_3_Y - DIST_Y
local LINE_5_Y = LINE_4_Y - DIST_Y
local LINE_6_Y = LINE_5_Y - DIST_Y
local LINE_7_Y = LINE_6_Y - DIST_Y
local LINE_8_Y = LINE_7_Y - DIST_Y
local LINE_9_Y = LINE_8_Y - DIST_Y

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
        init_pos = {KBD_TITLE_X, KBD_TITLE_Y}, value = "OESP PROGRAMMS", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF_X15,
    },

    -- Bingo
    {
        init_pos = {LINE_X_1, LINE_1_Y}, value = "CHAFF BINGO", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_4, LINE_1_Y}, value = "0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_ch_bingo"},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_2_Y}, value = "FLARE BINGO", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_4, LINE_2_Y}, value = "0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_fl_bingo"},}, mat = KBD_FONT_D,
    },
    
    -- Prog Table
    {
        init_pos = {LINE_X_1, (LINE_3_Y+LINE_4_Y)/2}, value = "TYPE", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF_X12,
    },
    {
        init_pos = {LINE_X_4, LINE_3_Y}, value = "CHAFF", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_3, LINE_4_Y}, value = "REPT", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_4, LINE_4_Y}, value = "INTV", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_5, LINE_4_Y}, value = "NUM", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_8, LINE_3_Y}, value = "FLARE", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_7, LINE_4_Y}, value = "REPT", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_8, LINE_4_Y}, value = "INTV", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    {
        init_pos = {LINE_X_9, LINE_4_Y}, value = "NUM", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF,
    },
    
    -- Prog List
    {
        init_pos = {LINE_X_1, LINE_5_Y}, value = "FL+CH     0    0    0          0    0    0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_prog_list", 0},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_6_Y}, value = "FL+CH     0    0    0          0    0    0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_prog_list", 1},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_7_Y}, value = "FL+CH     0    0    0          0    0    0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_prog_list", 2},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_8_Y}, value = "FL+CH     0    0    0          0    0    0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_prog_list", 3},}, mat = KBD_FONT_D,
    },
    {
        init_pos = {LINE_X_1, LINE_9_Y}, value = "FL+CH     0    0    0          0    0    0", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF,
        ctrls = {{"kbd_oesp_prog_list", 4},}, mat = KBD_FONT_D,
    },
    
    
}

AddStrTblElements(text_str, KBDBase.name)

