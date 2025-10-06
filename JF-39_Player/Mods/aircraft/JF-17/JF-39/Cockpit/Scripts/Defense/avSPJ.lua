dofile(LockOn_Options.script_path.."command_defs.lua")

local gettext = require("i_18n")
_ = gettext.translate

type1_pwr_factor = 1.2
type2_pwr_factor = 1.0
pwr_dir_coef     = 0.8

-- debugGUI = true

dtime = 0.1

need_to_be_closed = true
