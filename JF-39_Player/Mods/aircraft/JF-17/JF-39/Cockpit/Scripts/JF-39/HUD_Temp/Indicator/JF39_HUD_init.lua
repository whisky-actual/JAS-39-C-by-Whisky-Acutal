dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua") 

indicator_type 	= indicator_types.COLLIMATOR	
purposes 	   	= {render_purpose.GENERAL,render_purpose.HUD_ONLY_VIEW} 

BASE    = 1 

page_subsets  = {
	[BASE]    		= LockOn_Options.script_path.."JF-39/HUD_Temp/Indicator/HUD_base_page.lua",   
}
pages = {
	{ BASE, }, 
 
}

init_pageID = 1 

--collimator_default_distance_factor = {0.62,-0.04,0}  -- angular size operations will use this as reference to calculate coverage and collimation
collimator_default_distance_factor = {auto_collimator_default_distance_factor[1], auto_collimator_default_distance_factor[1] * math.rad(-5.2), 0}

update_screenspace_diplacement(SelfWidth/SelfHeight,false)
dedicated_viewport_arcade = dedicated_viewport
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------