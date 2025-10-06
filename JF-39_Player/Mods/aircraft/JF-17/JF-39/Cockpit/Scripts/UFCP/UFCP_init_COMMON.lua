dofile(LockOn_Options.common_script_path .. "devices_defs.lua")
dofile(LockOn_Options.common_script_path .. "ViewportHandling.lua")
dofile(LockOn_Options.script_path .. "materials.lua")
dofile(LockOn_Options.script_path .. "utils.lua")

indicator_type = indicator_types.COMMON
purposes       = {render_purpose.GENERAL, render_purpose.HUD_ONLY_VIEW}

local page_path = LockOn_Options.script_path.."UFCP/Indicator/"

dofile(page_path .. "../UFCP_pageID_defs.lua")


-- 子页面源定义
page_subsets = {
    [SUB_PAGE_ID.ELEMENTSET_BASE    ] = page_path .. "UFCP_page_base.lua",
    [SUB_PAGE_ID.ELEMENTSET_PAGE_01 ] = page_path .. "page_01.lua",
    [SUB_PAGE_ID.ELEMENTSET_PAGE_02 ] = page_path .. "page_02.lua",
    [SUB_PAGE_ID.ELEMENTSET_PAGE_03 ] = page_path .. "page_03.lua",
    [SUB_PAGE_ID.ELEMENTSET_PAGE_04 ] = page_path .. "page_04.lua",
}

-- 页面定义
pages = {
    [PAGE_ID.PAGE_ID_BASE    ] = {SUB_PAGE_ID.ELEMENTSET_BASE, },
    [PAGE_ID.PAGE_ID_WIN1    ] = {SUB_PAGE_ID.ELEMENTSET_BASE, SUB_PAGE_ID.ELEMENTSET_PAGE_01, },
    [PAGE_ID.PAGE_ID_WIN2    ] = {SUB_PAGE_ID.ELEMENTSET_BASE, SUB_PAGE_ID.ELEMENTSET_PAGE_02, },
    [PAGE_ID.PAGE_ID_WIN3    ] = {SUB_PAGE_ID.ELEMENTSET_BASE, SUB_PAGE_ID.ELEMENTSET_PAGE_03, },
    [PAGE_ID.PAGE_ID_WIN4    ] = {SUB_PAGE_ID.ELEMENTSET_BASE, SUB_PAGE_ID.ELEMENTSET_PAGE_04, },
}

init_pageID = PAGE_ID.PAGE_ID_BASE

mat_tbl = {
    "ufcd_mesh_def",
    "ufcd_mesh_cursor",
    "ufcd_mesh_pagebase",
    
    "ufcp_font_cursor",
    "ufcp_font_def",
}

brightness_sensitive_materials = mat_tbl
opacity_sensitive_materials    = mat_tbl
color_sensitive_materials      = mat_tbl

day_color    = {0, 255/255, 0/255, 255/255}
night_color  = {0, 128/255, 0/255, 255/255}