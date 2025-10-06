-- 页面: 1
dofile(LockOn_Options.script_path .. "Clock/Clock_defs.lua")

local HW = 2.0/8
local HH = H2W_SCALE * 0.6

local text              = CreateElement "ceStringPoly"
text.name               = "txt_win2"
text.material           = CLOCK_LCD_FONT
text.stringdefs         = CLOCK_STRINGDEFS_DEF
text.alignment          = "CenterCenter"
text.init_pos           = {0, 0, 0}
text.value              = ""
text.controllers        = {{"clock_disp_line2"},}
AddStringObject(text)
text = nil
