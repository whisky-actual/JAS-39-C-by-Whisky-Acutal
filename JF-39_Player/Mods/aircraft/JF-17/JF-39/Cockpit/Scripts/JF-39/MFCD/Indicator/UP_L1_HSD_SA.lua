

airspace_b_line                 = CreateElement "ceSimpleLineObject"
airspace_b_line.name            = "airspace_b_line"
airspace_b_line.material        = MFCD_MATERIAL_CYAN
airspace_b_line.width           = 0.003
airspace_b_line.init_pos        = {0, FWD_COMP_BIAS, 0}
airspace_b_line.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
airspace_b_line.h_clip_relation = h_clip_relations.COMPARE
airspace_b_line.controllers     = {{"airspace_line", 1.0}}
airspace_b_line.isdraw          = false
airspace_b_line.use_mipfilter   = true
airspace_b_line.additive_alpha  = true
AddToUpper(airspace_b_line)

airspace_a_line                 = CreateElement "ceSimpleLineObject"
airspace_a_line.name            = "airspace_a_line"
airspace_a_line.material        = MFCD_MATERIAL_PURPLE
airspace_a_line.width           = 0.003
airspace_a_line.init_pos        = {0, FWD_COMP_BIAS, 0}
airspace_a_line.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
airspace_a_line.h_clip_relation = h_clip_relations.COMPARE
airspace_a_line.controllers     = {{"airspace_line", 0.0}}
airspace_a_line.isdraw          = false
airspace_a_line.use_mipfilter   = true
airspace_a_line.additive_alpha  = true
AddToUpper(airspace_a_line)


rdr_env_line                 = CreateElement "ceSimpleLineObject"
rdr_env_line.name            = "rdr_env_line"
rdr_env_line.material        = MFCD_MATERIAL_WHITE
rdr_env_line.width           = 0.003
rdr_env_line.init_pos        = {0, FWD_COMP_BIAS, 0}
rdr_env_line.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
rdr_env_line.h_clip_relation = h_clip_relations.COMPARE
rdr_env_line.controllers     = {{"dl_update_rdr_env", 1.0}}
rdr_env_line.isdraw          = false
rdr_env_line.use_mipfilter   = true
rdr_env_line.additive_alpha  = true
AddToUpper(rdr_env_line)


msl_env_line                 = CreateElement "ceSimpleLineObject"
msl_env_line.name            = "msl_env_line"
--msl_env_line.material        = MFCD_MATERIAL_RED
msl_env_line.material        = MFCD_LINE_RED
msl_env_line.tex_params      = {{0, 0.5}, {1, 0.5}, {0.4, 1}}
msl_env_line.width           = 0.003
msl_env_line.init_pos        = {0, FWD_COMP_BIAS, 0}
msl_env_line.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
msl_env_line.h_clip_relation = h_clip_relations.COMPARE
msl_env_line.controllers     = {{"dl_update_msl_env", 1.0}}
msl_env_line.isdraw          = false
msl_env_line.use_mipfilter   = true
msl_env_line.additive_alpha  = true
AddToUpper(msl_env_line)




rwr_bound_l = fwd_square_clip.vertices[3][1]
rwr_bound_r = fwd_square_clip.vertices[1][1]
rwr_bound_u = fwd_square_clip.vertices[1][2] - FWD_COMP_BIAS
rwr_bound_d = fwd_square_clip.vertices[3][2] - FWD_COMP_BIAS


----[[ DL ]]
local hh = 246.667/1500

-- contact
local MAX_DL_CONTACTS = SA_CONTACT_NUM_SHARED
for cat = 0, 2 do
    for c = (MAX_DL_CONTACTS-1), 0, -1 do
        -- Target template
        local tex_poly        = CreateElement "ceTexPoly"
        tex_poly.init_pos     = {0, FWD_COMP_BIAS, 0}
        if cat > 0 then
            tex_poly.name     = 'sa_dl_contact_' .. c .. '_' .. cat
        else
            tex_poly.name     = 'sa_rdr_contact_' .. c .. '_0'
        end
        tex_poly.vertices     = {{hh, hh}, {hh,-hh}, {-hh,-hh}, {-hh,hh},}
        tex_poly.indices      = DEF_BOX_INDICES
        --

        tex_poly.material     = MFCD_TEX_IND3
        tex_poly.state_tex_coords = {
            MFCD_tex_coord(   0, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--0 Hollow triangle: Enemy aircraft
            MFCD_tex_coord( 592, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--1 Hollow circle: Friendly aircraft
            MFCD_tex_coord( 888, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--2 Hollow square: Unidentified
            MFCD_tex_coord( 296, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--3 Hollow label: Surface target

            MFCD_tex_coord( 148, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--4 Hollow triangle + horizontal line: Enemy aircraft
            MFCD_tex_coord( 740, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--5 Hollow circle + horizontal line: Friendly aircraft
            MFCD_tex_coord(1036, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--6 Hollow square + horizontal line: Unidentified
            MFCD_tex_coord( 444, 148, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--7 Hollow label + horizontal line: Surface target
            
            -- No heading
            MFCD_tex_coord( 740, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--0 Hollow triangle: Enemy aircraft
            MFCD_tex_coord(1332, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--1 Hollow circle: Friendly aircraft
            MFCD_tex_coord(1628, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--2 Hollow square: Unidentified
            MFCD_tex_coord(1036, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--3 Hollow label: Surface target

            MFCD_tex_coord( 888, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--4 Hollow triangle + horizontal line: Enemy aircraft
            MFCD_tex_coord(1480, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--5 Hollow circle + horizontal line: Friendly aircraft
            MFCD_tex_coord(1776, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--6 Hollow square + horizontal line: Unidentified
            MFCD_tex_coord(1184, 592, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--7 Hollow label + horizontal line: Surface target
        }
        tex_poly.controllers     = {{'sa_dl_rdr_update_contact', cat, c},}
        tex_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
        tex_poly.h_clip_relation = h_clip_relations.COMPARE
        tex_poly.isdraw          = false
        tex_poly.use_mipfilter   = true
        tex_poly.additive_alpha  = false
        AddToUpper(tex_poly)

        -- net ID
        local dl_contact_id              = CreateElement 'ceStringPoly'
        dl_contact_id.material           = MFCD_FONT_DEF
        dl_contact_id.stringdefs         = MFCD_STRINGDEFS_DEF_X075
        dl_contact_id.init_pos           = {0, 0, 0}
        dl_contact_id.alignment          = 'CenterCenter'
        dl_contact_id.value              = "00"
        dl_contact_id.level              = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
        dl_contact_id.h_clip_relation    = h_clip_relations.COMPARE
        dl_contact_id.controllers        = {{'sa_dl_rdr_contact_text', cat, c, 0},}
        dl_contact_id.parent_element     = tex_poly.name

        AddToUpper(dl_contact_id)

        -- alt str
        local dl_contact_alt_str           = CreateElement "ceStringPoly"
        dl_contact_alt_str.material        = MFCD_FONT_DEF
        dl_contact_alt_str.stringdefs      = MFCD_STRINGDEFS_DEF_X075
        dl_contact_alt_str.init_pos        = {0.4*hh, -0.4*hh, 0}
        dl_contact_alt_str.alignment       = "CenterCenter"
        dl_contact_alt_str.value           = "00"
        dl_contact_alt_str.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
        dl_contact_alt_str.h_clip_relation = h_clip_relations.COMPARE
        dl_contact_alt_str.controllers     = {{"sa_dl_rdr_contact_text", cat, c, 1}}
        dl_contact_alt_str.parent_element  = tex_poly.name
        AddToUpper(dl_contact_alt_str)

        tex_poly = nil
    end
end

---- Envelope
for ii = 1, 3 do
    flight_tgt_assign_line                 = CreateElement "ceSimpleLineObject"
    flight_tgt_assign_line.name            = "flight_tgt_assign_line" .. ii
    flight_tgt_assign_line.material        = MFCD_MATERIAL_YELLOW
    flight_tgt_assign_line.tex_params      = {{0, 0.5}, {1, 0.5}, {0.4, 1}}
    flight_tgt_assign_line.width           = 0.004
    flight_tgt_assign_line.init_pos        = {0, FWD_COMP_BIAS, 0}
    flight_tgt_assign_line.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    flight_tgt_assign_line.h_clip_relation = h_clip_relations.COMPARE
    flight_tgt_assign_line.controllers     = {{"flight_tgt_assign_line", ii}}
    flight_tgt_assign_line.isdraw          = false
    flight_tgt_assign_line.use_mipfilter   = true
    flight_tgt_assign_line.additive_alpha  = true
    AddToUpper(flight_tgt_assign_line)
end


----[[ MAWS ]]
local hh = 148/106*176.667/2000

local MAX_MAWS_CONTACTS = 20
for c = (MAX_MAWS_CONTACTS-1), 0, -1 do
    -- Target symbol
    local maws_sym_poly        = CreateElement "ceTexPoly"
    maws_sym_poly.init_pos     = {0, FWD_COMP_BIAS, 0}
    maws_sym_poly.name         = 'maws_contact_' .. c .. '_0'
    maws_sym_poly.vertices     = {{hh, hh}, {hh,-hh}, {-hh,-hh}, {-hh,hh},}
    maws_sym_poly.indices      = DEF_BOX_INDICES

    maws_sym_poly.material     = MFCD_TEX_IND3
    maws_sym_poly.state_tex_coords = {
        MFCD_tex_coord( 888,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile
        MFCD_tex_coord(1036,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile UH
        MFCD_tex_coord(1184,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile LH
        MFCD_tex_coord(1900, 1900, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--11 Unknown blank
    }
    maws_sym_poly.controllers     = {{'maws_update_contact_sym', c},}
    maws_sym_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    maws_sym_poly.h_clip_relation = h_clip_relations.COMPARE
    maws_sym_poly.isdraw          = false
    maws_sym_poly.use_mipfilter   = true
    maws_sym_poly.additive_alpha  = false
    AddToUpper(maws_sym_poly)

    -- Target identification
    local maws_text_poly           = CreateElement "ceStringPoly"
    maws_text_poly.material        = MFCD_FONT_DEF
    maws_text_poly.stringdefs      = MFCD_STRINGDEFS_DEF_X075
    maws_text_poly.init_pos        = {0, 0, 0}
    maws_text_poly.alignment       = "CenterCenter"
    maws_text_poly.value           = " M "
    maws_text_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    maws_text_poly.h_clip_relation = h_clip_relations.COMPARE
    maws_text_poly.controllers     = {{"maws_update_contact_str", c}}
    maws_text_poly.parent_element  = maws_sym_poly.name
    AddToUpper(maws_text_poly)

end


----[[ RWR ]]
-- RWR illumination template
local hh = 148/106*176.667/2000

local MAX_RWR_CONTACTS = 20
for c = (MAX_RWR_CONTACTS-1), 0, -1 do
    -- Target symbol
    local rwr_sym_poly        = CreateElement "ceTexPoly"
    rwr_sym_poly.init_pos     = {0, FWD_COMP_BIAS, 0}
    rwr_sym_poly.name         = 'rwr_contact_' .. c .. '_0'
    rwr_sym_poly.vertices     = {{hh, hh}, {hh,-hh}, {-hh,-hh}, {-hh,hh},}
    rwr_sym_poly.indices      = DEF_BOX_INDICES

    rwr_sym_poly.material     = MFCD_TEX_IND3
    rwr_sym_poly.state_tex_coords = {
        MFCD_tex_coord( 444,  444, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--1 Airborne
        MFCD_tex_coord( 592,  444, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--2 Airborne with jamming
        MFCD_tex_coord( 740,  444, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--3 Airborne high threat
        MFCD_tex_coord(   0,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--4 SAM
        MFCD_tex_coord( 148,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--5 SAM high threat
        MFCD_tex_coord( 296,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--6 AAA
        MFCD_tex_coord( 444,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--7 AAA high threat
        MFCD_tex_coord( 592,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--8 Naval
        MFCD_tex_coord( 740,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--9 Naval high threat
        MFCD_tex_coord( 888,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile
        MFCD_tex_coord(1036,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile UH
        MFCD_tex_coord(1184,  296, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--10 Missile LH
        MFCD_tex_coord(1900, 1900, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),--11 Unknown blank
    }
    rwr_sym_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    rwr_sym_poly.h_clip_relation = h_clip_relations.COMPARE
    rwr_sym_poly.controllers     = {{"rwr_update_contact_sym", rwr_bound_l, rwr_bound_r, rwr_bound_u, rwr_bound_d, c}}
    rwr_sym_poly.isdraw          = false
    rwr_sym_poly.use_mipfilter   = true
    rwr_sym_poly.additive_alpha  = false
    AddToUpper(rwr_sym_poly)

    -- Target identification
    local rwr_text_poly           = CreateElement "ceStringPoly"
    rwr_text_poly.material        = MFCD_FONT_DEF
    rwr_text_poly.stringdefs      = MFCD_STRINGDEFS_DEF_X075
    rwr_text_poly.init_pos        = {0, 0, 0}
    rwr_text_poly.alignment       = "CenterCenter"
    rwr_text_poly.value           = "FA"
    rwr_text_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    rwr_text_poly.h_clip_relation = h_clip_relations.COMPARE
    rwr_text_poly.controllers     = {{"rwr_update_contact_str", rwr_bound_l, rwr_bound_r, rwr_bound_u, rwr_bound_d, c}}
    rwr_text_poly.parent_element  = rwr_sym_poly.name
    rwr_text_poly.isdraw          = false
    AddToUpper(rwr_text_poly)
    rwr_text_poly = nil


    local rwr_jam_poly           = CreateElement "ceTexPoly"
    rwr_jam_poly.init_pos        = {0, 0, 0}
    rwr_jam_poly.vertices        = {{hh, hh}, {hh,-hh}, {-hh,-hh}, {-hh,hh},}
    rwr_jam_poly.indices         = DEF_BOX_INDICES
    rwr_jam_poly.material        = MFCD_TEX_IND3
    rwr_jam_poly.state_tex_coords = {
        MFCD_tex_coord( 888,  444, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),
        MFCD_tex_coord(1036,  444, 148, 148, TEX_SIZE_X, TEX_SIZE_Y),
    }
    rwr_jam_poly.level           = HSD_NAV_LEVEL + 2 + HSD_NAV_LEVEL_SHIFT
    rwr_jam_poly.h_clip_relation = h_clip_relations.COMPARE
    rwr_jam_poly.parent_element  = rwr_sym_poly.name
    rwr_jam_poly.controllers     = {{"rwr_update_jam_sym", rwr_bound_l, rwr_bound_r, rwr_bound_u, rwr_bound_d, c}}
    rwr_jam_poly.isdraw          = false
    rwr_jam_poly.use_mipfilter   = true
    rwr_jam_poly.additive_alpha  = false
    AddToUpper(rwr_jam_poly)
end

-------------------------------------------------------------
-- HSD BACKGROUND
-------------------------------------------------------------
--[[
hsd_frame_length_half = 0.80

hsd_frame_box_clip           = CreateElement "ceMeshPoly"
hsd_frame_box_clip.name            = "hsd_frame_box_clip"
hsd_frame_box_clip.material        = MFCD_MATERIAL_W_BASE
hsd_frame_box_clip.primitivetype   = "triangles"
hsd_frame_box_clip.init_pos        = {0, -1.25, 0}
hsd_frame_box_clip.vertices        = {{-hsd_frame_length_half,  hsd_frame_length_half/2}, 
                                      { hsd_frame_length_half,  hsd_frame_length_half/2},
                                      { hsd_frame_length_half, -hsd_frame_length_half/2}, 
                                      {-hsd_frame_length_half, -hsd_frame_length_half/2}}
hsd_frame_box_clip.indices         = DEF_BOX_INDICES --{0,1,2,0,2,3 }
hsd_frame_box_clip.h_clip_relation = h_clip_relations.REWRITE_LEVEL
hsd_frame_box_clip.level           = HSD_NAV_LEVEL
hsd_frame_box_clip.isdraw          = true
hsd_frame_box_clip.isvisible       = false
hsd_frame_box_clip.use_mipfilter   = true
--hsd_frame_box_clip.additive_alpha  = true
hsd_frame_box_clip.collimated      = false
hsd_frame_box_clip.additive_alpha  = true
AddToUpper(hsd_frame_box_clip)

SQUARE                 = CreateElement "ceMeshPoly"
SQUARE.name            = "SQUARE"
SQUARE.init_pos        = {0, -1.30, 0}
SQUARE.vertices        = {{-hsd_frame_length_half,  hsd_frame_length_half/2},
                             { hsd_frame_length_half,  hsd_frame_length_half/2},
                             { hsd_frame_length_half, -hsd_frame_length_half/2},
                             {-hsd_frame_length_half, -hsd_frame_length_half/2}}
--SQUARE.tex_coords      = {{0,0},{1,0},{1,1},{0,1}}
SQUARE.indices         = DEF_BOX_INDICES
SQUARE.material        = MakeMaterial(nil,{60, 60, 60, 150})
--SQUARE.material        = MakeMaterial(nil,{57/2.50, 131/2.50, 160/2.50, 254})--Gripen Blue Day 057/255, 131/255, 160/255
SQUARE.level           = HSD_NAV_LEVEL
SQUARE.h_clip_relation = h_clip_relations.REWRITE_LEVEL
SQUARE.use_mipfilter   = false
SQUARE.additive_alpha  = false
SQUARE.element_params 	= {"JF39_MFCD"}
SQUARE.controllers    	= {{"opacity_using_parameter",0}}
--SQUARE.controllers     = {{'rdr_video_check', 0},}--{"check_map_filter", 0},
AddToUpper(SQUARE)
]]
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------