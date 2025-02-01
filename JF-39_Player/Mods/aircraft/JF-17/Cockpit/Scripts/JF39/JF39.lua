dofile(LockOn_Options.script_path.."command_defs.lua")
local update_time_step = 0.05 
make_default_activity(update_time_step)
local dev = GetSelf()

-- ============= Show Param Handles List? ================
local SHOW_PARAMS_LIST = true

if SHOW_PARAMS_LIST then
    show_param_handles_list()
end
-- =======================================================


-- Local variables ==================

--local JF39_HMD = get_param_handle("JF39_HMD")
local JF39_MFCD = get_param_handle("JF39_MFCD")

function post_initialize()	-- modes / toggle default settings
dev:performClickableAction(device_commands.JF39_HMD, -1, true)
end

-- params =====================================================

--dev:listen_command(device_commands.JF39_HMD)
dev:listen_command(device_commands.JF39_MFCD)

function SetCommand(command,value) -- Post initialize gets called once on mission start. SetCommand gets called when ever there is a button clicked

-- Complexe functions ===================
--[[
if command == device_commands.JF39_HMD then
   if JF39_HMD:get()== -1 then
	JF39_HMD:set(1)
	else
	JF39_HMD:set(-1)
	end
end
]]
if command == device_commands.JF39_MFCD then
	if  JF39_MFCD:get()== 1 then
		JF39_MFCD:set(-1)
	 else
		JF39_MFCD:set(1)
	 end
 end
	
end

need_to_be_closed = false