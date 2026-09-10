----------------------------------------------------------------------------------------------------
--- must be loaded in HUD_NORMAL.lua

-- RDYX
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.name        = "hud_wpn_rdyx"
tex_poly.vertices    = {{30.135/2,18.834/2},{30.135/2,-18.834/2},{-30.135/2,-18.834/2},{-30.135/2,18.834/2}}
tex_poly.tex_coords  = HUD_tex_coord(872, 192, 192, 120, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tex_poly.init_pos    = {-117, -142}
tex_poly.indices     = DEF_BOX_INDICES
tex_poly.controllers = {{"hud_wpn_rdyx"}}
AddElementObject(tex_poly)


--[[-- Gun Cross
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.name        = "hud_gun_cross"
tex_poly.vertices    = {{10.045,10.045},{10.045,-10.045},{-10.045,-10.045},{-10.045,10.045}}
tex_poly.tex_coords  = HUD_tex_coord(0, 192, 128, 128, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tex_poly.init_pos    = {0, vert_bias, 0}
tex_poly.indices     = DEF_BOX_INDICES
AddElementObject(tex_poly)]]


-- HPT目标框
hpt_tex_poly             = CreateElement "ceTexPoly"
hpt_tex_poly.material    = HUD_TEX_IND1
hpt_tex_poly.name        = 'hpt_designator'
hpt_tex_poly.vertices    = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
--hpt_tex_poly.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hpt_tex_poly.state_tex_coords = {
    HUD_tex_coord( 528, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --0 四角方框: 不明目标
    HUD_tex_coord( 528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --1 封闭方框: 确认敌机
    HUD_tex_coord( 368, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --2 带x四角: 确认友机
    HUD_tex_coord( 368, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --3 菱形: 面目标
    HUD_tex_coord( 120, 712, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --4 下划线: 丢失目标记忆
    HUD_tex_coord( 688, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --5 圆形: OAP参考点
    HUD_tex_coord( 280, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --6 四角三角: 不明目标
    HUD_tex_coord( 120, 872, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --7 封闭三角: 确认敌机
    HUD_tex_coord( 440, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --8 带x三角: 确认友机
}
hpt_tex_poly.init_pos    = {0, 0, 0}
hpt_tex_poly.indices     = DEF_BOX_INDICES
hpt_tex_poly.controllers = {{"hud_SPI_target", range_l, range_r, range_u, range_d, range_d2}}
AddElementObject(hpt_tex_poly)

hpt_heading_poly                = CreateElement "ceTexPoly"
hpt_heading_poly.material       = HUD_TEX_IND1
hpt_heading_poly.vertices       = {{18.834/2, 68.746/2+31.391},{18.834/2, -68.746/2+31.391},{-18.834/2, -68.746/2+31.391},{-18.834/2, 68.746/2+31.391}}
hpt_heading_poly.tex_coords     = HUD_tex_coord(0, 712, 120, 438, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hpt_heading_poly.init_pos       = {0, 0, 0}
hpt_heading_poly.indices        = DEF_BOX_INDICES
hpt_heading_poly.controllers    = {{"hud_SPI_direction", range_l, range_r, range_u, range_d, range_d2}}
hpt_heading_poly.parent_element = 'hpt_designator'
AddElementObject(hpt_heading_poly)

local hpt_text_strpoly          = CreateElement "ceStringPoly"
hpt_text_strpoly.material       = HUD_IND_FONT
hpt_text_strpoly.stringdefs     = HUD_STRINGDEFS_DEF_X08
hpt_text_strpoly.init_pos       = {0, 0, 0}
hpt_text_strpoly.alignment      = "CenterCenter"
hpt_text_strpoly.controllers    = {{"hud_txt_AA_TOF_TOA"},} --TODO
hpt_text_strpoly.value          = "60"
hpt_text_strpoly.parent_element = 'hpt_designator'
AddElementObject(hpt_text_strpoly)



-- SPT目标框
spt_tex_poly             = CreateElement "ceTexPoly"
spt_tex_poly.material    = HUD_TEX_IND1
spt_tex_poly.name        = 'spt_designator'
spt_tex_poly.vertices    = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
--spt_tex_poly.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
spt_tex_poly.state_tex_coords = {
    HUD_tex_coord( 528, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --0 四角方框: 不明目标
    HUD_tex_coord( 528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --1 封闭方框: 确认敌机
    HUD_tex_coord( 368, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --2 带x四角: 确认友机
    HUD_tex_coord( 368, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --3 菱形: 面目标
    HUD_tex_coord( 120, 712, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --4 下划线: 丢失目标记忆
    HUD_tex_coord( 688, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --5 圆形: OAP参考点
    HUD_tex_coord( 280, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --6 四角三角: 不明目标
    HUD_tex_coord( 120, 872, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --7 封闭三角: 确认敌机
    HUD_tex_coord( 440, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --8 带x三角: 确认友机
}
spt_tex_poly.init_pos    = {0, 0, 0}
spt_tex_poly.indices     = DEF_BOX_INDICES
spt_tex_poly.controllers = {{"hud_SPI_target", range_l, range_r, range_u, range_d, range_d2, 1}}
AddElementObject(spt_tex_poly)

spt_heading_poly                = CreateElement "ceTexPoly"
spt_heading_poly.material       = HUD_TEX_IND1
spt_heading_poly.vertices       = {{18.834/2, 68.746/2+31.391},{18.834/2, -68.746/2+31.391},{-18.834/2, -68.746/2+31.391},{-18.834/2, 68.746/2+31.391}}
spt_heading_poly.tex_coords     = HUD_tex_coord(0, 712, 120, 438, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
spt_heading_poly.init_pos       = {0, 0, 0}
spt_heading_poly.indices        = DEF_BOX_INDICES
spt_heading_poly.controllers    = {{"hud_SPI_direction", range_l, range_r, range_u, range_d, range_d2, 1}}
spt_heading_poly.parent_element = 'spt_designator'
AddElementObject(spt_heading_poly)



-- OAP 菱形标记
hud_oap_tdc                = CreateElement "ceTexPoly"
hud_oap_tdc.material       = HUD_TEX_IND1
hud_oap_tdc.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
hud_oap_tdc.tex_coords     = HUD_tex_coord(368, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_oap_tdc.indices        = DEF_BOX_INDICES
hud_oap_tdc.init_pos       = {0, 0, 0}
hud_oap_tdc.controllers    = {{"hud_oap_tdc"},{"hud_check_declutter"},{"hud_check_power"}}
AddHUDElement(hud_oap_tdc)


----------------------------------------------------------------------------------------------------
-- AA
----------------------------------------------------------------------------------------------------

-- AA DLZ
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.vertices    = {{25.113/2 ,25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
--tex_poly.tex_coords  = HUD_tex_coord(33, 373, 92-33, 425 - 373, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tex_poly.state_tex_coords = {
    HUD_tex_coord(1008, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --0 顶 v
    HUD_tex_coord( 848, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --1 左 >
    HUD_tex_coord(1008, 784, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --2 下 ^
    HUD_tex_coord(1008, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --3 右 <
}
--[[
tex_poly.state_tex_coords = {
    HUD_tex_coord(1008, 944, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --0 Top v
    HUD_tex_coord( 848, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --1 Left >
    HUD_tex_coord(1008, 784, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --2 Bottom ^
    HUD_tex_coord(1008, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H), --3 Right <
}]]
tex_poly.init_pos    = {0, 0, 0}
tex_poly.indices     = DEF_BOX_INDICES
tex_poly.controllers = {{"hud_AA_dlz_caret", 25.113/2}}
tex_poly.parent_element = 'hpt_designator'
AddElementObject(tex_poly)

-- AA ASE Ring
ase_circle             = CreateElement "ceSimpleLineObject"
ase_circle.material    = HUD_MAT_DEF
ase_circle.width       = 1.0/2 -- 1.256/2
ase_circle.init_pos    = {0, general_vert_bias, 0} -- vert_bias
ase_circle.controllers = {{"hud_AA_ase_circle", 72}}
AddElementObject(ase_circle)


-- AA PIP Dot
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND2
tex_poly.name        = "hud_AA_pip_dot"
tex_poly.vertices    = {{25.113/2,25.113/2},{25.113/2,-25.113/2},{-25.113/2,-25.113/2},{-25.113/2,25.113/2}}
tex_poly.tex_coords  = HUD_tex_coord(780,   0, 160, 160, HUD_TEX_IND2_W, HUD_TEX_IND2_H)
tex_poly.init_pos    = {0, 0, 0}
tex_poly.controllers = { {"hud_AA_pip_dot"},}
tex_poly.indices     = DEF_BOX_INDICES
AddElementObject(tex_poly)

-- IR Seeker
tex_poly             = CreateElement "ceTexPoly"
tex_poly.material    = HUD_TEX_IND1
tex_poly.name        = "hud_irseeker"
tex_poly.vertices    = {{25.113/2,25.113/2},{25.113/2,-25.113/2},{-25.113/2,-25.113/2},{-25.113/2,25.113/2}}
tex_poly.tex_coords  = HUD_tex_coord(688, 624, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
tex_poly.init_pos    = {0, 0, 0}
tex_poly.controllers = { {"hud_irseeker"},}
tex_poly.indices     = DEF_BOX_INDICES
AddElementObject(tex_poly)


-- CAC mode radar scan boundary
rdr_ant_scan_zone                = CreateElement "ceSimpleLineObject"
rdr_ant_scan_zone.name           = "rdr_cac_ant_scan_zone"
--rdr_ant_scan_zone.material       = HUD_MAT_DEF
rdr_ant_scan_zone.material       = HUD_LINE_DEF
--rdr_ant_scan_zone.init_pos       = {0, vert_bias, 0}
rdr_ant_scan_zone.tex_params     = {{0, 0.5}, {1, 0.5}, {1 / (1024 * 100 / 275), 1}}
rdr_ant_scan_zone.width          = 1.256/2
rdr_ant_scan_zone.controllers    = {{"rdr_cac_ant_scan_zone"}}
AddToGunCross(rdr_ant_scan_zone)


----------------------------------------------------------------------------------------------------
-- AG
----------------------------------------------------------------------------------------------------

function AG_Bomb_CCIP_Solution()
    local ccip_base = CreateElement "ceSimple"
    ccip_base.controllers = {{"hud_AG_CCIP_bomb_pipper_presence"}}
    AddToFPM(ccip_base)

    -- CCIP aiming reticle
    local ccip           = CreateElement "ceTexPoly"
    ccip.material        = HUD_TEX_IND2
    ccip.name            = "ccip_pipper"
    --ccip.parent_element  = ccip_base.name
    ccip.init_pos        = {0,0}
    ccip.vertices        = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
    ccip.tex_coords      = HUD_tex_coord(435, 390, 120, 120, HUD_TEX_IND2_W, HUD_TEX_IND2_H)
    ccip.indices         = DEF_BOX_INDICES
    ccip.controllers     = {{"hud_AG_CCIP_bomb_pipper"}}

    AddHUDElement(ccip)

    local ccip_bomb_fall_line_solid          = CreateElement "ceSimpleLineObject"
    ccip_bomb_fall_line_solid.material       = HUD_MAT_DEF
    ccip_bomb_fall_line_solid.width          = 1.256/2
    ccip_bomb_fall_line_solid.vertices       = {{0,0},{0,-80}}
    ccip_bomb_fall_line_solid.controllers    = {{"hud_AG_CCIP_bomb_fall_line", 0}}
    AddHUDElement(ccip_bomb_fall_line_solid)

    local ccip_bomb_fall_line_dash           = CreateElement "ceSimpleLineObject"
    ccip_bomb_fall_line_dash.material        = HUD_LINE_DEF
    ccip_bomb_fall_line_dash.tex_params      = {{0, 0.5}, {1, 0.5}, {1 / (1024 * 100 / 275), 1}}
    ccip_bomb_fall_line_dash.width           = 1.256/2
    ccip_bomb_fall_line_dash.vertices        = {{0,0},{0,-80}}
    ccip_bomb_fall_line_dash.controllers     = {{"hud_AG_CCIP_bomb_fall_line", 1}}
    AddHUDElement(ccip_bomb_fall_line_dash)
end

AG_Bomb_CCIP_Solution()
------------------------------

-- AG GUN CCIP aiming reticle
local gun_AG_pipper          = CreateElement "ceTexPoly"
gun_AG_pipper.material       = HUD_TEX_IND1
gun_AG_pipper.name           = "AG_gun_pipper"
gun_AG_pipper.init_pos       = {0,-50}
gun_AG_pipper.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
gun_AG_pipper.tex_coords     = HUD_tex_coord(368, 784, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
gun_AG_pipper.indices        = DEF_BOX_INDICES
gun_AG_pipper.controllers    = {{"hud_AG_gun_pipper"}}

AddToGunCross(gun_AG_pipper)

----------------------------------------------------------------------------------------------------
-- AG ROCKET CCIP aiming reticle
local AG_rocket_pipper           = CreateElement "ceTexPoly"
AG_rocket_pipper.material        = HUD_TEX_IND1
AG_rocket_pipper.name            = "AG_rocket_pipper"
AG_rocket_pipper.init_pos        = {0,0}

AG_rocket_pipper.vertices        = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
AG_rocket_pipper.tex_coords      = HUD_tex_coord(1008, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
AG_rocket_pipper.indices         = DEF_BOX_INDICES
AG_rocket_pipper.controllers     = {{"hud_AG_rocket_pipper"}}

AddHUDElement(AG_rocket_pipper)

-- AG BRM1 ROCKET ASE
brm1_ase_circle             = CreateElement "ceSimpleLineObject"
brm1_ase_circle.material    = HUD_MAT_DEF
brm1_ase_circle.width       = 1.0/2 -- 1.256/2
brm1_ase_circle.init_pos    = {0, general_vert_bias, 0} -- vert_bias
brm1_ase_circle.controllers = {{"hud_AG_brm1_ase_circle", 72}}
AddElementObject(brm1_ase_circle)

----------------------------------------------------------------------------------------------------
-- AG TDC indicator
local AG_tdc           = CreateElement "ceTexPoly"
AG_tdc.material        = HUD_TEX_IND1
AG_tdc.name            = "AG_tdc"
AG_tdc.init_pos        = {0,0}
AG_tdc.vertices        = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
AG_tdc.tex_coords      = HUD_tex_coord(368, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
AG_tdc.indices         = DEF_BOX_INDICES
AG_tdc.controllers     = {{"hud_TDC", range_l, range_r, range_u, range_d2}}
AG_tdc.isdraw          = false
AddHUDElement(AG_tdc)

-- DTOS aiming reticle
function AG_Bomb_DTOS_Solution()
    local AG_DTOS           = CreateElement "ceTexPoly"
    AG_DTOS.material        = HUD_TEX_IND2
    AG_DTOS.name            = "AG_DTOS"
    AG_DTOS.init_pos        = {0,0}
    AG_DTOS.vertices        = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
    AG_DTOS.tex_coords      = HUD_tex_coord(435, 390, 120, 120, HUD_TEX_IND2_W, HUD_TEX_IND2_H)
    AG_DTOS.indices         = DEF_BOX_INDICES
    AG_DTOS.controllers     = {{"hud_DTOS", range_l, range_r, range_u, range_d2}}
    AG_DTOS.isdraw          = true
    AddHUDElement(AG_DTOS)

    local dtos_fall_line_solid          = CreateElement "ceSimpleLineObject"
    dtos_fall_line_solid.material       = HUD_MAT_DEF
    dtos_fall_line_solid.width          = 1.256/2
    dtos_fall_line_solid.vertices       = {{0,0},{0,-80}}
    dtos_fall_line_solid.controllers    = {{"hud_DTOS_fall_line", 0, range_l, range_r, range_u, range_d2}}
    AddHUDElement(dtos_fall_line_solid)

    local dtos_fall_line_dash           = CreateElement "ceSimpleLineObject"
    dtos_fall_line_dash.material        = HUD_LINE_DEF
    dtos_fall_line_dash.tex_params      = {{0, 0.5}, {1, 0.5}, {1 / (1024 * 100 / 275), 1}}
    dtos_fall_line_dash.width           = 1.256/2
    dtos_fall_line_dash.vertices        = {{0,0},{0,-80}}
    dtos_fall_line_dash.controllers     = {{"hud_DTOS_fall_line", 1, range_l, range_r, range_u, range_d2}}
    AddHUDElement(dtos_fall_line_dash)
end

AG_Bomb_DTOS_Solution()


-- DIR aiming reticle
function AG_Bomb_DIR_Solution()
    local AG_DIR           = CreateElement "ceTexPoly"
    AG_DIR.material        = HUD_TEX_IND2
    AG_DIR.name            = "AG_DIR"
    AG_DIR.init_pos        = {0,0}
    AG_DIR.vertices        = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
    AG_DIR.tex_coords      = HUD_tex_coord(435, 390, 120, 120, HUD_TEX_IND2_W, HUD_TEX_IND2_H)
    AG_DIR.indices         = DEF_BOX_INDICES
    AG_DIR.controllers     = {{"hud_DIR", range_l, range_r, range_u, range_d2}}
    AG_DIR.isdraw          = true
    AddHUDElement(AG_DIR)

    local dis_fall_line_dash           = CreateElement "ceSimpleLineObject"
    dis_fall_line_dash.material        = HUD_LINE_DEF
    dis_fall_line_dash.tex_params      = {{0, 0.5}, {1, 0.5}, {1 / (1024 * 100 / 275), 1}}
    dis_fall_line_dash.width           = 1.256/2
    dis_fall_line_dash.vertices        = {{0,0},{0,-80}}
    dis_fall_line_dash.controllers     = {{"hud_DIR_fall_line", range_l, range_r, range_u, range_d2}}
    AddHUDElement(dis_fall_line_dash)
end

AG_Bomb_DIR_Solution()

----------------------------------------------------------------------------------------------------
local function CCRP_PipperAndCue()
    -- bind to pipper
    local CCRP_pipper_line           = CreateElement "ceSimpleLineObject"
    CCRP_pipper_line.material        = HUD_MAT_DEF
    CCRP_pipper_line.width           = 1.256/2
    CCRP_pipper_line.vertices        = {{0,HUD_HALF_HEIGHT},{0, -1 * HUD_HALF_HEIGHT}}
    CCRP_pipper_line.controllers     = {{"hud_CCRP_pipper_line", HUD_HALF_HEIGHT * GetScale()}}
    CCRP_pipper_line.parent_element  = fpm_name -- in HUD_NORMAL.lua
    AddHUDElement(CCRP_pipper_line)

    local CCRP_cue          = CreateElement "ceTexPoly"
    CCRP_cue.material       = HUD_TEX_IND1
    CCRP_cue.vertices       = {{20.09 /2, 20.09/2},{20.09/2, -20.09/2},{-20.09/2, -20.09/2},{-20.09/2, 20.09/2}}
    CCRP_cue.tex_coords     = HUD_tex_coord(0, 584, 128, 128, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
    CCRP_cue.indices        = DEF_BOX_INDICES
    CCRP_cue.controllers    = {{"hud_CCRP_Cue", HUD_HALF_HEIGHT * GetScale()}}
    CCRP_cue.parent_element = CCRP_pipper_line.name
    AddHUDElement(CCRP_cue)

end

local function CCRP_PipperAndCue_New()
    local ccrp_sol_bar_len = 40 -- mr
    local bar_bias = 15

    local ccrp_line_base          = CreateElement "ceSimple"
    ccrp_line_base.name           = "ccrp_line_base"
    ccrp_line_base.controllers    = {{"hud_CCRP_pipper_line", 2 * HUD_HALF_HEIGHT * GetScale(), 1}}
    ccrp_line_base.parent_element = fpm_name
    AddHUDElement(ccrp_line_base)

    -- bind to pipper
    local CCRP_pipper_line_up           = CreateElement "ceSimpleLineObject"
    CCRP_pipper_line_up.material        = HUD_MAT_DEF
    CCRP_pipper_line_up.width           = 1.256/2
    CCRP_pipper_line_up.vertices        = {{0,HUD_HALF_HEIGHT},{0, 0.25 * HUD_HALF_HEIGHT}}
    CCRP_pipper_line_up.vertices        = {{0,HUD_HALF_HEIGHT},{0, ccrp_sol_bar_len + bar_bias}}
    CCRP_pipper_line_up.parent_element  = ccrp_line_base.name -- in HUD_NORMAL.lua
    AddHUDElement(CCRP_pipper_line_up)

    local CCRP_pipper_line_dn           = CreateElement "ceSimpleLineObject"
    CCRP_pipper_line_dn.material        = HUD_MAT_DEF
    CCRP_pipper_line_dn.width           = 1.256/2
    CCRP_pipper_line_dn.vertices        = {{0,0},{0, -1 * HUD_HALF_HEIGHT}}
    CCRP_pipper_line_dn.parent_element  = ccrp_line_base.name -- in HUD_NORMAL.lua
    AddHUDElement(CCRP_pipper_line_dn)

    local ccrp_sol_line_solid          = CreateElement "ceSimpleLineObject"
    ccrp_sol_line_solid.material       = HUD_MAT_DEF
    ccrp_sol_line_solid.width          = 1.256/2
    ccrp_sol_line_solid.vertices       = {{0,0},{0, ccrp_sol_bar_len}}
    ccrp_sol_line_solid.controllers    = {{"hud_CCRP_sol_line", 0, ccrp_sol_bar_len * GetScale(), bar_bias * GetScale()}}
    AddHUDElement(ccrp_sol_line_solid)

    local ccrp_sol_line_dash           = CreateElement "ceSimpleLineObject"
    ccrp_sol_line_dash.material        = HUD_LINE_DEF
    ccrp_sol_line_dash.tex_params      = {{0, 0.5}, {1, 0.5}, {1 / (1024 * 100 / 275), 1}}
    ccrp_sol_line_dash.width           = 1.256/2
    ccrp_sol_line_dash.vertices        = {{0,0},{0, ccrp_sol_bar_len}}
    ccrp_sol_line_dash.controllers     = {{"hud_CCRP_sol_line", 1, ccrp_sol_bar_len * GetScale(), bar_bias * GetScale()}}
    AddHUDElement(ccrp_sol_line_dash)

end

--CCRP_PipperAndCue()
CCRP_PipperAndCue_New()
----------------------------------------------------------------------------------------------------


---- AG sensor etc
-- WMD7 pointing indicator symbol
hud_wmd7             = CreateElement "ceTexPoly"
hud_wmd7.material    = HUD_TEX_IND1
hud_wmd7.name        = "hud_wmd7"
hud_wmd7.vertices    = {{25.113/2,25.113/2},{25.113/2,-25.113/2},{-25.113/2,-25.113/2},{-25.113/2,25.113/2}}
hud_wmd7.tex_coords  = HUD_tex_coord(688, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_wmd7.init_pos    = {0, 0, 0}
hud_wmd7.controllers = { {"hud_wmd7"},}
hud_wmd7.indices     = DEF_BOX_INDICES
AddElementObject(hud_wmd7)

-- TVIR sensor (C-701T) pointing indicator symbol
hud_tvir             = CreateElement "ceTexPoly"
hud_tvir.material    = HUD_TEX_IND1
hud_tvir.name        = "hud_tvir"
hud_tvir.vertices    = {{25.113/2,25.113/2},{25.113/2,-25.113/2},{-25.113/2,-25.113/2},{-25.113/2,25.113/2}}
hud_tvir.tex_coords  = HUD_tex_coord(368, 784, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
hud_tvir.init_pos    = {0, 0, 0}
hud_tvir.controllers = {{"hud_tvir"},}
hud_tvir.indices     = DEF_BOX_INDICES
AddElementObject(hud_tvir)


----------------------------------------------------------------------------------------------------
-- Gun
----------------------------------------------------------------------------------------------------

-- AA gun line, NO LOCK
local feds_line_snake        = CreateElement "ceSimpleLineObject"
feds_line_snake.name         = "feds_line_snake"
feds_line_snake.material     = HUD_MAT_DEF
feds_line_snake.width        = 1.256/2
feds_line_snake.controllers  = {{"hud_feds_line"}}
AddToGunCross(feds_line_snake)

-- 600m marker
local feds_line_snake_mark_600        = CreateElement "ceSimpleLineObject"
feds_line_snake_mark_600.material     = HUD_MAT_DEF
feds_line_snake_mark_600.vertices     = {{-12,0},{12,0}}
feds_line_snake_mark_600.width        = 1.256/2
feds_line_snake_mark_600.controllers  = {{"hud_feds_line_mark_600"}}
AddToGunCross(feds_line_snake_mark_600)

-- 1000m marker
local feds_line_snake_mark_1000        = CreateElement "ceSimpleLineObject"
feds_line_snake_mark_1000.material     = HUD_MAT_DEF
feds_line_snake_mark_1000.vertices     = {{-12,0},{12,0}}
feds_line_snake_mark_1000.width        = 1.256/2
feds_line_snake_mark_1000.controllers  = {{"hud_feds_line_mark_1000"}}
AddToGunCross(feds_line_snake_mark_1000)


local gun_AA_lcos_line          = CreateElement "ceSimpleLineObject"
gun_AA_lcos_line.name           = "gun_AA_lcos_line"
gun_AA_lcos_line.material       = HUD_MAT_DEF
gun_AA_lcos_line.width          = 1.256/2
gun_AA_lcos_line.controllers    = {{"gun_AA_lcos_line", vert_bias/1000}}
AddToGunCross(gun_AA_lcos_line)


local gun_AA_pipper          = CreateElement "ceTexPoly"
gun_AA_pipper.name           = "AA_gun_pipper"
gun_AA_pipper.material       = HUD_TEX_IND1
gun_AA_pipper.tex_coords     = HUD_tex_coord(640, 784, 360, 360, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
gun_AA_pipper.indices        = DEF_BOX_INDICES
gun_AA_pipper.vertices       = {{54.62/2, 54.62/2},{54.62/2, -54.62/2},{-54.62/2, -54.62/2},{-54.62/2, 54.62/2}}
gun_AA_pipper.init_pos       = {0, 0, 0}
gun_AA_pipper.controllers    = {{"hud_AA_gun_pipper"}}
AddToGunCross(gun_AA_pipper)


local gun_AA_pipper_dist_arc          = CreateElement "ceSimpleLineObject"
gun_AA_pipper_dist_arc.name           = "gun_AA_pipper_dist_arc"
gun_AA_pipper_dist_arc.material       = HUD_MAT_DEF
gun_AA_pipper_dist_arc.width          = 1.2
gun_AA_pipper_dist_arc.controllers    = {{"gun_AA_pipper_dist_arc", 100/180*54.62/2/1000}}
gun_AA_pipper_dist_arc.parent_element = gun_AA_pipper.name
AddToGunCross(gun_AA_pipper_dist_arc)

local gun_AA_pipper_appr          = CreateElement "ceTexPoly"
gun_AA_pipper_appr.material       = HUD_TEX_IND2
gun_AA_pipper_appr.name           = "gun_AA_pipper_appr"
gun_AA_pipper_appr.vertices       = {{54.62/2, 54.62/2},{54.62/2, -54.62/2},{-54.62/2, -54.62/2},{-54.62/2, 54.62/2}}
gun_AA_pipper_appr.tex_coords     = HUD_tex_coord(75, 390, 360, 360, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
gun_AA_pipper_appr.indices        = DEF_BOX_INDICES
gun_AA_pipper_appr.controllers    = {{"hud_AA_gun_pipper_appr", 600}}
gun_AA_pipper_appr.parent_element = gun_AA_pipper.name
AddToGunCross(gun_AA_pipper_appr)


---------------------------------
-- stand-off weapon envelop
---------------------------------

-- env base
local standoff_base          = CreateElement "ceSimple"
standoff_base.name           = "standoff_base"
standoff_base.init_pos       = {0, general_vert_bias, 0} -- vert_bias
standoff_base.controllers    = {{"hud_standoff_wpn_env"}}
AddElementObject(standoff_base)

----
standoff_wpn_bar_top                = CreateElement "ceTexPoly"
standoff_wpn_bar_top.material       = HUD_TEX_IND3
standoff_wpn_bar_top.name           = 'hud_standoff_wpn_bar_top'
standoff_wpn_bar_top.vertices       = {{23.543/2, 58/15*23.543/2},{23.543/2, -58/15*23.543/2},{-23.543/2, -58/15*23.543/2},{-23.543/2, 58/15*23.543/2}}
--standoff_wpn_bar_top.tex_coords     = HUD_tex_coord(   0,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_bar_top.state_tex_coords = {
    HUD_tex_coord( 450,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- sold 160
    HUD_tex_coord( 900,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- dashed
}
standoff_wpn_bar_top.init_pos       = {0, 58/15*23.543/2, 0}
standoff_wpn_bar_top.init_rot       = {90, 0, 0}
standoff_wpn_bar_top.indices        = DEF_BOX_INDICES
standoff_wpn_bar_top.parent_element = standoff_base.name
standoff_wpn_bar_top.controllers    = {{"hud_standoff_wpn_bar", 0}}
AddElementObject(standoff_wpn_bar_top)

----
standoff_wpn_bar_btn                = CreateElement "ceTexPoly"
standoff_wpn_bar_btn.material       = HUD_TEX_IND3
standoff_wpn_bar_btn.name           = 'hud_standoff_wpn_bar_btn'
standoff_wpn_bar_btn.vertices       = {{23.543/2, 58/15*23.543/2},{23.543/2, -58/15*23.543/2},{-23.543/2, -58/15*23.543/2},{-23.543/2, 58/15*23.543/2}}
--standoff_wpn_bar_btn.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
standoff_wpn_bar_btn.state_tex_coords = {
    HUD_tex_coord( 450,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- sold 160
    HUD_tex_coord( 900,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- dashed
}
standoff_wpn_bar_btn.init_pos       = {0, -58/15*23.543/2, 0}
standoff_wpn_bar_btn.init_rot       = {-90, 0, 0}
standoff_wpn_bar_btn.indices        = DEF_BOX_INDICES
standoff_wpn_bar_btn.parent_element = standoff_base.name
standoff_wpn_bar_btn.controllers    = {{"hud_standoff_wpn_bar", 1}}
AddElementObject(standoff_wpn_bar_btn)

----
standoff_wpn_bar_left                = CreateElement "ceTexPoly"
standoff_wpn_bar_left.material       = HUD_TEX_IND3
standoff_wpn_bar_left.name           = 'hud_standoff_wpn_bar_left'
standoff_wpn_bar_left.vertices       = {{23.543/2, 58/15*23.543/2},{23.543/2, -58/15*23.543/2},{-23.543/2, -58/15*23.543/2},{-23.543/2, 58/15*23.543/2}}
--standoff_wpn_bar_left.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
standoff_wpn_bar_left.state_tex_coords = {
    HUD_tex_coord( 150,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- sold 160
    HUD_tex_coord( 600,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- dashed
}
standoff_wpn_bar_left.init_pos       = {-58/15*23.543/2, 0, 0}
standoff_wpn_bar_left.indices        = DEF_BOX_INDICES
standoff_wpn_bar_left.parent_element = standoff_base.name
standoff_wpn_bar_left.controllers    = {{"hud_standoff_wpn_bar", 2}}
AddElementObject(standoff_wpn_bar_left)

----
standoff_wpn_bar_right                = CreateElement "ceTexPoly"
standoff_wpn_bar_right.material       = HUD_TEX_IND3
standoff_wpn_bar_right.name           = 'hud_standoff_wpn_bar_right'
standoff_wpn_bar_right.vertices       = {{23.543/2, 58/15*23.543/2},{23.543/2, -58/15*23.543/2},{-23.543/2, -58/15*23.543/2},{-23.543/2, 58/15*23.543/2}}
--standoff_wpn_bar_right.tex_coords  = HUD_tex_coord(528, 464, 160, 160, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
standoff_wpn_bar_right.state_tex_coords = {
    HUD_tex_coord( 300,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- sold 160
    HUD_tex_coord( 750,   0, 150, 580, HUD_TEX_IND3_W, HUD_TEX_IND3_H), -- dashed
}
standoff_wpn_bar_right.init_pos       = {58/15*23.543/2, 0, 0}
standoff_wpn_bar_right.indices        = DEF_BOX_INDICES
standoff_wpn_bar_right.parent_element = standoff_base.name
standoff_wpn_bar_right.controllers    = {{"hud_standoff_wpn_bar", 3}}
AddElementObject(standoff_wpn_bar_right)


----
standoff_wpn_tick_top                = CreateElement "ceTexPoly"
standoff_wpn_tick_top.material       = HUD_TEX_IND3
standoff_wpn_tick_top.name           = 'hud_standoff_wpn_tick_top'
standoff_wpn_tick_top.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_tick_top.tex_coords     = HUD_tex_coord(760, 740, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_tick_top.init_pos       = {0, 58/15*23.543/2, 0}
standoff_wpn_tick_top.indices        = DEF_BOX_INDICES
standoff_wpn_tick_top.parent_element = standoff_base.name
standoff_wpn_tick_top.controllers    = {{"hud_standoff_wpn_tick", 0, 58/15*23.543/2}}
AddElementObject(standoff_wpn_tick_top)

----
standoff_wpn_tick_btn                = CreateElement "ceTexPoly"
standoff_wpn_tick_btn.material       = HUD_TEX_IND3
standoff_wpn_tick_btn.name           = 'hud_standoff_wpn_tick_btn'
standoff_wpn_tick_btn.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_tick_btn.tex_coords     = HUD_tex_coord(760, 580, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_tick_btn.init_pos       = {0, -58/15*23.543/2, 0}
standoff_wpn_tick_btn.indices        = DEF_BOX_INDICES
standoff_wpn_tick_btn.parent_element = standoff_base.name
standoff_wpn_tick_btn.controllers    = {{"hud_standoff_wpn_tick", 1, 58/15*23.543/2}}
AddElementObject(standoff_wpn_tick_btn)

----
standoff_wpn_tick_left                = CreateElement "ceTexPoly"
standoff_wpn_tick_left.material       = HUD_TEX_IND3
standoff_wpn_tick_left.name           = 'hud_standoff_wpn_tick_right'
standoff_wpn_tick_left.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_tick_left.tex_coords     = HUD_tex_coord(600, 580, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_tick_left.init_pos       = {-58/15*23.543/2, -58/15*23.543/4, 0}
standoff_wpn_tick_left.indices        = DEF_BOX_INDICES
standoff_wpn_tick_left.parent_element = standoff_base.name
standoff_wpn_tick_left.controllers    = {{"hud_standoff_wpn_tick", 2, 58/15*23.543/2}}
AddElementObject(standoff_wpn_tick_left)

----
standoff_wpn_tick_right_in                = CreateElement "ceTexPoly"
standoff_wpn_tick_right_in.material       = HUD_TEX_IND3
standoff_wpn_tick_right_in.name           = 'hud_standoff_wpn_tick_right_in'
standoff_wpn_tick_right_in.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_tick_right_in.tex_coords     = HUD_tex_coord(600, 580, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_tick_right_in.init_pos       = {58/15*23.543/2, -58/15*23.543/4, 0}
standoff_wpn_tick_right_in.indices        = DEF_BOX_INDICES
standoff_wpn_tick_right_in.parent_element = standoff_base.name
standoff_wpn_tick_right_in.controllers    = {{"hud_standoff_wpn_tick", 3, 58/15*23.543/2}}
AddElementObject(standoff_wpn_tick_right_in)

----
standoff_wpn_tick_right_out                = CreateElement "ceTexPoly"
standoff_wpn_tick_right_out.material       = HUD_TEX_IND3
standoff_wpn_tick_right_out.name           = 'hud_standoff_wpn_tick_right_out'
standoff_wpn_tick_right_out.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_tick_right_out.tex_coords     = HUD_tex_coord(920, 580, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_tick_right_out.init_pos       = {58/15*23.543/2, -58/15*23.543/4, 0}
standoff_wpn_tick_right_out.indices        = DEF_BOX_INDICES
standoff_wpn_tick_right_out.parent_element = standoff_base.name
standoff_wpn_tick_right_out.controllers    = {{"hud_standoff_wpn_tick", 4, 58/15*23.543/2}}
AddElementObject(standoff_wpn_tick_right_out)

----
standoff_wpn_target                = CreateElement "ceTexPoly"
standoff_wpn_target.material       = HUD_TEX_IND3
standoff_wpn_target.name           = 'hud_standoff_wpn_target'
standoff_wpn_target.vertices       = {{25.113/2, 25.113/2},{25.113/2, -25.113/2},{-25.113/2, -25.113/2},{-25.113/2, 25.113/2}}
standoff_wpn_target.tex_coords     = HUD_tex_coord(600, 740, 160, 160, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_target.init_pos       = {0, -58/15*23.543/2, 0}
standoff_wpn_target.indices        = DEF_BOX_INDICES
standoff_wpn_target.parent_element = standoff_base.name
standoff_wpn_target.controllers    = {{"hud_standoff_wpn_target", 58/15*23.543, 58/15*23.543/2}}
AddElementObject(standoff_wpn_target)

----
standoff_wpn_nolaunch                = CreateElement "ceTexPoly"
standoff_wpn_nolaunch.material       = HUD_TEX_IND3
standoff_wpn_nolaunch.name           = 'hud_standoff_wpn_nolaunch'
standoff_wpn_nolaunch.vertices       = {{3.75*25.113/2, 3.75*25.113/2},{3.75*25.113/2, -3.75*25.113/2},{-3.75*25.113/2, -3.75*25.113/2},{-3.75*25.113/2, 3.75*25.113/2}}
standoff_wpn_nolaunch.tex_coords     = HUD_tex_coord(0, 580, 600, 600, HUD_TEX_IND3_W, HUD_TEX_IND3_H)
standoff_wpn_nolaunch.init_pos       = {0, 0, 0}
standoff_wpn_nolaunch.indices        = DEF_BOX_INDICES
standoff_wpn_nolaunch.parent_element = standoff_base.name
standoff_wpn_nolaunch.controllers    = {{"standoff_wpn_nolaunch"}}
AddElementObject(standoff_wpn_nolaunch)
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------