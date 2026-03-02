----------------------------------------------------------------------------------------------------
--- must be loaded in HUD_NORMAL.lua

---- AoA bracket symbol
hud_E_indicator             = CreateElement "ceTexPoly"
hud_E_indicator.material    = HUD_TEX_IND1
hud_E_indicator.name        = "hud_E_indicator"
hud_E_indicator.vertices    = {{ 89.778, 5.6505}, { 89.778,-5.6505}, {-89.778,-5.6505}, {-89.778, 5.6505},}
hud_E_indicator.tex_coords  = HUD_tex_coord(-40,  120, 1144,  72, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_E_indicator.init_pos    = {0, 0, 0}
hud_E_indicator.indices     = DEF_BOX_INDICES
hud_E_indicator.controllers = {{"hud_check_power"},{"hud_aoa_bracket", 0.36, 0.6},{"hud_check_declutter"},} --1st: vert coef, 2nd: hori coeff
 AddElementObject(hud_E_indicator)

--[[
---- AoA bracket symbol
hud_E_indicator_E             = CreateElement "ceTexPoly"
hud_E_indicator_E.material    = HUD_TEX_IND1
hud_E_indicator_E.name        = "hud_E_indicator_E"
hud_E_indicator_E.vertices    = {{0, 37.669/2},{0, -37.669/2},{-15.068, -37.669/2},{-15.068, 37.669/2}}
hud_E_indicator_E.tex_coords  = HUD_tex_coord(128, 192, 96, 240, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_E_indicator_E.init_pos    = {0, 0, 0}
hud_E_indicator_E.indices     = DEF_BOX_INDICES
hud_E_indicator_E.controllers = {{"hud_check_power"},{"hud_aoa_bracket", 0.36, 0.6},{"hud_check_declutter"},} --1st: vert coef, 2nd: hori coeff
 AddElementObject(hud_E_indicator_E)
]]--

-- Planned airspeed and altitude
local texts ={
    {value="\\", alignment="LeftCenter",  formats={"%s"}, init_pos={-105, spd_bar_vert_bias}, ctrls={{"hud_fp_spd", 0.03},{"hud_check_declutter"}}},
    {value="/",  alignment="RightCenter", formats={"%s"}, init_pos={ 105, alt_bar_vert_bias}, ctrls={{"hud_fp_alt", 0.03},{"hud_check_declutter"}} },
}

for i=1, #(texts) do
    text_strpoly                = CreateElement "ceStringPoly"
    text_strpoly.material       = HUD_IND_FONT
    text_strpoly.init_pos       = texts[i].init_pos
    text_strpoly.alignment      = "CenterCenter"
    text_strpoly.stringdefs     = HUD_STRINGDEFS_DEF

    if texts[i].strdef       then text_strpoly.stringdefs    = texts[i].strdef       end
    if texts[i].alignment    then text_strpoly.alignment     = texts[i].alignment    end
    if texts[i].formats      then text_strpoly.formats       = texts[i].formats      end
    if texts[i].ctrls        then text_strpoly.controllers   = texts[i].ctrls        end
    if texts[i].value        then text_strpoly.value         = texts[i].value        end

    AddHUDElement(text_strpoly)
    text_strpoly = nil
end

-- Heading guidance related
hud_wpt_tdc                = CreateElement "ceTexPoly"
hud_wpt_tdc.name           = 'wpt_designator'
hud_wpt_tdc.material       = HUD_TEX_IND1
hud_wpt_tdc.vertices       = {{20.09/2, 20.09/2},{20.09/2, -20.09/2},{-20.09/2, -20.09/2},{-20.09/2, 20.09/2}}
hud_wpt_tdc.tex_coords     = HUD_tex_coord(0, 584, 128, 128, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_wpt_tdc.indices        = DEF_BOX_INDICES
hud_wpt_tdc.init_pos       = {0, 0, 0}
hud_wpt_tdc.controllers    = {{"hud_check_power"},{"hud_wpt_tdc", range_l, range_r, range_u, range_d2},{"hud_check_declutter"}}
AddHUDElement(hud_wpt_tdc)

wpt_heading_poly                = CreateElement "ceTexPoly"
wpt_heading_poly.material       = HUD_TEX_IND1
wpt_heading_poly.vertices       = {{10.987/2, 36.099/2+16.484},{10.987/2, -36.099/2+16.484},{-10.987/2, -36.099/2+16.484},{-10.987/2, 36.099/2+16.484}}
wpt_heading_poly.tex_coords     = HUD_tex_coord(1080, 234, 70, 230, HUD_TEX_IND1_W, HUD_TEX_IND1_H) -- 120, 438
wpt_heading_poly.init_pos       = {0, 0, 0}
wpt_heading_poly.indices        = DEF_BOX_INDICES
wpt_heading_poly.controllers    = {{"hud_wpt_direction", range_l, range_r, range_u, range_d2}}
wpt_heading_poly.parent_element = 'wpt_designator'
AddElementObject(wpt_heading_poly)

---------------------
-- New Heading Queue
---------------------
hud_brg_indicator             = CreateElement "ceStringPoly"
hud_brg_indicator.material    = HUD_IND_FONT  -- Using the font material
hud_brg_indicator.name        = "hud_brg_indicator"
hud_brg_indicator.value       = "?"  -- Set the value to "T"
hud_brg_indicator.init_pos    = {0, 28, 0}  -- Move up by 10 units
hud_brg_indicator.stringdefs  = HUD_STRINGDEFS_DEF  -- Adjust string size if needed
hud_brg_indicator.controllers = {{"hud_check_power"},{"hud_nav_cmd_hdg", 0.034},{"hud_check_declutter"}}
AddHUDElement(hud_brg_indicator)


hud_nav_designator_ball             = CreateElement "ceTexPoly"
hud_nav_designator_ball.material    = HUD_TEX_IND1
hud_nav_designator_ball.name        = "hud_nav_designator_ball"
hud_nav_designator_ball.vertices    = {{7.8475, 7.8475},{7.8475,-7.8475},{-7.8475,-7.8475},{-7.8475,7.8475}}
hud_nav_designator_ball.tex_coords  = HUD_tex_coord(0, 0, 100, 100, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_nav_designator_ball.init_pos    = {0, 0, 0}
hud_nav_designator_ball.indices     = DEF_BOX_INDICES
--hud_nav_designator_ball.parent_element = hud_brg_indicator.name
hud_nav_designator_ball.controllers    = {{"hud_check_power"},{"hud_nav_cdi", 0.034},{"hud_nav_designator_ball", 0.034},{"hud_check_declutter"},}
AddElementObject(hud_nav_designator_ball)

hud_nav_designator_crs                = CreateElement "ceMeshPoly"
hud_nav_designator_crs.material       = HUD_MAT_DEF
hud_nav_designator_crs.primitivetype  = "triangles"
hud_nav_designator_crs.name           = "hud_nav_designator_crs"
hud_nav_designator_crs.vertices       = {{1.259/2, 49.467},{1.259/2, 2.5115},{-1.259/2, 2.5115},{-1.259/2, 49.467}} -- around 2.5 deg
hud_nav_designator_crs.init_pos       = {0, 0, 0}
hud_nav_designator_crs.indices        = DEF_BOX_INDICES
hud_nav_designator_crs.parent_element = hud_nav_designator_ball.name
hud_nav_designator_crs.controllers    = {{"hud_check_power"},{"hud_nav_designator_crs", 0},{"hud_check_declutter"},}
AddElementObject(hud_nav_designator_crs)


hud_nav_designator_dist                = CreateElement "ceMeshPoly"
hud_nav_designator_dist.material       = HUD_MAT_DEF
hud_nav_designator_dist.primitivetype  = "triangles"
hud_nav_designator_dist.name           = "hud_nav_designator_dist"
hud_nav_designator_dist.vertices       = {{5, 1.259/2},{5, -1.259/2},{-5, -1.259/2},{-5, 1.259/2}} -- around 2.5 deg
hud_nav_designator_dist.init_pos       = {0, 0, 0}
hud_nav_designator_dist.indices        = DEF_BOX_INDICES
hud_nav_designator_dist.parent_element = hud_nav_designator_crs.name
hud_nav_designator_dist.controllers    = {{"hud_check_power"},{"hud_nav_designator_dist", 0.0025115, 0.0469555},{"hud_check_declutter"},}
AddElementObject(hud_nav_designator_dist)


hud_apr_designator_crs                = CreateElement "ceMeshPoly"
hud_apr_designator_crs.material       = HUD_MAT_DEF
hud_apr_designator_crs.primitivetype  = "triangles"
hud_apr_designator_crs.name           = "hud_apr_designator_crs"
hud_apr_designator_crs.vertices       = {{1.259/2, 22},{1.259/2, 2.5115},{-1.259/2, 2.5115},{-1.259/2, 22}} -- around 2.5 deg
hud_apr_designator_crs.init_pos       = {0, 0, 0}
hud_apr_designator_crs.indices        = DEF_BOX_INDICES
hud_apr_designator_crs.parent_element = hud_nav_designator_ball.name
hud_apr_designator_crs.controllers    = {{"hud_check_power"},{"hud_nav_designator_crs", 1},{"hud_check_declutter"},}
AddElementObject(hud_apr_designator_crs)

---- TCN
local _dummy_tcn          = CreateElement "ceSimple"
_dummy_tcn.init_pos       = {0, 0, 0}
_dummy_tcn.parent_element = fpm_name
_dummy_tcn.collimated     = true
_dummy_tcn.controllers    = {{"hud_check_power"},{"hud_tcn_dummy"},{"hud_check_declutter"},}
AddElementObject(_dummy_tcn)

local use_tcn_dummy = true

hud_tcn_mark_left                = CreateElement "ceTexPoly"
hud_tcn_mark_left.material       = HUD_TEX_IND1
hud_tcn_mark_left.tex_coords     = HUD_tex_coord(872, 62, 168, 58, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_tcn_mark_left.indices        = DEF_BOX_INDICES
hud_tcn_mark_left.vertices       = {{26.368/2, 9.104/2},{26.368/2, -9.104/2},{-26.368/2, -9.104/2},{-26.368/2, 9.104/2}}
hud_tcn_mark_left.init_pos       = {-17 * 1.5, 0, 0}
hud_tcn_mark_left.parent_element = fpm_name
if use_tcn_dummy then
    hud_tcn_mark_left.parent_element = _dummy_tcn.name
end
hud_tcn_mark_left.controllers    = {{"hud_check_power"},{"hud_tcn_mark", -1},{"hud_check_declutter"}}
AddHUDElement(hud_tcn_mark_left)

hud_tcn_mark_right                = CreateElement "ceTexPoly"
hud_tcn_mark_right.material       = HUD_TEX_IND1
hud_tcn_mark_right.tex_coords     = HUD_tex_coord(872, 62, 168, 58, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_tcn_mark_right.indices        = DEF_BOX_INDICES
hud_tcn_mark_right.vertices       = {{26.368/2, 9.104/2},{26.368/2, -9.104/2},{-26.368/2, -9.104/2},{-26.368/2, 9.104/2}}
hud_tcn_mark_right.init_pos       = {17 * 1.5, 0, 0}
hud_tcn_mark_right.parent_element = fpm_name
if use_tcn_dummy then
    hud_tcn_mark_right.parent_element = _dummy_tcn.name
end
hud_tcn_mark_right.controllers    = {{"hud_check_power"},{"hud_tcn_mark", 1},{"hud_check_declutter"}}
AddHUDElement(hud_tcn_mark_right)


hud_tcn_cdi                = CreateElement "ceTexPoly"
hud_tcn_cdi.material       = HUD_TEX_IND1
hud_tcn_cdi.tex_coords     = HUD_tex_coord(1080, 234, 70, 230, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_tcn_cdi.indices        = DEF_BOX_INDICES
hud_tcn_cdi.vertices       = {{10.987/2, 36.1/2},{10.987/2, -36.1/2},{-10.987/2, -36.1/2},{-10.987/2, 36.1/2}}
hud_tcn_cdi.init_pos       = {0, 0, 0}
hud_tcn_cdi.parent_element = fpm_name
if use_tcn_dummy then
    hud_tcn_cdi.parent_element = _dummy_tcn.name
end
hud_tcn_cdi.controllers    = {{"hud_check_power"},{"hud_tcn_cdi", 0.034, use_tcn_dummy},{"hud_check_declutter"}}
AddHUDElement(hud_tcn_cdi)

---- ILS
--{8, 8}, {8,-8}, {-8,-8},{-8, 8}
--local gap = 0.25

local _dummyils_loc          = CreateElement "ceSimple"
_dummyils_loc.init_pos       = {0, 0, 0}
_dummyils_loc.parent_element = fpm_name
_dummyils_loc.isvisible      = false
_dummyils_loc.collimated     = true
_dummyils_loc.controllers    = {{"hud_check_power"},{"hud_ils_loc", 3.0},{"hud_check_declutter"},}
AddElementObject(_dummyils_loc)

hud_ils_loc_up                 = CreateElement "ceMeshPoly"
hud_ils_loc_up.name            = "hud_ils_loc_up"
hud_ils_loc_up.material        = HUD_MAT_DEF
hud_ils_loc_up.primitivetype   = "triangles"
hud_ils_loc_up.vertices        = {{  1.256/2, 38.631},
                                  {  1.256/2, 14.774},
                                  { -1.256/2, 14.774},
                                  { -1.256/2, 38.631},}
hud_ils_loc_up.indices         = DEF_BOX_INDICES
hud_ils_loc_up.parent_element  = _dummyils_loc.name
hud_ils_loc_up.isdraw          = true
hud_ils_loc_up.isvisible       = true
hud_ils_loc_up.use_mipfilter   = true
hud_ils_loc_up.additive_alpha  = true
hud_ils_loc_up.collimated      = true
AddElementObject(hud_ils_loc_up)

hud_ils_loc_dn                 = CreateElement "ceMeshPoly"
hud_ils_loc_dn.name            = "hud_ils_loc_dn"
hud_ils_loc_dn.material        = HUD_MAT_DEF
hud_ils_loc_dn.primitivetype   = "triangles"
hud_ils_loc_dn.vertices        = {{  1.256/2, -6.572},
                                  {  1.256/2, -30.429},
                                  { -1.256/2, -30.429},
                                  { -1.256/2, -6.572},}
hud_ils_loc_dn.indices         = DEF_BOX_INDICES
hud_ils_loc_dn.parent_element  = _dummyils_loc.name
hud_ils_loc_dn.isdraw          = true
hud_ils_loc_dn.isvisible       = true
hud_ils_loc_dn.use_mipfilter   = true
hud_ils_loc_dn.additive_alpha  = true
hud_ils_loc_dn.collimated      = true
AddElementObject(hud_ils_loc_dn)


local _dummyils_gs          = CreateElement "ceSimple"
_dummyils_gs.init_pos       = {0, 0, 0}
_dummyils_gs.parent_element = fpm_name
_dummyils_gs.isvisible      = false
_dummyils_gs.collimated     = true
_dummyils_gs.controllers    = {{"hud_check_power"},{"hud_ils_gs", 0.7},{"hud_check_declutter"},}
AddElementObject(_dummyils_gs)

hud_ils_gs_left                 = CreateElement "ceMeshPoly"
hud_ils_gs_left.name            = "hud_ils_gs_left"
hud_ils_gs_left.material        = HUD_MAT_DEF
hud_ils_gs_left.primitivetype   = "triangles"
hud_ils_gs_left.vertices        = {{-15.068, 1.256/2},
                                   {-15.068, -1.256/2},
                                   { -34.53, -1.256/2},
                                   { -34.53, 1.256/2},}
hud_ils_gs_left.indices         = DEF_BOX_INDICES
hud_ils_gs_left.parent_element  = _dummyils_gs.name
hud_ils_gs_left.isdraw          = true
hud_ils_gs_left.isvisible       = true
hud_ils_gs_left.use_mipfilter   = true
hud_ils_gs_left.additive_alpha  = true
hud_ils_gs_left.collimated      = true
AddElementObject(hud_ils_gs_left)

hud_ils_gs_right                 = CreateElement "ceMeshPoly"
hud_ils_gs_right.name            = "hud_ils_gs_right"
hud_ils_gs_right.material        = HUD_MAT_DEF
hud_ils_gs_right.primitivetype   = "triangles"
hud_ils_gs_right.vertices        = {{15.068, 1.256/2},
                                    {15.068, -1.256/2},
                                    { 34.53, -1.256/2},
                                    { 34.53, 1.256/2},}
hud_ils_gs_right.indices         = DEF_BOX_INDICES
hud_ils_gs_right.parent_element  = _dummyils_gs.name
hud_ils_gs_right.isdraw          = true
hud_ils_gs_right.isvisible       = true
hud_ils_gs_right.use_mipfilter   = true
hud_ils_gs_right.additive_alpha  = true
hud_ils_gs_right.collimated      = true
AddElementObject(hud_ils_gs_right)

----------------------------------------------------
-- Speed bar
----------------------------------------------------

local tex_coord_box  = HUD_tex_coord(224, 312, 268, 152, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
local SIDE_OFFSET    = HUD_HALF_WIDTH*5/12
HW = (42.064/2)+15
HH = 23.857/2
SPD_BAR_SHIFT = -13 -- Adjust this value to shift all elements horizontally

tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.name        = "SPD_Box"
tex_poly.tex_coords  = tex_coord_box
tex_poly.init_pos    = {-113.625 + SPD_BAR_SHIFT, spd_bar_vert_bias, 0}
tex_poly.vertices    = {{30.845/2, 11.961/2}, {30.845/2,-11.961/2}, {-30.845/2,-11.961/2}, {-30.845/2,11.961/2}}
tex_poly.indices     = DEF_BOX_INDICES
tex_poly.h_clip_relation = h_clip_relations.REWRITE_LEVEL
tex_poly.isvisible       = false
tex_poly.use_mipfilter   = true
tex_poly.additive_alpha  = true
tex_poly.collimated      = true
tex_poly.level           = HUD_DEFAULT_LEVEL + 2
tex_poly.controllers     = {{"hud_check_power"},{"hud_check_declutter"},}
Add(tex_poly)
tex_poly = nil

-- Clip speed bar
clipPoly                = CreateElement "ceMeshPoly"
clipPoly.name           = "clipPoly-spd"
clipPoly.primitivetype  = "triangles"
clipPoly.init_pos       = {-101.164 + SPD_BAR_SHIFT, spd_bar_vert_bias, 0}
clipPoly.vertices       = {{HW/2, 88.13/2},{HW/2, -88.13/2},{-2*HW, -88.13/2},{-2*HW, 88.13/2}}
clipPoly.indices        = DEF_BOX_INDICES
clipPoly.material       = HUD_MAT_DEF
clipPoly.h_clip_relation= h_clip_relations.INCREASE_IF_LEVEL
clipPoly.level          = HUD_DEFAULT_LEVEL
clipPoly.collimated     = true
clipPoly.isvisible      = false
clipPoly.controllers    = {{"hud_check_power"},{"hud_check_declutter"},}
Add(clipPoly)
clipPoly = nil

-- Speed bar
local _dummyspd          = CreateElement "ceSimple"
_dummyspd.level          = HUD_DEFAULT_LEVEL + 1
_dummyspd.isvisible      = false
_dummyspd.init_pos       = {-98.2 + SPD_BAR_SHIFT, spd_bar_vert_bias, 0}
_dummyspd.controllers    = {{"hud_check_power"},{"hud_move_speedtape", 0.03},{"hud_check_declutter"},}
AddElementObject(_dummyspd)

hud_spd_scale_long0                 = CreateElement "ceMeshPoly"
hud_spd_scale_long0.name            = "hud_spd_scale_long_0"
hud_spd_scale_long0.material        = HUD_MAT_DEF
hud_spd_scale_long0.primitivetype   = "triangles"
hud_spd_scale_long0.vertices        = {{  0, 1.256/2},
                                       {  0, -1.256/2},
                                       { -6.278, -1.256/2},
                                       { -6.278, 1.256/2},}
hud_spd_scale_long0.indices         = DEF_BOX_INDICES
hud_spd_scale_long0.level           = HUD_DEFAULT_LEVEL + 1
hud_spd_scale_long0.parent_element  = _dummyspd.name
hud_spd_scale_long0.isdraw          = true
hud_spd_scale_long0.isvisible       = true
hud_spd_scale_long0.use_mipfilter   = true
hud_spd_scale_long0.additive_alpha  = true
hud_spd_scale_long0.collimated      = true
AddElementObject(hud_spd_scale_long0)

for i=0,4000 do
    hud_spd_scale_line = CreateElement "ceMeshPoly"
    hud_spd_scale_line.material = HUD_MAT_DEF
    hud_spd_scale_line.primitivetype = "triangles"
    hud_spd_scale_line.vertices = {
        { 0.75, 1.256/2}, { 0.75, -1.256/2}, -- Right side of the line (offset by 0.75 pixel)
        {-0.75, 1.256/2}, {-0.75, -1.256/2}  -- Left side of the line (offset by -0.75 pixel)
    }
    hud_spd_scale_line.indices = {0, 1, 2, 2, 1, 3} -- Create two triangles to form the thick line
    hud_spd_scale_line.init_pos = {3 + 2, i * 1.25, 0} -- Move the line 2 pixels to the right by adding 2 to the x-position
    hud_spd_scale_line.level = HUD_DEFAULT_LEVEL + 1
    hud_spd_scale_line.parent_element = _dummyspd.name
    hud_spd_scale_line.isdraw = true
    hud_spd_scale_line.isvisible = true
    hud_spd_scale_line.use_mipfilter = true
    hud_spd_scale_line.additive_alpha = true
    hud_spd_scale_line.collimated = true
    hud_spd_scale_line.controllers = {{"hud_spd_boxclip", 0.045, spd_bar_vert_bias*MMIL2MIL},{"hud_check_declutter"},}
    AddElementObject(hud_spd_scale_line)
    hud_spd_scale_line = nil
end


for i=0,4000 do
    if i ~= 0 then
        local dir = 1
        if i < 0 then dir = -1 end
        i_plus = math.abs(i)
        hud_spd_scale_long = CreateElement "ceMeshPoly"
        hud_spd_scale_long.material = HUD_MAT_DEF
        hud_spd_scale_long.primitivetype = "triangles"
        hud_spd_scale_long.vertices = {{  0, 1.256/1.5}, {  0, -1.256/1.5}, { -3.767, -1.256/1.5}, { -3.767, 1.256/1.5},}
        hud_spd_scale_long.indices = DEF_BOX_INDICES
        hud_spd_scale_long.init_pos = {3 + 2, i * 15, 0} -- Move the scale 2 pixels to the right
        hud_spd_scale_long.level = HUD_DEFAULT_LEVEL + 1
        hud_spd_scale_long.parent_element = _dummyspd.name
        hud_spd_scale_long.isdraw = true
        hud_spd_scale_long.isvisible = true
        hud_spd_scale_long.use_mipfilter = true
        hud_spd_scale_long.additive_alpha = true
        hud_spd_scale_long.collimated = true
        hud_spd_scale_long.controllers = {{"hud_spd_boxclip", 0.045, spd_bar_vert_bias*MMIL2MIL},{"hud_check_declutter"},}
        AddElementObject(hud_spd_scale_long)
        hud_spd_scale_long = nil


    end
end
-------------------------------


for s = 0, 4000 do
    if s >= 12 and s <= 12.1 then
    min_spd_scale                 = CreateElement "ceStringPoly"
    min_spd_scale.material        = HUD_IND_FONT
    min_spd_scale.stringdefs      = HUD_STRINGDEFS_DEF_X12
    min_spd_scale.init_pos        = {14, s * 31.725, 0}  -- 125
    min_spd_scale.alignment       = "RightCenter"
    min_spd_scale.value           = "["
    min_spd_scale.level           = HUD_DEFAULT_LEVEL + 1
    min_spd_scale.parent_element  = _dummyspd.name
    min_spd_scale.isdraw          = true
    min_spd_scale.isvisible       = true
    min_spd_scale.use_mipfilter   = true
    min_spd_scale.additive_alpha  = true
    min_spd_scale.collimated      = true
    min_spd_scale.controllers     = {{0.045, spd_bar_vert_bias*MMIL2MIL}, {"hud_check_declutter"}}  -- Fixed syntax
    AddElementObject(min_spd_scale)
    min_spd_scale = nil
    end
end

for s = 0, 4000 do
    if s >= 82 and s <= 81.1 then
    max_spd_scale                 = CreateElement "ceStringPoly"
    max_spd_scale.material        = HUD_IND_FONT
    max_spd_scale.stringdefs      = HUD_STRINGDEFS_DEF_X12
    max_spd_scale.init_pos        = {14, s * 30.225, 0}  -- 820
    max_spd_scale.alignment       = "RightCenter"
    max_spd_scale.value           = "]"
    max_spd_scale.level           = HUD_DEFAULT_LEVEL + 1
    max_spd_scale.parent_element  = _dummyspd.name
    max_spd_scale.isdraw          = true
    max_spd_scale.isvisible       = true
    max_spd_scale.use_mipfilter   = true
    max_spd_scale.additive_alpha  = true
    max_spd_scale.collimated      = true
    max_spd_scale.controllers     = {{0.045, spd_bar_vert_bias*MMIL2MIL}, {"hud_check_declutter"}}  -- Fixed syntax
    AddElementObject(max_spd_scale)
    max_spd_scale = nil
    end
end

for s = 0, 4000 do
    if s >= 14 and s <= 14.1 then
    land_spd_scale                 = CreateElement "ceStringPoly"
    land_spd_scale.material        = HUD_IND_FONT
    land_spd_scale.stringdefs      = HUD_STRINGDEFS_DEF_X12
    land_spd_scale.init_pos        = {14, s * 30.225, 0}  -- 140
    land_spd_scale.alignment       = "RightCenter"
    land_spd_scale.value           = "{"
    land_spd_scale.level           = HUD_DEFAULT_LEVEL + 1
    land_spd_scale.parent_element  = _dummyspd.name
    land_spd_scale.isdraw          = true
    land_spd_scale.isvisible       = true
    land_spd_scale.use_mipfilter   = true
    land_spd_scale.additive_alpha  = true
    land_spd_scale.collimated      = true
    land_spd_scale.controllers     = {{0.045, spd_bar_vert_bias*MMIL2MIL}, {"hud_check_declutter"}}  -- Fixed syntax
    AddElementObject(land_spd_scale)
    land_spd_scale = nil
    end
end

for s = 0, 4000 do
    if s >= 38 and s <= 38.1 then
    corner_spd_scale                 = CreateElement "ceStringPoly"
    corner_spd_scale.material        = HUD_IND_FONT
    corner_spd_scale.stringdefs      = HUD_STRINGDEFS_DEF_X12
    corner_spd_scale.init_pos        = {14, s * 30.225, 0}  -- 380
    corner_spd_scale.alignment       = "RightCenter"
    corner_spd_scale.value           = "}"
    corner_spd_scale.level           = HUD_DEFAULT_LEVEL + 1
    corner_spd_scale.parent_element  = _dummyspd.name
    corner_spd_scale.isdraw          = true
    corner_spd_scale.isvisible       = true
    corner_spd_scale.use_mipfilter   = true
    corner_spd_scale.additive_alpha  = true
    corner_spd_scale.collimated      = true
    corner_spd_scale.controllers     = {{0.045, spd_bar_vert_bias*MMIL2MIL}, {"hud_check_declutter"}}  -- Fixed syntax
    AddElementObject(corner_spd_scale)
    corner_spd_scale = nil
    end
end

----------------------------------------------------
-- Altitude Bar
----------------------------------------------------

local tex_coord_box  = HUD_tex_coord(716, 312, 364, 152, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
HW = 57.131/2
HH = 23.857/2

-- Altitude Bar clip layer
clipPoly                 = CreateElement "ceMeshPoly"
clipPoly.name            = "clipPoly-alt"
clipPoly.primitivetype   = "triangles"
clipPoly.init_pos        = {110, alt_bar_vert_bias, 0}
clipPoly.vertices        = {{2*HW, 88.13/2},
                           {2*HW, -88.13/2},
                           {-HW/2, -88.13/2},
                           {-HW/2, 88.13/2}}
clipPoly.indices         = DEF_BOX_INDICES
clipPoly.material        = HUD_MAT_DEF
clipPoly.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
clipPoly.level           = HUD_DEFAULT_LEVEL
clipPoly.collimated      = true
clipPoly.isvisible       = false
clipPoly.controllers    = {{"hud_check_power"},{"hud_check_declutter"},}
Add(clipPoly)
clipPoly = nil

-- Altitude Bar
local _dummyalt          = CreateElement "ceSimple"
_dummyalt.level          = HUD_DEFAULT_LEVEL + 1
_dummyalt.isvisible      = false
_dummyalt.init_pos       = {105, alt_bar_vert_bias, 0}
_dummyalt.controllers    = {{"hud_check_power"},{"hud_move_alttape", 0.03},{"hud_check_declutter"},}
AddElementObject(_dummyalt)

hud_alt_scale_long0                 = CreateElement "ceMeshPoly"
hud_alt_scale_long0.name            = "hud_alt_scale_long_0"
hud_alt_scale_long0.material        = HUD_MAT_DEF
hud_alt_scale_long0.primitivetype   = "triangles"
hud_alt_scale_long0.vertices        = {{  0, 1.256},
                                       {  0, -1.256},
                                       { 6.278, -1.256},
                                       { 6.278, 1.256},}
hud_alt_scale_long0.indices         = DEF_BOX_INDICES
hud_alt_scale_long0.level           = HUD_DEFAULT_LEVEL + 1
hud_alt_scale_long0.parent_element  = _dummyalt.name
hud_alt_scale_long0.isdraw          = true
hud_alt_scale_long0.isvisible       = true
hud_alt_scale_long0.use_mipfilter   = true
hud_alt_scale_long0.additive_alpha  = true
hud_alt_scale_long0.collimated      = true
AddElementObject(hud_alt_scale_long0)


hud_alt_scale_idx0                 = CreateElement "ceStringPoly"
hud_alt_scale_idx0.name            = "hud_alt_scale_idx_0"
hud_alt_scale_idx0.material        = HUD_IND_FONT
hud_alt_scale_idx0.stringdefs      = HUD_STRINGDEFS_DEF
hud_alt_scale_idx0.init_pos        = {6.278+0.942, 0, 0}
hud_alt_scale_idx0.alignment       = "LeftCenter"
hud_alt_scale_idx0.value           = "0"
hud_alt_scale_idx0.level           = HUD_DEFAULT_LEVEL + 1
hud_alt_scale_idx0.parent_element  = _dummyalt.name
hud_alt_scale_idx0.isdraw          = true
hud_alt_scale_idx0.isvisible       = true
hud_alt_scale_idx0.use_mipfilter   = true
hud_alt_scale_idx0.additive_alpha  = true
hud_alt_scale_idx0.collimated      = true
AddElementObject(hud_alt_scale_idx0)
hud_alt_scale_idx0 = nil

for i=-5,550 do
    if i ~= 0 then
        local dir = 1
        if i < 0 then dir = -1 end

        i_plus = math.abs(i)

        -- Create the long scale element
        hud_alt_scale_long = CreateElement "ceMeshPoly"
        hud_alt_scale_long.material = HUD_MAT_DEF
        hud_alt_scale_long.primitivetype = "triangles"
        hud_alt_scale_long.vertices = {{ 0, 1.256},
                                       { 0, -1.256},
                                       { 6.278, -1.256},
                                       { 6.278, 1.256},}
        hud_alt_scale_long.indices = DEF_BOX_INDICES
        hud_alt_scale_long.init_pos = {0, i * 30, 0}
        hud_alt_scale_long.level = HUD_DEFAULT_LEVEL + 1
        hud_alt_scale_long.parent_element = _dummyalt.name
        hud_alt_scale_long.isdraw = true
        hud_alt_scale_long.isvisible = true
        hud_alt_scale_long.use_mipfilter = true
        hud_alt_scale_long.additive_alpha = true
        hud_alt_scale_long.collimated = true
        hud_alt_scale_long.controllers = {{"hud_alt_boxclip", 0.045, alt_bar_vert_bias * MMIL2MIL}, {"hud_check_declutter"},}
        AddElementObject(hud_alt_scale_long)
        hud_alt_scale_long = nil

        -- Create the short scale element between the long scale elements
        hud_alt_scale_short0 = CreateElement "ceMeshPoly"
        hud_alt_scale_short0.material = HUD_MAT_DEF
        hud_alt_scale_short0.primitivetype = "triangles"
        hud_alt_scale_short0.vertices = {{ 0, 1.256},
                                         { 0, -1.256},
                                         { 3.767, -1.256},
                                         { 3.767, 1.256},}
        hud_alt_scale_short0.indices = DEF_BOX_INDICES
        hud_alt_scale_short0.init_pos = {0, (i + 0.5) * 30, 0}  -- Adjust position to be between the long scale elements
        hud_alt_scale_short0.level = HUD_DEFAULT_LEVEL + 1
        hud_alt_scale_short0.parent_element = _dummyalt.name
        hud_alt_scale_short0.isdraw = true
        hud_alt_scale_short0.isvisible = true
        hud_alt_scale_short0.use_mipfilter = true
        hud_alt_scale_short0.additive_alpha = true
        hud_alt_scale_short0.collimated = true
        hud_alt_scale_short0.controllers = {{"hud_alt_boxclip", 0.045, alt_bar_vert_bias * MMIL2MIL}, {"hud_check_declutter"},}
        AddElementObject(hud_alt_scale_short0)
        hud_alt_scale_short0 = nil

        local p1000 = math.floor(i_plus / 10)  -- Extract only the thousand part (e.g., 1000 → 1, 10000 → 10)
        local p100 = (i_plus % 10) * 100      -- Keep the hundreds part (e.g., 100, 200, 300)
        local text1000 = tostring(p1000)
        local text100 = string.format("%03d", p100)  -- Format as 3 digits, e.g., 000, 100, 200, etc.

        if dir < 0 then
            text1000 = "-" .. text1000
        end

        -- Only create the thousands text if the value is 1000 or greater
        if p1000 > 0 then
            -- Thousands text
            hud_alt_scale_idx_1000 = CreateElement "ceStringPoly"
            hud_alt_scale_idx_1000.material = HUD_IND_FONT
            hud_alt_scale_idx_1000.stringdefs = HUD_STRINGDEFS_DEF_X12  -- Larger font for thousands
            
            -- Adjusted position to align to the right
            hud_alt_scale_idx_1000.init_pos = {24, i * 30, 0}  -- Move to the right side
            
            hud_alt_scale_idx_1000.alignment = "RightCenter"
            hud_alt_scale_idx_1000.value = text1000
            hud_alt_scale_idx_1000.level = HUD_DEFAULT_LEVEL + 1
            hud_alt_scale_idx_1000.parent_element = _dummyalt.name
            hud_alt_scale_idx_1000.isdraw = true
            hud_alt_scale_idx_1000.isvisible = true
            hud_alt_scale_idx_1000.use_mipfilter = true
            hud_alt_scale_idx_1000.additive_alpha = true
            hud_alt_scale_idx_1000.collimated = true
            hud_alt_scale_idx_1000.controllers = {{"hud_alt_boxclip", 0.045, alt_bar_vert_bias * MMIL2MIL},}
            AddElementObject(hud_alt_scale_idx_1000)
            hud_alt_scale_idx_1000 = nil
        end

        -- Hundreds text
        hud_alt_scale_idx_100 = CreateElement "ceStringPoly"
        hud_alt_scale_idx_100.material = HUD_IND_FONT
        hud_alt_scale_idx_100.stringdefs = HUD_STRINGDEFS_DEF  -- Normal font for hundreds
        hud_alt_scale_idx_100.init_pos = {26, i * 30, 0}  -- Adjusted position for hundreds
        hud_alt_scale_idx_100.alignment = "LeftCenter"
        hud_alt_scale_idx_100.value = text100
        hud_alt_scale_idx_100.level = HUD_DEFAULT_LEVEL + 1
        hud_alt_scale_idx_100.parent_element = _dummyalt.name
        hud_alt_scale_idx_100.isdraw = true
        hud_alt_scale_idx_100.isvisible = true
        hud_alt_scale_idx_100.use_mipfilter = true
        hud_alt_scale_idx_100.additive_alpha = true
        hud_alt_scale_idx_100.collimated = true
        hud_alt_scale_idx_100.controllers = {{"hud_alt_boxclip", 0.045, alt_bar_vert_bias * MMIL2MIL},}
        AddElementObject(hud_alt_scale_idx_100)
        hud_alt_scale_idx_100 = nil
    end
end

----------------------------------------------------
-- Adjustable values
----------------------------------------------------
local hdg_bar_offset = 10  -- Adjust heading bar position
local hdg_tape_extra_width = 20  -- Extra width on each side
local mark_width = 1.0  -- Half of the total width (2 pixels)

----------------------------------------------------
-- Helper function to create a HUD element
----------------------------------------------------
local function CreateHUDMesh(name, width, height, posX, posY, parent)
    local element = CreateElement "ceMeshPoly"
    element.name = name
    element.material = HUD_MAT_DEF
    element.primitivetype = "triangles"
    element.vertices = {{ width, height }, { width, 0 }, { -width, 0 }, { -width, height }}
    element.indices = DEF_BOX_INDICES
    element.init_pos = { posX, posY + hdg_bar_offset, 0 }
    element.level = HUD_DEFAULT_LEVEL + 1
    element.parent_element = parent
    element.isdraw = true
    element.isvisible = true
    element.use_mipfilter = true
    element.additive_alpha = true
    element.collimated = true
    AddElementObject(element)
end

----------------------------------------------------
-- Heading Indicator Clip Layer (Wider Tape)
----------------------------------------------------
local clipPoly = CreateElement "ceMeshPoly"
clipPoly.name = "clipPoly-hdg"
clipPoly.primitivetype = "triangles"
clipPoly.init_pos = {0, 19.965 + hdg_bar_offset, 0}
clipPoly.vertices = {
    { (113.31/2) + hdg_tape_extra_width,  2*HH },
    { (113.31/2) + hdg_tape_extra_width, -HH },
    {-(113.31/2) - hdg_tape_extra_width, -HH },
    {-(113.31/2) - hdg_tape_extra_width,  2*HH }
}
clipPoly.indices = DEF_BOX_INDICES
clipPoly.material = HUD_MAT_DEF
clipPoly.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
clipPoly.level = HUD_DEFAULT_LEVEL
clipPoly.controllers = {{"hud_check_power"}, {"hud_check_declutter"}}
clipPoly.isvisible = false
clipPoly.collimated = true
Add(clipPoly)

----------------------------------------------------
-- Move the whole heading tape
----------------------------------------------------
local _dummyhdg = CreateElement "ceSimple"
_dummyhdg.level = HUD_DEFAULT_LEVEL + 1
_dummyhdg.isvisible = false
_dummyhdg.init_pos = {0, hdg_bar_vert_bias + hdg_bar_offset, 0}
_dummyhdg.controllers = {{"hud_check_power"}, {"hud_move_headingtape", 0.034}, {"hud_check_declutter"}}
AddElementObject(_dummyhdg)

----------------------------------------------------
-- Heading Scale (Including 000)
----------------------------------------------------
-- Central long mark (000)
CreateHUDMesh("hud_hdg_scale_long_0", mark_width, 6.278, 0, 0, _dummyhdg.name)

-- Central index (000)
local hud_hdg_scale_idx0 = CreateElement "ceStringPoly"
hud_hdg_scale_idx0.name = "hud_hdg_scale_idx_0"
hud_hdg_scale_idx0.material = HUD_IND_FONT
hud_hdg_scale_idx0.stringdefs = HUD_STRINGDEFS_DEF
hud_hdg_scale_idx0.init_pos = {0, 6.278 + 6.278 + hdg_bar_offset, 0}
hud_hdg_scale_idx0.alignment = "CenterCenter"
hud_hdg_scale_idx0.value = "000"
hud_hdg_scale_idx0.level = HUD_DEFAULT_LEVEL + 1
hud_hdg_scale_idx0.parent_element = _dummyhdg.name
hud_hdg_scale_idx0.isdraw = true
hud_hdg_scale_idx0.isvisible = true
hud_hdg_scale_idx0.use_mipfilter = true
hud_hdg_scale_idx0.additive_alpha = true
hud_hdg_scale_idx0.collimated = true
AddElementObject(hud_hdg_scale_idx0)

-- Heading marks and numbers for the rest of the scale
for i = 1, 19 do
    for k = 0, 1 do
        local dir = 1 - 2 * k
        local val = (dir == -1) and (36 - i) or i
        val = string.format("%03d", val * 10)  -- Always show 3 digits

        -- Create Short and Long Marks (2 pixels wide)
        CreateHUDMesh("hud_hdg_scale_short_" .. i, mark_width, 3.767, dir * (17 + (i-1) * 34), 0, _dummyhdg.name)
        CreateHUDMesh("hud_hdg_scale_long_" .. i, mark_width, 6.278, dir * i * 34, 0, _dummyhdg.name)

        -- Heading index numbers
        local hud_hdg_scale_idx = CreateElement "ceStringPoly"
        hud_hdg_scale_idx.name = "hud_hdg_scale_idx_" .. i
        hud_hdg_scale_idx.material = HUD_IND_FONT
        hud_hdg_scale_idx.stringdefs = HUD_STRINGDEFS_DEF
        hud_hdg_scale_idx.init_pos = {dir * i * 34, 6.278 + 6.278 + hdg_bar_offset, 0}
        hud_hdg_scale_idx.alignment = "CenterCenter"
        hud_hdg_scale_idx.value = val
        hud_hdg_scale_idx.level = HUD_DEFAULT_LEVEL + 1
        hud_hdg_scale_idx.parent_element = _dummyhdg.name
        hud_hdg_scale_idx.isdraw = true
        hud_hdg_scale_idx.isvisible = true
        hud_hdg_scale_idx.use_mipfilter = true
        hud_hdg_scale_idx.additive_alpha = true
        hud_hdg_scale_idx.collimated = true
        AddElementObject(hud_hdg_scale_idx)
    end
end

----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------