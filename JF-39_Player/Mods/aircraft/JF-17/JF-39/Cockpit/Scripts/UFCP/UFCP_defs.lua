dofile(LockOn_Options.common_script_path .. "elements_defs.lua")
dofile(LockOn_Options.script_path .. "materials.lua")

SetScale(FOV)

UFCP_DEFAULT_LEVEL  = 12

IndTexture_Path     = IND_TEX_PATH

UFCP_COLOR_DEF      = materials["UFCP_IND_DEF"]
UFCP_COLOR_CURSOR   = materials["UFCP_IND_CURSOR"]
UFCP_COLOR_PAGEBASE = materials["UFCP_IND_PAGEBASE"]


UFCP_MATERIAL_DEF      = "ufcd_mesh_def"
UFCP_MATERIAL_CURSOR   = "ufcd_mesh_cursor"
UFCP_MATERIAL_PAGEBASE = "ufcd_mesh_pagebase"


--[[
local font_desc = fontdescription["font_UFCP"]
UFCP_LCD_FONT   = MakeFont(font_desc, UFCP_COLOR_DEF, "UFCP_LCD_FONT")
]]

UFCP_LCD_FONT   = "ufcp_font_def"

UFCP_FONT_SCALE = 1

UFCP_FONT_SIZE = 0.0064 * 1.1 --* 144 / 64

UFCP_FONT_W = UFCP_FONT_SIZE
UFCP_FONT_H = UFCP_FONT_W * UFCP_FONT_SCALE

-- 同比例字体 :1      {高,          宽, 字间, 行间, 水平偏,  垂直偏}
UFCP_STRINGDEFS_DEF = {UFCP_FONT_H, UFCP_FONT_W, UFCP_FONT_W*0.17, 0}

H2W_SCALE = GetAspect()
CX = 0
CY = 0

DEF_BOX_INDICES = { 0,1,2, 0,2,3 }

function AddElementObject(object)
    if object.name == nil or string.len(object.name) < 1 then
        object.name                = create_guid_string()
    end
    if object.h_clip_relation == nil then
        object.h_clip_relation  = h_clip_relations.COMPARE
    end
    if (object.level == nil) or (object.level < UFCP_DEFAULT_LEVEL) then
        object.level          = UFCP_DEFAULT_LEVEL
    end
    object.collimated         = false
    object.use_mipfilter      = true
    object.additive_alpha     = true
    --cur_poly.z_emable         = true
    Add(object)
end

function AddStringObject(object)
    object.stringdefs = UFCP_STRINGDEFS_DEF
    AddElementObject(object)
end
