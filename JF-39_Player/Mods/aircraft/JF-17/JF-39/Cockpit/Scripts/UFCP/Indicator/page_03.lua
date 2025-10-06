-- 页面: 3
dofile(LockOn_Options.script_path .. "UFCP/UFCP_defs.lua")

local HW = 2.0/8
local HH = H2W_SCALE * 0.6

local text              = CreateElement "ceStringPoly"
text.name               = "txt_win3"
text.material           = UFCP_LCD_FONT
text.alignment          = "LeftCenter"
text.init_pos           = {-1.04 + HW*1.5/4, 0, 0}
text.value              = "W3L  W3R"
text.controllers        = {{"win_txt"},}
AddStringObject(text)
text = nil

local text              = CreateElement "ceStringPoly"
text.name               = "txt_win3r"
text.material           = UFCP_LCD_FONT
text.alignment          = "RightCenter"
text.init_pos           = {1.04, 0, 0}
text.value              = "W3L  W3R"
text.controllers        = {{"win_txt", 1},}
AddStringObject(text)
text = nil

local text              = CreateElement "ceStringPoly"
text.name               = "txt_win3_fill"
text.material           = UFCP_LCD_FONT
text.alignment          = "LeftCenter"
text.init_pos           = {-1.04 + HW*1.5/4, 0, 0}
text.value              = "W3L  W3R"
text.controllers        = {{"txt_win_fill"},}
AddStringObject(text)
text = nil

--编辑游标
local cur_poly
cur_poly                = CreateElement "ceStringPoly"
cur_poly.material       = UFCP_LCD_FONT
cur_poly.alignment      = "LeftCenter"
cur_poly.parent_element = "txt_win3"
cur_poly.name           = "cur_win3"
cur_poly.value          = "\126"
cur_poly.init_pos       = {0, 0, 0}
cur_poly.controllers    = {{"edit_onoff"},{"blinking"},}
AddStringObject(cur_poly)
cur_poly = nil

local cur_poly
cur_poly                = CreateElement "ceStringPoly"
cur_poly.material       = UFCP_LCD_FONT
cur_poly.alignment      = "RightCenter"
cur_poly.parent_element = "txt_win3r"
cur_poly.name           = "cur_win3r"
cur_poly.value          = "\126"
cur_poly.init_pos       = {0, 0, 0}
cur_poly.controllers    = {{"edit_onoff", 1},{"blinking"},}
AddStringObject(cur_poly)
cur_poly = nil

--[[
local cur_poly
cur_poly                = CreateElement "ceMeshPoly"
cur_poly.material       = UFCP_MATERIAL_DEF
cur_poly.parent_element = "txt_win3"
cur_poly.name           = "cur_win3"
cur_poly.primitivetype  = "triangles"
cur_poly.vertices       = {{ HW/4,  HH},
                           { HW/4, -HH},
                           {-HW/4, -HH},
                           {-HW/4,  HH}}
cur_poly.indices        = DEF_BOX_INDICES
cur_poly.init_pos       = {HW*1/4, 0, 0}
cur_poly.controllers    = {{"edit_onoff"},{"blinking"},}
AddStringObject(cur_poly)
cur_poly = nil

local cur_poly
cur_poly                = CreateElement "ceMeshPoly"
cur_poly.material       = UFCP_MATERIAL_DEF
cur_poly.parent_element = "txt_win3r"
cur_poly.name           = "cur_win3r"
cur_poly.primitivetype  = "triangles"
cur_poly.vertices       = {{ HW/4,  HH},
                           { HW/4, -HH},
                           {-HW/4, -HH},
                           {-HW/4,  HH}}
cur_poly.indices        = DEF_BOX_INDICES
cur_poly.init_pos       = {-HW*2.5/4, 0, 0}
cur_poly.controllers    = {{"edit_onoff", 1},{"blinking"},}
AddStringObject(cur_poly)
cur_poly = nil
]]