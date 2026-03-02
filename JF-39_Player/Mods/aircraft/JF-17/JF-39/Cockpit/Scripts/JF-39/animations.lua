dofile(LockOn_Options.script_path .. "command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

local updateTimeStep = 1/30
make_default_activity(updateTimeStep)

local misc = GetSelf()

misc:listen_command(key_cmds.Gun_OnOff)
misc:listen_command(click_cmds.PNT_983)

local Stick_Show_Hide_Toggle = get_param_handle("Stick_Show_Hide_Toggle")

function update()
	
end
----------------------------------------------------------------------------------------
-- Custom Commands
----------------------------------------------------------------------------------------
function SetCommand(command, value)
	if command == key_cmds.Gun_OnOff then
		if Stick_Show_Hide_Toggle:get() == 1 then
			Stick_Show_Hide_Toggle:set(0)
		else
			Stick_Show_Hide_Toggle:set(1)
		end
	end
end
----------------------------------------------------------------------------------------
-- AAR Animations
----------------------------------------------------------------------------------------
function update()
	set_aircraft_draw_argument_value(22, get_aircraft_draw_argument_value(419))
end

need_to_be_closed = false
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------