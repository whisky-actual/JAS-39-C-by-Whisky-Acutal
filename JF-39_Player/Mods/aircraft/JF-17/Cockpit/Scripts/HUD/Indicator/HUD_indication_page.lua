dofile(LockOn_Options.script_path .. "HUD/Indicator/HUD_def.lua")



HUD_Base                = CreateElement "ceSimple"
HUD_Base.name           = create_guid_string()
HUD_Base.init_pos       = {0, -math.rad(2531.71)}
HUD_Base.element_params = {"DisplaysBooted"}
HUD_Base.controllers    = {{"parameter_compare_with_number",0, 1}}
AddHudElement(HUD_Base)


HUD_Pitch                = CreateElement "ceSimple"
HUD_Pitch.name           = create_guid_string()
HUD_Pitch.parent_element = HUD_Base.name
HUD_Pitch.element_params = {"ROLL_HUD", "PITCH_HUD"}
HUD_Pitch.controllers    = {{"rotate_using_parameter",0, 1}, {"move_up_down_using_parameter",1, -0.600005}}
AddHudElement(HUD_Pitch)

HUD_Moving_Sides_Base                = Copy(HUD_Base)
HUD_Moving_Sides_Base.init_pos       = {0, 57.5}
HUD_Moving_Sides_Base.parent_element = HUD_Base.name
HUD_Moving_Sides_Base.element_params = {"HudSidesAOA", "HudSidesAOS"}
HUD_Moving_Sides_Base.controllers    = {{"move_up_down_using_parameter",0, 0.600005}, {"move_left_right_using_parameter",1, 0.600005}}
AddHudElement(HUD_Moving_Sides_Base)

HUD_Left_Side_Indication_Base                  = Copy(HUD_Base)
HUD_Left_Side_Indication_Base.init_pos         = {-7.59, -34.5}
HUD_Left_Side_Indication_Base.parent_element   = HUD_Moving_Sides_Base.name
AddHudElement(HUD_Left_Side_Indication_Base)

--local sides_width = math.rad(21) * 1000		/ 2
--local sides_height = math.rad(11) * 1000	/ 2
--local Y_corr = 3.3
--local alfatoGS = math.rad(8.21) * 1000 / 2
--local left_width = math.rad(2.68) * 1000
--
--SIDESSIZE                = CreateElement "ceMeshPoly"
--SIDESSIZE.name           = create_guid_string()
--SIDESSIZE.primitivetype  = "triangles"
--SIDESSIZE.material       = MakeMaterial(nil, {255, 0, 0, 22})
--SIDESSIZE.vertices       = {{-sides_width, -1}, {sides_width, -1}, {sides_width, -sides_height}, {-sides_width, -sides_height}}
--SIDESSIZE.indices        = {0,1,2 , 0,2,3}
--SIDESSIZE.init_pos       = {0, math.rad(-Y_corr) * 1000}
--SIDESSIZE.parent_element = HUD_Moving_Sides_Base.name
--AddHudElement(SIDESSIZE)
--
--
--SIDESSIZE                = CreateElement "ceMeshPoly"
--SIDESSIZE.name           = create_guid_string()
--SIDESSIZE.primitivetype  = "triangles"
--SIDESSIZE.material       = MakeMaterial(nil, {255, 0, 0, 22})
--SIDESSIZE.vertices       = {{-sides_width, sides_height}, {sides_width, sides_height}, {sides_width, 1}, {-sides_width, 1}}
--SIDESSIZE.indices        = {0,1,2 , 0,2,3}
--SIDESSIZE.init_pos       = {0, math.rad(-Y_corr) * 1000}
--SIDESSIZE.parent_element = HUD_Moving_Sides_Base.name
--AddHudElement(SIDESSIZE)
--
--
--LeftSIDESSIZE                = CreateElement "ceMeshPoly"
--LeftSIDESSIZE.name           = create_guid_string()
--LeftSIDESSIZE.primitivetype  = "triangles"
--LeftSIDESSIZE.material       = MakeMaterial(nil, {0, 255, 0, 22})
--LeftSIDESSIZE.vertices       = {{-sides_width, alfatoGS}, {-sides_width + left_width, alfatoGS}, {-sides_width + left_width, -alfatoGS}, {-sides_width, -alfatoGS}}
--LeftSIDESSIZE.indices        = {0,1,2 , 0,2,3}
--LeftSIDESSIZE.init_pos       = {0, math.rad(-Y_corr) * 1000}
--LeftSIDESSIZE.parent_element = HUD_Moving_Sides_Base.name
--AddHudElement(LeftSIDESSIZE)


HUD_DSI                = CreateElement "ceSimple"
HUD_DSI.init_pos       = {0, -254.17}
HUD_DSI.parent_element = HUD_Base.name
HUD_DSI.element_params = {"DSI_STATE", "DSI_UP"}
HUD_DSI.controllers    = {{"parameter_compare_with_number",0, 1}, {"move_up_down_using_parameter",1, 0.175}}
AddHudElement(HUD_DSI)

HUD_Landing_Mode_Indicator                = add_text_hud("L", -138, 0, HUD_DSI, "Gripen_Font_green", HUD_Normal_Size)
HUD_Landing_Mode_Indicator.element_params = {"LANDING_MODE"}
HUD_Landing_Mode_Indicator.controllers    = {{"parameter_compare_with_number",0, 1}}

HUD_Radar_Mode_Indicator                = add_text_hud("RDR", -20, 0, HUD_DSI, "Gripen_Font_green", HUD_Normal_Size)
HUD_Radar_Mode_Indicator.element_params = {"RADAR_MODE"}
HUD_Radar_Mode_Indicator.controllers    = {{"parameter_in_range",0, 0.9, 3.1}}

for i = 0, 8 do
	HUD_Weapon_Indicator                = add_text_hud_param(100, 0, "HUD_BRIGHTNESS", "PYLONINFO_" .. i, "%0.4s", HUD_DSI, HUD_Normal_Size, "Gripen_Font_green", "CenterCenter")
	HUD_Weapon_Indicator.element_params = {"HUD_BRIGHTNESS", "MASTERMODE", "SELECTED_PYLON", "PYLONINFO_" .. i}
	HUD_Weapon_Indicator.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 0}, {"parameter_compare_with_number",2, i}, {"text_using_parameter",3}}
end

--[[HUD_Aiming_Circle_Range_R = add_text_hud("R", 40, 0, HUD_DSI, "Gripen_Font_green", HUD_Normal_Size)
HUD_Aiming_Circle_Range_R.element_params = {"HUD_BRIGHTNESS", "RADAR_STT_RANGE_NM"}
HUD_Aiming_Circle_Range_R.controllers    = {{"opacity_using_parameter",0}, {"parameter_in_range",1, 0, 999}}
HUD_Aiming_Circle_Range                = add_text_hud_param(45, 0, "HUD_BRIGHTNESS", "RADAR_STT_RANGE_NM", "%0.1f", HUD_DSI, HUD_Normal_Size, "Gripen_Font_green", "LeftCenter")
HUD_Aiming_Circle_Range.element_params = {"HUD_BRIGHTNESS", "RADAR_STT_RANGE_NM"}
HUD_Aiming_Circle_Range.controllers    = {{"opacity_using_parameter",0}, {"parameter_in_range",1, 0, 999}, {"text_using_parameter",1}}]]

HUD_Velocity_Vector_Base                = CreateElement "ceSimple"
HUD_Velocity_Vector_Base.name           = create_guid_string()
HUD_Velocity_Vector_Base.parent_element = HUD_Base.name
HUD_Velocity_Vector_Base.element_params = {"VELVEC_HUD_Y", "VELVEC_HUD_X"}
HUD_Velocity_Vector_Base.controllers    = {{"move_up_down_using_parameter",0, 0.600005}, {"move_left_right_using_parameter",1, 0.600005}}
AddHudElement(HUD_Velocity_Vector_Base)


HUD_Aiming_Circle_Base                = CreateElement "ceMeshPoly"
HUD_Aiming_Circle_Base.name           = create_guid_string()
HUD_Aiming_Circle_Base.primitivetype  = "triangles"
HUD_Aiming_Circle_Base.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Aiming_Circle_Base.parent_element = HUD_Velocity_Vector_Base.name
HUD_Aiming_Circle_Base.element_params = {"HUD_BRIGHTNESS", "MASTERMODE"}
HUD_Aiming_Circle_Base.controllers    = {{"opacity_using_parameter",0}, {"parameter_in_range",1, 0.9,4.1}}
set_circle(HUD_Aiming_Circle_Base, 0.9, 0, 360, 8)
AddHudElement(HUD_Aiming_Circle_Base)


HUD_Aiming_Circle_Left_Gun_Line                = CreateElement "ceSimpleLineObject"
HUD_Aiming_Circle_Left_Gun_Line.name           = create_guid_string()
HUD_Aiming_Circle_Left_Gun_Line.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Aiming_Circle_Left_Gun_Line.parent_element = HUD_Aiming_Circle_Base.name
HUD_Aiming_Circle_Left_Gun_Line.vertices       = {{-17.5, -7}, {-17.5, 7}}
HUD_Aiming_Circle_Left_Gun_Line.width          = 0.7
HUD_Aiming_Circle_Left_Gun_Line.element_params = {"HUD_BRIGHTNESS", "MASTERMODE", "ROLL_HUD"}
HUD_Aiming_Circle_Left_Gun_Line.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"rotate_using_parameter",2, 1}}
AddHudElement(HUD_Aiming_Circle_Left_Gun_Line)
HUD_Aiming_Circle_Right_Gun_Line               = Copy(HUD_Aiming_Circle_Left_Gun_Line)
HUD_Aiming_Circle_Right_Gun_Line.vertices      = {{17.5, -7}, {17.5, 7}}
AddHudElement(HUD_Aiming_Circle_Right_Gun_Line)

HUD_Aiming_Circle_Gun_Lead_Line                = Copy(HUD_Aiming_Circle_Left_Gun_Line)
HUD_Aiming_Circle_Gun_Lead_Line.parent_element = HUD_Base.name
HUD_Aiming_Circle_Gun_Lead_Line.vertices       = {{0, 0}, {0, 0}}
HUD_Aiming_Circle_Gun_Lead_Line.element_params = {"HUD_BRIGHTNESS", "MASTERMODE", "WS_GUN_PIPER_AZIMUTH", "WS_GUN_PIPER_ELEVATION", "VELVEC_HUD_Y", "VELVEC_HUD_X"}
HUD_Aiming_Circle_Gun_Lead_Line.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"line_object_set_point_using_parameters", 0, 5, 4, 0.600005, 0.600005}, {"line_object_set_point_using_parameters", 1, 2, 3, 0.600005, 0.600005}}
AddHudElement(HUD_Aiming_Circle_Gun_Lead_Line)

for i = 0, 360, 30 do
	HUD_Aiming_Circles          = Copy(HUD_Aiming_Circle_Base) --Varje prick är 0.5nm.
	HUD_Aiming_Circles.init_pos = {40 * math.cos(math.rad(i + 90)), 40 * math.sin(math.rad(i + 90))}
	set_circle(HUD_Aiming_Circles, 0.9, 0, 360, 8)
	AddHudElement(HUD_Aiming_Circles)

	if i == 90 then
		HUD_Aiming_Circles_Left_Line                = CreateElement "ceSimpleLineObject"
		HUD_Aiming_Circles_Left_Line.name           = create_guid_string()
		HUD_Aiming_Circles_Left_Line.material       = MakeMaterial(nil, {0, 510, 0, 510})
		HUD_Aiming_Circles_Left_Line.parent_element = HUD_Aiming_Circles.name
		HUD_Aiming_Circles_Left_Line.vertices       = {{0, 0}, {-7, 0}}
		HUD_Aiming_Circles_Left_Line.width          = 0.7
		HUD_Aiming_Circles_Left_Line.element_params = {"HUD_BRIGHTNESS"}
		HUD_Aiming_Circles_Left_Line.controllers    = {{"opacity_using_parameter",0}}
		AddHudElement(HUD_Aiming_Circles_Left_Line)
	end
	if i == 270 then
		HUD_Aiming_Circles_Right_Line                = Copy(HUD_Aiming_Circles_Left_Line)
		HUD_Aiming_Circles_Right_Line.parent_element = HUD_Aiming_Circles.name
		HUD_Aiming_Circles_Right_Line.vertices       = {{0, 0}, {7, 0}}
		AddHudElement(HUD_Aiming_Circles_Right_Line)
	end
end

minRange = 30
HUD_Aiming_MIN_Range_Mark                = CreateElement "ceSimpleLineObject"
HUD_Aiming_MIN_Range_Mark.name           = create_guid_string()
HUD_Aiming_MIN_Range_Mark.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Aiming_MIN_Range_Mark.parent_element = HUD_Aiming_Circle_Base.name
HUD_Aiming_MIN_Range_Mark.init_pos       = {40 * math.cos(math.rad(180 + minRange)), 40 * math.sin(math.rad(180 + minRange))}
HUD_Aiming_MIN_Range_Mark.init_rot       = {-90 + minRange}
HUD_Aiming_MIN_Range_Mark.vertices       = {{0, -1}, {0, -4.8}, {2.5, -4.8}}
HUD_Aiming_MIN_Range_Mark.width          = 0.7
HUD_Aiming_MIN_Range_Mark.element_params = {"HUD_BRIGHTNESS"}
HUD_Aiming_MIN_Range_Mark.controllers    = {{"opacity_using_parameter",0}}
AddHudElement(HUD_Aiming_MIN_Range_Mark)

for i = 0, 999, 1 do
	HUD_Aiming_Range_Circle                = CreateElement "ceMeshPoly"
	HUD_Aiming_Range_Circle.name           = create_guid_string()
	HUD_Aiming_Range_Circle.primitivetype  = "triangles"
	HUD_Aiming_Range_Circle.material       = MakeMaterial(nil, {0, 510, 0, 510})
	HUD_Aiming_Range_Circle.parent_element = HUD_Aiming_Circle_Base.name
	HUD_Aiming_Range_Circle.init_rot       = {90, 180}
	HUD_Aiming_Range_Circle.element_params = {"HUD_BRIGHTNESS", "RADAR_STT_RANGE_CARROT_RANGE"}
	HUD_Aiming_Range_Circle.controllers    = {{"opacity_using_parameter",0}, {"parameter_in_range",1, (i - 1)/180 , i/180}}
	set_circle(HUD_Aiming_Range_Circle, 41, 39.1, i, 186)
	AddHudElement(HUD_Aiming_Range_Circle)
end
HUD_Aiming_Circle_Carrot_Base                = CreateElement "ceSimple"
HUD_Aiming_Circle_Carrot_Base.name           = create_guid_string()
HUD_Aiming_Circle_Carrot_Base.parent_element = HUD_Aiming_Circle_Base.name
HUD_Aiming_Circle_Carrot_Base.init_rot       = {-90}
HUD_Aiming_Circle_Carrot_Base.element_params = {"RADAR_STT_RANGE_CARROT_RANGE"}
HUD_Aiming_Circle_Carrot_Base.controllers    = {{"rotate_using_parameter",0, math.rad(360)/2}}
AddHudElement(HUD_Aiming_Circle_Carrot_Base)

HUD_Aiming_Range_Carrot                = Copy(HUD_Aiming_MIN_Range_Mark)
HUD_Aiming_Range_Carrot.parent_element = HUD_Aiming_Circle_Carrot_Base.name
HUD_Aiming_Range_Carrot.init_pos       = {0}
HUD_Aiming_Range_Carrot.init_rot       = {0}
HUD_Aiming_Range_Carrot.vertices       = {{-2 + (40 * math.sin(math.rad(180))), 7 + (40 * math.cos(math.rad(180)))}, {0 + (40 * math.sin(math.rad(180))), 2.1 + (40 * math.cos(math.rad(180)))}, {2 + (40 * math.sin(math.rad(180))), 7 + (40 * math.cos(math.rad(180)))}}
AddHudElement(HUD_Aiming_Range_Carrot)

innerouterRange = 163
HUD_Aiming_Innerouter_Range_Mark          = Copy(HUD_Aiming_MIN_Range_Mark)
HUD_Aiming_Innerouter_Range_Mark.init_pos = {40 * math.cos(math.rad(180 + innerouterRange)), 40 * math.sin(math.rad(180 + innerouterRange))}
HUD_Aiming_Innerouter_Range_Mark.init_rot = {-90 + innerouterRange}
HUD_Aiming_Innerouter_Range_Mark.vertices = {{0, -1}, {0, -4.8}, {-2.5, -4.8}, {2.5, -4.8}}
AddHudElement(HUD_Aiming_Innerouter_Range_Mark)

HUD_Aiming_Circle_Range                = add_text_hud_param(0, -65, "HUD_BRIGHTNESS", "RADAR_STT_RANGE_NM", "%0.1f", HUD_Aiming_Circle_Base, HUD_Normal_Size, "Gripen_Font_green", "CenterCenter")
HUD_Aiming_Circle_Range.element_params = {"HUD_BRIGHTNESS", "RADAR_STT_RANGE_NM"}
HUD_Aiming_Circle_Range.controllers    = {{"opacity_using_parameter",0}, {"parameter_in_range",1, 0, 999}, {"text_using_parameter",1}}
HUD_Aiming_Circle_Safe_Status                = add_text_hud("SAFE", 25, -80, HUD_Aiming_Circle_Base, "Gripen_Font_green", HUD_Normal_Size)
HUD_Aiming_Circle_Safe_Status.element_params = {"TRSAFE"}
HUD_Aiming_Circle_Safe_Status.controllers    = {{"parameter_compare_with_number",0, 0}}

for i = 0, 9 do
	HUD_Weapon_Indicator                = add_text_hud_param(-25, -80, "HUD_BRIGHTNESS", "PYLONINFO_" .. i, "%0.4s", HUD_Aiming_Circle_Base, HUD_Normal_Size, "Gripen_Font_green", "CenterCenter")
	HUD_Weapon_Indicator.element_params = {"HUD_BRIGHTNESS", "SELECTED_PYLON", "PYLONINFO_" .. i}
	HUD_Weapon_Indicator.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, i}, {"text_using_parameter",2}}
end


HUD_Radar_Lock_SYMB                = Copy(HUD_Aiming_Circle_Left_Gun_Line)
HUD_Radar_Lock_SYMB.vertices       = {{-6, 2}, {-6, 8}, {6, 8}, {6, 2}}
HUD_Radar_Lock_SYMB.parent_element = HUD_Base.name
HUD_Radar_Lock_SYMB.element_params = {"HUD_BRIGHTNESS", "RADAR_MODE", "RADAR_STT_ELEVATION", "RADAR_STT_AZIMUTH", "ROLL_HUD"}
HUD_Radar_Lock_SYMB.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 3}, {"move_up_down_using_parameter",2, 0.600005}, {"move_left_right_using_parameter",3, 0.600005}, {"rotate_using_parameter",4, 1}}
AddHudElement(HUD_Radar_Lock_SYMB)




local IR_Seeker_Box          = Copy(HUD_Aiming_MIN_Range_Mark)
IR_Seeker_Box.name           = create_guid_string()
IR_Seeker_Box.material       = MakeMaterial(nil, {0, 255, 0, 255})
IR_Seeker_Box.parent_element = HUD_Base.name
IR_Seeker_Box.init_pos       = {0}
IR_Seeker_Box.init_rot       = {0}
IR_Seeker_Box.vertices       = {{-5, 0}, {-3, -6.25}, {3, -6.25}, {5, 0}}
IR_Seeker_Box.width          = 0.7
IR_Seeker_Box.element_params = {"HUD_BRIGHTNESS", "WS_IR_MISSILE_TARGET_AZIMUTH", "WS_IR_MISSILE_TARGET_ELEVATION"}
IR_Seeker_Box.controllers    = {{"opacity_using_parameter",0}, {"move_left_right_using_parameter",1, 0.600005}, {"move_up_down_using_parameter",2, 0.600005}}
Add(IR_Seeker_Box)




local TriggerX          = CreateElement "ceMeshPoly"
TriggerX.name           = create_guid_string()
TriggerX.primitivetype  = "triangles"
TriggerX.material       = MakeMaterial(nil, {0, 510, 0, 510})
TriggerX.parent_element = HUD_Moving_Sides_Base.name
TriggerX.vertices       = {{-0.7,-110}, {0.7,-110}, {-0.7,110}, {0.7,110}  ,  {-110,-0.7}, {-110,0.7}, {110,-0.7}, {110,0.7}}
TriggerX.indices        = {0,1,2 , 3,2,1  ,  4,5,6 , 7,6,5}
TriggerX.init_pos       = {0, -57.5}
TriggerX.init_rot       = {45}
TriggerX.element_params = {"HUD_BRIGHTNESS", "TRIGGERX"}
TriggerX.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}}
AddHudElement(TriggerX)


local Auto_Throttle_Indicator          = add_text_hud("AT", -163.76, -11, HUD_Left_Side_Indication_Base, "Gripen_Font_green")
Auto_Throttle_Indicator.element_params = {"AUTOTHROTTLE_ONOFF", "HUD_DECLUTT"}
Auto_Throttle_Indicator.controllers    = {{"parameter_in_range",0, 0.9, 1.1}, {"parameter_compare_with_number",1, 0}}

local Auto_Throttle_Mode12             = add_text_hud("12", -150, -11, HUD_Left_Side_Indication_Base, "Gripen_Font_green")
Auto_Throttle_Mode12.element_params    = {"AUTOTHROTTLE_MODE", "HUD_DECLUTT"}
Auto_Throttle_Mode12.controllers       = {{"parameter_in_range",0, 0.4, 0.6}, {"parameter_compare_with_number",1, 0}}

local Auto_Throttle_Mode14             = add_text_hud("14", -150, -11, HUD_Left_Side_Indication_Base, "Gripen_Font_green")
Auto_Throttle_Mode14.element_params    = {"AUTOTHROTTLE_MODE", "HUD_DECLUTT"}
Auto_Throttle_Mode14.controllers       = {{"parameter_in_range",0, 0.9, 1.1}, {"parameter_compare_with_number",1, 0}}


local Alfa_Indicator           = add_text_hud_param(-150, 36.5, "CUR_AOA", "HUD_BRIGHTNESS", "%.0f", HUD_Left_Side_Indication_Base, HUD_strdefs_digit, "Gripen_Font_green", "RightRight")
Alfa_Indicator.element_params  = {"HUD_BRIGHTNESS", "CUR_AOA", "HUD_DECLUTT"}
Alfa_Indicator.controllers     = {{"opacity_using_parameter",0}, {"text_using_parameter",1}, {"parameter_compare_with_number",2, 0}}

local Alfa_Text                = add_text_hud("@", -17, 0, Alfa_Indicator, "Gripen_Font_green", HUD_strdefs_digit, "RightRight")
Alfa_Text.element_params       = {"HUD_DECLUTT"}
Alfa_Text.controllers          = {{"parameter_compare_with_number",0, 0}}

local G_Indicator              = add_text_hud_param(-0.608 * Fov2MilRad, 27, "CUR_G", "HUD_BRIGHTNESS", "%.1f", HUD_Left_Side_Indication_Base, HUD_strdefs_digit, "Gripen_Font_green")
G_Indicator.element_params     = {"HUD_BRIGHTNESS", "CUR_G", "HUD_DECLUTT"}
G_Indicator.controllers        = {{"opacity_using_parameter", 0}, {"text_using_parameter",1}, {"parameter_compare_with_number",2, 0}}

local G_Text                  = add_text_hud("G", -0.71 * Fov2MilRad, 27, HUD_Left_Side_Indication_Base, "Gripen_Font_green")
G_Text.element_params         = {"HUD_DECLUTT"}
G_Text.controllers            = {{"parameter_compare_with_number",0, 0}}

local KIAS_Indicator          = add_text_hud_param(-0.705 * Fov2MilRad, -math.rad(3.3) * 1000, "SPEED_KCAS", "HUD_BRIGHTNESS", "%.0f", HUD_Moving_Sides_Base, HUD_strdefs_digit, "Gripen_Font_green")
KIAS_Indicator.element_params = {"HUD_BRIGHTNESS", "SPEED_KCAS", "HUD_DECLUTT"}
KIAS_Indicator.controllers    = {{"opacity_using_parameter", 0}, {"text_using_parameter",1}, {"parameter_compare_with_number",2, 0}}


--local Debug_Param = add_text_hud_param(0, 0, "HudSidesAOS", "HUD_BRIGHTNESS", "%.6f", HUD_Left_Side_Indication_Base, HUD_strdefs_digit, "Gripen_Font_green")
--local Debug_Param = add_text_hud_param(0, -50, "HudSidesAOA", "HUD_BRIGHTNESS", "%.6f", HUD_Left_Side_Indication_Base, HUD_strdefs_digit, "Gripen_Font_green")
--local Debug_Param = add_text_hud_param(0, 0, "ROLL_HUD", "HUD_BRIGHTNESS", "%.6f", HUD_Left_Side_Indication_Base, HUD_strdefs_digit, "Gripen_Font_green")

local GS_Base          = CreateElement "ceSimple"
GS_Base.init_pos       = {-0.729* Fov2MilRad, -89}
GS_Base.name           = create_guid_string()
GS_Base.parent_element = HUD_Left_Side_Indication_Base.name
GS_Base.element_params = {"MASTERMODE", "HUD_DECLUTT", "CURRENT_PHASE_STATIONARY", "CURRENT_PHASE_PARKED", "CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR", "CURRENT_PHASE_ROT", "CURRENT_PHASE_TD", "CURRENT_PHASE_LR"}
GS_Base.controllers    = {{"parameter_compare_with_number",0, 0}, {"parameter_compare_with_number",1, 0}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 0}, {"parameter_compare_with_number",4, 0}, {"parameter_compare_with_number",5, 0}, {"parameter_compare_with_number",6, 0}, {"parameter_compare_with_number",7, 0}, {"parameter_compare_with_number",8, 0}}
AddHudElement(GS_Base)

local GS_Text          = add_text_hud("GS", 0, 0, GS_Base, "Gripen_Font_green")
local GS_Indicator     = add_text_hud_param(20, 0, "CURR_GS", "HUD_BRIGHTNESS", "%.0f", GS_Base, HUD_strdefs_digit, "Gripen_Font_green")


local Mach_Indicator           = CreateElement "ceStringPoly"
Mach_Indicator.name            = create_guid_string()
Mach_Indicator.parent_element  = HUD_Left_Side_Indication_Base.name
Mach_Indicator.material        = fonts["Gripen_Font_green"]
Mach_Indicator.init_pos        = {-149, -76}
Mach_Indicator.alignment       = "LeftCenter"
Mach_Indicator.stringdefs      = HUD_strdefs_digit
Mach_Indicator.formats         = {"%.0f", "%s"}
Mach_Indicator.element_params  = {"MACH_B", "HUD_BRIGHTNESS", "HUD_DECLUTT"}
Mach_Indicator.controllers     = {{"text_using_parameter",0, 0}, {"parameter_in_range",0, 1, 99.5}, {"opacity_using_parameter", 1}, {"parameter_compare_with_number",2, 0}}
AddHudElement(Mach_Indicator)

local M_Text                   = add_text_hud("M", -167, -76, HUD_Left_Side_Indication_Base, "Gripen_Font_green")	
M_Text.element_params          = {"HUD_DECLUTT", "MACH_B"}
M_Text.controllers             = {{"parameter_compare_with_number",0, 0}, {"parameter_in_range",1, 1, 999}}

local Mach_Indicator2          = CreateElement "ceStringPoly"
Mach_Indicator2.name           = create_guid_string()
Mach_Indicator2.parent_element = HUD_Left_Side_Indication_Base.name
Mach_Indicator2.material       = fonts["Gripen_Font_green"]
Mach_Indicator2.init_pos       = {-160.14, -76}
Mach_Indicator2.alignment      = "LeftCenter"
Mach_Indicator2.stringdefs     = HUD_strdefs_digit
Mach_Indicator2.formats        = {"%.2f", "%s"}
Mach_Indicator2.element_params = {"MACH_A", "HUD_BRIGHTNESS", "HUD_DECLUTT"}
Mach_Indicator2.controllers    = {{"text_using_parameter",0, 0}, {"parameter_in_range",0, 0.995, 9}, {"opacity_using_parameter", 1}, {"parameter_compare_with_number",2, 0}}
AddHudElement(Mach_Indicator2)

local Mach_Comma			   = add_text_hud(".", -3, 0, Mach_Indicator, "Gripen_Font_green")
Mach_Comma.element_params      = {"HUD_DECLUTT"}
Mach_Comma.controllers         = {{"parameter_compare_with_number",0, 0}}



HUD_Takeoff_Lines                = CreateElement "ceMeshPoly"
HUD_Takeoff_Lines.name           = create_guid_string()
HUD_Takeoff_Lines.primitivetype  = "triangles"
HUD_Takeoff_Lines.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Takeoff_Lines.vertices       = {{-67.4, 0.7}, {-66, 0.7}, {-67.4, math.rad(4300)}, {-66, math.rad(4300)}, --Left line.
                                    {67.4, 0.7}, {66, 0.7}, {67.4, math.rad(4300)}, {66, math.rad(4300)}}     --Right line.
HUD_Takeoff_Lines.indices        = {0,1,2, 3,2,1, 
                                    4,5,6 , 7,6,5}
HUD_Takeoff_Lines.parent_element = HUD_Pitch.name
HUD_Takeoff_Lines.element_params = {"HUD_BRIGHTNESS", "CURRENT_PHASE_CO", "CURRENT_PHASE_PAL", "LANDING_MODE"}
HUD_Takeoff_Lines.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 0}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 0}}
AddHudElement(HUD_Takeoff_Lines)



HUD_Velocity_Vector_Horizontal_Lines                = CreateElement "ceMeshPoly"
HUD_Velocity_Vector_Horizontal_Lines.name           = create_guid_string()
HUD_Velocity_Vector_Horizontal_Lines.primitivetype  = "triangles"
HUD_Velocity_Vector_Horizontal_Lines.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Velocity_Vector_Horizontal_Lines.vertices       = {{-19, -0.7}, {-5.4, -0.7}, {-19, 0.7}, {-5.4, 0.7}, 
                                                       {19, -0.7}, {5.4, -0.7}, {19, 0.7}, {5.4, 0.7}}
HUD_Velocity_Vector_Horizontal_Lines.indices        = {0,1,2 , 3,2,1, 
                                                       4,5,6 , 7,6,5}
HUD_Velocity_Vector_Horizontal_Lines.parent_element = HUD_Velocity_Vector_Base.name
HUD_Velocity_Vector_Horizontal_Lines.element_params = {"HUD_BRIGHTNESS", "CURRENT_PHASE_STATIONARY", "CURRENT_PHASE_PARKED", "CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR", "CURRENT_PHASE_ROT", "CURRENT_PHASE_LR", "VV_LimitedLower", "VV_LimitedUpper", "MASTERMODE"}
HUD_Velocity_Vector_Horizontal_Lines.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 0}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 0}, {"parameter_compare_with_number",4, 0}, {"parameter_compare_with_number",5, 0}, {"parameter_compare_with_number",6, 0}, {"parameter_compare_with_number",7, 0}, {"parameter_compare_with_number",8, 0}, {"parameter_compare_with_number",9, 0}}
AddHudElement(HUD_Velocity_Vector_Horizontal_Lines)

--[[HUD_TESTER_VELVEC                = Copy(HUD_Velocity_Vector_Horizontal_Lines)
HUD_TESTER_VELVEC.element_params = {"HUD_BRIGHTNESS", "ROLL_HUD", "TEST_PITCHER", "TEST_ROLLER"}
HUD_TESTER_VELVEC.controllers    = {{"opacity_using_parameter",0}, {"rotate_using_parameter",1, 1}, {"move_up_down_using_parameter",2, -0.600005}, {"move_left_right_using_parameter",3, -0.600005}}
AddHudElement(HUD_TESTER_VELVEC)]]

HUD_Velocity_Vector_Circle                          = Copy(HUD_Velocity_Vector_Horizontal_Lines)
set_circle(HUD_Velocity_Vector_Circle, 5.5, 4.1, 360, 25)
AddHudElement(HUD_Velocity_Vector_Circle)

HUD_Velocity_Vector_Vertical_Line                = CreateElement "ceSimpleLineObject"
HUD_Velocity_Vector_Vertical_Line.name           = create_guid_string()
HUD_Velocity_Vector_Vertical_Line.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Velocity_Vector_Vertical_Line.vertices       = {{0, 4.075}, {0, 14.075}}
HUD_Velocity_Vector_Vertical_Line.width          = 0.7
HUD_Velocity_Vector_Vertical_Line.init_pos       = {0, -16.8}
HUD_Velocity_Vector_Vertical_Line.parent_element = HUD_Velocity_Vector_Base.name
HUD_Velocity_Vector_Vertical_Line.element_params = {"HUD_BRIGHTNESS", "HUD_VELVEC_VER_LINE_POS", "HUD_VELVEC_VER_LINE_BLINK"}
HUD_Velocity_Vector_Vertical_Line.controllers    = {{"opacity_using_parameter",0}, {"move_up_down_using_parameter",1, 14 * 0.001}, {"parameter_in_range",2, -0.1, 0.5}}
AddHudElement(HUD_Velocity_Vector_Vertical_Line)


HUD_Velocity_Vector_Limited_Horizontal_Lines                = Copy(HUD_Velocity_Vector_Horizontal_Lines)
HUD_Velocity_Vector_Limited_Horizontal_Lines.vertices       = {{-19, -0.7}, {-8, -0.7}, {-19, 0.7}, {-8, 0.7}, 
                                                               {19, -0.7}, {8, -0.7}, {19, 0.7}, {8, 0.7}}
HUD_Velocity_Vector_Limited_Horizontal_Lines.indices        = {0,1,2 , 3,2,1, 
                                                              4,5,6 , 7,6,5}
HUD_Velocity_Vector_Limited_Horizontal_Lines.element_params = {"HUD_BRIGHTNESS", "VV_LimitedLower", "MASTERMODE"}
HUD_Velocity_Vector_Limited_Horizontal_Lines.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"parameter_compare_with_number",2, }}
AddHudElement(HUD_Velocity_Vector_Limited_Horizontal_Lines)

HUD_Velocity_Vector_Limited_Alfa_readout                = add_text_hud_param(0, 0, "CUR_AOA", "HUD_BRIGHTNESS", "%.0f", HUD_Velocity_Vector_Limited_Horizontal_Lines, HUD_Normal_Size, "Gripen_Font_green")
HUD_Velocity_Vector_Limited_Alfa_readout.element_params = {"HUD_BRIGHTNESS", "CUR_AOA", "CURRENT_PHASE_STATIONARY", "CURRENT_PHASE_PARKED", "CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR", "CURRENT_PHASE_ROT", "CURRENT_PHASE_LO", "CURRENT_PHASE_TD", "CURRENT_PHASE_LR"}
HUD_Velocity_Vector_Limited_Alfa_readout.controllers    = {{"opacity_using_parameter",0}, {"text_using_parameter",1}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 0}, {"parameter_compare_with_number",4, 0}, {"parameter_compare_with_number",5, 0}, {"parameter_compare_with_number",6, 0}, {"parameter_compare_with_number",7, 0}, {"parameter_compare_with_number",8, 0}, {"parameter_compare_with_number",9, 0}}



HUD_Altitude_Keeping_Boxes                = CreateElement "ceMeshPoly"
HUD_Altitude_Keeping_Boxes.name           = create_guid_string()
HUD_Altitude_Keeping_Boxes.primitivetype  = "triangles"
HUD_Altitude_Keeping_Boxes.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Altitude_Keeping_Boxes.vertices       = {{-77.426504, -27.97108}, {-76.026504, -27.97108}, {-77.426504, -0.7}, {-76.026504, -0.7}, --Left box.
                                             {-66, -27.97108}, {-76.026504, -26.57108}, {-66, -26.57108}, 
                                             {-67.4, -26.57108}, {-67.4, -0.7}, {-66, -0.7}, 
                                             {77.426504, -27.97108}, {76.026504, -27.97108}, {77.426504, -0.7}, {76.026504, -0.7}, --Right box.
                                             {66, -27.97108}, {76.026504, -26.57108}, {66, -26.57108}, 
                                             {67.4, -26.57108}, {67.4, -0.7}, {66, -0.7}}
HUD_Altitude_Keeping_Boxes.indices        = {0,1,2 , 3,2,1, --Left box.
                                             1,4,5 , 6,5,4, 
                                             7,6,8 , 9,8,6, 
                                             10,11,12 , 13,12,11, --Right box.
                                             11,14,15 , 16,15,14, 
                                             17,16,18 , 19,18,16}
HUD_Altitude_Keeping_Boxes.parent_element = HUD_Pitch.name
HUD_Altitude_Keeping_Boxes.element_params = {"HUD_BRIGHTNESS", "AutoPilotMode"}
HUD_Altitude_Keeping_Boxes.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 2}}
AddHudElement(HUD_Altitude_Keeping_Boxes)

HUD_Altitude_Keeping_Box_Cs                = Copy(HUD_Altitude_Keeping_Boxes)
HUD_Altitude_Keeping_Box_Cs.vertices       = {{-77.426504, -0.7}, {-66, -0.7}, {-77.426504, 0.7}, {-66, 0.7}, --Left C.
                                              {-77.426504, -27.97108}, {-76.026504, -27.97108}, {-76.026504, -0.7}, 
                                              {-66, -27.97108}, {-76.026504, -26.57108}, {-66, -26.57108}, 
                                              {77.426504, -0.7}, {66, -0.7}, {77.426504, 0.7}, {66, 0.7}, --Right C.
                                              {77.426504, -27.97108}, {76.026504, -27.97108}, {76.026504, -0.7}, 
                                              {66, -27.97108}, {76.026504, -26.57108}, {66, -26.57108}}
HUD_Altitude_Keeping_Box_Cs.indices        = {0,1,2 , 3,2,1, --Left C.
                                              4,5,0 , 6,0,5, 
                                              5,7,8 , 9,8,7,
                                              10,11,12 , 13,12,11, --Right C.
                                              14,15,10 , 16,10,15, 
                                              15,17,18 , 19,18,17}
HUD_Altitude_Keeping_Box_Cs.parent_element = HUD_Velocity_Vector_Base.name
HUD_Altitude_Keeping_Box_Cs.element_params = {"HUD_BRIGHTNESS", "ROLL_HUD", "AutoPilotMode"}
HUD_Altitude_Keeping_Box_Cs.controllers    = {{"opacity_using_parameter",0}, {"rotate_using_parameter",1, 1}, {"parameter_compare_with_number",2, -2}}
AddHudElement(HUD_Altitude_Keeping_Box_Cs)



HUD_Horizon_Lines                = CreateElement "ceMeshPoly"
HUD_Horizon_Lines.name           = create_guid_string()
HUD_Horizon_Lines.primitivetype  = "triangles"
HUD_Horizon_Lines.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Horizon_Lines.vertices       = {{-9999, -0.7}, {-66, -0.7}, {-9999, 0.7}, {-66, 0.7}, --72.3064976 instead of 66???
                                   {9999, -0.7}, {66, -0.7}, {9999, 0.7}, {66, 0.7}}
HUD_Horizon_Lines.indices        = {0,1,2 , 3,2,1,
                                   4,5,6 , 7,6,5}
HUD_Horizon_Lines.parent_element = HUD_Pitch.name
HUD_Horizon_Lines.element_params = {"HUD_BRIGHTNESS"}
HUD_Horizon_Lines.controllers    = {{"opacity_using_parameter",0}}
AddHudElement(HUD_Horizon_Lines)

HUD_Glide_Slope                = CreateElement "ceMeshPoly"
HUD_Glide_Slope.name           = create_guid_string()
HUD_Glide_Slope.primitivetype  = "triangles"
HUD_Glide_Slope.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Glide_Slope.vertices       = {{-90, -0.7}, {-20, -0.7}, {-90, 0.7}, {-20, 0.7}, 
                                  {90, -0.7}, {20, -0.7}, {90, 0.7}, {20, 0.7}}
HUD_Glide_Slope.indices        = {0,1,2 , 3,2,1, 
                                  4,5,6 , 7,6,5}
--HUD_Glide_Slope.init_pos       = {0, math.rad(-2.86) * 1000}
HUD_Glide_Slope.parent_element = HUD_Pitch.name
HUD_Glide_Slope.element_params = {"HUD_BRIGHTNESS", "LANDING_MODE", "GLIDE_SLOPE_MOVE"}--, "VELVEC_HUD_X"}
HUD_Glide_Slope.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"move_up_down_using_parameter",2, 0.600005}}--, {"move_left_right_using_parameter",3, 0.600005}}
AddHudElement(HUD_Glide_Slope)



local TST_G	= MakeMaterial(nil,{0,0,100,100})

local HeadingScaleWidth = math.rad(5) * 1000 / 2

local HeadingScaleMask 					= CreateElement "ceMeshPoly"		-- change shape 
HeadingScaleMask.name 					=  create_guid_string()
HeadingScaleMask.primitivetype 			= "triangles"
HeadingScaleMask.material				= TST_G
HeadingScaleMask.parent_element			= HUD_Moving_Sides_Base.name
HeadingScaleMask.vertices	   	 		= { {-HeadingScaleWidth, -0.04 * Fov2MilRad }, { HeadingScaleWidth , -0.04 * Fov2MilRad}, { HeadingScaleWidth ,-0.17  * Fov2MilRad}, {-HeadingScaleWidth,-0.17  * Fov2MilRad}, }
HeadingScaleMask.indices				= {0, 1, 2, 0, 2, 3}
HeadingScaleMask.init_pos				= {0, math.rad(2.75) * 1000, 0}
HeadingScaleMask.h_clip_relation   		= h_clip_relations.INCREASE_IF_LEVEL 
HeadingScaleMask.level  		 		= HUD_DEFAULT_LEVEL
HeadingScaleMask.element_params			= {"HUD_MODE"}
HeadingScaleMask.controllers			= { {"parameter_in_range",0, -1,7}  }
HeadingScaleMask.isvisible				= false
Add(HeadingScaleMask)


--local HeadingScale 						= Hud_Heading_Scale(HUD_HeadingScale, 0, 0, 8400, 200, 2 * Fov2MilRad)
--HeadingScale.name						= create_guid_string()
--HeadingScale.init_pos					= {1.714 * Fov2MilRad, math.rad(1.67) * 1000, 0}
--HeadingScale.parent_element				= HUD_Moving_Sides_Base.name
--HeadingScale.element_params				= {"HUD_BRIGHTNESS","HEADING_HUD"}
--HeadingScale.controllers				= { {"opacity_using_parameter" ,0},{"move_left_right_using_parameter", 1, -0.0012575}  }
--HeadingScale.h_clip_relation   			= h_clip_relations.DECREASE_IF_LEVEL 
--HeadingScale.level  		 			= HUD_DEFAULT_LEVEL + 1
--AddHudElement2(HeadingScale)

local HeadingTape_Base          = CreateElement "ceSimple"
HeadingTape_Base.name           = create_guid_string()
HeadingTape_Base.parent_element = HUD_Moving_Sides_Base.name
HeadingTape_Base.element_params = {"HEADING_HUD"}
HeadingTape_Base.controllers    = {{"move_left_right_using_parameter",0, -0.0020944}}
AddHudElement(HeadingTape_Base)



local HdgLineSpacing = math.rad(1) * 1000
local HdgLineThickness = 0.46

for i = -4, 76 do -- make 4 extra lines on each side of north, north is 00. 34 <18> 02

	if i < 0 then
		j = 36 + (i / 2)
	elseif i > 70 then
		j = (i -72 ) / 2
	else
		j = i / 2
	end

	if j < 10 then
		j = "0"..j
	end

	if i %2 == 0 then
		hdgLineHeight = math.rad(0.5) * 1000
	
		HeadingDigit = add_text_hud2(j, HdgLineSpacing * i, 33,  HeadingTape_Base , "Gripen_Font_green")

	else
		hdgLineHeight = math.rad(0.25) * 1000
	end


	HeadingLine 					= CreateElement "ceMeshPoly"
	HeadingLine.name 				= create_guid_string()
	HeadingLine.primitivetype 		= "triangles"
	HeadingLine.vertices			= {{-HdgLineThickness, hdgLineHeight}, {HdgLineThickness, hdgLineHeight}, {HdgLineThickness, 0}, {-HdgLineThickness, 0}}
	HeadingLine.material			= MakeMaterial(nil,{0, 255, 0,255})
	HeadingLine.indices				= {0,1,2 , 0,2,3}
	HeadingLine.init_pos			= { HdgLineSpacing * i, 18 }	-- placing segments as a function of iteration step
	HeadingLine.init_rot			= {0, 0 , 0}	
	HeadingLine.h_clip_relation		= h_clip_relations.DECREASE_IF_LEVEL  	--INCREASE_IF_LEVEL  
	HeadingLine.level  		 		= HUD_DEFAULT_LEVEL + 1
	HeadingLine.use_mipfilter		= true
	HeadingLine.additive_alpha		= true
	HeadingLine.collimated			= true
	HeadingLine.parent_element		= HeadingTape_Base.name
	HeadingLine.blend_mode 			= blend_mode.IBM_REGULAR_ADDITIVE_ALPHA
	HeadingLine.ScreenType			= Stype
	HeadingLine.element_params		= {"HUD_BRIGHTNESS"}
	HeadingLine.controllers			= {{"opacity_using_parameter" ,0}}	
	Add(HeadingLine)

end



local HeadingScaleArrow					= Hud_Horizon_Line(HUD_HORIZON, 793, 987, 912, 1106, 0.5 * Fov2MilRad) 
HeadingScaleArrow.name					= create_guid_string()
HeadingScaleArrow.init_pos				= {0, math.rad(0.82) * 1000, 0}
HeadingScaleArrow.parent_element		= HUD_Moving_Sides_Base.name						
HeadingScaleArrow.h_clip_relation   	= h_clip_relations.DECREASE_IF_LEVEL 
HeadingScaleArrow.level  		 		= HUD_DEFAULT_LEVEL + 1
HeadingScaleArrow.element_params		= {"HUD_BRIGHTNESS"}
HeadingScaleArrow.controllers			= { {"opacity_using_parameter" ,0}  }	
AddHudElement3(HeadingScaleArrow)

-- 	HEADING_MODE:set(1)			-- 1 = True, 2 = Magnetic 

local heading_mode_ind 					= add_text_hud("T", -0.30 * Fov2MilRad, 0.15 * Fov2MilRad, HUD_Moving_Sides_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
heading_mode_ind.element_params  		= {"HEADING_MODE"}
heading_mode_ind.controllers     		= {{"parameter_in_range" ,0, 0.9, 1.1} }

local heading_mode_ind 					= add_text_hud("M", -0.30 * Fov2MilRad, 0.15 * Fov2MilRad, HUD_Moving_Sides_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
heading_mode_ind.element_params  		= {"HEADING_MODE"}
heading_mode_ind.controllers     		= {{"parameter_in_range" ,0, 1.9, 2.1} }



local HorizonLineHeadingDots			= add_text_hud("!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!", 0, 0, HUD_Pitch, "Gripen_Font_green", HUD_HorizonLineHeading)
--lol
HorizonLineHeadingDots.init_pos			= {0.03025 * Fov2MilRad, 2.5, 0}
HorizonLineHeadingDots.element_params	= {"HEADING_HUD"}
HorizonLineHeadingDots.controllers		= { {"move_left_right_using_parameter",0, -0.0110555}  }

local TerrainAltitudeBox				= Hud_Horizon_Line(HUD_HORIZON, 1861, 969, 2296, 1116, 0.8 * Fov2MilRad) 
TerrainAltitudeBox.name					= create_guid_string()
TerrainAltitudeBox.init_pos				= {0.68 * Fov2MilRad, -0.62 * Fov2MilRad, 0}
TerrainAltitudeBox.init_rot				= {0, 0, 0}
TerrainAltitudeBox.parent_element		= HUD_Moving_Sides_Base.name		
TerrainAltitudeBox.element_params		= {"HUD_BRIGHTNESS", "ALTITUDE_HUD", "HUD_DECLUTT"}
TerrainAltitudeBox.controllers			= {{"opacity_using_parameter",0}, {"parameter_in_range",1, 1000,81000}, {"parameter_compare_with_number",2, 0}}		
AddHudElement(TerrainAltitudeBox)

local TerrainAltitude 	= add_text_hud_param(0, 0.028, "TERRAIN_ALT","HUD_BRIGHTNESS", "%0.0f", TerrainAltitudeBox, HUD_strdefs_digit, "Gripen_Font_green")


local AltimeterScaleMask 				= CreateElement "ceMeshPoly"		-- change shape 
AltimeterScaleMask.name 				=  create_guid_string()
AltimeterScaleMask.primitivetype 		= "triangles"
AltimeterScaleMask.material				= TST_G
AltimeterScaleMask.parent_element		= HUD_Moving_Sides_Base.name
AltimeterScaleMask.vertices	   	 		= { {0.5 * Fov2MilRad, -0.02 * Fov2MilRad }, { 0.8 * Fov2MilRad, -0.02 * Fov2MilRad},
											{ 0.8  * Fov2MilRad,-0.48  * Fov2MilRad}, {0.5  * Fov2MilRad,-0.48  * Fov2MilRad}, }
AltimeterScaleMask.indices				= {0, 1, 2, 0, 2, 3}
AltimeterScaleMask.init_pos				= {0, 0, 0}
AltimeterScaleMask.init_rot				= {0, 0, 0}
AltimeterScaleMask.h_clip_relation   	= h_clip_relations.INCREASE_IF_LEVEL 
AltimeterScaleMask.level  		 		= HUD_DEFAULT_LEVEL
AltimeterScaleMask.element_params		= {"HUD_MODE"}
AltimeterScaleMask.controllers			= { {"parameter_in_range",0, -1,7}  }
AltimeterScaleMask.isvisible			= false
Add(AltimeterScaleMask)

local AltimeterScaleArrow				= Hud_Horizon_Line(HUD_HORIZON, 793, 987, 912, 1106, 0.5 * Fov2MilRad) 
AltimeterScaleArrow.name				= create_guid_string()
AltimeterScaleArrow.init_pos			= {0.56 * Fov2MilRad, -math.rad(3.3) * 1000, 0}
AltimeterScaleArrow.init_rot			= {-90, 0, 0}
AltimeterScaleArrow.parent_element		= HUD_Moving_Sides_Base.name
AltimeterScaleArrow.element_params		= {"HUD_BRIGHTNESS", "HUD_DECLUTT"}
AltimeterScaleArrow.controllers			= { {"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 0}}
AddHudElement3(AltimeterScaleArrow)

--ALTITUDE_MODE:set(1)		-- 1 = barometric, 2 = Radar 
local Altitude_mode_ind 					= add_text_hud("77", 0.58 * Fov2MilRad, -0.5 * Fov2MilRad, HUD_Moving_Sides_Base, "Gripen_Font_green", HUD_pitch_digit)
Altitude_mode_ind.element_params  			= {"ALTITUDE_MODE", "RadarAltAvail", "HUD_DECLUTT", "ALT_77"}
Altitude_mode_ind.controllers     			= {{"parameter_in_range",0, 1.9, 2.1}, {"parameter_in_range",1, 0.9, 1.1}, {"parameter_compare_with_number",2, 0}, {"move_up_down_using_parameter",3, 0.00001}}


local ALTIMETER_BASE 				= CreateElement "ceSimple"
ALTIMETER_BASE.name  				= create_guid_string()
ALTIMETER_BASE.init_pos				= {0, 173}
ALTIMETER_BASE.parent_element		= HUD_Moving_Sides_Base.name
ALTIMETER_BASE.element_params     	= {"ALTITUDE_HUD", "HUD_DECLUTT"}             
ALTIMETER_BASE.controllers        	= {{"move_up_down_using_parameter",0, -0.00020944}, {"parameter_compare_with_number",1, 0}}
AddHudElement(ALTIMETER_BASE)

local RAltitude_carrot_num           = add_text_hud_param(0.528 * Fov2MilRad, -0.282 * Fov2MilRad, "RTEXT_ALT","HUD_BRIGHTNESS", "%.0f", HUD_Moving_Sides_Base, HUD_strdefs_digit, "Gripen_Font_green", "RightCenter")
RAltitude_carrot_num.h_clip_relation = h_clip_relations.REWRITE_LEVEL
RAltitude_carrot_num.level           = HUD_DEFAULT_LEVEL
RAltitude_carrot_num.element_params  = {"HUD_BRIGHTNESS", "TEXT_RALT", "HUD_DECLUTT", "ALTITUDE_MODE"}
RAltitude_carrot_num.controllers     = {{"opacity_using_parameter", 0}, {"text_using_parameter",1}, {"parameter_in_range",1, 0, 10000}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 2}}

local ThousandsOffsetX = 0.655	 * Fov2MilRad
local ThousandsOffsetY = -1 * Fov2MilRad

local HundredsOffsetX = 0.72 * Fov2MilRad
local HundredsOffsetY = -1.0075 * Fov2MilRad
local AltLineOffset = 0.15 * Fov2MilRad
--local AltTextOffset = 0.149955
local AltTextOffset = math.rad(2) * 1000

local counter = - 1
local hundreds = 0
local Thousands = 0

for i = 0,810 do


	--AltitudeLine 						= CreateElement "ceMeshPoly"
	--AltitudeLine.name 					= create_guid_string()
	--AltitudeLine.primitivetype 			= "triangles"
	--AltitudeLine.vertices				= {{-HdgLineThickness, hdgLineHeight}, {HdgLineThickness, hdgLineHeight}, {HdgLineThickness, 0}, {-HdgLineThickness, 0}}
	--AltitudeLine.material				= MakeMaterial(nil,{0, 255, 0,255})
	--AltitudeLine.indices				= {0,1,2 , 0,2,3}
	--AltitudeLine.init_pos				= { 0, AltTextOffset * i }	-- placing segments as a function of iteration step
	--AltitudeLine.init_rot				= {90, 0 , 0}	
	--AltitudeLine.h_clip_relation		= h_clip_relations.INCREASE_IF_LEVEL--DECREASE_IF_LEVEL  	--INCREASE_IF_LEVEL  
	--AltitudeLine.level  		 		= HUD_DEFAULT_LEVEL --+ 1
	--AltitudeLine.use_mipfilter			= true
	--AltitudeLine.additive_alpha			= true
	--AltitudeLine.collimated				= true
	--AltitudeLine.parent_element			= ALTIMETER_BASE.name
	--AltitudeLine.blend_mode 			= blend_mode.IBM_REGULAR_ADDITIVE_ALPHA
	--AltitudeLine.ScreenType				= Stype
	--AltitudeLine.element_params			= {"HUD_BRIGHTNESS"}
	--AltitudeLine.controllers			= {{"opacity_using_parameter" ,0}}	
	--Add(AltitudeLine)
		
		counter = counter + 1
		
		if counter == 10 then
			counter = 0
			Thousands = Thousands + 1
		end
		
		hundreds = counter
		
		if Thousands < 1 then
		
			if hundreds == 0 then
				local Ahundreds		= add_text_hud2(hundreds, HundredsOffsetX, HundredsOffsetY+ i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_strdefs_text, "CenterCenter")
			else 
				local Ahundreds		= add_text_hud2(hundreds .. "00", HundredsOffsetX, HundredsOffsetY+ i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_strdefs_text, "CenterCenter")
			end
			
		elseif Thousands >= 1 and Thousands < 10 then
			local HundredsOffsetX = 0.705 * Fov2MilRad
			local AThousands		= add_text_hud2(Thousands, ThousandsOffsetX , ThousandsOffsetY + i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_strdefs_text, "CenterCenter")
			
			local Ahundreds			= add_text_hud2(hundreds .. "00", HundredsOffsetX, HundredsOffsetY + i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_Heading_digit, "CenterCenter")

		else
			local HundredsOffsetX = 0.725 * Fov2MilRad
			local AThousands		= add_text_hud2(Thousands, ThousandsOffsetX , ThousandsOffsetY + i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_strdefs_text, "CenterCenter")
			
			local Ahundreds			= add_text_hud2(hundreds .. "00", HundredsOffsetX, HundredsOffsetY + i * AltTextOffset, ALTIMETER_BASE , "Gripen_Font_green", HUD_Heading_digit, "CenterCenter")

		end

end

-- air to ground mode altimeter

local A2G_Altitude_BASE 					= CreateElement "ceSimple"
A2G_Altitude_BASE.name  					= create_guid_string()
A2G_Altitude_BASE.parent_element			= HUD_Moving_Sides_Base.name
A2G_Altitude_BASE.init_pos					= {0.65 * Fov2MilRad, 0 ,0}									--{0, -1.345,0}
A2G_Altitude_BASE.element_params  			= {"MASTERMODE"}
A2G_Altitude_BASE.controllers     			= { {"parameter_compare_with_number",0, 7}  }
AddHudElement(A2G_Altitude_BASE)

local A2G_Altitude 			 			= add_text_hud("A", 0, -0.1 * Fov2MilRad, A2G_Altitude_BASE , "Gripen_Font_green")
local A2G_Altitude_Readout 				= add_text_hud_param(0, -0.2 * Fov2MilRad, "ALTITUDE_HUD","HUD_BRIGHTNESS", "%.0f", A2G_Altitude_BASE, HUD_strdefs_digit, "Gripen_Font_green")

--Cropped HUD
local Cropped_Altitude_BASE          = CreateElement "ceSimple"
Cropped_Altitude_BASE.name           = create_guid_string()
Cropped_Altitude_BASE.parent_element = HUD_Moving_Sides_Base.name
Cropped_Altitude_BASE.init_pos       = {0.33 * Fov2MilRad, -0.25 * Fov2MilRad}
Cropped_Altitude_BASE.element_params = {"HUD_DECLUTT"}
Cropped_Altitude_BASE.controllers    = {{"parameter_compare_with_number",0, 1}}
AddHudElement(Cropped_Altitude_BASE)


local Cropped_Altitude                   = add_text_hud("ALT", 0, -0.1 * Fov2MilRad, Cropped_Altitude_BASE , "Gripen_Font_green")
Cropped_Altitude.element_params          = {"HUD_BRIGHTNESS", "ALTITUDE_MODE"}
Cropped_Altitude.controllers             = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}}

local Cropped_Altitude_Readout           = add_text_hud_param(0, -0.16 * Fov2MilRad, "TEXT_ALT","HUD_BRIGHTNESS", "%.0f", Cropped_Altitude_BASE, HUD_strdefs_digit, "Gripen_Font_green")
Cropped_Altitude_Readout.element_params  = {"HUD_BRIGHTNESS", "ALTITUDE_MODE", "TEXT_ALT"}
Cropped_Altitude_Readout.controllers     = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"text_using_parameter",2}}

local Cropped_RAltitude                  = add_text_hud("RALT", 0, -0.1 * Fov2MilRad, Cropped_Altitude_BASE , "Gripen_Font_green")
Cropped_RAltitude.element_params         = {"HUD_BRIGHTNESS", "ALTITUDE_MODE"}
Cropped_RAltitude.controllers            = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 2}}

local Cropped_RAltitude_Readout          = add_text_hud_param(0, -0.16 * Fov2MilRad, "TEXT_RALT","HUD_BRIGHTNESS", "%.0f", Cropped_Altitude_BASE, HUD_strdefs_digit, "Gripen_Font_green")
Cropped_RAltitude_Readout.element_params = {"HUD_BRIGHTNESS", "ALTITUDE_MODE", "TEXT_RALT"}
Cropped_RAltitude_Readout.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 2}, {"text_using_parameter",2}}


local Cropped_Speed_Readout = add_text_hud_param(-0.66 * Fov2MilRad, -0.16 * Fov2MilRad, "SPEED_KCAS","HUD_BRIGHTNESS", "%.0f", Cropped_Altitude_BASE, HUD_strdefs_digit, "Gripen_Font_green")

local Cropped_AT            = add_text_hud("AT", -0.7 * Fov2MilRad, -0.1 * Fov2MilRad, Cropped_Altitude_BASE, "Gripen_Font_green")
Cropped_AT.element_params   = {"AUTOTHROTTLE_ONOFF"}
Cropped_AT.controllers      = {{"parameter_in_range",0,0.9,1.1}}

local Cropped_12            = add_text_hud("12", -0.63 * Fov2MilRad, -0.1 * Fov2MilRad, Cropped_Altitude_BASE, "Gripen_Font_green")
Cropped_12.element_params   = {"AUTOTHROTTLE_MODE"}
Cropped_12.controllers      = {{"parameter_in_range",0,0.4,0.6}}

local Cropped_14            = add_text_hud("14", -0.63 * Fov2MilRad, -0.1 * Fov2MilRad, Cropped_Altitude_BASE, "Gripen_Font_green")
Cropped_14.element_params   = {"AUTOTHROTTLE_MODE"}
Cropped_14.controllers      = {{"parameter_in_range",0,0.9,1.1}}


local Cropped_Alfa_indicator          = add_text_hud_param(-0.724 * Fov2MilRad, -1.255 * Fov2MilRad, "CUR_AOA", "HUD_BRIGHTNESS", "%.0f", HUD_Base, HUD_strdefs_digit, "Gripen_Font_green")
Cropped_Alfa_indicator.element_params = {"HUD_BRIGHTNESS", "CUR_AOA", "HUD_DECLUTT"}
Cropped_Alfa_indicator.controllers    = {{"opacity_using_parameter", 0},{"text_using_parameter",1}, {"parameter_compare_with_number",2, 1}}

local Cropped_alfa_text               = add_text_hud("@", -0.81 * Fov2MilRad, -1.255 * Fov2MilRad, HUD_Base, "Gripen_Font_green")
Cropped_alfa_text.element_params      = {"HUD_DECLUTT"}
Cropped_alfa_text.controllers         = {{"parameter_compare_with_number",0, 1}}

local Cropped_G_indicator             = add_text_hud_param(-0.724 * Fov2MilRad, -305.9, "CUR_G", "HUD_BRIGHTNESS", "%.1f", HUD_Base, HUD_strdefs_digit, "Gripen_Font_green")
Cropped_G_indicator.element_params    = {"HUD_BRIGHTNESS", "CUR_G", "HUD_DECLUTT"}
Cropped_G_indicator.controllers       = {{"opacity_using_parameter", 0},{"text_using_parameter",1}, {"parameter_compare_with_number",2, 1}}

local Cropped_G_text                  = add_text_hud("G", -0.81 * Fov2MilRad, -305.9, HUD_Base, "Gripen_Font_green")
Cropped_G_text.element_params         = {"HUD_DECLUTT"}
Cropped_G_text.controllers            = {{"parameter_compare_with_number",0, 1}}


-------------------------------------------------------------------------------------------------------------------------------
local speedscaleheight = math.rad(4.89) * 1000 / 2

local SpeedScaleMask 					= CreateElement "ceMeshPoly"		-- change shape 
SpeedScaleMask.name 					=  create_guid_string()
SpeedScaleMask.primitivetype 			= "triangles"
SpeedScaleMask.material					= TST_G
SpeedScaleMask.parent_element			= HUD_Moving_Sides_Base.name
SpeedScaleMask.vertices	   	 			= {{-10, speedscaleheight}, {0, speedscaleheight}, {0, -speedscaleheight}, {-10,-speedscaleheight}}
SpeedScaleMask.indices					= {0, 1, 2, 0, 2, 3}
SpeedScaleMask.init_pos					= {-math.rad(7.75) * 1000, -math.rad(3.3) * 1000, 0} -- 57.5958653
SpeedScaleMask.init_rot					= {0, 0, 0}
SpeedScaleMask.h_clip_relation   		= h_clip_relations.INCREASE_IF_LEVEL 
SpeedScaleMask.level  		 			= HUD_DEFAULT_LEVEL
SpeedScaleMask.element_params			= {"HUD_DECLUTT"}
SpeedScaleMask.controllers				= {{"parameter_compare_with_number",0, 0}}
SpeedScaleMask.isvisible				= false
Add(SpeedScaleMask)


local SpeedScaleArrow				= Hud_Horizon_Line(HUD_HORIZON, 793, 987, 912, 1106, 0.5 * Fov2MilRad)
SpeedScaleArrow.name				= create_guid_string()
SpeedScaleArrow.init_pos			= {-0.63 * Fov2MilRad, (-0.282 * Fov2MilRad) + 7.26413} -- -64.86
SpeedScaleArrow.init_rot			= {-90}
SpeedScaleArrow.parent_element		= HUD_Moving_Sides_Base.name
SpeedScaleArrow.element_params		= {"HUD_BRIGHTNESS", "HUD_DECLUTT"}
SpeedScaleArrow.controllers			= {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 0}}
AddHudElement2(SpeedScaleArrow)


local Acc_Mask                 = CreateElement "ceMeshPoly"
Acc_Mask.name                  = create_guid_string()
Acc_Mask.primitivetype         = "triangles"
Acc_Mask.material              = TST_G
Acc_Mask.parent_element        = HUD_Left_Side_Indication_Base.name
Acc_Mask.vertices              = {{-0.003 * Fov2MilRad,0 * Fov2MilRad }, {0.003 * Fov2MilRad,0 * Fov2MilRad}, {-0.003 * Fov2MilRad,0.28 * Fov2MilRad}, {0.003 * Fov2MilRad,0.28 * Fov2MilRad}}
Acc_Mask.indices               = {0,1,2 , 3,2,1}
Acc_Mask.init_pos              = {-0.613 * Fov2MilRad, -0.1155 * Fov2MilRad + 7.26413}
Acc_Mask.h_clip_relation       = h_clip_relations.INCREASE_IF_LEVEL 
Acc_Mask.level                 = HUD_DEFAULT_LEVEL
Acc_Mask.element_params        = {"ACC"}
Acc_Mask.controllers           = {{"move_up_down_using_parameter",0, 0.0001203}}
Acc_Mask.isvisible             = false
Add(Acc_Mask)

local Acc_indicator            = CreateElement "ceMeshPoly"
Acc_indicator.name             = create_guid_string()
Acc_indicator.primitivetype    = "triangles"
Acc_indicator.material         = MakeMaterial(nil, {0, 510, 0, 510})
Acc_indicator.parent_element   = SpeedScaleArrow.name
Acc_indicator.vertices         = {{-0.002 * Fov2MilRad,0.002 * Fov2MilRad}, {0.002 * Fov2MilRad,0}, {-0.002 * Fov2MilRad,0.25 * Fov2MilRad}, {0.002 * Fov2MilRad,0.25 * Fov2MilRad}}
Acc_indicator.indices          = {0,1,2 , 3,2,1}
Acc_indicator.init_pos         = {-0.0124 * Fov2MilRad, -0.0156 * Fov2MilRad} 
Acc_indicator.init_rot         = {90, 0}
Acc_indicator.h_clip_relation  = h_clip_relations.DECREASE_IF_LEVEL 
Acc_indicator.level            = HUD_DEFAULT_LEVEL
Acc_indicator.element_params   = {"HUD_BRIGHTNESS"}
Acc_indicator.controllers      = {{"opacity_using_parameter", 0}}
AddHudElement2(Acc_indicator)

local Deacc_Mask               = CreateElement "ceMeshPoly"
Deacc_Mask.name                = create_guid_string()
Deacc_Mask.primitivetype       = "triangles"
Deacc_Mask.material            = TST_G
Deacc_Mask.parent_element      = HUD_Left_Side_Indication_Base.name
Deacc_Mask.vertices            = {{-0.003 * Fov2MilRad,0 * Fov2MilRad }, {0.003 * Fov2MilRad,0 * Fov2MilRad}, {-0.003 * Fov2MilRad,0.26 * Fov2MilRad}, {0.003 * Fov2MilRad,0.26 * Fov2MilRad}}
Deacc_Mask.indices             = {0,1,2, 3,2,1}
Deacc_Mask.init_pos            = {-0.613 * Fov2MilRad, -0.408 * Fov2MilRad + 7.26413}
Deacc_Mask.h_clip_relation     = h_clip_relations.INCREASE_IF_LEVEL 
Deacc_Mask.level               = HUD_DEFAULT_LEVEL
Deacc_Mask.element_params      = {"DEACC"}
Deacc_Mask.controllers         = {{"move_up_down_using_parameter",0, 0.0001203}}
Deacc_Mask.isvisible           = false
Add(Deacc_Mask)


local Deacc_indicator          = CreateElement "ceMeshPoly"
Deacc_indicator.name           = create_guid_string()
Deacc_indicator.primitivetype  = "triangles"
Deacc_indicator.material       = MakeMaterial(nil, {0, 510, 0, 510})
Deacc_indicator.parent_element = SpeedScaleArrow.name
Deacc_indicator.vertices       = {{-0.002 * Fov2MilRad,0 * Fov2MilRad}, {0.002 * Fov2MilRad,0}, {-0.002 * Fov2MilRad,0.186 * Fov2MilRad}, {0.002 * Fov2MilRad,0.186 * Fov2MilRad}}
Deacc_indicator.indices        = {0,1,2 , 3,2,1}
Deacc_indicator.init_pos       = {0.201 * Fov2MilRad, -0.0156 * Fov2MilRad}
Deacc_indicator.init_rot       = {90, 0}
Deacc_indicator.element_params = {"HUD_BRIGHTNESS"}
Deacc_indicator.controllers    = {{"opacity_using_parameter", 0}}
AddHudElement(Deacc_indicator)


local Speed_Scale_Line_Base           = CreateElement "ceSimple"
Speed_Scale_Line_Base.name            = create_guid_string()
Speed_Scale_Line_Base.init_pos        = {-0.611 * Fov2MilRad, 7.26413}
Speed_Scale_Line_Base.parent_element  = HUD_Moving_Sides_Base.name
Speed_Scale_Line_Base.element_params  = {"CURR_IAS"}
Speed_Scale_Line_Base.controllers     = {{"move_up_down_using_parameter",0, -0.0001203}}
AddHudElement(Speed_Scale_Line_Base)

local Lower_SpeedScaleMask           = CreateElement "ceSimpleLineObject"
Lower_SpeedScaleMask.name            = create_guid_string()
Lower_SpeedScaleMask.material        = TST_G
Lower_SpeedScaleMask.vertices	     = {{0, -65.36}, {0, -215.94}}
Lower_SpeedScaleMask.width           = 0.47
Lower_SpeedScaleMask.parent_element  = Speed_Scale_Line_Base.name
Lower_SpeedScaleMask.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
Lower_SpeedScaleMask.level           = HUD_DEFAULT_LEVEL + 1
Lower_SpeedScaleMask.element_params  = {"HUD_DECLUTT"}
Lower_SpeedScaleMask.controllers     = {{"parameter_compare_with_number",0, 0}}
Lower_SpeedScaleMask.isvisible       = false
Add(Lower_SpeedScaleMask)

local Upper_Speed_Scale_Line           = CreateElement "ceSimpleLineObject"
Upper_Speed_Scale_Line.name            = create_guid_string()
Upper_Speed_Scale_Line.material        = MakeMaterial(nil, {0, 510, 0, 510})
Upper_Speed_Scale_Line.vertices        = {{0, -64.9}, {0, 215.94}}
Upper_Speed_Scale_Line.width           = 0.46
Upper_Speed_Scale_Line.parent_element  = Speed_Scale_Line_Base.name
Upper_Speed_Scale_Line.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
Upper_Speed_Scale_Line.level           = HUD_DEFAULT_LEVEL + 1
Upper_Speed_Scale_Line.element_params  = {"HUD_BRIGHTNESS", "TransonicUpper"}
Upper_Speed_Scale_Line.controllers     = {{"opacity_using_parameter",0}, {"move_up_down_using_parameter",1, 0.0001203}}
AddHudElement2(Upper_Speed_Scale_Line)

local Lower_Speed_Scale_Line           = Copy(Upper_Speed_Scale_Line)
Lower_Speed_Scale_Line.init_pos        = {0, -280.84}
Lower_Speed_Scale_Line.element_params  = {"HUD_BRIGHTNESS", "TransonicLower"}
AddHudElement2(Lower_Speed_Scale_Line)


for i = 0, 28, 1 do
	SpeedScaleMark                 = CreateElement "ceMeshPoly"
	SpeedScaleMark.name            = create_guid_string()
	SpeedScaleMark.primitivetype   = "triangles"
	SpeedScaleMark.material        = MakeMaterial(nil, {0, 510, 0, 510})
	SpeedScaleMark.vertices        = {{-2.3,-0.002 * Fov2MilRad}, {2.3,-0.002 * Fov2MilRad}, {-2.3,0.002 * Fov2MilRad}, {2.3,0.002 * Fov2MilRad}}
	SpeedScaleMark.indices         = {0,1,2 , 3,2,1}
	SpeedScaleMark.init_pos        = {-1.84, -64.9 + (i * 10.03)}
	SpeedScaleMark.parent_element  = Speed_Scale_Line_Base.name
	SpeedScaleMark.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
	SpeedScaleMark.level           = HUD_DEFAULT_LEVEL + 1
	SpeedScaleMark.element_params  = {"HUD_BRIGHTNESS"}
	SpeedScaleMark.controllers     = {{"opacity_using_parameter",0}}
	AddHudElement2(SpeedScaleMark)
end



local Min_Speed           = CreateElement "ceSimpleLineObject"
Min_Speed.name            = create_guid_string()
Min_Speed.material        = MakeMaterial(nil, {0, 510, 0, 510})
Min_Speed.vertices        = {{0, 0}, {2.3, 0}, {4.6, 0}, {4.6, 4.6}}
Min_Speed.width           = 0.46
Min_Speed.init_pos        = {0, -44.84}
Min_Speed.parent_element  = Speed_Scale_Line_Base.name
Min_Speed.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
Min_Speed.level           = HUD_DEFAULT_LEVEL + 1
Min_Speed.element_params  = {"HUD_BRIGHTNESS"}
Min_Speed.controllers     = {{"opacity_using_parameter",0}}
AddHudElement2(Min_Speed)

HUD_Landing_Speed_Indicator                 = CreateElement "ceSimpleLineObject"
HUD_Landing_Speed_Indicator.name            = create_guid_string()
HUD_Landing_Speed_Indicator.material        = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Landing_Speed_Indicator.vertices        = {{0, 0}, {2.3, 0}, {4.6, 0}, {4.6, 4.6}}
HUD_Landing_Speed_Indicator.width           = 0.46
HUD_Landing_Speed_Indicator.init_pos        = {0, -64.9}
HUD_Landing_Speed_Indicator.parent_element  = Speed_Scale_Line_Base.name
HUD_Landing_Speed_Indicator.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
HUD_Landing_Speed_Indicator.level           = HUD_DEFAULT_LEVEL + 1
HUD_Landing_Speed_Indicator.element_params  = {"HUD_BRIGHTNESS", "ROTATE_SPEED"}
HUD_Landing_Speed_Indicator.controllers     = {{"opacity_using_parameter",0}, {"move_up_down_using_parameter",1, 0.0001203}}
AddHudElement2(HUD_Landing_Speed_Indicator)



HUD_GCW_Base                 = CreateElement "ceSimple"
HUD_GCW_Base.name            = create_guid_string()
HUD_GCW_Base.parent_element  = HUD_Velocity_Vector_Vertical_Line.name
HUD_GCW_Base.level           = HUD_DEFAULT_LEVEL + 1
HUD_GCW_Base.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
HUD_GCW_Base.element_params  = {"ROLL_HUD", "HUD_PULLUPQUE", "CURRENT_PHASE_STATIONARY", "CURRENT_PHASE_PARKED", "CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR", "CURRENT_PHASE_ROT", "CURRENT_PHASE_LR"}
HUD_GCW_Base.controllers     = {{"rotate_using_parameter",0, 1}, {"move_up_down_using_parameter",1, -0.0004}, {"parameter_compare_with_number",2, 0}, {"parameter_compare_with_number",3, 0}, {"parameter_compare_with_number",4, 0}, {"parameter_compare_with_number",5, 0}, {"parameter_compare_with_number",6, 0}, {"parameter_compare_with_number",7, 0}}
AddHudElement(HUD_GCW_Base)

HUD_Left_Ground_SYMB                = CreateElement "ceSimpleLineObject"
HUD_Left_Ground_SYMB.name           = create_guid_string()
HUD_Left_Ground_SYMB.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Left_Ground_SYMB.vertices       = {{-54, 4.2}, {-54, 0}, {-33.17, 0}}
HUD_Left_Ground_SYMB.width          = 0.7
HUD_Left_Ground_SYMB.parent_element = HUD_GCW_Base.name
HUD_Left_Ground_SYMB.element_params = {"HUD_BRIGHTNESS", "GROUNDSYMB"}
HUD_Left_Ground_SYMB.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}}
AddHudElement(HUD_Left_Ground_SYMB)

HUD_Middle_Ground_SYMB                = Copy(HUD_Left_Ground_SYMB)
HUD_Middle_Ground_SYMB.vertices       = {{12.25, 0}, {-12.25, 0}}
AddHudElement(HUD_Middle_Ground_SYMB)

HUD_Right_Ground_SYMB                = Copy(HUD_Left_Ground_SYMB)
HUD_Right_Ground_SYMB.vertices       = {{54, 4.2}, {54, 0}, {33.17, 0}}
AddHudElement(HUD_Right_Ground_SYMB)

HUD_LeftLeft_GCW                = Copy(HUD_Left_Ground_SYMB)
HUD_LeftLeft_GCW.vertices       = {{-54, 40}, {-54, 4.2}}
HUD_LeftLeft_GCW.element_params = {"HUD_BRIGHTNESS", "GROUNDSYMB", "PULLUPQUE", "PULLMORE"}
HUD_LeftLeft_GCW.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"parameter_in_range",2, -10000, 0}, {"parameter_in_range",3, -0.99, 0.5}}
AddHudElement(HUD_LeftLeft_GCW)

HUD_LeftRight_GCW               = Copy(HUD_LeftLeft_GCW)
HUD_LeftRight_GCW.vertices      = {{-47, 40}, {-47, 4.2}, {-33.17, 4.2}}
AddHudElement(HUD_LeftRight_GCW)

HUD_Middle_GCW                  = Copy(HUD_LeftLeft_GCW)
HUD_Middle_GCW.vertices         = {{12.25, 4.2}, {-12.25, 4.2}}
AddHudElement(HUD_Middle_GCW)

HUD_RightLeft_GCW               = Copy(HUD_LeftLeft_GCW)
HUD_RightLeft_GCW.vertices      = {{47, 40}, {47, 4.2}, {33.17, 4.2}}
AddHudElement(HUD_RightLeft_GCW)

HUD_RightRight_GCW              = Copy(HUD_LeftLeft_GCW)
HUD_RightRight_GCW.vertices     = {{54, 40}, {54, 4.2}}
AddHudElement(HUD_RightRight_GCW)


HUD_Left_GCW_Arrow                = Copy(HUD_LeftLeft_GCW)
HUD_Left_GCW_Arrow.vertices       = {{-56, 35}, {-50.5, 50}, {-45, 35}, {-56, 35}}
HUD_Left_GCW_Arrow.init_pos       = {0, -2}
HUD_Left_GCW_Arrow.element_params = {"HUD_BRIGHTNESS", "GROUNDSYMB", "PULLUPQUE", "PULLMORE"}
HUD_Left_GCW_Arrow.controllers    = {{"opacity_using_parameter",0}, {"parameter_compare_with_number",1, 1}, {"parameter_in_range",2, -10000, 0}, {"move_up_down_using_parameter",2, -0.00001}, {"parameter_in_range",3, -0.99, 0.5}}
AddHudElement(HUD_Left_GCW_Arrow)

HUD_Right_GCW_Arrow               = Copy(HUD_Left_GCW_Arrow)
HUD_Right_GCW_Arrow.vertices      = {{56, 35}, {50.5, 50}, {45, 35}, {56, 35}}
AddHudElement(HUD_Right_GCW_Arrow)


HUD_POS_HUD_Heading_Base                = CreateElement "ceSimple"
HUD_POS_HUD_Heading_Base.name           = create_guid_string()
HUD_POS_HUD_Heading_Base.init_pos       = {0, math.rad(90) * 1000}
HUD_POS_HUD_Heading_Base.parent_element = HUD_Pitch.name
HUD_POS_HUD_Heading_Base.element_params = {"HEADING_HUD"}
HUD_POS_HUD_Heading_Base.controllers    = {{"rotate_using_parameter",0, -math.rad(1)}}
AddHudElement(HUD_POS_HUD_Heading_Base)

HUD_NEG_HUD_Heading_Base                = CreateElement "ceSimple"
HUD_NEG_HUD_Heading_Base.name           = create_guid_string()
HUD_NEG_HUD_Heading_Base.init_pos       = {0, -math.rad(90) * 1000}
HUD_NEG_HUD_Heading_Base.parent_element = HUD_Pitch.name
HUD_NEG_HUD_Heading_Base.element_params = {"HEADING_HUD"}
HUD_NEG_HUD_Heading_Base.controllers    = {{"rotate_using_parameter",0, math.rad(1)}}
AddHudElement(HUD_NEG_HUD_Heading_Base)

-- make pitch lines from +10 to +80 degrees

local LineThickness = 2
local LineLength = 7.5

for j = 10, 80, 10 do

	local Spherify = 1--math.cos(math.rad(j)) / math.sin(math.rad(j))



	if j < 50 then
		Radius = math.rad(90-j) * Spherify * 1000  -- make radius 90 - j degrees
	else 
		Radius = math.rad(90-j) * 1000
	end

	local DigitRadius = Radius - 10 -- place digits 10 milliradians above line


	local HUD_POS_HUD_Heading_Base          = CreateElement "ceSimple"
	HUD_POS_HUD_Heading_Base.name           = "Base_"..j
	HUD_POS_HUD_Heading_Base.init_pos       = {0, Radius + (math.rad(j) * 1000) , 0}
	HUD_POS_HUD_Heading_Base.init_rot       = {0, 0, 0}
	HUD_POS_HUD_Heading_Base.parent_element = HUD_Pitch.name
	HUD_POS_HUD_Heading_Base.element_params = {"HEADING_HUD"}
	HUD_POS_HUD_Heading_Base.controllers    = {{"rotate_using_parameter" ,0, -math.rad(1) / Spherify }}
	AddHudElement(HUD_POS_HUD_Heading_Base)


	Circle                = Copy(HUD_Aiming_Circle_Base)
	Circle.parent_element = HUD_POS_HUD_Heading_Base.name
	Circle.element_params = {"HUD_BRIGHTNESS"}
	Circle.controllers    = {{"opacity_using_parameter",0}}
	set_circle(Circle, Radius, Radius - 1.4, 360, 360/2.5)
	AddHudElement(Circle)

	if j < 70 then		--from +10 to +60 degrees, make heading lines every 10 degs, at 70 every 30
		DegsEvery = 10 --/ Spherify
	else
		DegsEvery = 30 --/ Spherify
	end

	if j < 80 then -- and at 80 none

		for i = -180, 180, DegsEvery do	-- i = outer Circle
			VertHeadingLine                 = Copy(HUD_Left_Ground_SYMB)
			VertHeadingLine.vertices        = {{0, LineLength}, {0, 0}}
			VertHeadingLine.init_pos        = {Radius * math.cos(math.rad(i)), Radius * math.sin(math.rad(i))}
			VertHeadingLine.init_rot        = {i + 90}
			VertHeadingLine.width           = 0.7
			VertHeadingLine.parent_element  = "Base_"..j
			VertHeadingLine.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
			VertHeadingLine.level           = HUD_DEFAULT_LEVEL
			VertHeadingLine.ScreenType      = Stype
			VertHeadingLine.element_params  = {"HUD_BRIGHTNESS"}
			VertHeadingLine.controllers     = {{"opacity_using_parameter",0}}
			AddHudElement2(VertHeadingLine)
		end

		for k = -185, 165, 20 do
			PitchAngleDigits          = add_text_hud("+"..j, DigitRadius * math.cos(math.rad(k)), DigitRadius * math.sin(math.rad(k)), HUD_POS_HUD_Heading_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
			PitchAngleDigits.init_rot = {k + 90, 0 , 0}
		end

	end
end


-- make pitch lines from -10 to -80 degrees
local SpikeWidth = 12.5	
local SpikeHeight = 18.75

local Spike_Mask_Offset = 3.5
local SpikeHalfAngle = math.atan(SpikeWidth / SpikeHeight / 2 )

for j = -10, -80, -10 do

	local Radius = math.rad(90+j) * 1000
	local DigitRadius = Radius + 10
	
	if j == -90 then
		DegsEvery = 90
	elseif j >= -60 then
		DegsEvery = 10
	else
		DegsEvery = 30
	end

	for i = -180, 180, DegsEvery do	-- i = outer Circle
		HeadingSpike                 = Copy(HUD_Left_Ground_SYMB)
		HeadingSpike.vertices        = {{-SpikeWidth * 0.5, -1.4}, {0, SpikeHeight}, {SpikeWidth * 0.5, -1.4}}
		HeadingSpike.init_pos        = {(Radius) * math.cos(math.rad(i)), ((Radius) * math.sin(math.rad(i)))}
		HeadingSpike.init_rot        = {i - 90}
		HeadingSpike.width           = 0.7
		HeadingSpike.parent_element  = HUD_NEG_HUD_Heading_Base.name
		HeadingSpike.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
		HeadingSpike.level           = HUD_DEFAULT_LEVEL
		HeadingSpike.ScreenType      = Stype
		HeadingSpike.element_params  = {"HUD_BRIGHTNESS"}
		HeadingSpike.controllers     = {{"opacity_using_parameter",0}}
		AddHudElement2(HeadingSpike)

		HeadingSpikeMask                 = Copy(SpeedScaleMark)
		HeadingSpikeMask.material        = MakeMaterial(nil, {0, 0, 0, 0})
		HeadingSpikeMask.vertices        = {{(-0.5 * SpikeWidth + LineThickness) - 1.3, (Spike_Mask_Offset + LineThickness) - 0.05}, {(0.5 * SpikeWidth - LineThickness) + 1.3, (Spike_Mask_Offset + LineThickness) - 0.05}, {(-0.5 * SpikeWidth + LineThickness) - 1.3, (Spike_Mask_Offset + LineThickness) + 1.6}, {(0.5 * SpikeWidth - LineThickness) + 1.3, (Spike_Mask_Offset + LineThickness) + 1.6}}
		HeadingSpikeMask.indices         = {0,1,2, 3,2,1}
		HeadingSpikeMask.init_pos        = {(Radius - Spike_Mask_Offset * LineThickness) * math.cos(math.rad(i)), ((Radius - Spike_Mask_Offset * LineThickness) * math.sin(math.rad(i)))}
		HeadingSpikeMask.init_rot        = {i - 90}
		HeadingSpikeMask.parent_element  = HUD_NEG_HUD_Heading_Base.name
		HeadingSpikeMask.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
		HeadingSpikeMask.level           = HUD_DEFAULT_LEVEL
		AddHudElement2(HeadingSpikeMask)
	end


	Circle                = Copy(HUD_Aiming_Circle_Base)
	Circle.parent_element = HUD_NEG_HUD_Heading_Base.name
	Circle.element_params = {"HUD_BRIGHTNESS"}
	Circle.controllers    = {{"opacity_using_parameter",0}}
	set_circle(Circle, Radius, Radius - 1.4, 360, 360/2.5)
	AddHudElement(Circle)

	if j >= -80 then

		if j >= -60 then		--from +10 to +60 degrees, make heading lines every 10 degs, at 70 every 30
			DegsEvery = 20
		else
			DegsEvery = 60
		end

		for k = -175, 175, DegsEvery do
			PitchAngleDigits          = add_text_hud(j, (DigitRadius * math.cos(math.rad(k))), ((DigitRadius * math.sin(math.rad(k)))), HUD_NEG_HUD_Heading_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
			PitchAngleDigits.init_rot = {k-90, 0 , 0}
		end
	end

end


local Radius = math.rad(2) * 1000

	for i = 0, 270, 90 do	-- i = outer Circle
		HeadingSpike                 = Copy(HUD_Left_Ground_SYMB)
		HeadingSpike.vertices        = {{-SpikeWidth * 0.5, -1.4}, {0, SpikeHeight}, {SpikeWidth * 0.5, -1.4}}
		HeadingSpike.init_pos        = {(Radius) * math.cos(math.rad(i)), ((Radius) * math.sin(math.rad(i)))}
		HeadingSpike.init_rot        = {i - 90}
		HeadingSpike.width           = 0.7
		HeadingSpike.parent_element  = HUD_NEG_HUD_Heading_Base.name
		HeadingSpike.h_clip_relation = h_clip_relations.DECREASE_IF_LEVEL
		HeadingSpike.level           = HUD_DEFAULT_LEVEL
		HeadingSpike.ScreenType      = Stype
		HeadingSpike.element_params  = {"HUD_BRIGHTNESS"}
		HeadingSpike.controllers     = {{"opacity_using_parameter",0}}
		AddHudElement2(HeadingSpike)

		HeadingSpikeMask                 = Copy(SpeedScaleMark)
		HeadingSpikeMask.material        = MakeMaterial(nil, {0, 0, 0, 0})
		HeadingSpikeMask.vertices        = {{(-0.5 * SpikeWidth + LineThickness) - 1.3, (Spike_Mask_Offset + LineThickness) - 0.6}, {(0.5 * SpikeWidth - LineThickness) + 1.3, (Spike_Mask_Offset + LineThickness) - 0.6}, {(-0.5 * SpikeWidth + LineThickness) - 1.3, (Spike_Mask_Offset + LineThickness) + 1.6}, {(0.5 * SpikeWidth - LineThickness) + 1.3, (Spike_Mask_Offset + LineThickness) + 1.6}}
		HeadingSpikeMask.indices         = {0,1,2, 3,2,1}
		HeadingSpikeMask.init_pos        = {(Radius - Spike_Mask_Offset * LineThickness) * math.cos(math.rad(i)), ((Radius - Spike_Mask_Offset * LineThickness) * math.sin(math.rad(i)))}
		HeadingSpikeMask.init_rot        = {i - 90}
		HeadingSpikeMask.parent_element  = HUD_NEG_HUD_Heading_Base.name
		HeadingSpikeMask.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
		HeadingSpikeMask.level           = HUD_DEFAULT_LEVEL
		AddHudElement2(HeadingSpikeMask)
	end

	Circle                = Copy(HUD_Aiming_Circle_Base)
	Circle.parent_element = HUD_NEG_HUD_Heading_Base.name
	Circle.element_params = {"HUD_BRIGHTNESS"}
	Circle.controllers    = {{"opacity_using_parameter",0}}
	set_circle(Circle, Radius, Radius - 1.4, 360, 360/2.5)
	AddHudElement(Circle)

HUD_Top_Compass                = CreateElement "ceMeshPoly"
HUD_Top_Compass.name           = create_guid_string()
HUD_Top_Compass.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Top_Compass.vertices       = {{-math.rad(45) * 100, -0.7}, {math.rad(45) * 100, -0.7}, {-math.rad(45) * 100, 0.7}, {math.rad(45) * 100, 0.7}, 
								  {-0.7, -math.rad(45) * 100}, {0.7, -math.rad(45) * 100}, {-0.7, math.rad(45) * 100}, {0.7, math.rad(45) * 100}}
HUD_Top_Compass.indices        = {0,1,2 , 3,2,1, 
								  4,5,6 , 7,6,5}
HUD_Top_Compass.parent_element = HUD_POS_HUD_Heading_Base.name
HUD_Top_Compass.element_params = {"HUD_BRIGHTNESS"}
HUD_Top_Compass.controllers    = {{"opacity_using_parameter",0}}
AddHudElement(HUD_Top_Compass)

HUD_Top_Compass_N              = add_text_hud("N", 0, -math.rad(50) * 100, HUD_POS_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Top_Compass_S              = add_text_hud("S", 0, math.rad(50) * 100, HUD_POS_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Top_Compass_S.init_rot     = {180}
HUD_Top_Compass_W              = add_text_hud("W", -math.rad(50) * 100, 0, HUD_POS_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Top_Compass_W.init_rot     = {-90}
HUD_Top_Compass_E              = add_text_hud("E", math.rad(50) * 100, 0, HUD_POS_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Top_Compass_E.init_rot     = {90}

HUD_Top_Compass_N_Arrow                = CreateElement "ceSimpleLineObject"
HUD_Top_Compass_N_Arrow.name           = create_guid_string()
HUD_Top_Compass_N_Arrow.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Top_Compass_N_Arrow.vertices       = {{-1.45, -math.rad(37.5) * 100}, {0, -math.rad(45) * 100}, {1.45, -math.rad(37.5) * 100}}
HUD_Top_Compass_N_Arrow.width          = 0.7
HUD_Top_Compass_N_Arrow.parent_element = HUD_POS_HUD_Heading_Base.name
HUD_Top_Compass_N_Arrow.element_params = {"HUD_BRIGHTNESS"}
HUD_Top_Compass_N_Arrow.controllers    = {{"opacity_using_parameter",0}}
AddHudElement(HUD_Top_Compass_N_Arrow)

HUD_Bottom_Compass                = CreateElement "ceMeshPoly"
HUD_Bottom_Compass.name           = create_guid_string()
HUD_Bottom_Compass.material       = MakeMaterial(nil, {0, 510, 0, 510})
HUD_Bottom_Compass.vertices       = {{-math.rad(5) * 100, -0.7}, {math.rad(5) * 100, -0.7}, {-math.rad(5) * 100, 0.7}, {math.rad(5) * 100, 0.7}, 
								     {-0.7, -math.rad(5) * 100}, {0.7, -math.rad(5) * 100}, {-0.7, math.rad(5) * 100}, {0.7, math.rad(5) * 100}}
HUD_Bottom_Compass.indices        = {0,1,2 , 3,2,1, 
								     4,5,6 , 7,6,5}
HUD_Bottom_Compass.parent_element = HUD_NEG_HUD_Heading_Base.name
HUD_Bottom_Compass.element_params = {"HUD_BRIGHTNESS"}
HUD_Bottom_Compass.controllers    = {{"opacity_using_parameter",0}}
AddHudElement(HUD_Bottom_Compass)

HUD_Bottom_Compass_N              = add_text_hud("S", 0, -math.rad(35) * 100, HUD_NEG_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Bottom_Compass_S              = add_text_hud("N", 0, math.rad(35) * 100, HUD_NEG_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Bottom_Compass_S.init_rot     = {180}
HUD_Bottom_Compass_E              = add_text_hud("W", -math.rad(35) * 100, 0, HUD_NEG_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Bottom_Compass_E.init_rot     = {90}
HUD_Bottom_Compass_W              = add_text_hud("E", math.rad(35) * 100, 0, HUD_NEG_HUD_Heading_Base, "Gripen_Font_green", HUD_pitch_digit)
HUD_Bottom_Compass_W.init_rot     = {-90}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------