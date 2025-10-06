dofile(LockOn_Options.common_script_path .. "elements_defs.lua")
dofile(LockOn_Options.script_path .. "materials.lua")

SetScale(FOV)

IndTexture_Path = IND_TEX_PATH

CLOCK_DEFAULT_LEVEL = 12

CLOCK_LCD_FONT      = "clock_font_def"
CLOCK_FONT_SCALE    = 1
CLOCK_FONT_SIZE     = 0.0064 * 1.0 --* 144 / 64

CLOCK_FONT_W = CLOCK_FONT_SIZE
CLOCK_FONT_H = CLOCK_FONT_W * CLOCK_FONT_SCALE

-- 同比例字体 :1         {高,          宽,            字间,             行间, 水平偏,  垂直偏}
CLOCK_STRINGDEFS_DEF = {CLOCK_FONT_H, CLOCK_FONT_W, CLOCK_FONT_W*0.10,  0, CLOCK_FONT_H*0.1, -CLOCK_FONT_H*0.1 }

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
    if (object.level == nil) or (object.level < CLOCK_DEFAULT_LEVEL) then
        object.level          = CLOCK_DEFAULT_LEVEL
    end
    object.collimated         = false
    object.use_mipfilter      = true
    object.additive_alpha     = true
    --cur_poly.z_emable         = true
    Add(object)
end

function AddStringObject(object)
    object.stringdefs = CLOCK_STRINGDEFS_DEF
    AddElementObject(object)
end
