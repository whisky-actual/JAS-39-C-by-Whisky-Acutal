dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")
dev = GetSelf()
local update_time_step = 0.001 --update will be called 1000 times per second
make_default_activity(update_time_step)
local sensor_data = get_base_data()
--[[
-- ============= PrintButBetter ================
local lastprint = 0
function PrintButBetter(input)

	if input ~= lastprint then
		print_message_to_user(input)
	end

	lastprint = input
end
-- =============================================
]]
-- Conversions
local RAD_TO_DEGREE  = 57.29577951308233

--hud indicator params
local CURR_IAS  = get_param_handle("CURR_IAS")	--Airspeed.
local MACH_A  	= get_param_handle("MACH_A")
local MACH_B  	= get_param_handle("MACH_B")	
local HUD_MACH = 0
local HUD_IAS = 0
local HUD_GS = 0

function update()
-- Speeds =================================================================================================================================
HUD_IAS = sensor_data.getIndicatedAirSpeed() * 1.94384449         -- m/s to kts
    local self_vel_l,self_vel_v,self_vel_h = sensor_data.getSelfAirspeed()        -- Prereq for ground speed in kts
    HUD_GS = math.sqrt(self_vel_h^2 + self_vel_l^2)*1.94384449
-- Below 50 kts use ground speed reading instead
    if HUD_IAS < 50 then
        CURR_IAS:set(HUD_GS)
    else
        CURR_IAS:set(HUD_IAS)
    end
get_param_handle("CURR_GS"):set(HUD_GS)

-- ============= PrintButBetter ================
--PrintButBetter(HUD_GS)	
-- =============================================
	HUD_MACH = sensor_data.getMachNumber()
	
	if HUD_MACH < 0.995 then
		HUD_MACH = HUD_MACH *100
	end
	
	MACH_A:set(sensor_data.getMachNumber())

	MACH_B:set(HUD_MACH)
	--MACH_A:set(1.69)
	
	--MACH_B:set(69)
end
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------