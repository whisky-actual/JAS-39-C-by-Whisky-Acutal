dofile(LockOn_Options.common_script_path .. "devices_defs.lua")
dofile(LockOn_Options.common_script_path .. "ViewportHandling.lua")
dofile(LockOn_Options.script_path .. "materials.lua")
dofile(LockOn_Options.script_path .. "utils.lua")

indicator_type = indicator_types.COMMON
purposes       = {render_purpose.GENERAL, render_purpose.HUD_ONLY_VIEW}

local page_path = LockOn_Options.script_path.."Clock/Indicator/"

dofile(page_path .. "../Clock_pageID_defs.lua")


-- 子页面源定义
page_subsets = {
    [SUB_PAGE_ID.ELEMENTSET_PAGE_01 ] = page_path .. "page_01.lua",
    [SUB_PAGE_ID.ELEMENTSET_PAGE_02 ] = page_path .. "page_02.lua",
}

-- 页面定义
pages = {
    [PAGE_ID.PAGE_ID_WIN1    ] = {SUB_PAGE_ID.ELEMENTSET_PAGE_01, },
    [PAGE_ID.PAGE_ID_WIN2    ] = {SUB_PAGE_ID.ELEMENTSET_PAGE_02, },
}

mat_tbl = {
    "clock_font_def",
}

brightness_sensitive_materials = mat_tbl
opacity_sensitive_materials    = mat_tbl
color_sensitive_materials      = mat_tbl

day_color    = {0, 255/255, 0/255, 255/255}
night_color  = {0, 128/255, 0/255, 255/255}