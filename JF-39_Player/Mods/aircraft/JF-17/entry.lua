----------------------------------------------------------------------------------------
-- Toggle: Set to true for JF-39, false for JF-17
----------------------------------------------------------------------------------------
JF39 = true   -- <<<< CHANGE HERE
----------------------------------------------------------------------------------------
local self_ID  = 'JF-17 by Deka Ironwork Simulations'
local ac_name  = 'JF-17'
local bin_name = 'JF-17_ASM'

if JF39 == true then
    --------------------------------------------------------------------------
    -- JF-39 Entry
    --------------------------------------------------------------------------
	declare_plugin(self_ID, {
    installed     = true,
    dirName       = current_mod_path,
    displayName   = _(ac_name),
    shortName     = ac_name,
    fileMenuName  = _(ac_name),
    version       = '1.3.0',
    state         = 'installed',
    developerName = _('Whisky Actual: https://github.com/whisky-actual/Community-JF-39'),
    info          = _('THIS MATERIAL IS NOT MADE OR SUPPORTED BY EAGLE DYNAMICS SA OR DEKA IRONWORKS SIMULATION'),
    binaries      = { bin_name, },
    update_id     = 'DEKA_JF-17',
    InputProfiles = {
        --[ac_name] = current_mod_path .. '/JF-39/Input/JF-17',
		[ac_name] = current_mod_path .. '/Input/JF-17',
    },
    Skins = {
        { name = ac_name, dir = '/JF-39/Skins/1' },
    },
    Missions = {
        { name = _(ac_name), dir = 'Missions', CLSID = '{JF-17 missions}', },
    },
    LogBook = {
        { name = _(ac_name), type = ac_name },
    },
    Options =
    {
        {
            name   = _(ac_name),
            nameId = ac_name,
            dir    = '/JF-39/Options',
            CLSID  = '{JF-17 options}',
            --AircraftSettingsFile = 'AircraftSettings.lua'
        },
    },
    preload_resources = preload_files,
    infoWaitScreen = _('Whisky Actual : JAS-39-C MOD'),
})

    ----------------------------------------------------------------------------------------
    -- VFS Paths
    ----------------------------------------------------------------------------------------
    mount_vfs_model_path   (current_mod_path .. '/JF-39/Shapes')
	mount_vfs_texture_path (current_mod_path .. '/JF-39/Shapes/Textures')
	mount_vfs_texture_path (current_mod_path .. '/JF-39/Cockpit/Scripts/JF-39/Textures/Fonts')
	mount_vfs_texture_path (current_mod_path .. '/JF-39/Cockpit/Scripts/JF-39/Textures/Hud')
	mount_vfs_texture_path (current_mod_path .. '/JF-39/Cockpit/Scripts/JF-39/Textures/IndicationTextures')
	mount_vfs_liveries_path(current_mod_path .. '/JF-39/Liveries')
	mount_vfs_texture_path (current_mod_path .. '/JF-39/Skins/1/ME')
		
    ----------------------------------------------------------------------------------------
    -- FM, Views, Flyable
    ----------------------------------------------------------------------------------------
	local cfg_path = current_mod_path .. '/JF-39/FM/config.lua'
    dofile(cfg_path)
    
    JF39_FM[1]           = self_ID
	JF39_FM[2]           = bin_name
	JF39_FM.config_path  = cfg_path
	JF39_FM.user_options = ac_name
    
	dofile(current_mod_path .. '/JF-39/Views.lua')
    make_view_settings(ac_name, ViewSettings, SnapViews)
	
	make_flyable(ac_name, current_mod_path .. '/JF-39/Cockpit/Scripts/', JF39_FM, current_mod_path .. '/JF-39/Comm/comm.lua')

    plugin_done()

else
    --------------------------------------------------------------------------
    -- JF-17 Entry (Vanilla)
    --------------------------------------------------------------------------
	declare_plugin(self_ID, {
    installed     = true,
    dirName       = current_mod_path,
    displayName   = _(ac_name),
    shortName     = ac_name,
    fileMenuName  = _(ac_name),
    version       = "EA",
    state         = 'installed',
    developerName = _('Deka Ironwork Simulations'),
    info          = _("JF-17 is a single seat, single engine, multirole light fighter that joint developed by AVIC Chengdu and Pakistan Aeronautical Complex (PAC). The design phase of JF-17 'Thunder' finished on May 31st, 2002, and the maiden flight was made on August 25th, 2003. 'Thunder' has a bubble canopy of great view, pretty strake-wing layout and advanced avionics. KLJ-7 radar provides excellent air to ground capability. WMD-7 targeting pod can help 'Thunder' searching for targets in combat. Although 'Thunder' has small size, remember that: she is one of the most advanced fighter jets in the DCS World."),
    binaries      = { bin_name, },
    update_id     = 'DEKA_JF-17',
    InputProfiles = {
        [ac_name] = current_mod_path .. '/Input/JF-17',
    },
    Skins = {
        { name = ac_name, dir = 'Skins/1' },
    },
    Missions = {
        { name = _(ac_name), dir = 'Missions', CLSID = '{JF-17 missions}', },
    },
    LogBook = {
        { name = _(ac_name), type = ac_name },
    },
    Options =
    {
        {
            name   = _(ac_name),
            nameId = ac_name,
            dir    = 'Options',
            CLSID  = '{JF-17 options}',
            --AircraftSettingsFile = 'AircraftSettings.lua'
        },
    },
    preload_resources = preload_files,
    infoWaitScreen = _('DCS: JF-17 by Deka Ironwork Simulations.'),
})

    ----------------------------------------------------------------------------------------
    -- VFS Paths
    ----------------------------------------------------------------------------------------
	mount_vfs_model_path   (current_mod_path .. '/Cockpit/Shapes')
	mount_vfs_texture_path (current_mod_path .. '/Cockpit/Shapes/Textures')
	mount_vfs_texture_path (current_mod_path .. '/Cockpit/Textures/IndicationTextures')
	mount_vfs_liveries_path(current_mod_path .. '/Liveries')
	mount_vfs_texture_path (current_mod_path .. '/Skins/1/ME')

    ----------------------------------------------------------------------------------------
    -- Config, Flyable
    ----------------------------------------------------------------------------------------
    local cfg_path = current_mod_path .. '/FM/config.lua'
    dofile(cfg_path)
	
    JF17_FM[1]           = self_ID
	JF17_FM[2]           = bin_name
	JF17_FM.config_path  = cfg_path
	JF17_FM.user_options = ac_name
	
	dofile(current_mod_path .. '/Views.lua')
    make_view_settings(ac_name, ViewSettings, SnapViews)
	
    make_flyable(ac_name, current_mod_path .. '/Cockpit/Scripts/', JF17_FM, current_mod_path .. '/Comm/comm.lua')

    plugin_done()
end
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------