dofile(LockOn_Options.script_path .. "HUD/Indicator/HUD_defs.lua")

local clipPoly
local tex_poly
local text_strpoly

-- fpm
fpm_poly             = CreateElement "ceTexPoly"
fpm_poly.material    = HUD_TEX_IND1
fpm_poly.name        = fpm_name
fpm_poly.tex_coords  = HUD_tex_coord(128, 464, 240, 240, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
fpm_poly.init_pos    = {0, horizon_offset, 0}
fpm_poly.vertices    = {{18.834, 18.834}, {18.834,-18.834}, {-18.834,-18.834},{-18.834, 18.834}}
fpm_poly.indices     = DEF_BOX_INDICES
fpm_poly.controllers = {{"hud_fpm"},}
AddElementObject(fpm_poly)

-- fpm not ready
fpm_noti_poly                = CreateElement "ceTexPoly"
fpm_noti_poly.material       = HUD_TEX_IND1
fpm_noti_poly.tex_coords     = HUD_tex_coord(100, 0, 100, 100, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
fpm_noti_poly.init_pos       = {0, 0, 0}
fpm_noti_poly.vertices       = {{7.8475, 7.8475},{7.8475,-7.8475},{-7.8475,-7.8475},{-7.8475,7.8475}}
fpm_noti_poly.indices        = DEF_BOX_INDICES
fpm_noti_poly.parent_element = fpm_name
fpm_noti_poly.controllers    = {{"hud_fpm_noti"},}
AddElementObject(fpm_noti_poly)


--notify
text_strpoly                = CreateElement "ceStringPoly"
text_strpoly.material       = HUD_BIG_IND_FONT -- HUD_IND_FONT
text_strpoly.init_pos       = {0, -6 * DEGREE_TO_MRAD, 0}
text_strpoly.alignment      = "CenterCenter"
text_strpoly.controllers    = {{"hud_txt_cwin1"},}
text_strpoly.value          = "    " -- WARN
text_strpoly.stringdefs     = HUD_STRINGDEFS_DEF_X15
AddElementObject(text_strpoly)

--notify ALIGN
text_strpoly                = CreateElement "ceStringPoly"
text_strpoly.material       = HUD_BIG_IND_FONT -- HUD_IND_FONT
text_strpoly.init_pos       = {0, -8 * DEGREE_TO_MRAD, 0}
text_strpoly.alignment      = "CenterCenter"
text_strpoly.controllers    = {{"hud_txt_cwin2"},}
text_strpoly.value          = "    " -- ALIGN
text_strpoly.stringdefs     = HUD_STRINGDEFS_DEF_X15
AddElementObject(text_strpoly)


--
local Alt_nogo_noti           = CreateElement "ceTexPoly"
Alt_nogo_noti.material        = HUD_TEX_IND2
Alt_nogo_noti.name            = "Alt_nogo_noti"
Alt_nogo_noti.init_pos        = {0,0}
Alt_nogo_noti.vertices        = {{82.558/2, 82.558/2},{82.558/2, -82.558/2},{-82.558/2, -82.558/2},{-82.558/2, 82.558/2}}
Alt_nogo_noti.tex_coords      = HUD_tex_coord(390, 0, 390, 390, HUD_TEX_IND2_W, HUD_TEX_IND2_W)
Alt_nogo_noti.indices         = DEF_BOX_INDICES
Alt_nogo_noti.controllers     = {{"hud_nogo_noti"}}
Alt_nogo_noti.parent_element  = fpm_name
Alt_nogo_noti.isdraw          = false
AddHUDElement(Alt_nogo_noti)
---------------------------------------------------------------------------------------------------
hud_hdg_txt_pos_y = 29.382

local texts ={
    -- heading
    --{value="HDG", alignment="CenterCenter", name = "hud_hdg_txt", formats={"%s"}, init_pos={0, hud_hdg_txt_pos_y}, ctrls={{"hud_txt_hdg"},{"hud_check_declutter"},}},--Heading value
    
    --left
    {value="A",     alignment="LeftCenter",  formats={"%s"}, init_pos={-130, 20}, ctrls={{"hud_txt_lwin0"},} },
    {value="A_val", alignment="RightCenter", formats={"%s"}, init_pos={-92, 20}, ctrls={{"hud_txt_lwin1"},} },
    {value="G",     alignment="LeftCenter",  formats={"%s"}, init_pos={-130, 10},},    
    {value="G_val", alignment="RightCenter", formats={"%s"}, init_pos={-92, 10}, ctrls={{"hud_txt_lwin2"},} }, 
    {value="AS",  alignment="RightCenter", formats={"%s"}, init_pos={-110, spd_bar_vert_bias}, ctrls={{"hud_txt_lwin3"},{"hud_check_declutter"},},},
    {value="AS", alignment="RightCenter",  formats={"%s"}, init_pos={-135, spd_bar_vert_bias}, ctrls={{"hud_txt_lwin31"},{"hud_check_declutter"},}},
    --{value="M",   alignment="RightCenter",  formats={"%s"}, init_pos={-92, -110}, ctrls={{"hud_txt_lwin4"},}},--Mach number
    {value="MODE",alignment="RightCenter",  formats={"%s"}, init_pos={-92, -135}, ctrls={{"hud_txt_lwin6"},} },
    --{value="GM",  alignment="RightCenter",  formats={"%s"}, init_pos={-98, -115}, ctrls={{"hud_txt_lwin8"},} },--Peak (Maximum) Aircraft G    
    {value="*",   alignment="RightCenter", formats={"%s"}, init_pos={-112.065, -161.474}, ctrls={{"hud_txt_lwin7"},} },--HUD SOI
    
    
    --right
    --{value="FUEL", alignment="RightCenter", formats={"%s"}, init_pos={ 112.065,  11.175}, ctrls={{"hud_txt_rwin1"},} },--Total fuel
    {value="VVI",  alignment="RightCenter", formats={"%s"}, init_pos={  90.930, -105.355}, ctrls={{"hud_txt_rwin9"},{"hud_check_declutter"},}},
    --{value="BALT", alignment="RightCenter", formats={"%s"}, init_pos={ 130.272, alt_bar_vert_bias}, ctrls={{"hud_txt_rwin2"},{"hud_check_declutter"}}},--Barometric Altitude
    {value="RALT", alignment="LeftCenter",  formats={"%s"}, init_pos={ 77.535, -123.805}, ctrls={{"hud_txt_rwin3"},} },
    {value="RANGE",alignment="LeftCenter",  formats={"%s"}, init_pos={ 77.535, -133.223}, ctrls={{"hud_txt_rwin4"},} },
    {value="KTS",  alignment="LeftCenter",  formats={"%s"}, init_pos={ 77.535, -142.640}, ctrls={{"hud_txt_rwin5"},} },
    --{value="DT",   alignment="LeftCenter",  formats={"%s"}, init_pos={ 77.535, -200}, ctrls={{"hud_txt_rwin6", -9.418/2},} },--Time to Destination
    {value="FPL",  alignment="LeftCenter",  formats={"%s"}, init_pos={ -25, -180}, ctrls={{"hud_txt_rwin7", -9.418},} },
    --{value="TIME", alignment="LeftCenter",  formats={"%s"}, init_pos={ 77.535, -170.892}, ctrls={{"hud_txt_rwin8", -9.418},}},--Time
    {value="ARM", alignment="LeftCenter", formats={"%s"}, init_pos={77.535, -180}, ctrls={{"hud_txt_lwin5"},} }, -- -77.74

    --warning
    --{value="WARN", alignment="CenterCenter", formats={"%s"}, init_pos={ 0, -1 *HUD_HALF_HEIGHT*1/2}, ctrls={{"hud_txt_cwin1"},}, strdef = HUD_STRINGDEFS_DEF_X20,},
}

for i=1, #(texts) do
    text_strpoly                = CreateElement "ceStringPoly"
    text_strpoly.material       = HUD_IND_FONT
    text_strpoly.init_pos       = texts[i].init_pos
    text_strpoly.alignment      = "CenterCenter"
    text_strpoly.stringdefs     = HUD_STRINGDEFS_DEF

    if texts[i].name         then text_strpoly.name          = texts[i].name         end
    if texts[i].strdef       then text_strpoly.stringdefs    = texts[i].strdef       end
    if texts[i].alignment    then text_strpoly.alignment     = texts[i].alignment    end
    if texts[i].formats      then text_strpoly.formats       = texts[i].formats      end
    if texts[i].ctrls        then text_strpoly.controllers   = texts[i].ctrls        end
    if texts[i].value        then text_strpoly.value         = texts[i].value        end

    AddHUDElement(text_strpoly)
    text_strpoly = nil
end

-- Add caret (">") next to "AS" value
local caret_strpoly = CreateElement "ceStringPoly"
caret_strpoly.material = HUD_IND_FONT
caret_strpoly.init_pos = {-110, spd_bar_vert_bias} -- Adjust this to place the caret next to "AS"
caret_strpoly.alignment = "LeftCenter" -- Align it to the left of the "AS" value
caret_strpoly.value = ">" -- The caret symbol
caret_strpoly.stringdefs = HUD_STRINGDEFS_DEF_X15 -- Adjust string size if needed
caret_strpoly.controllers = {{"hud_check_power"}} -- Use the appropriate controller if needed
AddHUDElement(caret_strpoly)

-- Add caret (">") next to "ALT" value
local caret_alt = CreateElement "ceStringPoly"
caret_alt.material = HUD_IND_FONT
caret_alt.init_pos = {75, alt_bar_vert_bias} -- Adjust this to place the caret next to "AS"
caret_alt.alignment = "LeftCenter" -- Align it to the left of the "AS" value
caret_alt.value = ">" -- The caret symbol
caret_alt.stringdefs = HUD_STRINGDEFS_DEF_X15 -- Adjust string size if needed
caret_alt.controllers = {{"hud_check_power"}} -- Use the appropriate controller if needed
AddHUDElement(caret_alt)

-- Add caret ("^") under the hsg tape
local caret_hdg = CreateElement "ceTexPoly"
caret_hdg.name         = "caret_hdg"
caret_hdg.material     = HUD_TEX_IND1
caret_hdg.vertices     = {{-10, -8}, {0, 8}, {10, -8}} -- Flatter and thicker
caret_hdg.tex_coords   = HUD_tex_coord(0, 584, 128, 128, HUD_TEX_IND1_W, HUD_TEX_IND1_H)
caret_hdg.indices      = {0, 1, 2}
caret_hdg.init_pos     = {0, 35, 0} -- Moved up by 35 pixels
caret_hdg.controllers  = {{"hud_check_power"}}
AddHUDElement(caret_hdg)

---------------------------------------------------------------------------------------------------
-- 武器相关符号

dofile(LockOn_Options.script_path .. "HUD/Indicator/HUD_NORMAL_WPN.lua")

----------------------------------------------------------------------------------------------------
-- 基本信息和导航相关

dofile(LockOn_Options.script_path .. "HUD/Indicator/HUD_NORMAL_NAV.lua")

----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.3                       --
----------------------------------------------------------------------------------------