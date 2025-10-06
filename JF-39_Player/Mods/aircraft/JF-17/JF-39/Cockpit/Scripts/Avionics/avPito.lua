dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

pito_l_pos = { x = 6.95388, y = -0.02002, z = -0.506 }
pito_r_pos = { x = 6.95388, y = -0.02002, z = 0.506 }
pito_t_pos = { x = 6.95387, y = 0.17038, z = 0.31538 }

aoa_l_pos = { x = 7.02868, y = -0.29852, z = -0.49072 }
aoa_r_pos = { x = 7.02868, y = -0.29852, z = 0.49072 }

need_to_be_closed = true
