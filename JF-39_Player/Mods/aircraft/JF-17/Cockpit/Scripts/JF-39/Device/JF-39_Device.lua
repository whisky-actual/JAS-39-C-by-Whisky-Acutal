dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")
local update_time_step = 0.01 --update will be called 100 times per second
make_default_activity(update_time_step)
dev = GetSelf()
-------------------------------------------------------
-- Local Variables
-------------------------------------------------------
local PNT_765 = get_param_handle("PNT_765") -- "Left MFCD Brt +"
local PNT_798 = get_param_handle("PNT_798") --"Center MFCD Brt +"
local PNT_831 = get_param_handle("PNT_831") --"Right MFCD Brt +"
-------------------------------------------------------
-- Initialization Functions	
-------------------------------------------------------
function post_initialize()	--Set Brigthness of MFCD to max
	PNT_765:set(-1) -- "Left MFCD Brt +" 140 to 145
	PNT_798:set(-1) --"Center MFCD Brt +"
	PNT_831:set(-1) --"Right MFCD Brt +"
end
-------------------------------------------------------
-- Params
-------------------------------------------------------
dev:listen_command(2142) -- -162 to 162 degrees
dev:listen_command(2143) -- -90 to 110
dev:listen_command(765) -- "Left MFCD Brt +"
dev:listen_command(768) -- "Center MFCD Brt +"
dev:listen_command(831) -- "Right MFCD Brt +"
-------------------------------------------------------
-- Complexe Functions
-------------------------------------------------------
--N/A
-------------------------------------------------------
--Animations Changes
-------------------------------------------------------
function update()

	--Refuel Probe
	set_aircraft_draw_argument_value(22, get_aircraft_draw_argument_value(419))
	
	--Right LEF
	set_aircraft_draw_argument_value(13, get_aircraft_draw_argument_value(130))
	
	--Left LEF
	set_aircraft_draw_argument_value(14, get_aircraft_draw_argument_value(132))

	--Engine Nozzle
	set_aircraft_draw_argument_value(89, get_aircraft_draw_argument_value(90))
		
	--Red Navigation Light
	--set_aircraft_draw_argument_value(190, get_aircraft_draw_argument_value(190))

	--Green NavigationLight
	--set_aircraft_draw_argument_value(191, get_aircraft_draw_argument_value(191))

	--Anti-Collision Light
	--set_aircraft_draw_argument_value(192, get_aircraft_draw_argument_value(192))

	--Anti-Collision Light
	set_aircraft_draw_argument_value(193, get_aircraft_draw_argument_value(83))

	--Slimes Light
	--set_aircraft_draw_argument_value(200, get_aircraft_draw_argument_value(200))

	--Wing Navigation Light
	set_aircraft_draw_argument_value(201, get_aircraft_draw_argument_value(192))
		
	--Landing Light
	--set_aircraft_draw_argument_value(208, get_aircraft_draw_argument_value(209))

	--Taxi Light 
	set_aircraft_draw_argument_value(209, get_aircraft_draw_argument_value(208))

	--Inlet Cover
	set_aircraft_draw_argument_value(499, get_aircraft_draw_argument_value(24))

	
	--Canards
	--set_aircraft_draw_argument_value(9, get_aircraft_draw_argument_value(10000))
	--set_aircraft_draw_argument_value(10, get_aircraft_draw_argument_value(10000))
	--[[
	
	ANTI_COLLISION    = 83,
	FORM_LIGHT_R    = 201, green

	190 Red nav --> NAV_LIGHT_L       = 190
	191 Green nav --> NAV_LIGHT_R       = 191
	192 Back nav white back --> NAV_LIGHT_VERTICAL_STAB = 192
	193 Anti-Collision Stobe --> ANTI_COLLISION_STROBE   = 195
	200 Slimes --> FORM_LIGHT_L    = 200, red
	201 Wing nav white --> NAV_LIGHT_VERTICAL_STAB = 192

	--]]

end

need_to_be_closed = false