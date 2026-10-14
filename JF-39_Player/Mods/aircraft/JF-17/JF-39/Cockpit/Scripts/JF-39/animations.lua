dofile(LockOn_Options.script_path .. "command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")

local updateTimeStep = 1/30
make_default_activity(updateTimeStep)

local misc = GetSelf()

misc:listen_command(key_cmds.Gun_OnOff)
misc:listen_command(click_cmds.PNT_983)

local Stick_Show_Hide_Toggle = get_param_handle("Stick_Show_Hide_Toggle")

-- Engine RPM Parameter Handle (Adjust "RPM" or "ENG_RPM" to match your main panel/device param)
local engine_rpm = get_param_handle("BASE_SENSOR_LEFT_ENGINE_RPM") -- Adjust this to match your engine RPM parameter name

-- APU Door Animation Settings
local apu_door_val = 0.0
local apu_door_speed = 0.5 -- Takes 2 seconds to transition (1.0 / 0.5)

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
-- Main Update Loop
----------------------------------------------------------------------------------------
function update()
    -- AAR Animations
    set_aircraft_draw_argument_value(22, get_aircraft_draw_argument_value(419))
    set_aircraft_draw_argument_value(88, get_cockpit_draw_argument_value(948))

    -- Check Weight-on-Wheels (Strut Compression: Arg 1 = Nose, 4 = Left, 6 = Right)
    local nose_gear_wow  = get_aircraft_draw_argument_value(1)
    local left_gear_wow  = get_aircraft_draw_argument_value(4)
    local right_gear_wow = get_aircraft_draw_argument_value(6)
    local is_on_ground   = (nose_gear_wow > 0 or left_gear_wow > 0 or right_gear_wow > 0)

    -- Check Engine Status
    -- Checks engine parameter > 1% (0.01) OR fallback RPM draw argument 151
    local current_rpm = engine_rpm:get() or get_aircraft_draw_argument_value(151)
    local is_engine_running = (current_rpm > 0.01)

    -- Target state: 1.0 (Open) only if ON THE GROUND and ENGINE IS RUNNING
    local target_apu_state = 0.0
    if is_on_ground and is_engine_running then
        target_apu_state = 1.0
    end

    -- Smoothly interpolate towards target state
    if apu_door_val < target_apu_state then
        apu_door_val = apu_door_val + (apu_door_speed * updateTimeStep)
        if apu_door_val > target_apu_state then 
            apu_door_val = target_apu_state 
        end
    elseif apu_door_val > target_apu_state then
        apu_door_val = apu_door_val - (apu_door_speed * updateTimeStep)
        if apu_door_val < target_apu_state then 
            apu_door_val = target_apu_state 
        end
    end

    -- Apply smooth value to APU doors
    set_aircraft_draw_argument_value(910, apu_door_val)
end

need_to_be_closed = false
----------------------------------------------------------------------------------------
--                     File by whisky.actual@gmail.com - v.1.5.1                      --
----------------------------------------------------------------------------------------