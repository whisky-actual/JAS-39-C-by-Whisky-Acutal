dofile(LockOn_Options.script_path .. "command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")



make_default_activity(0.006) --No variable is needed unless something needs to be timed.


local HMD = GetSelf()

HMD:listen_command(device_commands.HMD_TOGGLE)

HMD:listen_command(Keys.HMD_TOGGLE) --HMD Toggle keybind.
HMD:listen_command(Keys.ViewNightVisionGogglesOn) --NVG keybind.

HMD:listen_command(2142) --Horizontal view in deg. Sometimes it doesn't work (janyX/Y used if possible), we need a new one.
HMD:listen_command(2143) --Vertical view in deg.


local AIMING_CROSS_Y = get_param_handle("AIMING_CROSS_Y")

local HMD_STATE = get_param_handle("HMD_STATE")
local HMD_BRIGHTNESS = get_param_handle("HMD_BRIGHTNESS")
local HUD_BRIGHTNESS = get_param_handle("HUD_BRIGHTNESS")

local NVG_STATE = get_param_handle("NVG_STATE")


local absViewX = 0
local viewX    = 0
local viewY = 0

local jankyX = 0
local jankyY = 0

local tmpHMDState = 0



function post_initialize()
	get_param_handle("orgHMDBrightness"):set(1)
end

function update()
	jankyX = get_aircraft_draw_argument_value(39) --Has a max value (2142 is better but it buggs).
	jankyY = get_aircraft_draw_argument_value(99)

	if math.abs(jankyX) < 1 then
		viewX = -jankyX
	end
	if math.abs(jankyY) < 1 then
		viewY = jankyY
	end

	get_param_handle("HORIZONTAL_VIEW_HMD"):set(-viewX)
	get_param_handle("VERTICAL_VIEW_HMD"):set(viewY)


	absViewX = math.abs(viewX)

	if (absViewX <= 0.233 and viewY <= 0.097) or (absViewX > 0.233 and absViewX <= 0.487 and viewY <= -0.231) or (absViewX > 0.487 and absViewX <= 0.908 and viewY <= -0.428) or viewY <= -0.552 then --2142 & 2143: (absViewX <= 0.243 and viewY <= 0.102) or (absViewX > 0.243 and absViewX <= 0.595 and viewY <= -0.242) or (absViewX > 0.595 and absViewX <= 0.885 and viewY <= -0.451) or viewY <= -0.571
		HMD_BRIGHTNESS:set(0) --HMD is not visible when looking down into the cockpit.
	else
		HMD_BRIGHTNESS:set(get_param_handle("orgHMDBrightness"):get())
	end
	--HUD_BRIGHTNESS:set(0)


	if viewY < 0 then
		AIMING_CROSS_Y:set(0)
	elseif viewY >= 0 and viewY <= 0.724 then --Buggy when moving the head fast.
		AIMING_CROSS_Y:set(viewY / 0.724)
	else
		AIMING_CROSS_Y:set(1)
	end



	get_param_handle("HMD_PITCH"):set(math.abs(math.deg(get_base_data().getPitch()) - 90))
end

function SetCommand(command, value)
	if command == 2142 then
		if math.abs(jankyX) == 1 then
			viewX = math.rad(value)
		end
	end

	if command == 2143 then
		if math.abs(jankyY) == 1 then
			viewY = math.rad(value)
		end
	end



	if command == device_commands.HMD_TOGGLE then
		if HMD_STATE:get() == 0 then
			HMD_STATE:set(1)
			tmpHMDState = 1
		else
			HMD_STATE:set(0)
			tmpHMDState = 0
		end
	end

	if command == Keys.HMD_TOGGLE then
		if HMD_STATE:get() == 0 then
			HMD_STATE:set(1)
			tmpHMDState = 1
		else
			HMD_STATE:set(0)
			tmpHMDState = 0
		end
	end


	if command == Keys.ViewNightVisionGogglesOn then
		if NVG_STATE:get() == 0 then
			NVG_STATE:set(1)
			HMD_STATE:set(0) --HMD and NVG can't be used at the same time.
		else
			NVG_STATE:set(0)
			if tmpHMDState == 1 then
				HMD_STATE:set(1)
			end
		end
	end
end



need_to_be_closed = false