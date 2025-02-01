-- 公用基础页面
dofile(LockOn_Options.script_path .. "MFCD/MFCDs_defs.lua")

local page_root = create_page_root()

local aspect = GetAspect()

local MFCD_base             = CreateElement "ceMeshPoly" -- untextured shape
MFCD_base.name              = create_guid_string()
MFCD_base.primitivetype     = "triangles"
MFCD_base.material          = MFCD_MATERIAL_DARK
--MFCD_base.material          = MakeMaterial(nil,{0, 0, 0, 255})--TEST
--MFCD_base.material          = MakeMaterial(nil,{210, 200, 120, 50})--TAN
MFCD_base.h_clip_relation   = h_clip_relations.REWRITE_LEVEL
MFCD_base.level             = PAGE_LEVEL_BASE -1
MFCD_base.collimated        = false
MFCD_base.isdraw            = true
MFCD_base.isvisible         = true
MFCD_base.vertices          = { {-1.0 , 1.4 }, { 1.0,1.4}, { 1.0,-1.4}, {-1.0,-1.4}, } --New Coordinates
MFCD_base.indices           = {0,1,2,0,2,3 }
MFCD_base.element_params 	= {"JF39_MFCD"}
MFCD_base.controllers    	= {{"opacity_using_parameter", "check_power",0}}


Add(MFCD_base)

-- TODO: add controller
split_white_line                 = CreateElement "ceMeshPoly"
split_white_line.name            = "split_white_line"
split_white_line.material        = MFCD_MATERIAL_WHITE_Y
split_white_line.primitivetype   = "triangles"
split_white_line.vertices        = {{ 1.0,  0.006},
                                    { 1.0, -0.006},
                                    {-1.0, -0.006},
                                    {-1.0,  0.006},}
split_white_line.indices         = DEF_BOX_INDICES
split_white_line.init_pos        = {0, -0.4, 0}
--split_white_line.h_clip_relation = h_clip_relations.COMPARE
split_white_line.level           = PAGE_LEVEL_BASE
split_white_line.isdraw          = true
split_white_line.isvisible       = true
split_white_line.use_mipfilter   = true
split_white_line.additive_alpha  = true
split_white_line.collimated      = false
split_white_line.parent_element  = page_root.name
--split_white_line.controllers     = {{"apply_contrast"}}
Add(split_white_line)
split_white_line = nil


-- OSB
local osb_txt = {
    {
        value="D2",  init_pos={MFCD_FONT_UD2_X, MFCD_FONT_D_Y}, alignment="CenterCenter",
        controller = {{"check_display"},{"DOWN_osb_d2_txt"}, --[[{"apply_contrast"}]]}, level = PAGE_LEVEL_DATA,
    },
    {
        value="SOI", init_pos={MFCD_FONT_UD3_X, MFCD_FONT_D_Y}, alignment="CenterCenter",
        controller = {{"check_display"},{"BASE_isSOI"}, --[[{"apply_contrast"}]]}, level = PAGE_LEVEL_DATA,
    }, --I'm SOI indicator
    {
        value="D4",  init_pos={MFCD_FONT_UD4_X, MFCD_FONT_D_Y}, alignment="CenterCenter",
        controller = {{"check_display"},{"DOWN_osb_d4_txt"}, --[[{"apply_contrast"}]]}, level = PAGE_LEVEL_DATA,
    },
}

local text_strpoly
for i=1, #(osb_txt) do
    text_strpoly                 = CreateElement "ceStringPoly"
    text_strpoly.material        = MFCD_FONT_DEF
    text_strpoly.stringdefs      = MFCD_STRINGDEFS_DEF_X08
    text_strpoly.init_pos        = osb_txt[i].init_pos
    text_strpoly.alignment       = osb_txt[i].alignment
    text_strpoly.controllers     = osb_txt[i].controller
    --text_strpoly.parent_element  = page_root.name
    if osb_txt[i].level then
        text_strpoly.level       = osb_txt[i].level
    end
    text_strpoly.isdraw          = true
    text_strpoly.isvisible       = true
    text_strpoly.h_clip_relation = h_clip_relations.REWRITE_LEVEL
    AddElementObject(text_strpoly)
    text_strpoly = nil
end


----------------------------------------------------------------------------------------
-- JF-39
----------------------------------------------------------------------------------------
--[[
local DMAP_FILTER1              = CreateElement "ceMeshPoly"
DMAP_FILTER1.name               = "DMAP_FILTER1"
DMAP_FILTER1.material           = MFCD_MATERIAL_BLACK1--Sets filter MFCD_IND_BLACK1
DMAP_FILTER1.primitivetype      = "triangles"
DMAP_FILTER1.init_pos           = {0, FWD_COMP_BIAS, 0}
DMAP_FILTER1.vertices           = {{-1,  1.2}, { 1,  1.2}, { 1, -1.5}, {-1, -1.5}}
DMAP_FILTER1.indices            = DEF_BOX_INDICES --{0,1,2,0,2,3 }
--DMAP_FILTER1.h_clip_relation  = h_clip_relations.REWRITE_LEVEL
DMAP_FILTER1.level              = HSD_NAV_LEVEL + 1
DMAP_FILTER1.isdraw             = true
DMAP_FILTER1.isvisible          = true
DMAP_FILTER1.use_mipfilter      = false
DMAP_FILTER1.controllers        = {{"check_map_filter", 0},}
DMAP_FILTER1.collimated         = false
DMAP_FILTER1.additive_alpha     = true
AddToUpper(DMAP_FILTER1)
]]
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------