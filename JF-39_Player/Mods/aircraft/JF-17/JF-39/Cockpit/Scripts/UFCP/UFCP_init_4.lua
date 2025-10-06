--UFCP窗口4
ufcp_id = 4

dofile(LockOn_Options.script_path.."UFCP/UFCP_init_COMMON.lua")

init_pageID = PAGE_ID.PAGE_ID_WIN4

-- MFCD position in HUD only view
local w = LockOn_Options.screen.width;
local h = LockOn_Options.screen.height;

local rect_w = w/8
local rect_h = rect_w / UFCP_aspect
local hud_only_view_position = best_fit_rect(
                                                w/4 - rect_w/2, 
                                                h - 1 * rect_h,
                                                rect_w,
                                                rect_h,
                                                Viewport_Align.hcenter,
                                                Viewport_Align.vcenter,
                                                UFCP_aspect)
dedicated_viewport           = hud_only_view_position
dedicated_viewport_arcade    = hud_only_view_position

-- render_purpose.GENERAL
-- try_find_assigned_viewport('UFCP_4')

local default_viewport = try_find_assigned_viewport('JF17_UFCP_4', 'UFCP_4')
if default_viewport then
    dedicated_viewport        = {default_viewport.x, default_viewport.y, default_viewport.width, default_viewport.height}
    dedicated_viewport_arcade = {default_viewport.x, default_viewport.y, default_viewport.width, default_viewport.height}
    purposes                  = {render_purpose.GENERAL, render_purpose.SCREENSPACE_INSIDE_COCKPIT, render_purpose.HUD_ONLY_VIEW}
    render_target_always      = true
end
