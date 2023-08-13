dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")
local update_time_step = 0.01 --update will be called 100 times per second
make_default_activity(update_time_step)
dev = GetSelf()
-------------------------------------------------------
-- Local Variables
-------------------------------------------------------
local sensor_data = get_base_data()
local HORIZONTAL_VIEW_HMD = get_param_handle("HORIZONTAL_VIEW_HMD")
local VERTICAL_VIEW_HMD = get_param_handle("VERTICAL_VIEW_HMD")
local HMD_LIGHT = get_param_handle("HMD_LIGHT")
local HUD_MODE = get_param_handle("HUD_MODE")
local CANNON_MODE = get_param_handle("CANNON_MODE")
local HMDTOGGLE = get_param_handle("HMDTOGGLE")
local RAD_TO_DEGREE  = 57.29577951308233
local MainPower = get_param_handle("MAINPOWER")

local HUD_BRIGHTNESS = get_param_handle("HUD_BRIGHTNESS")
MainPower:set(1.0)
local button_depress = false
local first_run = true

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
--dev:listen_command(device_commands.HMDTOGGLE)

function post_initialize()
    HORIZONTAL_VIEW_HMD:set(0)
    VERTICAL_VIEW_HMD:set(0)
    --HMD_LIGHT:set(1)
    HMDTOGGLE:set(1)
    CANNON_MODE:set(1)
	MainPower:set(1.0)
	HUD_BRIGHTNESS:set(1.0)
	HUD_MODE:set(1.0)
end

function SetCommand(command,value)
--[[
    if command == device_commands.HMDTOGGLE then

    if HMDTOGGLE:get() == 0 then
        HMDTOGGLE:set(1)
        HMD_LIGHT:set(1) 
    else
        HMDTOGGLE:set(0)
        HMD_LIGHT:set(0) 
    end
end]]
    if command == 2142 then
       -- print_message_to_user(value)

       if VERTICAL_VIEW_HMD:get() < 40 then
            HORIZONTAL_VIEW_HMD:set(math.abs(value))
       else
            HORIZONTAL_VIEW_HMD:set(25)
           -- print_message_to_user(HORIZONTAL_VIEW:get())
       --HEAD_ROT:set(value/-180)
       end
    end

    if command == 2143 then
        --HEAD_TILT:set(value/90)
        if HORIZONTAL_VIEW_HMD:get() < 45 then
             VERTICAL_VIEW_HMD:set(value*2)
        else
            VERTICAL_VIEW_HMD:set(value)
        end
      -- print_message_to_user(VERTICAL_VIEW_HMD:get())

    end
end 

function update()
	if first_run then
		HMDTOGGLE:set(0)
		first_run = false
	end
	--print_message_to_user(get_cockpit_draw_argument_value(915))
	if get_cockpit_draw_argument_value(915) > 0.0 then
		--print_message_to_user('Clicked')
		button_depress = true
	else
		--if clicked
		if button_depress == true  then
			if HMDTOGGLE:get() == 0 then
				print_message_to_user('On')
				HMDTOGGLE:set(1)
				HMD_LIGHT:set(1) 
			else	
				print_message_to_user('Off')
				HMDTOGGLE:set(0)
				HMD_LIGHT:set(0) 
			end		
		end
		
		button_depress = false
	end 
--[[
	--get HMD toggle pos
	if get_cockpit_draw_argument_value(264) > 0.5 then
		HMDTOGGLE:set(1.0)
	else
		HMDTOGGLE:set(0.0)
	end]]
	
	--get HMD brightness
	if get_cockpit_draw_argument_value(729) > 0.0 then
		HUD_BRIGHTNESS:set(get_cockpit_draw_argument_value(729))
	else
		HUD_BRIGHTNESS:set(0.0)
	end
	
end

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
	
	--Canards
	--set_aircraft_draw_argument_value(9, get_aircraft_draw_argument_value(10000))
	--set_aircraft_draw_argument_value(10, get_aircraft_draw_argument_value(10000))
		
	ROLL_HUD:set(sensor_data.getRoll())

	PITCH_HUD:set(sensor_data.getPitch())
	
 local VelVec_y = -sensor_data.getAngleOfAttack() 

	VELVEC_HUD_Y:set(VelVec_y * (1.08))
	
	HEADING_HUD:set((sensor_data.getMagneticHeading() * RAD_TO_DEGREE))
	
	ALTITUDE_HUD:set(sensor_data.getBarometricAltitude() * 3.2808399)
	
	HUD_IAS = sensor_data.getIndicatedAirSpeed() * 1.94384449		 -- m/s to kts
	local self_vel_l,self_vel_v,self_vel_h = sensor_data.getSelfAirspeed()		-- Prereq for ground speed in kts
	HUD_GS = math.sqrt(self_vel_h^2 + self_vel_l^2)*1.94384449
-- Below 50 kts use ground speed reading instead
	if HUD_IAS < 50 then
		CURR_IAS:set(HUD_GS)
	else
		CURR_IAS:set(HUD_IAS)
	end
	
	HUD_MACH = sensor_data.getMachNumber()
	
	if HUD_MACH < 0.995 then
		HUD_MACH = HUD_MACH *100
	end
	
	MACH_A:set(sensor_data.getMachNumber())

end

need_to_be_closed = false