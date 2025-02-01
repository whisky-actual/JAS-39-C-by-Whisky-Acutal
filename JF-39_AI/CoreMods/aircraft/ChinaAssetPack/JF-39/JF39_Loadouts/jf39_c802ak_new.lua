
local use_ed_wpn = true

local c802ak_name  = 'C-802AK'
local c802ak_disp  = '1x RB-15F Programmable Anti-ship Missile'
local c802ak_model = 'jf39_rb15'
local c802ak_mass  = 715
local pylon_mass   = 50.0

local function clsid_c802ak(use_ed)
    if use_ed then
        return "weapons.missiles.C_802AK"
    else
        return "weapons.missiles." .. c802ak_name
    end
end
local function dispname_c802ak(use_ed)
    if use_ed then
        return 'C802AK'
    else
        return c802ak_disp
    end
end

declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_C-802AK',
    Picture      = 'Rb15.png',
    attribute    = clsid_c802ak(use_ed_wpn),
    displayName  = _(c802ak_disp),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = c802ak_mass + pylon_mass,
    Elements     = {
        [1] =
        {
            Position  = {0, 0, 0},
            ShapeName = c802ak_model,
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements
    --attribute = {4, 4, 8, WSTYPE_PLACEHOLDER, "Anti-Ship missiles"},
    ejectVelocity  = eject_speed_msll,
    ejectDirection = {0, -1, 0},
})





-- YJ-83K
local yj83k_name  = 'YJ-83K'
local yj83k_disp  = 'YJ83K (DIS)'
local yj83k_model = 'yj83k'
local yj83k_mass  = 715

local function clsid_yj83(use_ed)
    if use_ed then
        return "weapons.missiles.YJ-83"
    else
        return "weapons.missiles." .. yj83k_name
    end
end
local function dispname_yj83(use_ed)
    if use_ed then
        return 'YJ83K'
    else
        return yj83k_disp
    end
end


declare_loadout({
    category     = CAT_MISSILES,
    CLSID        = 'DIS_YJ83K',
    Picture      = 'yj83.png',
    attribute    = clsid_yj83(use_ed_wpn),
    displayName  = _(dispname_yj83(use_ed_wpn)),
    Cx_pil       = 0.0023,
    Count        = 1,
    Weight       = yj83k_mass,
    Elements     = {
        {
            ShapeName = yj83k_model,
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements
    ejectVelocity  = eject_speed_msl1,
    ejectDirection = {0, -1, 0},
})

declare_loadout({
    category       = CAT_MISSILES,
    CLSID          = 'DIS_GDJ_YJ83K',
    Picture        = 'yj83.png',
    attribute      = {4, 4, 32, WSTYPE_PLACEHOLDER},
    wsTypeOfWeapon = clsid_yj83(use_ed_wpn),
    displayName    = _(dispname_yj83(use_ed_wpn)),
    Cx_pil         = 0.0023,
    Count          = 1,
    Weight         = yj83k_mass + pylon_mass,
    Elements       = {
        {
            ShapeName = "adapter_gdj_yj83k",
            IsAdapter = true,
        },
        {
            ShapeName = yj83k_model,
            connector_name = "adapter_cnt",
            DrawArgs  = {
                [1] = {1, 1.0},
            }
        },
    }, -- end of Elements
    JettisonSubmunitionOnly = true,
    ejectVelocity  = eject_speed_msl1,
    ejectDirection = {0, -1, 0},
})
