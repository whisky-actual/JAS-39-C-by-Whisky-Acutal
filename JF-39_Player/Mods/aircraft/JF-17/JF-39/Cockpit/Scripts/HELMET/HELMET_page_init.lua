dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path .. "materials.lua")
dofile(LockOn_Options.script_path .. "HELMET/Indicator/HELMET_defs.lua")

indicator_type  = indicator_types.HELMET
purposes        = {render_purpose.GENERAL, render_purpose.HUD_ONLY_VIEW}

-------PAGE IDs-------
HELMET_PAGE_BASE  = 0

--subsets declare lua indication source files which will be used to combines pages 
local script_path = LockOn_Options.script_path

page_subsets = {
    [HELMET_PAGE_BASE] = script_path .. "HELMET/Indicator/HELMET_base.lua",
}

----------------------
-- 页面
HELMET_PAGESET_NORMAL = 0

pages = {
    [HELMET_PAGESET_NORMAL] = { HELMET_PAGE_BASE },
}
-- set this page on start 
init_pageID = HELMET_PAGESET_NORMAL


mat_tbl = {
    "helmet_tex_visor",
}

brightness_sensitive_materials = mat_tbl
opacity_sensitive_materials    = mat_tbl
color_sensitive_materials      = mat_tbl

is_colored   = true
day_color    = {0, 1.0, 0}
night_color  = {0, 0.5, 0}
