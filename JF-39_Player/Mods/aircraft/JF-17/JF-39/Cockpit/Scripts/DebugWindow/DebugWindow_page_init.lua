dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")

indicator_type       = indicator_types.COMMON
purposes             = {render_purpose.SCREENSPACE_INSIDE_COCKPIT, render_purpose.HUD_ONLY_VIEW}

local page_path = LockOn_Options.script_path.."DebugWindow/Indicator/"

-- ��ҳ�涨��
local sub_pages_ID ={
    LUA_PAGE_BASE    = 0,
}

page_subsets = {
    [sub_pages_ID.LUA_PAGE_BASE    ] = page_path .. "debug_page_base.lua",
}

-- ҳ�涨��
local page_ID = {
    PAGE_BASE = 0,
}

pages = {
    [page_ID.PAGE_BASE    ] = {sub_pages_ID.LUA_PAGE_BASE, },
}

init_pageID = page_ID.PAGE_BASE
--
need_to_be_closed = true -- close lua state after initialization 
