-- Clock窗口1
clock_id = 1

dofile(LockOn_Options.script_path.."Clock/Clock_init_COMMON.lua")

init_pageID = PAGE_ID.PAGE_ID_WIN1

local w = LockOn_Options.screen.width;
local h = LockOn_Options.screen.height;

local rect_w = w/16
local rect_h = rect_w / CLOCK_aspect
local hud_only_view_position = best_fit_rect(
                                                w*3/4 - rect_w/2, 
                                                h - 8 * rect_h,
                                                rect_w,
                                                rect_h,
                                                Viewport_Align.hcenter,
                                                Viewport_Align.vcenter,
                                                CLOCK_aspect)
dedicated_viewport           = hud_only_view_position
dedicated_viewport_arcade    = hud_only_view_position


local default_viewport = try_find_assigned_viewport('JF17_CLOCK_WIN1', 'CLOCK_WIN1')
if default_viewport then
    dedicated_viewport        = {default_viewport.x, default_viewport.y, default_viewport.width, default_viewport.height}
    dedicated_viewport_arcade = {default_viewport.x, default_viewport.y, default_viewport.width, default_viewport.height}
    purposes                  = {render_purpose.GENERAL, render_purpose.SCREENSPACE_INSIDE_COCKPIT, render_purpose.HUD_ONLY_VIEW}
    render_target_always      = true
end
