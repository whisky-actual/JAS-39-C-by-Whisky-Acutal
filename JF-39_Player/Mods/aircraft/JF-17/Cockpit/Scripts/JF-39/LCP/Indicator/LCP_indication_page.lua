dofile(LockOn_Options.script_path.."/JF-39/MFD/Indicator/Displays_def.lua")
--dofile(LockOn_Options.script_path.."/JF-39/HUD/Device/Device.lua")

--JF17_COM1_FREQ = get_param_handle("JF17_COM1_FREQ")

-- ============= PrintButBetter ================
local lastprint = 0
function PrintButBetter(input)

	if input ~= lastprint then
		print_message_to_user(input)
	end

	lastprint = input
end
-- =============================================



LCP_BASE 					= CreateElement "ceSimple"
LCP_BASE.init_pos			= {0,0}
LCP_BASE.name				= create_guid_string()
--LCP_BASE.element_params 	= {"MAINPOWER"}
--LCP_BASE.controllers    	= {{"parameter_compare_with_number",0, 1}}
AddElement(LCP_BASE)


GlowEffect 				= CreateElement "ceMeshPoly"
GlowEffect.name 			= create_guid_string()
GlowEffect.primitivetype 	= "triangles"
GlowEffect.vertices	   	= { {-1.0 , 1.0 }, { 1.0,1.0}, { 1.0,-1.0}, {-1.0,-1.0}, }
GlowEffect.indices			= {0, 1, 2, 0, 2, 3}
GlowEffect.init_pos		= {0, 0, 0}
GlowEffect.material		= MakeMaterial(nil,{0, 255, 0, 8})	--RGBA
GlowEffect.parent_element	= LCP_BASE.name
GlowEffect.h_clip_relation  = h_clip_relations.REWRITE_LEVEL
GlowEffect.level			= LCP_DEFAULT_LEVEL
--GlowEffect.change_opacity	= false
--GlowEffect.collimated 		= false
GlowEffect.isvisible		= true
GlowEffect.element_params    = {"JF39_LCP" }
GlowEffect.controllers       = {{"opacity_using_parameter",0}}
Add(GlowEffect)

local AlignLeft = -0.75

add_text_with_opacity("  COMMUNICATION", AlignLeft, 0.6,"JF39_LCP", LCP_BASE, "Gripen_Font_LCP", lcp_strdefs_digit, "LeftLeft")
add_text_with_opacity("-----------------", AlignLeft, 0.5,"JF39_LCP", LCP_BASE, "Gripen_Font_LCP", lcp_strdefs_digit, "LeftLeft")
add_text_with_opacity("COM1: 169.000AV  T", AlignLeft, 0.2,"JF39_LCP", LCP_BASE, "Gripen_Font_LCP", lcp_strdefs_digit, "LeftLeft")
add_text_with_opacity("   ---------", AlignLeft, 0.05,"JF39_LCP", LCP_BASE, "Gripen_Font_LCP", lcp_strdefs_digit, "LeftLeft")
add_text_with_opacity("COM2: 199.000AV  DT", AlignLeft, -0.1,"JF39_LCP", LCP_BASE, "Gripen_Font_LCP", lcp_strdefs_digit, "LeftLeft")
--textParamWithOpacity(AlignLeft, -0.2, "JF39_LCP", "LCP_LAT", "%0.23s", LCP_BASE, lcp_strdefs_digit, "Gripen_Font_LCP", "LeftLeft")
--textParamWithOpacity(AlignLeft, -0.305, "JF39_LCP", "LCP_LON", "%0.23s", LCP_BASE, lcp_strdefs_digit, "Gripen_Font_LCP", "LeftLeft")

-- ============= PrintButBetter ================
--PrintButBetter("Stored value: " .. JF17_COM1_FREQ)	
-- =============================================
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.2.0                       --
----------------------------------------------------------------------------------------