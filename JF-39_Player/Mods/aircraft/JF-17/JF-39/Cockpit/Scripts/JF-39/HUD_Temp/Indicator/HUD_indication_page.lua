dofile(LockOn_Options.script_path.."JF-39/HUD_Temp/Indicator/HUD_def.lua")

-----------------------------------------
-- JF_39 HUD BASE
-----------------------------------------
local HUD_BASE 				= CreateElement "ceSimple"
HUD_BASE.name  				= create_guid_string()
HUD_BASE.init_pos			= {0, 0.51, 1.25}		          
HUD_BASE.controllers        = {{"hud_check_power"},{"parameter_in_range" ,0,0.9,1.1},{"parameter_in_range" ,1, 23,360},{"parameter_in_range" ,2, -30,180}, {"parameter_in_range" ,3, 0.9,1.1} }
AddHudElement(HUD_BASE)

local Left_Side_Indication_base 			= CreateElement "ceSimple"
Left_Side_Indication_base.name  			= create_guid_string()
Left_Side_Indication_base.init_pos			= {-0.83, -0.73, -0.35}--{-0.69, -0.65, -0.70}
Left_Side_Indication_base.parent_element	= HUD_BASE.name
AddHudElement(Left_Side_Indication_base)

local Mach_indicator 				= CreateElement "ceStringPoly"
Mach_indicator.name 				= create_guid_string()
Mach_indicator.parent_element		= Left_Side_Indication_base.name
Mach_indicator.material				= fonts["Gripen_Font_green"]
Mach_indicator.init_pos 			= {0.055, 0}
Mach_indicator.alignment 			= "LeftCenter"
Mach_indicator.stringdefs 			= HUD_strdefs_digit
Mach_indicator.formats 				= {"%0.0f","%s"}
Mach_indicator.element_params 		= {"MACH_B","JF39_HUD"}
Mach_indicator.controllers 			= {{"text_using_parameter",0,0},{"parameter_in_range" ,0, 3, 99.5},{"opacity_using_parameter", 1}}
AddHudElement(Mach_indicator)

local Mach_indicator2 				= CreateElement "ceStringPoly"
Mach_indicator2.name 				= create_guid_string()
Mach_indicator2.parent_element		= Left_Side_Indication_base.name
Mach_indicator2.material			= fonts["Gripen_Font_green"]
Mach_indicator2.init_pos 			= {0, 0}
Mach_indicator2.alignment 			= "LeftCenter"
Mach_indicator2.stringdefs 			= HUD_strdefs_digit
Mach_indicator2.formats 			= {"%0.2f","%s"}
Mach_indicator2.element_params 		= {"MACH_A","JF39_HUD"}
Mach_indicator2.controllers 		= {{"text_using_parameter",0,0},{"parameter_in_range" ,0, 0.995, 3},{"opacity_using_parameter", 1}}
AddHudElement(Mach_indicator2)

local M_text		= add_text_hud("M ", -0.05, 0, Left_Side_Indication_base , "Gripen_Font_green", HUD_strdefs_text)
local MachComma		= add_text_hud(".", -0.015, 0, Mach_indicator , "Gripen_Font_green", HUD_strdefs_text)
local GS_Text       = add_text_hud("GS ", -0.05, -0.105, Left_Side_Indication_base, "Gripen_Font_green")
local GS_Indicator  = add_text_hud_param(0.075, -0.105, "CURR_GS", "JF39_HUD", "%.0f", Left_Side_Indication_base, HUD_strdefs_digit, "Gripen_Font_green")--2nd CURR_GS is the transparency parameter

-----------------------------------------
-- JF_39 HUD SPECIAL INDICATION
-----------------------------------------
--[[
---Landing mode indicator
local landing_mode_ind 			 	= add_text_hud("L", -0.6, 0.4, HUD_BASE , "Gripen_Font_green", HUD_strdefs_text, "CenterCenter")
landing_mode_ind.element_params  	= {"JF39_HUD"}
landing_mode_ind.controllers     	= {{"hud_aoa_bracket", 0.36, 0.6,"parameter_in_range" ,0,0.9,1.1} }

local TerrainAltitudeBox                = Hud_Horizon_Line(HUD_HORIZON, 1861, 969, 2296, 1116, 0.8) 
TerrainAltitudeBox.name                 = create_guid_string()
TerrainAltitudeBox.init_pos             = {0.68, -0.68, 0}
TerrainAltitudeBox.init_rot             = {0, 0, 0}
TerrainAltitudeBox.parent_element       = HUD_BASE.name                
TerrainAltitudeBox.element_params       = {"JF39_HUD"}
TerrainAltitudeBox.controllers          = {{"opacity_using_parameter" ,0}}  
AddHudElement(TerrainAltitudeBox)

local VelocityVectorHUD                 = Hud_Horizon_Line(HUD_HORIZON, 1506, 1065, 1794, 1145, 1)
VelocityVectorHUD.name                  = create_guid_string()
VelocityVectorHUD.init_pos              = {0, -0.0212, 0}
VelocityVectorHUD.element_params        = {"JF39_AP", "JF39_HUD"}
VelocityVectorHUD.controllers           = {{"parameter_in_range" ,0, 0.9,1.1, "opacity_using_parameter" , 0}}   
VelocityVectorHUD.parent_element        = HUD_BASE.name
AddHudElement(VelocityVectorHUD)

local VelocityVectorLimited              = Hud_Horizon_Line(HUD_HORIZON, 454, 1097, 742, 1107, 1.5)
VelocityVectorLimited.name               = create_guid_string()
VelocityVectorLimited.init_pos           = {0, -1.29, 0}
VelocityVectorLimited.element_params     = {"JF39_AP", "JF39_HUD"}
VelocityVectorLimited.controllers        = {{"parameter_in_range" ,0, 0.9,1.1, "opacity_using_parameter" , 0}}   
VelocityVectorLimited.parent_element     = HUD_BASE.name
AddHudElement(VelocityVectorLimited)     


local GroundCollisionWarning             = create_HUD_GCW(HUD_GroundCollisionWarning, 184, 458, 2682, 1348, 0.333) 
GroundCollisionWarning.name              = create_guid_string()
GroundCollisionWarning.init_pos          = {0, -0.3, 0}
GroundCollisionWarning.init_rot          = {0, 0, 0}
GroundCollisionWarning.parent_element    = HUD_BASE.name                
GroundCollisionWarning.element_params    = {"JF39_HUD","PULLUPQUE", "ROLL_HUD", "VELVEC_HUD_Y",
--"CURRENT_PHASE_STATIONARY","CURRENT_PHASE_PARKED","CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR","CURRENT_PHASE_ROT","CURRENT_PHASE_TD","CURRENT_PHASE_LR","CURRENT_PHASE_PAL",
 "PULLMORE","VELVEC_HUD_X"}
GroundCollisionWarning.controllers              = { {"opacity_using_parameter" ,0},
                                                    {"parameter_in_range",1, -10000,0},
                                                    {"rotate_using_parameter" ,2, 1.00},
                                                    --{"move_up_down_using_parameter",3, 0.322},
                                                    --{"parameter_compare_with_number",4, 0},
                                                    --{"parameter_compare_with_number",5, 0},
                                                    --{"parameter_compare_with_number",6, 0},
                                                    --{"parameter_compare_with_number",7, 0},
                                                    --{"parameter_compare_with_number",8, 0},
                                                    --{"parameter_compare_with_number",9, 0},
                                                    --{"parameter_compare_with_number",10, 0},
                                                    --{"parameter_compare_with_number",11, 0},
                                                    {"parameter_in_range",12, -0.99,0.5},
                                                    {"move_left_right_using_parameter",13, 0.322} }                                                                        
AddHudElement(GroundCollisionWarning)

local GCW_Arrow_L                       = create_HUD_GCW(HUD_GroundCollisionWarning, 23, 23, 508, 443, 0.333) 
GCW_Arrow_L.name                        = create_guid_string()
GCW_Arrow_L.init_pos                    = {-0.2655, 0.09, 0}
GCW_Arrow_L.init_rot                    = {0, 0, 0}
GCW_Arrow_L.parent_element              = GroundCollisionWarning.name        
GCW_Arrow_L.element_params              = {"JF39_HUD","PULLUPQUE", "PULLMORE"}
GCW_Arrow_L.controllers                 = { {"opacity_using_parameter" ,0},{"move_up_down_using_parameter",1, -0.000006}, {"parameter_in_range",2, -0.99,0.5}  }                                                                        
AddHudElement(GCW_Arrow_L)

local GCW_Arrow_R                       = create_HUD_GCW(HUD_GroundCollisionWarning, 23, 23, 508, 443, 0.333) 
GCW_Arrow_R.name                        = create_guid_string()
GCW_Arrow_R.init_pos                    = {0.2655, 0.09, 0}
GCW_Arrow_R.init_rot                    = {0, 0, 0}
GCW_Arrow_R.parent_element              = GroundCollisionWarning.name        
GCW_Arrow_R.element_params              = {"JF39_HUD","PULLUPQUE", "PULLMORE"}
GCW_Arrow_R.controllers                 = { {"opacity_using_parameter" ,0},{"move_up_down_using_parameter",1, -0.000006}, {"parameter_in_range",2, -0.99,0.5}  }                                                                        
AddHudElement(GCW_Arrow_R)
]]

-----------------------------------------
-- JF_39 HUD PITCH INDICATION
-----------------------------------------

local HUD_PITCH 						= CreateElement "ceSimple"
HUD_PITCH.name  						= create_guid_string()
HUD_PITCH.init_pos						= {0, 0}
HUD_PITCH.init_rot						= {0, 0, 15}
HUD_PITCH.parent_element				= HUD_BASE.name
HUD_PITCH.element_params 				= {"ROLL_HUD","PITCH_HUD"}
HUD_PITCH.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(HUD_PITCH)

local HorizonLineHUD 					= CreateElement "ceSimple"
HorizonLineHUD.name						= create_guid_string()
HorizonLineHUD.init_pos					= {0, 0, 0}
HorizonLineHUD.parent_element			= HUD_PITCH.name
AddHudElement(HorizonLineHUD)

local HorizonLineRight 					= Hud_Horizon_Line(HUD_HORIZON, 0, 1290, 3300, 1304, 1)
HorizonLineRight.name					= create_guid_string()
HorizonLineRight.init_pos				= {1.2225, 0, 0}
HorizonLineRight.parent_element			= HUD_PITCH.name
HorizonLineRight.element_params 		= {"JF39_HUD"}
HorizonLineRight.controllers			= {{"opacity_using_parameter" ,0}}
AddHudElement(HorizonLineRight)

local HorizonLineRightRight 			= Hud_Horizon_Line(HUD_HORIZON, 0, 1290, 3300, 1304, 1)
HorizonLineRightRight.name				= create_guid_string()
HorizonLineRightRight.init_pos			= {1.2225*2, 0, 0}
HorizonLineRightRight.parent_element	= HUD_PITCH.name
HorizonLineRightRight.element_params 	= {"JF39_HUD"}
HorizonLineRightRight.controllers		= {{"opacity_using_parameter" ,0}}
AddHudElement(HorizonLineRightRight)

local HorizonLineLeft 					= Hud_Horizon_Line(HUD_HORIZON, 0, 1290, 3300, 1304, 1)
HorizonLineLeft.name					= create_guid_string()
HorizonLineLeft.init_pos				= {-1.2225, 0, 0}
HorizonLineLeft.parent_element			= HUD_PITCH.name
HorizonLineLeft.element_params 			= {"JF39_HUD"}
HorizonLineLeft.controllers				= {{"opacity_using_parameter" ,0}}
AddHudElement(HorizonLineLeft)

local HorizonLineLeftLeft  				= Hud_Horizon_Line(HUD_HORIZON, 0, 1290, 3300, 1304, 1)
HorizonLineLeftLeft.name				= create_guid_string()
HorizonLineLeftLeft.init_pos			= {-1.2225*2, 0, 0}
HorizonLineLeftLeft.parent_element		= HUD_PITCH.name
HorizonLineLeftLeft.element_params 		= {"JF39_HUD"}
HorizonLineLeftLeft.controllers			= {{"opacity_using_parameter" ,0}}
AddHudElement(HorizonLineLeftLeft)

local PositivePitchLinesHUD 			= Hud_Pitch_Lines2(HUD_POSITIVE_PITCH, 0, 0, 9984, 9984, 6.9)
PositivePitchLinesHUD.name				= create_guid_string()
PositivePitchLinesHUD.init_pos			= {0, 7.7, 0}
PositivePitchLinesHUD.init_rot			= {180, 0, 0}
PositivePitchLinesHUD.parent_element	= HUD_PITCH.name
PositivePitchLinesHUD.element_params 	= {"JF39_HUD","HEADING_HUD",}
PositivePitchLinesHUD.controllers	 	= {{"opacity_using_parameter" ,0},{"rotate_using_parameter" ,1, math.rad(360)/-360},}
AddHudElement(PositivePitchLinesHUD)

local NegativePitchLinesHUD 			= Hud_Pitch_Lines2(HUD_NEGATIVE_PITCH, 0, 0, 9984, 9984, 6.9)
NegativePitchLinesHUD.name				= create_guid_string()
NegativePitchLinesHUD.init_pos			= {0, -7.7, 0}
NegativePitchLinesHUD.parent_element	= HUD_PITCH.name
NegativePitchLinesHUD.element_params 	= {"JF39_HUD","HEADING_HUD",}
NegativePitchLinesHUD.controllers	 	= {{"opacity_using_parameter" ,0},{"rotate_using_parameter" ,1, math.rad(360)/360},}
AddHudElement(NegativePitchLinesHUD)

local HorizonLineHeadingDots			= add_text_hud("!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!,,,,!", 0, 0, HUD_PITCH , "Gripen_Font_green", HUD_HorizonLineHeading, "CenterCenter")
HorizonLineHeadingDots.init_pos			= {1.25, 0.0110,0.065}
HorizonLineHeadingDots.element_params	= {"HEADING_HUD"}
HorizonLineHeadingDots.controllers		= { {"move_left_right_using_parameter",0, -0.0110555}  }

local AltitudeKeepingBoxes              = Hud_Horizon_Line(HUD_HORIZON, 1086, 1786, 2218, 2022, 1)
AltitudeKeepingBoxes.name               = create_guid_string()
AltitudeKeepingBoxes.init_pos           = {0, -0.067, 0}
AltitudeKeepingBoxes.parent_element     = HUD_PITCH.name
AltitudeKeepingBoxes.element_params     = {"JF39_AP", "JF39_HUD"}
AltitudeKeepingBoxes.controllers        = {{"parameter_in_range" ,0, 0.9,1.1, "opacity_using_parameter" , 0}}       
AddHudElement(AltitudeKeepingBoxes)

        



--------------------------------------------
-- JF_39 HUD PITCH INDICATION ANGLE
--------------------------------------------

local PosPitch175_Base 						= CreateElement "ceSimple"
PosPitch175_Base.name  						= create_guid_string()
PosPitch175_Base.init_pos						= {0, 0}
PosPitch175_Base.init_rot						= {5, 0, 0}
PosPitch175_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch175_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch175_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch175_Base)


pitch1_175					= add_text_hud("+10", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_175.init_pos			= {0, 6.82, 0.10}
pitch1_175.init_rot			= {180, 0, 0}

pitch2_175					= add_text_hud("+20", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_175.init_pos			= {0, 5.96, 0.10}
pitch2_175.init_rot			= {180, 0, 0}
	
pitch3_175					= add_text_hud("+30", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_175.init_pos			= {0, 5.098, 0.10}
pitch3_175.init_rot			= {180, 0, 0}

pitch4_175					= add_text_hud("+40", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_175.init_pos			= {0, 4.234, 0.10}
pitch4_175.init_rot			= {180, 0, 0}

pitch5_175					= add_text_hud("+50", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_175.init_pos			= {0, 3.37, 0.10}
pitch5_175.init_rot			= {180, 0, 0}

pitch6_175					= add_text_hud("+60", 0, 0, PosPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_175.init_pos			= {0, 2.51, 0.10}
pitch6_175.init_rot			= {180, 0, 0}



--
local PosPitch155_Base 						= CreateElement "ceSimple"
PosPitch155_Base.name  						= create_guid_string()
PosPitch155_Base.init_pos						= {0, 0}
PosPitch155_Base.init_rot						= {25, 0, 0}
PosPitch155_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch155_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch155_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch155_Base)


pitch1_155					= add_text_hud("+10", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_155.init_pos			= {0, 6.82, 0.10}
pitch1_155.init_rot			= {180, 0, 0}

pitch2_155					= add_text_hud("+20", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_155.init_pos			= {0, 5.96, 0.10}
pitch2_155.init_rot			= {180, 0, 0}
	
pitch3_155					= add_text_hud("+30", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_155.init_pos			= {0, 5.098, 0.10}
pitch3_155.init_rot			= {180, 0, 0}

pitch4_155					= add_text_hud("+40", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_155.init_pos			= {0, 4.234, 0.10}
pitch4_155.init_rot			= {180, 0, 0}

pitch5_155					= add_text_hud("+50", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_155.init_pos			= {0, 3.37, 0.10}
pitch5_155.init_rot			= {180, 0, 0}

pitch6_155					= add_text_hud("+60", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_155.init_pos			= {0, 2.51, 0.10}
pitch6_155.init_rot			= {180, 0, 0}

pitch7_155					= add_text_hud("+70", 0, 0, PosPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_155.init_pos			= {0, 1.65, 0.10}
pitch7_155.init_rot			= {180, 0, 0}

--

local PosPitch135_Base 						= CreateElement "ceSimple"
PosPitch135_Base.name  						= create_guid_string()
PosPitch135_Base.init_pos						= {0, 0}
PosPitch135_Base.init_rot						= {45, 0, 0}
PosPitch135_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch135_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch135_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch135_Base)


pitch1_135					= add_text_hud("+10", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_135.init_pos			= {0, 6.82, 0.10}
pitch1_135.init_rot			= {180, 0, 0}

pitch2_135					= add_text_hud("+20", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_135.init_pos			= {0, 5.96, 0.10}
pitch2_135.init_rot			= {180, 0, 0}
	
pitch3_135					= add_text_hud("+30", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_135.init_pos			= {0, 5.098, 0.10}
pitch3_135.init_rot			= {180, 0, 0}

pitch4_135					= add_text_hud("+40", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_135.init_pos			= {0, 4.234, 0.10}
pitch4_135.init_rot			= {180, 0, 0}

pitch5_135					= add_text_hud("+50", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_135.init_pos			= {0, 3.37, 0.10}
pitch5_135.init_rot			= {180, 0, 0}

pitch6_135					= add_text_hud("+60", 0, 0, PosPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_135.init_pos			= {0, 2.51, 0.10}
pitch6_135.init_rot			= {180, 0, 0}



--

local PosPitch115_Base 						= CreateElement "ceSimple"
PosPitch115_Base.name  						= create_guid_string()
PosPitch115_Base.init_pos						= {0, 0}
PosPitch115_Base.init_rot						= {65, 0, 0}
PosPitch115_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch115_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch115_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch115_Base)


pitch1_115					= add_text_hud("+10", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_115.init_pos			= {0, 6.82, 0.10}
pitch1_115.init_rot			= {180, 0, 0}

pitch2_115					= add_text_hud("+20", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_115.init_pos			= {0, 5.96, 0.10}
pitch2_115.init_rot			= {180, 0, 0}
	
pitch3_115					= add_text_hud("+30", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_115.init_pos			= {0, 5.098, 0.10}
pitch3_115.init_rot			= {180, 0, 0}

pitch4_115					= add_text_hud("+40", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_115.init_pos			= {0, 4.234, 0.10}
pitch4_115.init_rot			= {180, 0, 0}

pitch5_115					= add_text_hud("+50", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_115.init_pos			= {0, 3.37, 0.10}
pitch5_115.init_rot			= {180, 0, 0}

pitch6_115					= add_text_hud("+60", 0, 0, PosPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_115.init_pos			= {0, 2.51, 0.10}
pitch6_115.init_rot			= {180, 0, 0}




local PosPitch95_Base 						= CreateElement "ceSimple"
PosPitch95_Base.name  						= create_guid_string()
PosPitch95_Base.init_pos						= {0, 0}
PosPitch95_Base.init_rot						= {85, 0, 0}
PosPitch95_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch95_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch95_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch95_Base)


pitch1_95					= add_text_hud("+10", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_95.init_pos			= {0, 6.82, 0.10}
pitch1_95.init_rot			= {180, 0, 0}

pitch2_95					= add_text_hud("+20", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_95.init_pos			= {0, 5.96, 0.10}
pitch2_95.init_rot			= {180, 0, 0}
	
pitch3_95					= add_text_hud("+30", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_95.init_pos			= {0, 5.098, 0.10}
pitch3_95.init_rot			= {180, 0, 0}

pitch4_95					= add_text_hud("+40", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_95.init_pos			= {0, 4.234, 0.10}
pitch4_95.init_rot			= {180, 0, 0}

pitch5_95					= add_text_hud("+50", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_95.init_pos			= {0, 3.37, 0.10}
pitch5_95.init_rot			= {180, 0, 0}

pitch6_95					= add_text_hud("+60", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_95.init_pos			= {0, 2.51, 0.10}
pitch6_95.init_rot			= {180, 0, 0}

pitch7_95					= add_text_hud("+70", 0, 0, PosPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_95.init_pos			= {0, 1.65, 0.10}
pitch7_95.init_rot			= {180, 0, 0}

local PosPitch75_Base 						= CreateElement "ceSimple"
PosPitch75_Base.name  						= create_guid_string()
PosPitch75_Base.init_pos						= {0, 0}
PosPitch75_Base.init_rot						= {105, 0, 0}
PosPitch75_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch75_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch75_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch75_Base)


pitch1_75					= add_text_hud("+10", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_75.init_pos			= {0, 6.82, 0.10}
pitch1_75.init_rot			= {180, 0, 0}

pitch2_75					= add_text_hud("+20", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_75.init_pos			= {0, 5.96, 0.10}
pitch2_75.init_rot			= {180, 0, 0}
	
pitch3_75					= add_text_hud("+30", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_75.init_pos			= {0, 5.098, 0.10}
pitch3_75.init_rot			= {180, 0, 0}

pitch4_75					= add_text_hud("+40", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_75.init_pos			= {0, 4.234, 0.10}
pitch4_75.init_rot			= {180, 0, 0}

pitch5_75					= add_text_hud("+50", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_75.init_pos			= {0, 3.37, 0.10}
pitch5_75.init_rot			= {180, 0, 0}

pitch6_75					= add_text_hud("+60", 0, 0, PosPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_75.init_pos			= {0, 2.51, 0.10}
pitch6_75.init_rot			= {180, 0, 0}



local PosPitch55_Base 						= CreateElement "ceSimple"
PosPitch55_Base.name  						= create_guid_string()
PosPitch55_Base.init_pos						= {0, 0}
PosPitch55_Base.init_rot						= {125, 0, 0}
PosPitch55_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch55_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch55_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch55_Base)


pitch1_55					= add_text_hud("+10", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_55.init_pos			= {0, 6.82, 0.10}
pitch1_55.init_rot			= {180, 0, 0}

pitch2_55					= add_text_hud("+20", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_55.init_pos			= {0, 5.96, 0.10}
pitch2_55.init_rot			= {180, 0, 0}
	
pitch3_55					= add_text_hud("+30", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_55.init_pos			= {0, 5.098, 0.10}
pitch3_55.init_rot			= {180, 0, 0}

pitch4_55					= add_text_hud("+40", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_55.init_pos			= {0, 4.234, 0.10}
pitch4_55.init_rot			= {180, 0, 0}

pitch5_55					= add_text_hud("+50", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_55.init_pos			= {0, 3.37, 0.10}
pitch5_55.init_rot			= {180, 0, 0}

pitch6_55					= add_text_hud("+60", 0, 0, PosPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_55.init_pos			= {0, 2.51, 0.10}
pitch6_55.init_rot			= {180, 0, 0}



local PosPitch35_Base 						= CreateElement "ceSimple"
PosPitch35_Base.name  						= create_guid_string()
PosPitch35_Base.init_pos						= {0, 0}
PosPitch35_Base.init_rot						= {145, 0, 0}
PosPitch35_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch35_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch35_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch35_Base)


pitch1_35					= add_text_hud("+10", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_35.init_pos			= {0, 6.82, 0.10}
pitch1_35.init_rot			= {180, 0, 0}

pitch2_35					= add_text_hud("+20", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_35.init_pos			= {0, 5.96, 0.10}
pitch2_35.init_rot			= {180, 0, 0}
	
pitch3_35					= add_text_hud("+30", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_35.init_pos			= {0, 5.098, 0.10}
pitch3_35.init_rot			= {180, 0, 0}

pitch4_35					= add_text_hud("+40", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_35.init_pos			= {0, 4.234, 0.10}
pitch4_35.init_rot			= {180, 0, 0}

pitch5_35					= add_text_hud("+50", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_35.init_pos			= {0, 3.37, 0.10}
pitch5_35.init_rot			= {180, 0, 0}

pitch6_35					= add_text_hud("+60", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_35.init_pos			= {0, 2.51, 0.10}
pitch6_35.init_rot			= {180, 0, 0}

pitch7_35					= add_text_hud("+70", 0, 0, PosPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_35.init_pos			= {0, 1.65, 0.10}
pitch7_35.init_rot			= {180, 0, 0}

local PosPitch15_Base 						= CreateElement "ceSimple"
PosPitch15_Base.name  						= create_guid_string()
PosPitch15_Base.init_pos						= {0, 0}
PosPitch15_Base.init_rot						= {165, 0, 0}
PosPitch15_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch15_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch15_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch15_Base)


pitch1_15					= add_text_hud("+10", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_15.init_pos			= {0, 6.82, 0.10}
pitch1_15.init_rot			= {180, 0, 0}

pitch2_15					= add_text_hud("+20", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_15.init_pos			= {0, 5.96, 0.10}
pitch2_15.init_rot			= {180, 0, 0}
	
pitch3_15					= add_text_hud("+30", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_15.init_pos			= {0, 5.098, 0.10}
pitch3_15.init_rot			= {180, 0, 0}

pitch4_15					= add_text_hud("+40", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_15.init_pos			= {0, 4.234, 0.10}
pitch4_15.init_rot			= {180, 0, 0}

pitch5_15					= add_text_hud("+50", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_15.init_pos			= {0, 3.37, 0.10}
pitch5_15.init_rot			= {180, 0, 0}

pitch6_15					= add_text_hud("+60", 0, 0, PosPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_15.init_pos			= {0, 2.51, 0.10}
pitch6_15.init_rot			= {180, 0, 0}



local PosPitch185_Base 						= CreateElement "ceSimple"
PosPitch185_Base.name  						= create_guid_string()
PosPitch185_Base.init_pos						= {0, 0}
PosPitch185_Base.init_rot						= {-15, 0, 0}
PosPitch185_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch185_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch185_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch185_Base)


pitch1_185					= add_text_hud("+10", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_185.init_pos			= {0, 6.82, 0.10}
pitch1_185.init_rot			= {180, 0, 0}

pitch2_185					= add_text_hud("+20", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_185.init_pos			= {0, 5.96, 0.10}
pitch2_185.init_rot			= {180, 0, 0}
	
pitch3_185					= add_text_hud("+30", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_185.init_pos			= {0, 5.098, 0.10}
pitch3_185.init_rot			= {180, 0, 0}

pitch4_185					= add_text_hud("+40", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_185.init_pos			= {0, 4.234, 0.10}
pitch4_185.init_rot			= {180, 0, 0}

pitch5_185					= add_text_hud("+50", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_185.init_pos			= {0, 3.37, 0.10}
pitch5_185.init_rot			= {180, 0, 0}

pitch6_185					= add_text_hud("+60", 0, 0, PosPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_185.init_pos			= {0, 2.51, 0.10}
pitch6_185.init_rot			= {180, 0, 0}



local PosPitch205_Base 						= CreateElement "ceSimple"
PosPitch205_Base.name  						= create_guid_string()
PosPitch205_Base.init_pos						= {0, 0}
PosPitch205_Base.init_rot						= {-35, 0, 0}
PosPitch205_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch205_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch205_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch205_Base)


pitch1_205					= add_text_hud("+10", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_205.init_pos			= {0, 6.82, 0.10}
pitch1_205.init_rot			= {180, 0, 0}

pitch2_205					= add_text_hud("+20", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_205.init_pos			= {0, 5.96, 0.10}
pitch2_205.init_rot			= {180, 0, 0}
	
pitch3_205					= add_text_hud("+30", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_205.init_pos			= {0, 5.098, 0.10}
pitch3_205.init_rot			= {180, 0, 0}

pitch4_205					= add_text_hud("+40", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_205.init_pos			= {0, 4.234, 0.10}
pitch4_205.init_rot			= {180, 0, 0}

pitch5_205					= add_text_hud("+50", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_205.init_pos			= {0, 3.37, 0.10}
pitch5_205.init_rot			= {180, 0, 0}

pitch6_205					= add_text_hud("+60", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_205.init_pos			= {0, 2.51, 0.10}
pitch6_205.init_rot			= {180, 0, 0}

pitch7_205					= add_text_hud("+70", 0, 0, PosPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_205.init_pos			= {0, 1.65, 0.10}
pitch7_205.init_rot			= {180, 0, 0}

local PosPitch225_Base 						= CreateElement "ceSimple"
PosPitch225_Base.name  						= create_guid_string()
PosPitch225_Base.init_pos						= {0, 0}
PosPitch225_Base.init_rot						= {-55, 0, 0}
PosPitch225_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch225_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch225_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch225_Base)


pitch1_225					= add_text_hud("+10", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_225.init_pos			= {0, 6.82, 0.10}
pitch1_225.init_rot			= {180, 0, 0}

pitch2_225					= add_text_hud("+20", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_225.init_pos			= {0, 5.96, 0.10}
pitch2_225.init_rot			= {180, 0, 0}
	
pitch3_225					= add_text_hud("+30", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_225.init_pos			= {0, 5.098, 0.10}
pitch3_225.init_rot			= {180, 0, 0}

pitch4_225					= add_text_hud("+40", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_225.init_pos			= {0, 4.234, 0.10}
pitch4_225.init_rot			= {180, 0, 0}

pitch5_225					= add_text_hud("+50", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_225.init_pos			= {0, 3.37, 0.10}
pitch5_225.init_rot			= {180, 0, 0}

pitch6_225					= add_text_hud("+60", 0, 0, PosPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_225.init_pos			= {0, 2.51, 0.10}
pitch6_225.init_rot			= {180, 0, 0}



local PosPitch245_Base 						= CreateElement "ceSimple"
PosPitch245_Base.name  						= create_guid_string()
PosPitch245_Base.init_pos						= {0, 0}
PosPitch245_Base.init_rot						= {-75, 0, 0}
PosPitch245_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch245_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch245_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch245_Base)


pitch1_245					= add_text_hud("+10", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_245.init_pos			= {0, 6.82, 0.10}
pitch1_245.init_rot			= {180, 0, 0}

pitch2_245					= add_text_hud("+20", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_245.init_pos			= {0, 5.96, 0.10}
pitch2_245.init_rot			= {180, 0, 0}
	
pitch3_245					= add_text_hud("+30", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_245.init_pos			= {0, 5.098, 0.10}
pitch3_245.init_rot			= {180, 0, 0}

pitch4_245					= add_text_hud("+40", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_245.init_pos			= {0, 4.234, 0.10}
pitch4_245.init_rot			= {180, 0, 0}

pitch5_245					= add_text_hud("+50", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_245.init_pos			= {0, 3.37, 0.10}
pitch5_245.init_rot			= {180, 0, 0}

pitch6_245					= add_text_hud("+60", 0, 0, PosPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_245.init_pos			= {0, 2.51, 0.10}
pitch6_245.init_rot			= {180, 0, 0}



local PosPitch265_Base 						= CreateElement "ceSimple"
PosPitch265_Base.name  						= create_guid_string()
PosPitch265_Base.init_pos						= {0, 0}
PosPitch265_Base.init_rot						= {-95, 0, 0}
PosPitch265_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch265_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch265_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch265_Base)


pitch1_265					= add_text_hud("+10", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_265.init_pos			= {0, 6.82, 0.10}
pitch1_265.init_rot			= {180, 0, 0}

pitch2_265					= add_text_hud("+20", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_265.init_pos			= {0, 5.96, 0.10}
pitch2_265.init_rot			= {180, 0, 0}
	
pitch3_265					= add_text_hud("+30", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_265.init_pos			= {0, 5.098, 0.10}
pitch3_265.init_rot			= {180, 0, 0}

pitch4_265					= add_text_hud("+40", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_265.init_pos			= {0, 4.234, 0.10}
pitch4_265.init_rot			= {180, 0, 0}

pitch5_265					= add_text_hud("+50", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_265.init_pos			= {0, 3.37, 0.10}
pitch5_265.init_rot			= {180, 0, 0}

pitch6_265					= add_text_hud("+60", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_265.init_pos			= {0, 2.51, 0.10}
pitch6_265.init_rot			= {180, 0, 0}

pitch7_265					= add_text_hud("+70", 0, 0, PosPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_265.init_pos			= {0, 1.65, 0.10}
pitch7_265.init_rot			= {180, 0, 0}

local PosPitch285_Base 						= CreateElement "ceSimple"
PosPitch285_Base.name  						= create_guid_string()
PosPitch285_Base.init_pos						= {0, 0}
PosPitch285_Base.init_rot						= {-115, 0, 0}
PosPitch285_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch285_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch285_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch285_Base)


pitch1_285					= add_text_hud("+10", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_285.init_pos			= {0, 6.82, 0.10}
pitch1_285.init_rot			= {180, 0, 0}

pitch2_285					= add_text_hud("+20", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_285.init_pos			= {0, 5.96, 0.10}
pitch2_285.init_rot			= {180, 0, 0}
	
pitch3_285					= add_text_hud("+30", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_285.init_pos			= {0, 5.098, 0.10}
pitch3_285.init_rot			= {180, 0, 0}

pitch4_285					= add_text_hud("+40", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_285.init_pos			= {0, 4.234, 0.10}
pitch4_285.init_rot			= {180, 0, 0}

pitch5_285					= add_text_hud("+50", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_285.init_pos			= {0, 3.37, 0.10}
pitch5_285.init_rot			= {180, 0, 0}

pitch6_285					= add_text_hud("+60", 0, 0, PosPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_285.init_pos			= {0, 2.51, 0.10}
pitch6_285.init_rot			= {180, 0, 0}



local PosPitch305_Base 						= CreateElement "ceSimple"
PosPitch305_Base.name  						= create_guid_string()
PosPitch305_Base.init_pos						= {0, 0}
PosPitch305_Base.init_rot						= {-135, 0, 0}
PosPitch305_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch305_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch305_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch305_Base)


pitch1_305					= add_text_hud("+10", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_305.init_pos			= {0, 6.82, 0.10}
pitch1_305.init_rot			= {180, 0, 0}

pitch2_305					= add_text_hud("+20", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_305.init_pos			= {0, 5.96, 0.10}
pitch2_305.init_rot			= {180, 0, 0}
	
pitch3_305					= add_text_hud("+30", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_305.init_pos			= {0, 5.098, 0.10}
pitch3_305.init_rot			= {180, 0, 0}

pitch4_305					= add_text_hud("+40", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_305.init_pos			= {0, 4.234, 0.10}
pitch4_305.init_rot			= {180, 0, 0}

pitch5_305					= add_text_hud("+50", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_305.init_pos			= {0, 3.37, 0.10}
pitch5_305.init_rot			= {180, 0, 0}

pitch6_305					= add_text_hud("+60", 0, 0, PosPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_305.init_pos			= {0, 2.51, 0.10}
pitch6_305.init_rot			= {180, 0, 0}



local PosPitch325_Base 						= CreateElement "ceSimple"
PosPitch325_Base.name  						= create_guid_string()
PosPitch325_Base.init_pos						= {0, 0}
PosPitch325_Base.init_rot						= {-155, 0, 0}
PosPitch325_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch325_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch325_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch325_Base)


pitch1_325					= add_text_hud("+10", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_325.init_pos			= {0, 6.82, 0.10}
pitch1_325.init_rot			= {180, 0, 0}

pitch2_325					= add_text_hud("+20", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_325.init_pos			= {0, 5.96, 0.10}
pitch2_325.init_rot			= {180, 0, 0}
	
pitch3_325					= add_text_hud("+30", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_325.init_pos			= {0, 5.098, 0.10}
pitch3_325.init_rot			= {180, 0, 0}

pitch4_325					= add_text_hud("+40", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_325.init_pos			= {0, 4.234, 0.10}
pitch4_325.init_rot			= {180, 0, 0}

pitch5_325					= add_text_hud("+50", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_325.init_pos			= {0, 3.37, 0.10}
pitch5_325.init_rot			= {180, 0, 0}

pitch6_325					= add_text_hud("+60", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_325.init_pos			= {0, 2.51, 0.10}
pitch6_325.init_rot			= {180, 0, 0}

pitch7_325					= add_text_hud("+70", 0, 0, PosPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch7_325.init_pos			= {0, 1.65, 0.10}
pitch7_325.init_rot			= {180, 0, 0}

local PosPitch345_Base 						= CreateElement "ceSimple"
PosPitch345_Base.name  						= create_guid_string()
PosPitch345_Base.init_pos						= {0, 0}
PosPitch345_Base.init_rot						= {-175, 0, 0}
PosPitch345_Base.parent_element				= PositivePitchLinesHUD.name
--PosPitch345_Base.element_params 				= {"ROLL_HUD","PITCH_HUD"}
--PosPitch345_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(PosPitch345_Base)


pitch1_345					= add_text_hud("+10", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch1_345.init_pos			= {0, 6.82, 0.10}
pitch1_345.init_rot			= {180, 0, 0}

pitch2_345					= add_text_hud("+20", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch2_345.init_pos			= {0, 5.96, 0.10}
pitch2_345.init_rot			= {180, 0, 0}
	
pitch3_345					= add_text_hud("+30", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch3_345.init_pos			= {0, 5.098, 0.10}
pitch3_345.init_rot			= {180, 0, 0}

pitch4_345					= add_text_hud("+40", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch4_345.init_pos			= {0, 4.234, 0.10}
pitch4_345.init_rot			= {180, 0, 0}

pitch5_345					= add_text_hud("+50", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch5_345.init_pos			= {0, 3.37, 0.10}
pitch5_345.init_rot			= {180, 0, 0}

pitch6_345					= add_text_hud("+60", 0, 0, PosPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
pitch6_345.init_pos			= {0, 2.51, 0.10}
pitch6_345.init_rot			= {180, 0, 0}



-- Negative pitch values


local NegPitch175_Base 						= CreateElement "ceSimple"
NegPitch175_Base.name  						= create_guid_string()
NegPitch175_Base.init_pos						= {0, 0}
NegPitch175_Base.init_rot						= {-5, 0, 0}
NegPitch175_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch175_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch175_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch175_Base)


NegPitch1_175					= add_text_hud("-10", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_175.init_pos			= {0, 6.82, 0.10}
NegPitch1_175.init_rot			= {0, 0, 0}

NegPitch2_175					= add_text_hud("-20", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_175.init_pos			= {0, 5.96, 0.10}
NegPitch2_175.init_rot			= {0, 0, 0}
	
NegPitch3_175					= add_text_hud("-30", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_175.init_pos			= {0, 5.098, 0.10}
NegPitch3_175.init_rot			= {0, 0, 0}

NegPitch4_175					= add_text_hud("-40", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_175.init_pos			= {0, 4.234, 0.10}
NegPitch4_175.init_rot			= {0, 0, 0}

NegPitch5_175					= add_text_hud("-50", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_175.init_pos			= {0, 3.37, 0.10}
NegPitch5_175.init_rot			= {0, 0, 0}

NegPitch6_175					= add_text_hud("-60", 0, 0, NegPitch175_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_175.init_pos			= {0, 2.51, 0.10}
NegPitch6_175.init_rot			= {0, 0, 0}



--
local NegPitch155_Base 						= CreateElement "ceSimple"
NegPitch155_Base.name  						= create_guid_string()
NegPitch155_Base.init_pos						= {0, 0}
NegPitch155_Base.init_rot						= {-25, 0, 0}
NegPitch155_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch155_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch155_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch155_Base)


NegPitch1_155					= add_text_hud("-10", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_155.init_pos			= {0, 6.82, 0.10}
NegPitch1_155.init_rot			= {0, 0, 0}

NegPitch2_155					= add_text_hud("-20", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_155.init_pos			= {0, 5.96, 0.10}
NegPitch2_155.init_rot			= {0, 0, 0}
	
NegPitch3_155					= add_text_hud("-30", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_155.init_pos			= {0, 5.098, 0.10}
NegPitch3_155.init_rot			= {0, 0, 0}

NegPitch4_155					= add_text_hud("-40", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_155.init_pos			= {0, 4.234, 0.10}
NegPitch4_155.init_rot			= {0, 0, 0}

NegPitch5_155					= add_text_hud("-50", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_155.init_pos			= {0, 3.37, 0.10}
NegPitch5_155.init_rot			= {0, 0, 0}

NegPitch6_155					= add_text_hud("-60", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_155.init_pos			= {0, 2.51, 0.10}
NegPitch6_155.init_rot			= {0, 0, 0}

Negpitch7_155					= add_text_hud("-70", 0, 0, NegPitch155_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
Negpitch7_155.init_pos			= {0, 1.65, 0.10}
Negpitch7_155.init_rot			= {0, 0, 0}

--

local NegPitch135_Base 						= CreateElement "ceSimple"
NegPitch135_Base.name  						= create_guid_string()
NegPitch135_Base.init_pos						= {0, 0}
NegPitch135_Base.init_rot						= {-45, 0, 0}
NegPitch135_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch135_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch135_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch135_Base)


NegPitch1_135					= add_text_hud("-10", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_135.init_pos			= {0, 6.82, 0.10}
NegPitch1_135.init_rot			= {0, 0, 0}

NegPitch2_135					= add_text_hud("-20", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_135.init_pos			= {0, 5.96, 0.10}
NegPitch2_135.init_rot			= {0, 0, 0}
	
NegPitch3_135					= add_text_hud("-30", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_135.init_pos			= {0, 5.098, 0.10}
NegPitch3_135.init_rot			= {0, 0, 0}

NegPitch4_135					= add_text_hud("-40", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_135.init_pos			= {0, 4.234, 0.10}
NegPitch4_135.init_rot			= {0, 0, 0}

NegPitch5_135					= add_text_hud("-50", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_135.init_pos			= {0, 3.37, 0.10}
NegPitch5_135.init_rot			= {0, 0, 0}

NegPitch6_135					= add_text_hud("-60", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_135.init_pos			= {0, 2.51, 0.10}
NegPitch6_135.init_rot			= {0, 0, 0}

NegPitch7_135					= add_text_hud("-70", 0, 0, NegPitch135_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_135.init_pos			= {0, 1.65, 0.10}
NegPitch7_135.init_rot			= {0, 0, 0}

--

local NegPitch115_Base 						= CreateElement "ceSimple"
NegPitch115_Base.name  						= create_guid_string()
NegPitch115_Base.init_pos						= {0, 0}
NegPitch115_Base.init_rot						= {-65, 0, 0}
NegPitch115_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch115_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch115_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch115_Base)


NegPitch1_115					= add_text_hud("-10", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_115.init_pos			= {0, 6.82, 0.10}
NegPitch1_115.init_rot			= {0, 0, 0}

NegPitch2_115					= add_text_hud("-20", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_115.init_pos			= {0, 5.96, 0.10}
NegPitch2_115.init_rot			= {0, 0, 0}
	
NegPitch3_115					= add_text_hud("-30", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_115.init_pos			= {0, 5.098, 0.10}
NegPitch3_115.init_rot			= {0, 0, 0}

NegPitch4_115					= add_text_hud("-40", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_115.init_pos			= {0, 4.234, 0.10}
NegPitch4_115.init_rot			= {0, 0, 0}

NegPitch5_115					= add_text_hud("-50", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_115.init_pos			= {0, 3.37, 0.10}
NegPitch5_115.init_rot			= {0, 0, 0}

NegPitch6_115					= add_text_hud("-60", 0, 0, NegPitch115_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_115.init_pos			= {0, 2.51, 0.10}
NegPitch6_115.init_rot			= {0, 0, 0}



local NegPitch95_Base 						= CreateElement "ceSimple"
NegPitch95_Base.name  						= create_guid_string()
NegPitch95_Base.init_pos						= {0, 0}
NegPitch95_Base.init_rot						= {-85, 0, 0}
NegPitch95_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch95_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch95_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch95_Base)


NegPitch1_95					= add_text_hud("-10", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_95.init_pos			= {0, 6.82, 0.10}
NegPitch1_95.init_rot			= {0, 0, 0}

NegPitch2_95					= add_text_hud("-20", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_95.init_pos			= {0, 5.96, 0.10}
NegPitch2_95.init_rot			= {0, 0, 0}
	
NegPitch3_95					= add_text_hud("-30", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_95.init_pos			= {0, 5.098, 0.10}
NegPitch3_95.init_rot			= {0, 0, 0}

NegPitch4_95					= add_text_hud("-40", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_95.init_pos			= {0, 4.234, 0.10}
NegPitch4_95.init_rot			= {0, 0, 0}

NegPitch5_95					= add_text_hud("-50", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_95.init_pos			= {0, 3.37, 0.10}
NegPitch5_95.init_rot			= {0, 0, 0}

NegPitch6_95					= add_text_hud("-60", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_95.init_pos			= {0, 2.51, 0.10}
NegPitch6_95.init_rot			= {0, 0, 0}

Negpitch7_95					= add_text_hud("-70", 0, 0, NegPitch95_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
Negpitch7_95.init_pos			= {0, 1.65, 0.10}
Negpitch7_95.init_rot			= {0, 0, 0}

local NegPitch75_Base 						= CreateElement "ceSimple"
NegPitch75_Base.name  						= create_guid_string()
NegPitch75_Base.init_pos						= {0, 0}
NegPitch75_Base.init_rot						= {-105, 0, 0}
NegPitch75_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch75_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch75_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch75_Base)


NegPitch1_75					= add_text_hud("-10", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_75.init_pos			= {0, 6.82, 0.10}
NegPitch1_75.init_rot			= {0, 0, 0}

NegPitch2_75					= add_text_hud("-20", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_75.init_pos			= {0, 5.96, 0.10}
NegPitch2_75.init_rot			= {0, 0, 0}
	
NegPitch3_75					= add_text_hud("-30", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_75.init_pos			= {0, 5.098, 0.10}
NegPitch3_75.init_rot			= {0, 0, 0}

NegPitch4_75					= add_text_hud("-40", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_75.init_pos			= {0, 4.234, 0.10}
NegPitch4_75.init_rot			= {0, 0, 0}

NegPitch5_75					= add_text_hud("-50", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_75.init_pos			= {0, 3.37, 0.10}
NegPitch5_75.init_rot			= {0, 0, 0}

NegPitch6_75					= add_text_hud("-60", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_75.init_pos			= {0, 2.51, 0.10}
NegPitch6_75.init_rot			= {0, 0, 0}

NegPitch7_75					= add_text_hud("-70", 0, 0, NegPitch75_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_75.init_pos			= {0, 1.65, 0.10}
NegPitch7_75.init_rot			= {0, 0, 0}

local NegPitch55_Base 						= CreateElement "ceSimple"
NegPitch55_Base.name  						= create_guid_string()
NegPitch55_Base.init_pos						= {0, 0}
NegPitch55_Base.init_rot						= {-125, 0, 0}
NegPitch55_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch55_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch55_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch55_Base)


NegPitch1_55					= add_text_hud("-10", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_55.init_pos			= {0, 6.82, 0.10}
NegPitch1_55.init_rot			= {0, 0, 0}

NegPitch2_55					= add_text_hud("-20", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_55.init_pos			= {0, 5.96, 0.10}
NegPitch2_55.init_rot			= {0, 0, 0}
	
NegPitch3_55					= add_text_hud("-30", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_55.init_pos			= {0, 5.098, 0.10}
NegPitch3_55.init_rot			= {0, 0, 0}

NegPitch4_55					= add_text_hud("-40", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_55.init_pos			= {0, 4.234, 0.10}
NegPitch4_55.init_rot			= {0, 0, 0}

NegPitch5_55					= add_text_hud("-50", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_55.init_pos			= {0, 3.37, 0.10}
NegPitch5_55.init_rot			= {0, 0, 0}

NegPitch6_55					= add_text_hud("-60", 0, 0, NegPitch55_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_55.init_pos			= {0, 2.51, 0.10}
NegPitch6_55.init_rot			= {0, 0, 0}



local NegPitch35_Base 						= CreateElement "ceSimple"
NegPitch35_Base.name  						= create_guid_string()
NegPitch35_Base.init_pos						= {0, 0}
NegPitch35_Base.init_rot						= {-145, 0, 0}
NegPitch35_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch35_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch35_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch35_Base)


NegPitch1_35					= add_text_hud("-10", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_35.init_pos			= {0, 6.82, 0.10}
NegPitch1_35.init_rot			= {0, 0, 0}

NegPitch2_35					= add_text_hud("-20", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_35.init_pos			= {0, 5.96, 0.10}
NegPitch2_35.init_rot			= {0, 0, 0}
	
NegPitch3_35					= add_text_hud("-30", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_35.init_pos			= {0, 5.098, 0.10}
NegPitch3_35.init_rot			= {0, 0, 0}

NegPitch4_35					= add_text_hud("-40", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_35.init_pos			= {0, 4.234, 0.10}
NegPitch4_35.init_rot			= {0, 0, 0}

NegPitch5_35					= add_text_hud("-50", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_35.init_pos			= {0, 3.37, 0.10}
NegPitch5_35.init_rot			= {0, 0, 0}

NegPitch6_35					= add_text_hud("-60", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_35.init_pos			= {0, 2.51, 0.10}
NegPitch6_35.init_rot			= {0, 0, 0}

NegPitch7_35					= add_text_hud("-70", 0, 0, NegPitch35_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_35.init_pos			= {0, 1.65, 0.10}
NegPitch7_35.init_rot			= {0, 0, 0}

local NegPitch15_Base 						= CreateElement "ceSimple"
NegPitch15_Base.name  						= create_guid_string()
NegPitch15_Base.init_pos						= {0, 0}
NegPitch15_Base.init_rot						= {-165, 0, 0}
NegPitch15_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch15_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch15_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch15_Base)


NegPitch1_15					= add_text_hud("-10", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_15.init_pos			= {0, 6.82, 0.10}
NegPitch1_15.init_rot			= {0, 0, 0}

NegPitch2_15					= add_text_hud("-20", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_15.init_pos			= {0, 5.96, 0.10}
NegPitch2_15.init_rot			= {0, 0, 0}
	
NegPitch3_15					= add_text_hud("-30", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_15.init_pos			= {0, 5.098, 0.10}
NegPitch3_15.init_rot			= {0, 0, 0}

NegPitch4_15					= add_text_hud("-40", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_15.init_pos			= {0, 4.234, 0.10}
NegPitch4_15.init_rot			= {0, 0, 0}

NegPitch5_15					= add_text_hud("-50", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_15.init_pos			= {0, 3.37, 0.10}
NegPitch5_15.init_rot			= {0, 0, 0}

NegPitch6_15					= add_text_hud("-60", 0, 0, NegPitch15_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_15.init_pos			= {0, 2.51, 0.10}
NegPitch6_15.init_rot			= {0, 0, 0}



local NegPitch185_Base 						= CreateElement "ceSimple"
NegPitch185_Base.name  						= create_guid_string()
NegPitch185_Base.init_pos						= {0, 0}
NegPitch185_Base.init_rot						= {15, 0, 0}
NegPitch185_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch185_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch185_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch185_Base)


NegPitch1_185					= add_text_hud("-10", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_185.init_pos			= {0, 6.82, 0.10}
NegPitch1_185.init_rot			= {0, 0, 0}

NegPitch2_185					= add_text_hud("-20", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_185.init_pos			= {0, 5.96, 0.10}
NegPitch2_185.init_rot			= {0, 0, 0}
	
NegPitch3_185					= add_text_hud("-30", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_185.init_pos			= {0, 5.098, 0.10}
NegPitch3_185.init_rot			= {0, 0, 0}

NegPitch4_185					= add_text_hud("-40", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_185.init_pos			= {0, 4.234, 0.10}
NegPitch4_185.init_rot			= {0, 0, 0}

NegPitch5_185					= add_text_hud("-50", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_185.init_pos			= {0, 3.37, 0.10}
NegPitch5_185.init_rot			= {0, 0, 0}

NegPitch6_185					= add_text_hud("-60", 0, 0, NegPitch185_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_185.init_pos			= {0, 2.51, 0.10}
NegPitch6_185.init_rot			= {0, 0, 0}



local NegPitch205_Base 						= CreateElement "ceSimple"
NegPitch205_Base.name  						= create_guid_string()
NegPitch205_Base.init_pos						= {0, 0}
NegPitch205_Base.init_rot						= {35, 0, 0}
NegPitch205_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch205_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch205_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch205_Base)


NegPitch1_205					= add_text_hud("-10", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_205.init_pos			= {0, 6.82, 0.10}
NegPitch1_205.init_rot			= {0, 0, 0}

NegPitch2_205					= add_text_hud("-20", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_205.init_pos			= {0, 5.96, 0.10}
NegPitch2_205.init_rot			= {0, 0, 0}
	
NegPitch3_205					= add_text_hud("-30", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_205.init_pos			= {0, 5.098, 0.10}
NegPitch3_205.init_rot			= {0, 0, 0}

NegPitch4_205					= add_text_hud("-40", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_205.init_pos			= {0, 4.234, 0.10}
NegPitch4_205.init_rot			= {0, 0, 0}

NegPitch5_205					= add_text_hud("-50", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_205.init_pos			= {0, 3.37, 0.10}
NegPitch5_205.init_rot			= {0, 0, 0}

NegPitch6_205					= add_text_hud("-60", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_205.init_pos			= {0, 2.51, 0.10}
NegPitch6_205.init_rot			= {0, 0, 0}

Negpitch7_205					= add_text_hud("-70", 0, 0, NegPitch205_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
Negpitch7_205.init_pos			= {0, 1.65, 0.10}
Negpitch7_205.init_rot			= {0, 0, 0}

local NegPitch225_Base 						= CreateElement "ceSimple"
NegPitch225_Base.name  						= create_guid_string()
NegPitch225_Base.init_pos						= {0, 0}
NegPitch225_Base.init_rot						= {55, 0, 0}
NegPitch225_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch225_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch225_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch225_Base)


NegPitch1_225					= add_text_hud("-10", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_225.init_pos			= {0, 6.82, 0.10}
NegPitch1_225.init_rot			= {0, 0, 0}

NegPitch2_225					= add_text_hud("-20", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_225.init_pos			= {0, 5.96, 0.10}
NegPitch2_225.init_rot			= {0, 0, 0}
	
NegPitch3_225					= add_text_hud("-30", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_225.init_pos			= {0, 5.098, 0.10}
NegPitch3_225.init_rot			= {0, 0, 0}

NegPitch4_225					= add_text_hud("-40", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_225.init_pos			= {0, 4.234, 0.10}
NegPitch4_225.init_rot			= {0, 0, 0}

NegPitch5_225					= add_text_hud("-50", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_225.init_pos			= {0, 3.37, 0.10}
NegPitch5_225.init_rot			= {0, 0, 0}

NegPitch6_225					= add_text_hud("-60", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_225.init_pos			= {0, 2.51, 0.10}
NegPitch6_225.init_rot			= {0, 0, 0}

NegPitch7_225					= add_text_hud("-70", 0, 0, NegPitch225_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_225.init_pos			= {0, 1.65, 0.10}
NegPitch7_225.init_rot			= {0, 0, 0}

local NegPitch245_Base 						= CreateElement "ceSimple"
NegPitch245_Base.name  						= create_guid_string()
NegPitch245_Base.init_pos						= {0, 0}
NegPitch245_Base.init_rot						= {75, 0, 0}
NegPitch245_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch245_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch245_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch245_Base)


NegPitch1_245					= add_text_hud("-10", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_245.init_pos			= {0, 6.82, 0.10}
NegPitch1_245.init_rot			= {0, 0, 0}

NegPitch2_245					= add_text_hud("-20", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_245.init_pos			= {0, 5.96, 0.10}
NegPitch2_245.init_rot			= {0, 0, 0}
	
NegPitch3_245					= add_text_hud("-30", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_245.init_pos			= {0, 5.098, 0.10}
NegPitch3_245.init_rot			= {0, 0, 0}

NegPitch4_245					= add_text_hud("-40", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_245.init_pos			= {0, 4.234, 0.10}
NegPitch4_245.init_rot			= {0, 0, 0}

NegPitch5_245					= add_text_hud("-50", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_245.init_pos			= {0, 3.37, 0.10}
NegPitch5_245.init_rot			= {0, 0, 0}

NegPitch6_245					= add_text_hud("-60", 0, 0, NegPitch245_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_245.init_pos			= {0, 2.51, 0.10}
NegPitch6_245.init_rot			= {0, 0, 0}



local NegPitch265_Base 						= CreateElement "ceSimple"
NegPitch265_Base.name  						= create_guid_string()
NegPitch265_Base.init_pos						= {0, 0}
NegPitch265_Base.init_rot						= {95, 0, 0}
NegPitch265_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch265_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch265_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch265_Base)


NegPitch1_265					= add_text_hud("-10", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_265.init_pos			= {0, 6.82, 0.10}
NegPitch1_265.init_rot			= {0, 0, 0}

NegPitch2_265					= add_text_hud("-20", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_265.init_pos			= {0, 5.96, 0.10}
NegPitch2_265.init_rot			= {0, 0, 0}
	
NegPitch3_265					= add_text_hud("-30", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_265.init_pos			= {0, 5.098, 0.10}
NegPitch3_265.init_rot			= {0, 0, 0}

NegPitch4_265					= add_text_hud("-40", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_265.init_pos			= {0, 4.234, 0.10}
NegPitch4_265.init_rot			= {0, 0, 0}

NegPitch5_265					= add_text_hud("-50", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_265.init_pos			= {0, 3.37, 0.10}
NegPitch5_265.init_rot			= {0, 0, 0}

NegPitch6_265					= add_text_hud("-60", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_265.init_pos			= {0, 2.51, 0.10}
NegPitch6_265.init_rot			= {0, 0, 0}

Negpitch7_265					= add_text_hud("-70", 0, 0, NegPitch265_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
Negpitch7_265.init_pos			= {0, 1.65, 0.10}
Negpitch7_265.init_rot			= {0, 0, 0}

local NegPitch285_Base 						= CreateElement "ceSimple"
NegPitch285_Base.name  						= create_guid_string()
NegPitch285_Base.init_pos						= {0, 0}
NegPitch285_Base.init_rot						= {115, 0, 0}
NegPitch285_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch285_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch285_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch285_Base)


NegPitch1_285					= add_text_hud("-10", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_285.init_pos			= {0, 6.82, 0.10}
NegPitch1_285.init_rot			= {0, 0, 0}

NegPitch2_285					= add_text_hud("-20", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_285.init_pos			= {0, 5.96, 0.10}
NegPitch2_285.init_rot			= {0, 0, 0}
	
NegPitch3_285					= add_text_hud("-30", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_285.init_pos			= {0, 5.098, 0.10}
NegPitch3_285.init_rot			= {0, 0, 0}

NegPitch4_285					= add_text_hud("-40", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_285.init_pos			= {0, 4.234, 0.10}
NegPitch4_285.init_rot			= {0, 0, 0}

NegPitch5_285					= add_text_hud("-50", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_285.init_pos			= {0, 3.37, 0.10}
NegPitch5_285.init_rot			= {0, 0, 0}

NegPitch6_285					= add_text_hud("-60", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_285.init_pos			= {0, 2.51, 0.10}
NegPitch6_285.init_rot			= {0, 0, 0}

NegPitch7_285					= add_text_hud("-70", 0, 0, NegPitch285_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_285.init_pos			= {0, 1.65, 0.10}
NegPitch7_285.init_rot			= {0, 0, 0}

local NegPitch305_Base 						= CreateElement "ceSimple"
NegPitch305_Base.name  						= create_guid_string()
NegPitch305_Base.init_pos						= {0, 0}
NegPitch305_Base.init_rot						= {135, 0, 0}
NegPitch305_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch305_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch305_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch305_Base)


NegPitch1_305					= add_text_hud("-10", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_305.init_pos			= {0, 6.82, 0.10}
NegPitch1_305.init_rot			= {0, 0, 0}

NegPitch2_305					= add_text_hud("-20", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_305.init_pos			= {0, 5.96, 0.10}
NegPitch2_305.init_rot			= {0, 0, 0}
	
NegPitch3_305					= add_text_hud("-30", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_305.init_pos			= {0, 5.098, 0.10}
NegPitch3_305.init_rot			= {0, 0, 0}

NegPitch4_305					= add_text_hud("-40", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_305.init_pos			= {0, 4.234, 0.10}
NegPitch4_305.init_rot			= {0, 0, 0}

NegPitch5_305					= add_text_hud("-50", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_305.init_pos			= {0, 3.37, 0.10}
NegPitch5_305.init_rot			= {0, 0, 0}

NegPitch6_305					= add_text_hud("-60", 0, 0, NegPitch305_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_305.init_pos			= {0, 2.51, 0.10}
NegPitch6_305.init_rot			= {0, 0, 0}



local NegPitch325_Base 						= CreateElement "ceSimple"
NegPitch325_Base.name  						= create_guid_string()
NegPitch325_Base.init_pos						= {0, 0}
NegPitch325_Base.init_rot						= {155, 0, 0}
NegPitch325_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch325_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch325_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch325_Base)


NegPitch1_325					= add_text_hud("-10", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_325.init_pos			= {0, 6.82, 0.10}
NegPitch1_325.init_rot			= {0, 0, 0}

NegPitch2_325					= add_text_hud("-20", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_325.init_pos			= {0, 5.96, 0.10}
NegPitch2_325.init_rot			= {0, 0, 0}
	
NegPitch3_325					= add_text_hud("-30", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_325.init_pos			= {0, 5.098, 0.10}
NegPitch3_325.init_rot			= {0, 0, 0}

NegPitch4_325					= add_text_hud("-40", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_325.init_pos			= {0, 4.234, 0.10}
NegPitch4_325.init_rot			= {0, 0, 0}

NegPitch5_325					= add_text_hud("-50", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_325.init_pos			= {0, 3.37, 0.10}
NegPitch5_325.init_rot			= {0, 0, 0}

NegPitch6_325					= add_text_hud("-60", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_325.init_pos			= {0, 2.51, 0.10}
NegPitch6_325.init_rot			= {0, 0, 0}

Negpitch7_325					= add_text_hud("-70", 0, 0, NegPitch325_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
Negpitch7_325.init_pos			= {0, 1.65, 0.10}
Negpitch7_325.init_rot			= {0, 0, 0}

local NegPitch345_Base 						= CreateElement "ceSimple"
NegPitch345_Base.name  						= create_guid_string()
NegPitch345_Base.init_pos						= {0, 0}
NegPitch345_Base.init_rot						= {175, 0, 0}
NegPitch345_Base.parent_element				= NegativePitchLinesHUD.name
--NegPitch345_Base.element_params 				= {"ROLL_HUD","NegPitch_HUD"}
--NegPitch345_Base.controllers					= {{"rotate_using_parameter" ,0, 1.00},{"move_up_down_using_parameter",1, -0.644}}
AddHudElement(NegPitch345_Base)


NegPitch1_345					= add_text_hud("-10", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch1_345.init_pos			= {0, 6.82, 0.10}
NegPitch1_345.init_rot			= {0, 0, 0}

NegPitch2_345					= add_text_hud("-20", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch2_345.init_pos			= {0, 5.96, 0.10}
NegPitch2_345.init_rot			= {0, 0, 0}
	
NegPitch3_345					= add_text_hud("-30", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch3_345.init_pos			= {0, 5.098, 0.10}
NegPitch3_345.init_rot			= {0, 0, 0}

NegPitch4_345					= add_text_hud("-40", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch4_345.init_pos			= {0, 4.234, 0.10}
NegPitch4_345.init_rot			= {0, 0, 0}

NegPitch5_345					= add_text_hud("-50", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch5_345.init_pos			= {0, 3.37, 0.10}
NegPitch5_345.init_rot			= {0, 0, 0}

NegPitch6_345					= add_text_hud("-60", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch6_345.init_pos			= {0, 2.51, 0.10}
NegPitch6_345.init_rot			= {0, 0, 0}

NegPitch7_345					= add_text_hud("-70", 0, 0, NegPitch345_Base , "Gripen_Font_green", HUD_pitch_digit, "CenterCenter")
NegPitch7_345.init_pos			= {0, 1.65, 0.10}
NegPitch7_345.init_rot			= {0, 0, 0}

----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------