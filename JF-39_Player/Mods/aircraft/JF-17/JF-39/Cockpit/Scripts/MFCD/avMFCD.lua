dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32

use_ed_render_target = true
use_ed_camera_render = false

overheat_time = 600.0
cooldown_time = 30.0

hsd_fwd_comp_bias = -0.3125

hsd_fwd_clip_l = -1800/2000
hsd_fwd_clip_r =  1800/2000
hsd_fwd_clip_u =  0.84 -- 0.8875
hsd_fwd_clip_d = -1650/2000

need_to_be_closed = true
