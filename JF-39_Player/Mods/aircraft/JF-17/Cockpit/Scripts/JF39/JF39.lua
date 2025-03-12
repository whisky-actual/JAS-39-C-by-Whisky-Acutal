dofile(LockOn_Options.script_path.."command_defs.lua")
local update_time_step = 0.05 
make_default_activity(update_time_step)

local dev = GetSelf()
--[[
-- ============= Show Param Handles List? ================
local SHOW_PARAMS_LIST = true

if SHOW_PARAMS_LIST then
    show_param_handles_list()
end
-- =======================================================
]]--

-- Local variables ==================
local JF39_HMD = get_param_handle("JF39_HMD") -- Handle for HMD
local JF39_MFCD = get_param_handle("JF39_MFCD") -- Handle for MFCD
local JF39_HUD = get_param_handle("JF39_HUD") -- Handle for HUD

-- Initialization function
function post_initialize()
    -- Set initial values for devices
    initialize_device_state()
end

-- Function to initialize the device states
function initialize_device_state()
    -- Default settings for the devices
    dev:performClickableAction(device_commands.JF39_HMD, 1, true)
    dev:performClickableAction(device_commands.JF39_MFCD, -1, true)
    dev:performClickableAction(device_commands.JF39_HUD, 1, true)
end

-- Listen to the commands for HMD, MFCD, and HUD
dev:listen_command(device_commands.JF39_HMD)
dev:listen_command(device_commands.JF39_MFCD)
dev:listen_command(device_commands.JF39_HUD)

-- Command handling function
function SetCommand(command, value)
    -- Check and handle specific command actions
    if command == device_commands.JF39_HMD then
        toggle_HMD()
    elseif command == device_commands.JF39_MFCD then
        toggle_MFCD()
    elseif command == device_commands.JF39_HUD then
        toggle_HUD()
    end
end

-- Function to toggle HMD state
function toggle_HMD()
    if JF39_HMD:get() == 1 then
        JF39_HMD:set(-1) -- Turn off the HMD
    else
        JF39_HMD:set(1) -- Turn on the HMD
    end
end

-- Function to toggle MFCD state
function toggle_MFCD()
    if JF39_MFCD:get() == -1 then
        JF39_MFCD:set(1) -- Turn off the MFCD
    else
        JF39_MFCD:set(-1) -- Turn on the MFCD
    end
end

-- Function to toggle HUD state
function toggle_HUD()
    if JF39_HUD:get() == 1 then
        JF39_HUD:set(-1) -- Turn off the HUD
    else
        JF39_HUD:set(1) -- Turn on the HUD
    end
end

-- Ensure the script does not need to be closed
need_to_be_closed = false