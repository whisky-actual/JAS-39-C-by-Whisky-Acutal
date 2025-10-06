dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

mc_type  = 0
mc_time  = 2.0
mc_scale = 1.0
mc_pnt   = {-3.00, 0.00, 0.00}
mc_ang   = {0.00, 0.00, -180.00}

mc_dm    = 0.005

need_to_be_closed = true