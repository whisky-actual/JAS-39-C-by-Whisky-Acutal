dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 16

overheat_time = 600.0
cooldown_time = 20.0

need_to_be_closed = true -- close lua state after initialization
