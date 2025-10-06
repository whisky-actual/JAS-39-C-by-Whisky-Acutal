dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true
-- disableDM = true

dtime = 0.05

pneu_m_chute_deploy = 6.0 * dtime / 60.0
pneu_m_chute_cutoff = 6.0 * dtime / 60.0
pneu_m_canopy_seal  = 0.05

pneu_e_wbrk = 0.0
pneu_e_lg   = 0.0

need_to_be_closed = true