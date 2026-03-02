----------------------------------------------------------------------------------------------------
--- must be loaded in HUD_NORMAL.lua

-- Target Box
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.name        = 'target_designator'
tex_poly.vertices    = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}

--tex_poly.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tex_poly.state_tex_coords = {
    HUD_tex_coord( 528, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --0 Four corners box: Unknown target
    HUD_tex_coord( 528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --1 Closed box: Confirm enemy aircraft
    HUD_tex_coord( 368, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --2 Box with X at four corners: Confirm friendly aircraft
    HUD_tex_coord( 368, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --3 Diamond: Ground target
    HUD_tex_coord( 120, 712, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --4 Underscore: Lost target memory
    HUD_tex_coord( 688, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --5 Circle: OAP reference point
}

tex_poly.init_pos    = {0, 0, 0}
tex_poly.indices     = DEF_BOX_INDICES
--tex_poly.controllers = {{"hud_SPI_target", range_l, range_r, range_u, range_d, range_d2}}
tex_poly.controllers = {{"hud_SPI_target", range_l, range_r, range_u + 15, range_d + 15, range_d2 + 15}}
AddElementObject(tex_poly)

tgt_heading_poly                = CreateElement "ceTexPoly"
tgt_heading_poly.material       = HUD_TEX_IND1
tgt_heading_poly.vertices       = {{18.834/2, 68.746/2+31.391},{18.834/2, -68.746/2+31.391},{-18.834/2, -68.746/2+31.391},{-18.834/2, 68.746/2+31.391}}
tgt_heading_poly.tex_coords     = HUD_tex_coord(0, 712, 120, 438, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tgt_heading_poly.init_pos       = {0, 0, 0}
tgt_heading_poly.indices        = DEF_BOX_INDICES
tgt_heading_poly.controllers    = {{"hud_SPI_direction", range_l, range_r, range_u, range_d, range_d2}}
tgt_heading_poly.parent_element = 'target_designator'
AddElementObject(tgt_heading_poly)

----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------