dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

local gettext = require("i_18n")
_ = gettext.translate

std_message_timeout = 10

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
local    t_start   = 0.0
local    t_stop    = 0.0
local    dt        = 1.5
local    dt_mto    = 2.0
local    start_sequence_time   = 255
local    stop_sequence_time    = 30.0

--
start_sequence_full       = {}
stop_sequence_full        = {}
cockpit_illumination_full = {}

function push_command(sequence, run_t, command)
    sequence[#sequence + 1] = command
    sequence[#sequence]["time"] = run_t
end

function push_start_command(delta_t, command)
    t_start = t_start + delta_t
    push_command(start_sequence_full, t_start, command)
end

function push_stop_command(delta_t, command)
    t_stop = t_stop + delta_t
    push_command(stop_sequence_full, t_stop, command)
end

--
local count = 0
local function counter()
    count = count + 1
    return count
end

-- conditions
count = -1

JF17_AD_NO_FAILURE    = counter()
JF17_AD_INS_ALIGN     = counter()

--
alert_messages = {}

alert_messages[JF17_AD_INS_ALIGN]    = { message = _("INS NOT ALIGNED"), message_timeout = std_message_timeout }

----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
--[[
  for message:   push_start_command(dt,  { message = _("MSG"),  message_timeout = start_sequence_time })
  for operation: push_start_command(dt,  { device = device,  action = cmd, value = 1.0})
  for condition: push_start_command(dt,  { message = _("MSG"),  check_condition = cond_enum,  message_timeout = dt_mto})
]]

-- stage functions
local function stage_pre_start()
    push_start_command(dt + dt_mto,  { message = _("Check and Preparation"),  message_timeout = dt_mto })

    push_start_command(dt, { device = devices.INTERCOM,  action = macro_cmds.AutoStart_Remove_Cover_Ladder, value = 1.0})
    push_start_command(0,  { message = _("Remove Inlet Cover and Ladder"),  message_timeout = dt })
end

local function stage_power_on()
    push_start_command(dt + dt_mto,  { message = _("1: Power On"),  message_timeout = dt_mto })

    -- Batt/DC/AC switch on
    push_start_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_904, value = 1.0})
    push_start_command(0,   { message = _(" - Battery Switch On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_905, value = 1.0})
    push_start_command(0,   { message = _(" - DC Switch On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_906, value = 1.0})
    push_start_command(0,   { message = _(" - AC Switch On"),  message_timeout = dt })

    -- AAP
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_928, value = 1.0})
    push_start_command(0,   { message = _(" - AAP WMMC1 On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_929, value = 1.0})
    push_start_command(0,   { message = _(" - AAP WMMC2 On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_923, value = 1.0})
    push_start_command(0,   { message = _(" - AAP COM1 On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_924, value = 1.0})
    push_start_command(0,   { message = _(" - AAP COM2 On"),  message_timeout = dt })

    -- Warning Light
    push_start_command(dt,  { device = devices.WARNING_SYSTEM,  action = click_cmds.PNT_900, value = 1.0})
    push_start_command(0,   { message = _(" - Warning Panel Day/Night - Day"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.WARNING_SYSTEM,  action = click_cmds.PNT_901, value = 1.0})
    push_start_command(0,   { message = _(" - Warning Panel Bright Knob - Max"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.WARNING_SYSTEM,  action = click_cmds.PNT_903, value = 1.0})
    push_start_command(0,   { message = _(" - Oxygen Indicator Bright Knob - Max"),  message_timeout = dt })

    -- Audio
    push_start_command(dt,  { device = devices.ACP,  action = click_cmds.PNT_935, value = 1.0})
    push_start_command(0,   { message = _(" - Intercom Switch On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ACP,  action = click_cmds.PNT_934, value = 1.0})
    push_start_command(0,   { message = _(" - COM1 Volume Knob - Max"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ACP,  action = click_cmds.PNT_938, value = 1.0})
    push_start_command(0,   { message = _(" - COM2 Volume Knob - Max"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ACP,  action = click_cmds.PNT_939, value = 1.0})
    push_start_command(0,   { message = _(" - TCN/ILS Volume Knob - Max"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ACP,  action = click_cmds.PNT_940, value = 0.4})
    push_start_command(0,   { message = _(" - MSL Volume Knob - 40%"),  message_timeout = dt })


    -- HUD/UFCD/MFCD
    local ext = 0.0
    push_start_command(dt + ext,  { device = devices.UFCP,  action = click_cmds.PNT_728, value = 1.0})
    push_start_command(0,   { message = _(" - HUD Contrast Knob - Max"),  message_timeout = dt })
    push_start_command(dt + ext,  { device = devices.UFCP,  action = click_cmds.PNT_729, value = 1.0})
    push_start_command(0,   { message = _(" - HUD Brightness Knob - Max"),  message_timeout = dt })
    push_start_command(dt + ext,  { device = devices.UFCP,  action = click_cmds.PNT_732, value = 1.0})
    push_start_command(0,   { message = _(" - UFCP Brightness Knob - Max"),  message_timeout = dt })

    -- EMMC
    push_start_command(dt + ext,  { device = devices.EMMC,  action = key_cmds.HOTAS_Throttle_T1_Center })
    push_start_command(0,   { message = _(" - Select Nav Master Mode"),  message_timeout = dt })

    -- Radio
    push_start_command(dt + ext,  { device = devices.INTERCOM,  action = click_cmds.PNT_547, value = 0.2})
    push_start_command(0,   { message = _(" - Radio Mode Selector - T/R"),  message_timeout = dt })
    push_start_command(dt + ext,  { device = devices.INTERCOM,  action = click_cmds.PNT_545, value = 1.0})
    push_start_command(0,   { message = _(" - Radio Volume Knob - Max"),  message_timeout = dt })

    push_start_command(dt + ext,  { device = devices.WARNING_SYSTEM,  action = click_cmds.PNT_842, value = 1.0})
    push_start_command(0,   { message = _(" - Master Warning Button - Press"),  message_timeout = dt })
end

local function stage_cockpit_light_on()
    push_start_command(dt + dt_mto,  { message = _("2: Cockpit Light"),  message_timeout = dt_mto })

    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_944, value = 0.8})
    push_start_command(0,   { message = _(" - Inst. Light Knob - 80%"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_945, value = 0.8})
    push_start_command(0,   { message = _(" - Console Light Knob - 80%"),  message_timeout = dt })
end

local function stage_start_engine()
    push_start_command(dt + dt_mto,  { message = _("3: Engine Start"),  message_timeout = dt_mto })

    push_start_command(dt,  { device = devices.FUEL,    action = click_cmds.PNT_518, value = 1.0})
    push_start_command(0,   { message = _(" - Fuel Pump Switch On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ENGINE,  action = click_cmds.PNT_519, value = 1.0})
    push_start_command(0,   { message = _(" - Engine Control Switch On"),  message_timeout = dt })

    push_start_command(dt,  { device = devices.ENGINE,  action = click_cmds.PNT_571, value = 1.0})
    push_start_command(0,   { message = _(" - Throttle - Stop To Idle"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ENGINE,  action = click_cmds.PNT_521, value = 1.0})
    push_start_command(0,   { message = _(" - Ground Start Button - Press and Hold"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ENGINE,  action = macro_cmds.AutoStart_Engine_Start, value = 1.0})

    push_start_command(dt,  { device = devices.MFCD,  action = click_cmds.PNT_823, value = 1.0})
    push_start_command(0,   { message = _(" - RMFCD Shows EPI2 Page"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.MFCD,  action = click_cmds.PNT_822, value = 1.0})
end

local function stage_start_shars_ins()
    push_start_command(dt + dt_mto + 20.0,  { message = _("4: SHARS and INS"),  message_timeout = dt_mto })

    -- SHARS
    push_start_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_540, value = 1.0})
    push_start_command(0,   { message = _(" - SHARS Switch On"),  message_timeout = dt })

    -- INS
    push_start_command(dt + 10.0,  { device = devices.AAP,  action = click_cmds.PNT_927, value = 0.0})
    push_start_command(0,   { message = _(" - AAP INS On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.UFCP, action = click_cmds.PNT_721, value = 1.0})
    push_start_command(dt,  { device = devices.UFCP, action = click_cmds.PNT_707, value = 1.0})
    push_start_command(0,   { message = _(" - UFCP DST Button - Press"),  message_timeout = dt })
    push_start_command(dt +  4.0,  { device = devices.INS,  action = macro_cmds.AutoStart_INS_Coord, value = 1.0})
    push_start_command(0,   { message = _(" - Enter Current Coordinate"),  message_timeout = dt })
    push_start_command(dt + 15.0,  { device = devices.INS,  action = click_cmds.PNT_908, value = 0.667})
    push_start_command(0,   { message = _(" - Start Fast Alignment"),  message_timeout = dt })
    push_start_command(dt + 10.0,  { device = devices.INS,  action = macro_cmds.AutoStart_INS_Hdg, value = 1.0})
    push_start_command(0,   { message = _(" - Enter Current True Heading"),  message_timeout = dt })

    push_start_command(dt + 40.0,  { device = devices.AAP,  action = click_cmds.PNT_925, value = 1.0})
    push_start_command(0,   { message = _(" - AAP NAV On"),  message_timeout = dt })
end


local function stage_start_ecs_oxy()
    push_start_command(dt + dt_mto,  { message = _("5: ECS and Oxygen"),  message_timeout = dt_mto })

    -- ECS
    push_start_command(dt,  { device = devices.ECS,  action = click_cmds.PNT_942, value = 0.333})
    push_start_command(0,   { message = _(" - ECS Mode Knob Selector On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.ECS,  action = click_cmds.PNT_941, value = 0.520})
    push_start_command(0,   { message = _(" - Air Temp Knob Selector - 25"),  message_timeout = dt })


    -- Oxygen
    push_start_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_975, value = 1.0})
    push_start_command(0,   { message = _(" - Oxygen Tube - Connect"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_979, value = 1.0})
    push_start_command(0,   { message = _(" - G-Suit Tube - Connect"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_976, value = 1.0})
    push_start_command(0,   { message = _(" - Oxygen Supply Valve - Max"),  message_timeout = dt })

    -- Seat
    push_start_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_972, value = 1.0})
    push_start_command(0,   { message = _(" - Eject Seat Safe/Arm Handle - Arm"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_973, value = 0.0})
    push_start_command(0,   { message = _(" - Eject Seat Firing Handle Safety Pin - Remove"),  message_timeout = dt })
end


local function stage_dtc_install()
    push_start_command(dt + dt_mto,  { message = _("6: DTC Card"),  message_timeout = dt_mto })

    push_start_command(dt,  { device = devices.DTC,  action = click_cmds.PNT_953, value = 1.0})
    push_start_command(0,   { message = _(" - DTC Card - Install"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.DTC,  action = click_cmds.PNT_953, value = 0.0})

    push_start_command(dt + 10.0,  { device = devices.MFCD, action = click_cmds.PNT_740, value = 1.0}) -- U5
    push_start_command(0,   { message = _(" - Select All Data Entries"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.MFCD, action = click_cmds.PNT_754, value = 1.0}) -- R5
    push_start_command(0,   { message = _(" - Start Loading Selected Data"),  message_timeout = dt })

    -- more device power on
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_930, value = 1.0})
    push_start_command(0,   { message = _(" - AAP SAIU On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_919, value = 1.0})
    push_start_command(0,   { message = _(" - AAP RDR On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_920, value = 1.0})
    push_start_command(0,   { message = _(" - AAP SLNK On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_921, value = 1.0})
    push_start_command(0,   { message = _(" - AAP OESP On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_922, value = 1.0})
    push_start_command(0,   { message = _(" - AAP RWR On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.AAP,  action = click_cmds.PNT_926, value = 1.0})
    push_start_command(0,   { message = _(" - AAP IFF On"),  message_timeout = dt })

end

local function stage_start_final()
    push_start_command(dt + dt_mto,  { message = _("7: Startup Final"),  message_timeout = dt_mto })

    push_start_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_539, value = 1.0})
    push_start_command(0,   { message = _(" - Emergency Hydraulic Pump Switch On"),  message_timeout = dt })

    -- External Light
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_947, value = 1.0})
    push_start_command(0,   { message = _(" - Exterior Light Master Switch On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_948, value = 1.0})
    push_start_command(0,   { message = _(" - Formation Light Knob Selector On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_949, value = 1.0})
    push_start_command(0,   { message = _(" - Anti-Collision Light Knob Selector On"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_950, value = 1.0})
    push_start_command(0,   { message = _(" - Navigation Light Switch - Brt"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_951, value = 1.0})
    push_start_command(0,   { message = _(" - Navigation Light Switch - Flash"),  message_timeout = dt })
    push_start_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_952, value = 1.0})
    push_start_command(0,   { message = _(" - Light Switch - Anti-Collision"),  message_timeout = dt })

    -- Canopy
    push_start_command(dt,  { device = devices.FCS,  action = click_cmds.PNT_958, value = 0.667})
    push_start_command(0,   { message = _(" - Canopy Open/Close Handle - Close"),  message_timeout = dt })
    push_start_command(dt + 10.0,  { device = devices.FCS,  action = click_cmds.PNT_958, value = 1.0})
    push_start_command(0,   { message = _(" - Canopy Open/Close Handle - Lock"),  message_timeout = dt })

    -- FCS Cfg
    push_start_command(dt,  { action = macro_cmds.AutoStart_FCS_Cfg, value = 1.0})
    push_start_command(0,   { message = _(" - Set FCS Configuration"),  message_timeout = dt })

    -- EMMC
    push_start_command(dt,  { device = devices.EMMC,  action = key_cmds.HOTAS_Throttle_T1_Center })
    push_start_command(0,   { message = _(" - Refresh MFCD Pages"),  message_timeout = dt })

    -- QFE
    push_start_command(dt + dt_mto,  { message = _(" - Adjust QFE using BARO Altitude Setting Knob"),  message_timeout = dt * 4.0 })
    push_start_command(dt,  { device = devices.MFCD,  action = click_cmds.PNT_762, value = 1.0}) -- D3
    push_start_command(dt,  { device = devices.MFCD,  action = click_cmds.PNT_745, value = 1.0}) -- L4
    push_start_command(dt,  { device = devices.MFCD,  action = click_cmds.PNT_743, value = 1.0}) -- L2

    -- brake
    push_start_command(dt,  { device = devices.GEAR,  action = click_cmds.PNT_511, value = -1.0})
    push_start_command(0,   { message = _(" - Parking Brake - Norm"),  message_timeout = dt })

end

local function stage_stop()
    -- Engine Off
    push_stop_command(dt + dt_mto,  { message = _("1: Engine Shutdown"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.ENGINE,  action = macro_cmds.AutoStop_Throttle_Off, value = 1.0})
    push_stop_command(dt,  { device = devices.ENGINE,  action = click_cmds.PNT_572, value = 1.0})
    push_stop_command(dt,  { device = devices.WARNING_SYSTEM,  action = click_cmds.PNT_842, value = 1.0})
    push_stop_command(dt,  { device = devices.ENGINE,  action = click_cmds.PNT_519, value = 0.0})
    push_stop_command(dt,  { device = devices.FUEL,  action = click_cmds.PNT_518, value = 0.0})

    push_stop_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_539, value = 0.0})

    push_stop_command(dt,  { device = devices.WCS,  action = click_cmds.PNT_509, value = 0.0})

    -- Canopy
    push_stop_command(dt + dt_mto,  { message = _("2: Open Canopy"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.FCS,  action = click_cmds.PNT_958, value = 0.0})

    -- SHARS and INS
    push_stop_command(dt + dt_mto,  { message = _("3: Turn Off INS and SHARS"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.INS,  action = click_cmds.PNT_908, value = 0.0})
    push_stop_command(dt,  { device = devices.MISC, action = click_cmds.PNT_540, value = 0.0})

    -- ECS and Oxy
    push_stop_command(dt + dt_mto,  { message = _("4: Turn Off ECS and Oxy"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.ECS,  action = click_cmds.PNT_942, value = 0.667})
    push_stop_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_976, value = 0.0})
    push_stop_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_975, value = 0.0})
    push_stop_command(dt,  { device = devices.OXYGEN,  action = click_cmds.PNT_979, value = 0.0})

    -- Seat
    push_stop_command(dt + dt_mto,  { message = _("5: Eject Seat Safety"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_972, value = 0.0})
    push_stop_command(dt,  { device = devices.MISC,  action = click_cmds.PNT_973, value = 1.0})

    -- Light
    push_stop_command(dt + dt_mto,  { message = _("6: Turn Off Cockpit and External Lights"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_944, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_945, value = 0.0})

    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_947, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_948, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_949, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_950, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_951, value = 0.0})
    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_952, value = 0.0})

    push_stop_command(dt,  { device = devices.LIGHTS,  action = click_cmds.PNT_512, value = 0.0})

    -- Radio
    push_stop_command(dt + dt_mto,  { message = _("7: Turn Off Radio"),  message_timeout = dt_mto })
    push_stop_command(dt,  { device = devices.INTERCOM,  action = click_cmds.PNT_547, value = 0.0})

    -- Power
    push_stop_command(dt + dt_mto,  { message = _("8: Turn Off Power"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_906, value = 0.0})
    push_stop_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_905, value = 0.0})
    push_stop_command(dt,  { device = devices.ELECTRIC_SYSTEM,  action = click_cmds.PNT_904, value = 0.0})

    -- DTC
    push_stop_command(dt + dt_mto,  { message = _("9: Unplug DTC Card"),  message_timeout = dt_mto })

    push_stop_command(dt,  { device = devices.DTC,  action = click_cmds.PNT_974, value = 1.0})
    push_stop_command(dt,  { device = devices.DTC,  action = click_cmds.PNT_974, value = 1.0})

    push_stop_command(dt,  { device = devices.FCS,  action = click_cmds.PNT_958, value = 0.333})
end

--------
-- Start sequence
push_start_command(dt, { message = _("AUTOSTART SEQUENCE IS RUNNING"),  message_timeout = start_sequence_time })
--

stage_pre_start()
stage_power_on()
stage_cockpit_light_on()
stage_start_engine()
stage_start_shars_ins()
stage_start_ecs_oxy()
stage_dtc_install()
stage_start_final()

--
push_start_command(3.0, {message = _("AUTOSTART COMPLETE"), message_timeout = std_message_timeout})
--

--------
-- Stop sequence
push_stop_command(dt, { message = _("AUTOSTOP SEQUENCE IS RUNNING"),  message_timeout = stop_sequence_time })
--

stage_stop()

--
push_stop_command(3.0, {message = _("AUTOSTOP COMPLETE"), message_timeout = std_message_timeout})
--
