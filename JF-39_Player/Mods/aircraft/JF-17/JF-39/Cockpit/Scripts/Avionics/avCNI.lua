dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."damage_list.lua")

local gettext = require("i_18n")
_ = gettext.translate

-- debugGUI = true

dtime = 1.0 / 32


CNI_FAILURE_COM1 = 0
CNI_FAILURE_COM1_SECOS = 1
CNI_FAILURE_COM2 = 2
CNI_FAILURE_COM2_SECOS = 3
CNI_FAILURE_TACAN = 4
CNI_FAILURE_ILS = 5
CNI_FAILURE_IFF_TX = 6
CNI_FAILURE_IFF_RX = 7
CNI_FAILURE_RALT = 8

Damage = {
    {
        Failure = CNI_FAILURE_COM1, Failure_name = "CNI_FAILURE_COM1", Failure_editor_name = _("CNI_FAILURE_COM1"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_COM1_SECOS, Failure_name = "CNI_FAILURE_COM1_SECOS", Failure_editor_name = _("CNI_FAILURE_COM1_SECOS"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_COM2, Failure_name = "CNI_FAILURE_COM2", Failure_editor_name = _("CNI_FAILURE_COM2"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_COM2_SECOS, Failure_name = "CNI_FAILURE_COM2_SECOS", Failure_editor_name = _("CNI_FAILURE_COM2_SECOS"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_TACAN, Failure_name = "CNI_FAILURE_TACAN", Failure_editor_name = _("CNI_FAILURE_TACAN"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_ILS, Failure_name = "CNI_FAILURE_ILS", Failure_editor_name = _("CNI_FAILURE_ILS"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_IFF_TX, Failure_name = "CNI_FAILURE_IFF_TX", Failure_editor_name = _("CNI_FAILURE_IFF_TX"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_IFF_RX, Failure_name = "CNI_FAILURE_IFF_RX", Failure_editor_name = _("CNI_FAILURE_IFF_RX"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
    {
        Failure = CNI_FAILURE_RALT, Failure_name = "CNI_FAILURE_RALT", Failure_editor_name = _("CNI_FAILURE_RALT"),
        Element = 1000, work_time_to_fail_probability = 0.3, work_time_to_fail = 3600*300
    },
}

need_to_be_closed = true
