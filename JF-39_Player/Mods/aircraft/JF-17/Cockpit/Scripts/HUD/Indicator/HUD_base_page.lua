dofile(LockOn_Options.script_path.."HUD/Indicator/HUD_def.lua")
dofile(LockOn_Options.common_script_path.."elements_defs.lua")
dofile(LockOn_Options.common_script_path.."devices_defs.lua")



Mask_Color = MakeMaterial(nil, {0, 0, 255, 127})

local Show_Masks = false

--HUD_Nose_Base                 = CreateElement "ceMeshPoly"
--HUD_Nose_Base.name            = "HUDNOSEBASE"--create_guid_string()
--HUD_Nose_Base.primitivetype   = "triangles"
--HUD_Nose_Base.init_pos        = {0, -math.rad(2531.71)}
--HUD_Nose_Base.material        = MakeMaterial(nil, {0, 510, 0, 510})
--HUD_Nose_Base.h_clip_relation = h_clip_relations.REWRITE_LEVEL 
--HUD_Nose_Base.level           = HUD_DEFAULT_LEVEL - 1
--HUD_Nose_Base.change_opacity  = false
--HUD_Nose_Base.collimated      = true
--HUD_Nose_Base.element_params  = {"ROLL_RAD"}
--HUD_Nose_Base.controllers     = {{"rotate_using_parameter",2, 1}}
--set_circle(HUD_Nose_Base, 5, 0, 360, 15)
--Add(HUD_Nose_Base)

NAV_total_FOV                 = CreateElement "ceMeshPoly"
NAV_total_FOV.name            = create_guid_string()
NAV_total_FOV.primitivetype   = "triangles"
NAV_total_FOV.vertices        = {{-160, -255}, {0, -255}, {-201.7, -184}, {-236.2, -59.5}, {-233, 107.8}, {-217.5, 139.3}, {-180.8, 199.2}, {-140, 213}, {-110, 220.3}, {-78.5, 225.4}, {-18.7, 229.8}, 
								 {18.7, 229.8}, {79.3, 225.7}, {111, 220.6}, {143.3, 212.8}, {183.6, 199.3}, {219, 139.4}, {235, 107.8}, {238.4, -59.5}, {204, -184}, {163, -255}}
NAV_total_FOV.indices         = {0,1,2 , 2,1,3 , 3,1,4 , 4,1,5 , 5,1,6 , 6,1,7 , 7,1,8 , 8,1,9 , 9,1,10 , 10,1,
								 11 , 11,1,12 , 12,1,13 , 13,1,14 , 14,1,15 , 15,1,16 , 16,1,17 , 17,1,18 , 18,1,19 , 19,1,20}
NAV_total_FOV.init_pos        = {0, -90}
NAV_total_FOV.init_rot        = {0, 0, -25}
NAV_total_FOV.material        = Mask_Color
NAV_total_FOV.h_clip_relation = h_clip_relations.REWRITE_LEVEL
NAV_total_FOV.level           = HUD_DEFAULT_LEVEL - 1
NAV_total_FOV.change_opacity  = false
NAV_total_FOV.collimated      = false
if Show_Masks == true then
	NAV_total_FOV.isvisible   = true
elseif Show_Masks == false then
	NAV_total_FOV.isvisible   = false
end
Add(NAV_total_FOV)

HUD_base_clip_FOV                 = CreateElement "ceMeshPoly"
HUD_base_clip_FOV.name            = create_guid_string()
HUD_base_clip_FOV.primitivetype   = "triangles"
HUD_base_clip_FOV.vertices        = {{-236.2, -255}, {238.4, -255}, {-236.2, 229.8}, {238.4, 229.8}}
HUD_base_clip_FOV.indices         = {0,1,2 , 3,2,1}
HUD_base_clip_FOV.material        = Mask_Color
HUD_base_clip_FOV.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL 
HUD_base_clip_FOV.level           = HUD_DEFAULT_LEVEL  - 1
HUD_base_clip_FOV.change_opacity  = false
HUD_base_clip_FOV.collimated      = false
if Show_Masks == true then
	HUD_base_clip_FOV.isvisible   = true
elseif Show_Masks == false then
	HUD_base_clip_FOV.isvisible   = false
end
Add(HUD_base_clip_FOV)



dofile(LockOn_Options.script_path.."HUD/Indicator/HUD_indication_page.lua")