dofile(LockOn_Options.common_script_path.."elements_defs.lua")

DEBUG_WIN_DEF_LEVEL = 20

SetScale(FOV)

-- font define
local SYMBOL_PIXELS_X = 88 -- pi
local SYMBOL_PIXELS_Y = 128

INDTEXTURE_PATH = LockOn_Options.script_path.."../Textures/IndicationTextures/"
local font_desc = {
    texture     = INDTEXTURE_PATH.."font_HUD.dds",
    size        = {10, 10},
    resolution  = {1280, 1280},
    default     = {SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y},
    chars        = {
        {32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- [space]
        {48, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 0
        {49, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 1
        {50, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 2
        {51, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 3
        {52, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 4
        {53, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 5
        {54, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 6
        {55, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 7
        {56, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 8
        {57, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- 9

        {64, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Alpha -> @

        -- bold
        {65, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- A bold
        {66, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- B bold
        {67, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- C bold
        {68, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- D bold
        {69, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- E bold
        {70, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- F bold
        {71, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- G bold
        {72, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- H bold
        {73, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- I bold
        {74, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- J bold
        {75, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- K bold
        {76, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- L bold
        {77, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- M bold
        {78, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- N bold
        {79, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- O bold
        {80, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- P bold
        {81, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Q bold
        {82, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- R bold
        {83, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- S bold
        {84, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- T bold
        {85, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- U bold
        {86, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- V bold
        {87, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- W bold
        {88, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- X bold
        {89, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Y bold
        {90, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Z bold
        
        -- normal replaced by lower case
        --[[
        {65+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- A -> a
        {66+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- B
        {67+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- C
        {68+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- D
        {69+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- E
        {70+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- F
        {71+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- G
        {72+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- H
        {73+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- I
        {74+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- J
        {75+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- K
        {76+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- L
        {77+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- M
        {78+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- N
        {79+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- O
        {80+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- P
        {81+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Q
        {82+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- R
        {83+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- S
        {84+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- T
        {85+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- U
        {86+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- V
        {87+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- W
        {88+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- X
        {89+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Y
        {90+32, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- Z -> z
        ]]
         
        {42, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- *
        {43, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- +
        {45, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- -
        {61, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- =
        {47, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- /
        {92, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- \
        {40, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- (
        {41, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- )
        {91, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- [
        {93, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- ]
        {123, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- {
        {125, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- }
        {60, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- <
        {62, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- >
        {63, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- ?
        {124, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- |
        {33, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- !
        {35, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- #
        {37, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- %
        {94, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- ^
        {38, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- &
        --{248, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- o
        {96, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- o -- degree, change its ascii code to 96 ', original 248 (out of index)
        {46, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- .
        {58, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- :        
        {44, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- ,
        {95, SYMBOL_PIXELS_X, SYMBOL_PIXELS_Y}, -- _
    }
}

-- 默认 MeshPoly 顶点集
DEF_BOX_INDICES = { 0,1,2, 0,2,3 }

---- 材质颜色
IND_MATERIAL_R = {255,0,0,255} -- red
IND_MATERIAL_W = {255,255,255,255} -- white
IND_MATERIAL   = {0,255,0,255} -- green

---- 字体定义
FONT_SCALE = SYMBOL_PIXELS_Y/SYMBOL_PIXELS_X
FONT_SIZE = 0.005

FONT_W = FONT_SIZE
FONT_H = FONT_W * FONT_SCALE

-- 字体高宽 1:1        {    高,      宽,  字间,  行间,  水平偏,  垂直偏}
MFCD_STRINGDEFS_ORIG = {FONT_W, FONT_W,    0,     0,      0,     0}

MFCD_STRINGDEFS_DEF  = {0.80 * FONT_W, 0.80 * FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X08  = MFCD_STRINGDEFS_DEF

---- 字符串 字号及间距
MFCD_STRINGDEFS_DEF_X05  = {0.50 * FONT_W, 0.50*FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X06  = {0.60 * FONT_W, 0.60*FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X07  = {0.70 * FONT_W, 0.70*FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X075 = {0.75 * FONT_W, 0.75*FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X15  = {1.50 * FONT_W, 1.50*FONT_W, 0, 0}
MFCD_STRINGDEFS_DEF_X2   = {2.00 * FONT_W, 2.00*FONT_W, 0, 0}

---- 字体和颜色
IND_FONT      = MakeFont(font_desc,IND_MATERIAL,  "IND_FONT")
IND_FONT_R    = MakeFont(font_desc,IND_MATERIAL_R,"IND_FONT_R")
IND_FONT_G    = MakeFont(font_desc,IND_MATERIAL_G,"IND_FONT_G")
IND_FONT_B    = MakeFont(font_desc,IND_MATERIAL_B,"IND_FONT_B")
IND_FONT_W    = MakeFont(font_desc,IND_MATERIAL_W,"IND_FONT_W")

function AddElementObject(object)
    if (object.name == nil) or (string.len(object.name) < 1) then
        object.name            = create_guid_string()
    end
    if (type(object.stringdefs) ~= "table") or (next(object.stringdefs) == nil) then
        object.stringdefs      = MFCD_STRINGDEFS_DEF
    end
    if (object.h_clip_relation == nil) then
        object.h_clip_relation = h_clip_relations.COMPARE
    end
    
    if (object.level == nil) or (object.level < DEBUG_WIN_DEF_LEVEL) then
        object.level        = DEBUG_WIN_DEF_LEVEL
    end
    object.use_mipfilter    = true
    object.additive_alpha   = true
    object.collimated       = false
    Add(object)
end

