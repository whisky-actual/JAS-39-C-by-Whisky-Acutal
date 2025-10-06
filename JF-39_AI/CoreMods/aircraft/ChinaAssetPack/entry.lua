----------------------------------------------------------------------------------------
-- Toggle: Set to true for JF-39, false for vanilla China Asset Pack
----------------------------------------------------------------------------------------
JF39 = true   -- <<<< CHANGE HERE
----------------------------------------------------------------------------------------

if JF39 == true then
    --------------------------------------------------------------------------
    -- JF-39 Entry
    --------------------------------------------------------------------------
    local self_ID   = 'China Asset Pack by Deka Ironwork Simulations and Eagle Dynamics'
    local pack_name = 'China Asset Pack'

    declare_plugin(self_ID, {
        installed         = true,
        state             = 'installed',
        dirName           = current_mod_path,
        shortName         = pack_name,
        fileMenuName      = _(pack_name),
        displayName       = _(pack_name),
        developerName     = _('Whisky.Actual'),
        version           = __DCS_VERSION__,
        info              = _('These are mods for the JF-17'),
        encyclopedia_path = current_mod_path .. '/Encyclopedia',
        Skins             = {{ name = pack_name, dir = 'Skins/1' }},
        load_immediately  = true,
        binaries          = { 'CAP_AI', 'JF-17_AI' }
    })

    ----------------------------------------------------------------------------------------
    -- JF-39 Files
    ----------------------------------------------------------------------------------------
    -- models
    mount_vfs_model_path(current_mod_path .. '/JF-39/Shapes/Aircraft')
    mount_vfs_model_path(current_mod_path .. '/JF-39/Shapes/Weapons')

    -- textures
    mount_vfs_texture_path(current_mod_path .. '/JF-39/ImagesGUI')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/WIP')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_AA_Weapons')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_AG_Weapons')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Accessories')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Base')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Common')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Drop_tank')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Pilot')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_CAF')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Fictional')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_Operators')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_SwAF_1')
    mount_vfs_texture_path(current_mod_path .. '/JF-39/Textures/JAS39_SwAF_2')

    -- liveries
    mount_vfs_liveries_path(current_mod_path .. '/JF-39/Liveries/')

    ----------------------------------------------------------------------------------------
    -- Deka Ironwork Simulations Files (still needed)
    ----------------------------------------------------------------------------------------
    -- models
    mount_vfs_model_path(current_mod_path .. '/Shapes/Weapons')
    mount_vfs_model_path(current_mod_path .. '/Shapes/Navy')
    mount_vfs_model_path(current_mod_path .. '/Shapes/Vehicles')
    mount_vfs_model_path(current_mod_path .. '/Shapes/Static')

    -- textures
    mount_vfs_texture_path(current_mod_path .. '/Textures/Weapons')
    mount_vfs_texture_path(current_mod_path .. '/Textures/Static/')

    -- liveries
    mount_vfs_texture_path(current_mod_path .. '/Skins/1/ME')

    ----------------------------------------------------------------------------------------
    -- Loadouts & Config
    ----------------------------------------------------------------------------------------
    dofile(current_mod_path .. '/JF-39/Payload.lua')
    dofile(current_mod_path .. '/JF-39/weapon_config.lua')

    -- load entries
    dofile(current_mod_path .. '/JF-39/Aircrafts.lua')
    dofile(current_mod_path .. '/Entries/Tech.lua')

    plugin_done()

else
    --------------------------------------------------------------------------
    -- China Asset Pack (Vanilla, No JF-39)
    --------------------------------------------------------------------------
    local self_ID   = 'China Asset Pack by Deka Ironwork Simulations and Eagle Dynamics'
    local pack_name = 'China Asset Pack'

    declare_plugin(self_ID, {
        installed         = true,
        state             = 'installed',
        dirName           = current_mod_path,
        shortName         = pack_name,
        fileMenuName      = _(pack_name),
        displayName       = _(pack_name),
        developerName     = _("Deka Ironwork Simulations"),
        version           = __DCS_VERSION__,
        info              = _('China Asset Pack is a free add-on for DCS World developed by Deka Ironwork Simulations. It contains many AI aircraft, ground and navy units, as well as weapons that are developed and served in China.'),
        encyclopedia_path = current_mod_path..'/Encyclopedia',
        Skins             = {{ name = pack_name, dir = "Skins/1" }},
        load_immediately  = true,
        binaries          = { 'CAP_AI', 'JF-17_AI' },
    })

    -- models
    mount_vfs_model_path (current_mod_path .. '/Shapes/Weapons')
    mount_vfs_model_path (current_mod_path .. '/Shapes/Navy')
    mount_vfs_model_path (current_mod_path .. '/Shapes/Vehicles')
    mount_vfs_model_path (current_mod_path .. '/Shapes/Static')

    -- textures
    mount_vfs_texture_path (current_mod_path .. '/Textures/Weapons')
    mount_vfs_texture_path (current_mod_path .. '/Textures/Static/')

    -- liveries
    mount_vfs_liveries_path (current_mod_path .. '/Liveries')
    mount_vfs_texture_path(current_mod_path .. "/Skins/1/ME")

    -- loadouts
    dofile(current_mod_path .. '/Entries/Payload.lua')

    -- load aircraft entries
    dofile(current_mod_path .. '/Entries/Aircrafts.lua')
    dofile(current_mod_path .. '/Entries/Tech.lua')

    plugin_done()
end

----------------------------------------------------------------------------------------
-- File by whisky.actual@gmail.com - v.1.2.3  
----------------------------------------------------------------------------------------