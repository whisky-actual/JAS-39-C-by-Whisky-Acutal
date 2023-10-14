
local self_ID  = 'JF-17 by Deka Ironwork Simulations'
local ac_name  = 'JF-17'
local bin_name = 'JF-17_ASM'

dofile(current_mod_path .. '/preload.lua')

declare_plugin(self_ID, {
    installed     = true,
    dirName       = current_mod_path,
    displayName   = _(ac_name),
    shortName     = ac_name,
    fileMenuName  = _(ac_name),
    version       = '1.0.0',
    state         = 'installed',
    developerName = _('Whisky Actual: https://github.com/whisky-actual/Community-JF-39'),
    info          = _('THIS MATERIAL IS NOT MADE OR SUPPORTED BY EAGLE DYNAMICS SA OR DEKA IRONWORKS SIMULATION'),
    binaries      = { bin_name, },
    update_id     = 'DEKA_JF-17',
    InputProfiles = {
        [ac_name] = current_mod_path .. '/Input/JF-17',
    },
    Skins = {
        { name = ac_name, dir = '/Skins/1' },
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
    infoWaitScreen = _('Whisky Actual : JAS-39-C MOD'),
})
-------------------------------------------------------------------------------------
mount_vfs_model_path   (current_mod_path .. '/Cockpit/Shapes')
mount_vfs_texture_path (current_mod_path .. '/Cockpit/Shapes/Textures')
mount_vfs_texture_path (current_mod_path .. '/Cockpit/Shapes/JF-39_Textures')
mount_vfs_texture_path (current_mod_path .. '/Cockpit/Textures/IndicationTextures')
mount_vfs_texture_path (current_mod_path .. '/Cockpit/Textures/JF-39_IndicationTextures')
mount_vfs_liveries_path(current_mod_path .. '/Liveries')
mount_vfs_texture_path (current_mod_path .. '/Skins/1/ME')
-------------------------------------------------------------------------------------
--JF-39 FM
-------------------------------------------------------------------------------------
local MainToNoseWidth = 1.3725 -- two frontwheels = 1.37 mainwheels wide
    
local mainGear = {
    --amortizer_min_length					= 0.0,
    amortizer_max_length					= 0.35, --3D Modell
    amortizer_basic_length					= 0.35, --3D Modell
    amortizer_spring_force_factor			= 4.8e+6, --F16 = 2.1e+7, F15 = 990000.0,(reduce_length)
    amortizer_spring_force_factor_rate		= 3,
    amortizer_static_force					= 1000,
    amortizer_reduce_length					= 0.227, -- damper range of motion in meters
    amortizer_direct_damper_force_factor	= 60000,
    amortizer_back_damper_force_factor		= 20000,
    allowable_hard_contact_length			= 0.1,

    anti_skid_installed = true,

    crossover_locked_wheel_protection			= true,
    crossover_locked_wheel_protection_speed_min	= 18.0,
    anti_skid_improved							= true,
    anti_skid_gain								= 400.0,

    wheel_radius					= 0.3245, 
    wheel_static_friction_factor	= 0.42,
    wheel_glide_friction_factor		= 0.8,
    wheel_side_friction_factor		= 0.95,
    wheel_roll_friction_factor		= 0.067,
    wheel_damage_force_factor		= 200.0, --450.0,
    wheel_brake_moment_max			= 35000.0,
    wheel_kz_factor					= 0.52,
    noise_k							= 0.0,
    wheel_damage_speedX				= 270, --115,
    wheel_damage_delta_speedX		= 22.5, --11.5,
}

jf39_FM = 
{
		[1] = self_ID,
		[2] = bin_name,
    disable_built_in_oxygen_system = true,
    center_of_mass    = {0.25, -0.020, 0.00},
	moment_of_inertia	= {12875.0, 85552.0, 75674.0, -1331.0},--Ix,Iy,Iz,Ixy			-- Ix(roll) = 9496, Iy(pitch) Ix(roll) = 9496, Iy(pitch) 
	
    suspension			= {
       
        
        
        { -- NOSE WHEEL
        damage_element					= 83,
        wheel_axle_offset				= 0.0,
        self_attitude					= false,
        yaw_limit						= math.rad(67.0),	-- Real angle but is it to each side or in total? 33.5
        moment_limit					= 750.0,
        damper_coeff					= 300.0,
        allowable_hard_contact_length	= 0.25,
        filter_yaw						= true,

        amortizer_min_length						= 0.0,
        amortizer_max_length						= 0.424, -- measure 3d model //Panda  0.424
        amortizer_basic_length						= 0.49, -- measure 3d model //Panda 0.49
        amortizer_spring_force_factor				= 1.2e+6,
        amortizer_spring_force_factor_rate			= 3.5,
        amortizer_static_force						= 6000,
        amortizer_reduce_length						= 0.424, -- damper range of motion in meters 0.424
        amortizer_direct_damper_force_factor		= 15000,
        amortizer_back_damper_force_factor			= 15000,
        
        wheel_brake_moment_max			= 8000.0,
        anti_skid_installed							= true,

        wheel_radius								= 0.1845,	
        wheel_static_friction_factor				= 0.35,
        wheel_side_friction_factor					= 1.1, --0.45,
        wheel_roll_friction_factor					= 0.06,
        wheel_glide_friction_factor					= 0.58,
        wheel_damage_force_factor					= 450.0, --450.0,
        wheel_kz_factor								= 0.3,
        noise_k										= 0,
        wheel_damage_speedX							= 270.0, --115,
        wheel_damage_delta_speedX					= 22.5, --11.5,

        arg_post			= 0,
        arg_amortizer		= 1,
        arg_wheel_rotation	= 101,
        arg_wheel_damage	= 134
    },
    { -- LEFT WHEEL
    damage_element					= 84,

    amortizer_max_length						= mainGear.amortizer_max_length,
    amortizer_basic_length						= mainGear.amortizer_basic_length,
    amortizer_spring_force_factor				= mainGear.amortizer_spring_force_factor, --
    amortizer_spring_force_factor_rate			= mainGear.amortizer_spring_force_factor_rate,
    amortizer_static_force						= mainGear.amortizer_static_force,
    amortizer_reduce_length						= mainGear.amortizer_reduce_length,
    amortizer_direct_damper_force_factor		= mainGear.amortizer_direct_damper_force_factor,
    amortizer_back_damper_force_factor			= mainGear.amortizer_back_damper_force_factor,
    allowable_hard_contact_length				= mainGear.allowable_hard_contact_length,

    anti_skid_installed							= mainGear.anti_skid_installed,

    crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
    crossover_locked_wheel_protection_wheel		= 2,
    crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
    anti_skid_improved							= mainGear.anti_skid_improved;
    anti_skid_gain								= mainGear.anti_skid_gain,

    wheel_radius								= mainGear.wheel_radius,
    wheel_static_friction_factor				= mainGear.wheel_static_friction_factor,
    wheel_side_friction_factor					= mainGear.wheel_side_friction_factor,
    wheel_roll_friction_factor					= mainGear.wheel_roll_friction_factor,
    wheel_glide_friction_factor					= mainGear.wheel_glide_friction_factor,
    wheel_damage_force_factor					= mainGear.wheel_damage_force_factor,
    wheel_brake_moment_max						= mainGear.wheel_brake_moment_max,
    wheel_kz_factor								= mainGear.wheel_kz_factor,
    noise_k										= mainGear.noise_k,
    wheel_damage_speedX							= mainGear.wheel_damage_speedX,
    wheel_damage_delta_speedX					= mainGear.wheel_damage_delta_speedX,

    arg_post			= 5,
    arg_amortizer		= 6,
    arg_wheel_rotation	= 102,
    arg_wheel_damage	= 136
},
{  -- RIGHT WHEEL
    damage_element					= 85,

    amortizer_max_length						= mainGear.amortizer_max_length,
    amortizer_basic_length						= mainGear.amortizer_basic_length,
    amortizer_spring_force_factor				= mainGear.amortizer_spring_force_factor, --
    amortizer_spring_force_factor_rate			= mainGear.amortizer_spring_force_factor_rate,
    amortizer_static_force						= mainGear.amortizer_static_force,
    amortizer_reduce_length						= mainGear.amortizer_reduce_length,
    amortizer_direct_damper_force_factor		= mainGear.amortizer_direct_damper_force_factor,
    amortizer_back_damper_force_factor			= mainGear.amortizer_back_damper_force_factor,
    allowable_hard_contact_length				= mainGear.allowable_hard_contact_length,

    anti_skid_installed							= mainGear.anti_skid_installed,

    crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
    crossover_locked_wheel_protection_wheel		= 1,
    crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
    anti_skid_improved							= mainGear.anti_skid_improved;
    anti_skid_gain								= mainGear.anti_skid_gain,

    wheel_radius								= mainGear.wheel_radius,
    wheel_static_friction_factor				= mainGear.wheel_static_friction_factor,
    wheel_side_friction_factor					= mainGear.wheel_side_friction_factor,
    wheel_roll_friction_factor					= mainGear.wheel_roll_friction_factor,
    wheel_glide_friction_factor					= mainGear.wheel_glide_friction_factor,
    wheel_damage_force_factor					= mainGear.wheel_damage_force_factor,
    wheel_brake_moment_max						= mainGear.wheel_brake_moment_max,
    wheel_kz_factor								= mainGear.wheel_kz_factor,
    noise_k										= mainGear.noise_k,
    wheel_damage_speedX							= mainGear.wheel_damage_speedX,
    wheel_damage_delta_speedX					= mainGear.wheel_damage_delta_speedX,

    arg_post			= 3,
    arg_amortizer		= 4,
    arg_wheel_rotation	= 103,
    arg_wheel_damage	= 135
},
    }
}
-------------------------------------------------------------------------------------
dofile(current_mod_path .. '/Views.lua')
make_view_settings(ac_name, ViewSettings, SnapViews)
-------------------------------------------------------------------------------------
make_flyable(ac_name, current_mod_path .. '/Cockpit/Scripts/', jf39_FM, current_mod_path .. '/Comm/comm.lua')
-------------------------------------------------------------------------------------
--jf39 Weapons lua
-------------------------------------------------------------------------------------
--dofile(current_mod_path..'/jf39/Payload.lua')
--is_entry = true
--dofile(current_mod_path..'/jf39/Config.lua')
-------------------------------------------------------------------------------------
plugin_done()
