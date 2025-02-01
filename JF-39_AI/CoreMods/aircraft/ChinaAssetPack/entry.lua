local self_ID = 'China Asset Pack by Deka Ironwork Simulations and Eagle Dynamics'
local pack_name = 'China Asset Pack'

declare_plugin(self_ID, {
    installed = true, -- if false that will be place holder , or advertising
    state = 'installed',
    dirName = current_mod_path,
    shortName = pack_name,
    fileMenuName = _(pack_name),
    displayName = _(pack_name),
    developerName = _('Whisky.Actual'),
    version = __DCS_VERSION__,
    info = _('These are mods for the JF-17'),
    encyclopedia_path = current_mod_path .. '/Encyclopedia',
    Skins = {{
        name = pack_name,
        dir = 'Skins/1'
    }},
    load_immediately = true,
    binaries = {'CAP_AI', 'JF-17_AI'}
})
----------------------------------------------------------------------------------------
-- Missiles Configuration
----------------------------------------------------------------------------------------
missile = {}
--[[
----------------------------------------------------------------------------------------
-- PL-5EII (IRAAM )
----------------------------------------------------------------------------------------
 'IR1' for IRIS-T IR AAM
 'IR2' for A-Darter IR AAM
 'IR3' for Python-5 IR AAM
 'IR4' for AIM-9X Sidewinder IR AAM
 'IR5' for AIM-9L Sidewinder IR AAM
 'IR6' for AIM-9M Sidewinder IR AAM
 'IR7' for AIM-132 ASRAAM IR AAM
----------------------------------------------------------------------------------------
-- SD-10 (BVRAAM)
----------------------------------------------------------------------------------------
 'BVR1' for Meteor BVRAAM Active Rdr AAM
 'BVR2' for I-Derby ER BVRAAM Active Rdr AAM
 'BVR3' for AIM-120B AMRAAM Active Rdr AAM
 'BVR4' for AIM-120C-5 AMRAAM Active Rdr AAM
 'BVR5' for AIM-120C-7 AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
-- GB6 (JSOW)
----------------------------------------------------------------------------------------
 'GB6_1'  for AGM-154C - JSOW Unitary BROACH
 'GB6_2'  for 2
 'GB6_3'  for 3
----------------------------------------------------------------------------------------
-- ASM ()
----------------------------------------------------------------------------------------
WIP
----------------------------------------------------------------------------------------
-- LGB
----------------------------------------------------------------------------------------
WIP
]] --
----------------------------------------------------------------------------------------
-- Select one value per missle type. Replace values in the quotation marks
----------------------------------------------------------------------------------------
missile['IRAAM'] = 'IR7'
missile['BVRAAM'] = 'BVR1'

missile['C701_IR'] = 'C701_IR_1'
missile['C701_T'] = 'C701_T_1'
missile['C802AK'] = 'C802AK_1'
missile['CM802AKG'] = 'CM802AKG_2'

missile['TYPE200'] = 'TYPE200_1'

missile['GB6'] = 'GB6_1'
missile['GB6_HE'] = 'GB6_HE_1'
missile['GB6_TSP'] = 'GB6_TSP_1'

missile['LS_6_100'] = 'LS_6_100_1'
missile['LS_6_250'] = 'LS_6_250_1'
missile['LS_6_500'] = 'LS_6_500_1'
----------------------------------------------------------------------------------------
-- JF-39 Files
----------------------------------------------------------------------------------------
-- models
mount_vfs_model_path(current_mod_path .. '/JF-39/Shapes/Aircraft')
mount_vfs_model_path(current_mod_path .. '/JF-39/Shapes/Weapons')

-- textures
mount_vfs_texture_path(current_mod_path .. '/JF-39/ImagesGUI')
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
-- Deka Ironwork Simulations Files
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
-- Below sequence must NOT be changed!!!
---------------------------------------------------------------------------------------- 
-- loadouts
dofile(current_mod_path .. '/JF-39/Payload.lua')
dofile(current_mod_path .. '/JF-39/missile_config.lua')

-- load entries
dofile(current_mod_path .. '/JF-39/Aircrafts.lua')
dofile(current_mod_path .. '/Entries/Tech.lua')
----------------------------------------------------------------------------------------
plugin_done()
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------