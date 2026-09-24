dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")
make_default_activity(0.006)
dev = GetSelf()

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
local JF39_MFCD = get_param_handle("JF39_MFCD")
local JF39_HUD  = get_param_handle("JF39_HUD")
local JF39_HMD  = get_param_handle("JF39_HMD")
local JF39_AP   = get_param_handle("JF39_AP")
local JF39_LCP  = get_param_handle("JF39_LCP")


---------------------------------------------------------------------------------------------
-- Sensor Data
---------------------------------------------------------------------------------------------
local sensor_data = get_base_data()


---------------------------------------------------------------------------------------------
-- AP Disconnect Limits
---------------------------------------------------------------------------------------------
-- Values are in radians per second.
--
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


---------------------------------------------------------------------------------------------
-- AP Automatic Disconnect
---------------------------------------------------------------------------------------------
local function check_ap_disconnect()

    -- Do nothing if AP is not currently active
    if JF39_AP:get() < 0.5 then
        return
    end

    -------------------------------------------------------------------------
    -- Get aircraft pitch and roll rates
    -------------------------------------------------------------------------
    local pitch_rate = sensor_data:getRateOfPitch()
    local roll_rate  = sensor_data:getRateOfRoll()

    -------------------------------------------------------------------------
    -- Automatic AP disconnect
    -------------------------------------------------------------------------
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
-- Update Function
---------------------------------------------------------------------------------------------
function update()

    -----------------------------------------------------------------------------------------
    -- First Run
    -----------------------------------------------------------------------------------------
    if first_run then
        JF39_MFCD:set(0)
        JF39_HUD:set(0)
        JF39_AP:set(0)
        first_run = false
    end


    -----------------------------------------------------------------------------------------
    -- MFCD Logic
    -----------------------------------------------------------------------------------------
    local switch_val = get_cockpit_draw_argument_value(907)
    local battery_val = get_cockpit_draw_argument_value(904)

    if switch_val > 0.5 and battery_val > 0.5 then
        JF39_MFCD:set(1)
    else
        JF39_MFCD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- HUD Toggle Logic
    -----------------------------------------------------------------------------------------
    local hud_switch_val = get_cockpit_draw_argument_value(729)
    local hud_battery_val = get_cockpit_draw_argument_value(904)

    if hud_switch_val > 0.01 and hud_battery_val > 0.5 then
        JF39_HUD:set(1)
    else
        JF39_HUD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- HMD Toggle Logic
    -----------------------------------------------------------------------------------------
    local hmd_switch_val = get_cockpit_draw_argument_value(915)
    local hmd_battery_val = get_cockpit_draw_argument_value(904)

    if hmd_switch_val > 0.5 and hmd_battery_val > 0.5 then
        JF39_HMD:set(1)
    else
        JF39_HMD:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- LCP Toggle Logic
    -----------------------------------------------------------------------------------------
    local lcp_switch_val = get_cockpit_draw_argument_value(547)
    local lcp_battery_val = get_cockpit_draw_argument_value(904)

    if lcp_switch_val > 0.01 and lcp_battery_val > 0.5 then
        JF39_LCP:set(1)
    else
        JF39_LCP:set(0)
    end


    -----------------------------------------------------------------------------------------
    -- AP Toggle Logic
    -----------------------------------------------------------------------------------------
    -- Button 719 controls activation/deactivation.
    --
    -- AP OFF + button press = AP ON
    -- AP ON  + button press = AP OFF
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
    -- Automatic AP Disconnect
    -----------------------------------------------------------------------------------------
    check_ap_disconnect()

end


----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.4.0
----------------------------------------------------------------------------------------