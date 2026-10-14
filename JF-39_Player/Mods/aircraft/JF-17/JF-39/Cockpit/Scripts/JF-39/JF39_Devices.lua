dofile(LockOn_Options.script_path .. "command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")

make_default_activity(0.006)
local dev = GetSelf()

--[[
-- ============= Show Param Handles List? ================
local SHOW_PARAMS_LIST = true

if SHOW_PARAMS_LIST then
    show_param_handles_list()
end
-- =======================================================
]]


---------------------------------------------------------------------------------------------
-- Parameter Handles
---------------------------------------------------------------------------------------------
local JF39_MFCD         = get_param_handle("JF39_MFCD")
local JF39_HUD          = get_param_handle("JF39_HUD")
local JF39_HMD          = get_param_handle("JF39_HMD")
local JF39_AP           = get_param_handle("JF39_AP")
local JF39_LCP          = get_param_handle("JF39_LCP")
local JF17_COM1_FREQ    = get_param_handle("JF17_COM1_FREQ")
local JF17_COM2_FREQ    = get_param_handle("JF17_COM2_FREQ")
local JF17_COM1_CHAN    = get_param_handle("JF17_COM1_CHAN")
local JF17_COM2_CHAN    = get_param_handle("JF17_COM2_CHAN")
local JF17_COM1_VOL     = get_param_handle("JF17_COM1_VOL")
local JF17_COM2_VOL     = get_param_handle("JF17_COM2_VOL")
local JF17_COM1_STAT    = get_param_handle("JF17_COM1_STAT")
local JF17_COM2_STAT    = get_param_handle("JF17_COM2_STAT")
local JF17_DATALINK     = get_param_handle("JF17_DATALINK")
local JF17_RADIO_MODE   = get_param_handle("JF17_RADIO_MODE")
local JF17_RADIO_TAKE   = get_param_handle("JF17_RADIO_TAKE")
local JF17_RADIO_SQL    = get_param_handle("JF17_RADIO_SQL")


---------------------------------------------------------------------------------------------
-- Sensor Data
---------------------------------------------------------------------------------------------
local sensor_data = get_base_data()


---------------------------------------------------------------------------------------------
-- AP Disconnect Limits
---------------------------------------------------------------------------------------------
-- Values are in radians per second.
-- 5 degrees/second pitch
-- 10 degrees/second roll
---------------------------------------------------------------------------------------------
local AP_PITCH_RATE_LIMIT = math.rad(5)
local AP_ROLL_RATE_LIMIT  = math.rad(10)


---------------------------------------------------------------------------------------------
-- State Variables
---------------------------------------------------------------------------------------------
local first_run = true
local button_depress_ap = false
local button_depress_radio_take = false


---------------------------------------------------------------------------------------------
-- Frequency to Channel Mapping Table and Function
---------------------------------------------------------------------------------------------
local freq_to_chan_table = {
    [108.00] = "CH001", [108.50] = "CH002", [109.00] = "CH003", [109.50] = "CH004", [110.00] = "CH005", [110.50] = "CH006", [111.00] = "CH007", [111.50] = "CH008",
    [112.00] = "CH009", [112.50] = "CH010", [113.00] = "CH011", [113.50] = "CH012", [114.00] = "CH013", [114.50] = "CH014", [115.00] = "CH015", [115.50] = "CH016",
    [116.00] = "CH017", [116.50] = "CH018", [117.00] = "CH019", [117.50] = "CH020", [118.00] = "CH021", [118.50] = "CH022", [119.00] = "CH023", [119.50] = "CH024", 
    [120.00] = "CH025", [120.50] = "CH026", [121.00] = "CH027", [121.50] = "CH028", [122.00] = "CH029", [122.50] = "CH030", [123.00] = "CH031", [123.50] = "CH032", 
    [124.00] = "CH033", [124.50] = "CH034", [125.00] = "CH035", [125.50] = "CH036", [126.00] = "CH037", [126.50] = "CH038", [127.00] = "CH039", [127.50] = "CH040", 
    [128.00] = "CH041", [128.50] = "CH042", [129.00] = "CH043", [129.50] = "CH044", [130.00] = "CH045", [130.50] = "CH046", [131.00] = "CH047", [131.50] = "CH048", 
    [132.00] = "CH049", [132.50] = "CH050", [133.00] = "CH051", [133.50] = "CH052", [134.00] = "CH053", [134.50] = "CH054", [135.00] = "CH055", [135.50] = "CH056", 
    [136.00] = "CH057", [136.50] = "CH058", [137.00] = "CH059", [137.50] = "CH060", [138.00] = "CH061", [138.50] = "CH062", [139.00] = "CH063", [139.50] = "CH064", 
    [140.00] = "CH065", [140.50] = "CH066", [141.00] = "CH067", [141.50] = "CH068", [142.00] = "CH069", [142.50] = "CH070", [143.00] = "CH071", [143.50] = "CH072", 
    [144.00] = "CH073", [144.50] = "CH074", [145.00] = "CH075", [145.50] = "CH076", [146.00] = "CH077", [146.50] = "CH078", [147.00] = "CH079", [147.50] = "CH080", 
    [148.00] = "CH081", [148.50] = "CH082", [149.00] = "CH083", [149.50] = "CH084", [150.00] = "CH085", [150.50] = "CH086", [151.00] = "CH087", [151.50] = "CH088", 
    [152.00] = "CH089", [152.50] = "CH090", [153.00] = "CH091", [153.50] = "CH092", [154.00] = "CH093", [154.50] = "CH094", [155.00] = "CH095", [155.50] = "CH096", 
    [156.00] = "CH097", [156.50] = "CH098", [157.00] = "CH099", [157.50] = "CH100", [225.00] = "CH101", [226.00] = "CH102", [227.00] = "CH103", [228.00] = "CH104", 
    [229.00] = "CH105", [230.00] = "CH106", [231.00] = "CH107", [232.00] = "CH108", [233.00] = "CH109", [234.00] = "CH110", [235.00] = "CH111", [236.00] = "CH112", 
    [237.00] = "CH113", [238.00] = "CH114", [239.00] = "CH115", [240.00] = "CH116", [241.00] = "CH117", [242.00] = "CH118", [243.00] = "CH119", [244.00] = "CH120", 
    [245.00] = "CH121", [246.00] = "CH122", [247.00] = "CH123", [248.00] = "CH124", [249.00] = "CH125", [250.00] = "CH126", [251.00] = "CH127", [252.00] = "CH128", 
    [253.00] = "CH129", [254.00] = "CH130", [255.00] = "CH131", [256.00] = "CH132", [257.00] = "CH133", [258.00] = "CH134", [259.00] = "CH135", [260.00] = "CH136", 
    [261.00] = "CH137", [262.00] = "CH138", [263.00] = "CH139", [264.00] = "CH140", [265.00] = "CH141", [266.00] = "CH142", [267.00] = "CH143", [268.00] = "CH144", 
    [269.00] = "CH145", [270.00] = "CH146", [271.00] = "CH147", [272.00] = "CH148", [273.00] = "CH149", [274.00] = "CH150", [275.00] = "CH151", [276.00] = "CH152", 
    [277.00] = "CH153", [278.00] = "CH154", [279.00] = "CH155", [280.00] = "CH156", [281.00] = "CH157", [282.00] = "CH158", [283.00] = "CH159", [284.00] = "CH160", 
    [285.00] = "CH161", [286.00] = "CH162", [287.00] = "CH163", [288.00] = "CH164", [289.00] = "CH165", [290.00] = "CH166", [291.00] = "CH167", [292.00] = "CH168", 
    [293.00] = "CH169", [294.00] = "CH170", [295.00] = "CH171", [296.00] = "CH172", [297.00] = "CH173", [298.00] = "CH174", [299.00] = "CH175", [300.00] = "CH176", 
    [301.00] = "CH177", [302.00] = "CH178", [303.00] = "CH179", [304.00] = "CH180", [305.00] = "CH181", [306.00] = "CH182", [307.00] = "CH183", [308.00] = "CH184", 
    [309.00] = "CH185", [310.00] = "CH186", [311.00] = "CH187", [312.00] = "CH188", [313.00] = "CH189", [314.00] = "CH190", [315.00] = "CH191", [316.00] = "CH192", 
    [317.00] = "CH193", [318.00] = "CH194", [319.00] = "CH195", [320.00] = "CH196", [321.00] = "CH197", [322.00] = "CH198", [422.75] = "CH199", [432.75] = "CH200"
}

local function update_com_channels()
    -- COM1 Channel Conversion
    local freq1 = tonumber(string.format("%.2f", JF17_COM1_FREQ:get() or 0))
    local chan1 = freq_to_chan_table[freq1] or "CH000"
    JF17_COM1_CHAN:set(chan1)

    -- COM2 Channel Conversion
    local freq2 = tonumber(string.format("%.2f", JF17_COM2_FREQ:get() or 0))
    local chan2 = freq_to_chan_table[freq2] or "CH000"
    JF17_COM2_CHAN:set(chan2)
end


---------------------------------------------------------------------------------------------
-- COM Power/Status Logic Function
---------------------------------------------------------------------------------------------
local function update_com_status()
    -- COM1 Status (Arg 272)
    local stat1 = get_cockpit_draw_argument_value(272)
    if stat1 == 1 then
        JF17_COM1_STAT:set('ON')
    else
        JF17_COM1_STAT:set('OFF')
    end

    -- COM2 Status (Arg 273)
    local stat2 = get_cockpit_draw_argument_value(273)
    if stat2 == 1 then
        JF17_COM2_STAT:set('ON')
    else
        JF17_COM2_STAT:set('OFF')
    end
end


---------------------------------------------------------------------------------------------
-- Radio Mode Logic Function (Arg 547)
---------------------------------------------------------------------------------------------
local function update_radio_mode()
    local mode_val = get_cockpit_draw_argument_value(547)
    
    if math.abs(mode_val - 0.0) < 0.005 then
        JF17_RADIO_MODE:set('OFF')
    elseif math.abs(mode_val - 0.20) < 0.005 then
        JF17_RADIO_MODE:set('TR')
    elseif math.abs(mode_val - 0.40) < 0.005 then
        JF17_RADIO_MODE:set('TR+G')
    elseif math.abs(mode_val - 0.60) < 0.005 then
        JF17_RADIO_MODE:set('ADF')
    elseif math.abs(mode_val - 0.80) < 0.005 then
        JF17_RADIO_MODE:set('GD')
    elseif math.abs(mode_val - 1.0) < 0.005 then
        JF17_RADIO_MODE:set('SET')
    else
        JF17_RADIO_MODE:set('OFF')
    end
end


---------------------------------------------------------------------------------------------
-- AP Automatic Disconnect Function
---------------------------------------------------------------------------------------------
local function check_ap_disconnect()

    if JF39_AP:get() < 0.5 then
        return
    end

    local pitch_rate = sensor_data:getRateOfPitch()
    local roll_rate  = sensor_data:getRateOfRoll()

    if math.abs(pitch_rate) > AP_PITCH_RATE_LIMIT then
        JF39_AP:set(0)
        return
    end

    if math.abs(roll_rate) > AP_ROLL_RATE_LIMIT then
        JF39_AP:set(0)
        return
    end

end


---------------------------------------------------------------------------------------------
-- Main Frame Update Loop
---------------------------------------------------------------------------------------------
function update()

    -----------------------------------------------------------------------------------------
    -- First Run Initialization
    -----------------------------------------------------------------------------------------
    if first_run then
        JF39_MFCD:set(0)
        JF39_HUD:set(0)
        JF39_AP:set(0)
        JF17_COM1_CHAN:set("CH000")
        JF17_COM2_CHAN:set("CH000")
        JF17_COM1_VOL:set(0)
        JF17_COM2_VOL:set(0)
        JF17_COM1_STAT:set('OFF')
        JF17_COM2_STAT:set('OFF')
        JF17_RADIO_MODE:set('OFF')
        JF17_RADIO_TAKE:set('UFC')
        JF17_RADIO_SQL:set('OFF')
        first_run = false
    end


    -----------------------------------------------------------------------------------------
    -- MFCD Display Toggle (Arg 907 Switch + Arg 904 Battery)
    -----------------------------------------------------------------------------------------
    local switch_val = get_cockpit_draw_argument_value(907)
    local battery_val = get_cockpit_draw_argument_value(904)

    if switch_val > 0.5 and battery_val > 0.5 then
        JF39_MFCD:set(1)
    else
        JF39_MFCD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- HUD Display Toggle (Arg 729 Brightness Switch + Arg 904 Battery)
    -----------------------------------------------------------------------------------------
    local hud_switch_val = get_cockpit_draw_argument_value(729)
    local hud_battery_val = get_cockpit_draw_argument_value(904)

    if hud_switch_val > 0.01 and hud_battery_val > 0.5 then
        JF39_HUD:set(1)
    else
        JF39_HUD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- HMD Display Toggle (Arg 915 Switch + Arg 904 Battery)
    -----------------------------------------------------------------------------------------
    local hmd_switch_val = get_cockpit_draw_argument_value(915)
    local hmd_battery_val = get_cockpit_draw_argument_value(904)

    if hmd_switch_val > 0.5 and hmd_battery_val > 0.5 then
        JF39_HMD:set(1)
    else
        JF39_HMD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- LCP Power/Lighting Logic (Arg 547 Knob Pos + Arg 904 Battery)
    -----------------------------------------------------------------------------------------
    local lcp_switch_val = get_cockpit_draw_argument_value(547)
    local lcp_battery_val = get_cockpit_draw_argument_value(904)

    if lcp_switch_val > 0.01 and lcp_battery_val > 0.5 then
        JF39_LCP:set(1)
    else
        JF39_LCP:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- AP Momentary Toggle Button (Arg 719)
    -----------------------------------------------------------------------------------------
    if get_cockpit_draw_argument_value(719) > 0.0 then
        button_depress_ap = true
    else
        if button_depress_ap then
            JF39_AP:set(1 - JF39_AP:get())
        end
        button_depress_ap = false
    end


    -----------------------------------------------------------------------------------------
    -- Radio Take Control Toggle (Arg 548)
    -----------------------------------------------------------------------------------------
    if get_cockpit_draw_argument_value(548) > 0.0 then
        button_depress_radio_take = true
    else
        if button_depress_radio_take then
            if JF17_RADIO_TAKE:get() == 'LCP' then
                JF17_RADIO_TAKE:set('UFC')
            else
                JF17_RADIO_TAKE:set('LCP')
            end
        end
        button_depress_radio_take = false
    end


    -----------------------------------------------------------------------------------------
    -- Radio Squelch (SQL) 3-Position Switch Logic (Arg 546: 0 = ON, 1 = OFF)
    -----------------------------------------------------------------------------------------
    local sql_val = get_cockpit_draw_argument_value(546)

    if sql_val > 0.5 then
        JF17_RADIO_SQL:set('OFF')
    else
        JF17_RADIO_SQL:set('ON')
    end


    -----------------------------------------------------------------------------------------
    -- COM Channels & Volume Monitoring (Arg 934 for COM1, Arg 938 for COM2)
    -----------------------------------------------------------------------------------------
    update_com_channels()

    JF17_COM1_VOL:set(get_cockpit_draw_argument_value(934) * 100)
    JF17_COM2_VOL:set(get_cockpit_draw_argument_value(938) * 100)


    -----------------------------------------------------------------------------------------
    -- Radio Mode & COM Power Tracking
    -----------------------------------------------------------------------------------------
    update_com_status()
    update_radio_mode()


    -----------------------------------------------------------------------------------------
    -- Autopilot Limit Monitoring
    -----------------------------------------------------------------------------------------
    check_ap_disconnect()


    -----------------------------------------------------------------------------------------
    -- Datalink Frequency Tracking Logic
    -----------------------------------------------------------------------------------------
    local freq2_val = JF17_COM2_FREQ:get()
    if freq2_val and math.abs(freq2_val - 422.75) < 0.001 then
        JF17_DATALINK:set('ON')
    else
        JF17_DATALINK:set('OFF')
    end

end

----------------------------------------------------------------------------------------
--                 File by whisky.actual@gmail.com - v.1.5.1
----------------------------------------------------------------------------------------