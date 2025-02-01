local missile_type = 
	{
		['IR1'] = {picture = _('jf39_iris-t.png'),  wstype = 'weapons.missiles.jf39_iris-t', display_name = _('IRIS-T IR AAM'), cx_pil = 0.00057, mass = 87.4},
		['IR2'] = {picture = _('jf39_a-darter.png'),  wstype = 'weapons.missiles.jf39_a-darter', display_name = _('A-Darter IR AAM'), cx_pil = 0.00057, mass = 89.0},
		['IR3'] = {picture = _('jf39_python-5.png'),  wstype = 'weapons.missiles.jf39_python-5', display_name = _('Python-5 IR AAM'), cx_pil = 0.00057, mass = 105.0},
		['IR4'] = {picture = _('us_aim-9x.png'),  wstype = 'weapons.missiles.jf39_aim9-x', display_name = _('AIM-9X Sidewinder IR AAM'), cx_pil = 0.0001, mass = 85.5},
		['IR5'] = {picture = _('us_aim-9l.png'),  wstype = 'weapons.missiles.jf39_aim9-l', display_name = _('AIM-9L Sidewinder IR AAM'), cx_pil = 0.0001, mass = 85.0},
		['IR6'] = {picture = _('us_aim-9l.png'),  wstype = 'weapons.missiles.jf39_aim9-m', display_name = _('AIM-9M Sidewinder IR AAM'), cx_pil = 0.0001, mass = 85.0},
		['IR7'] = {picture = _('jf39_aim-132.png'),  wstype = 'weapons.missiles.jf39_aim-132', display_name = _('AIM-132 ASRAAM IR AAM'), cx_pil = 0.00057, mass = 88.0},

		['BVR1'] = {picture = _('jf39_meteor.png'), wstype = 'weapons.missiles.jf39_meteor', display_name = _('Meteor BVRAAM Active Rdr AAM'), shape = _('jf39_meteor'), cx_pil = 0.00062, mass = 190.0},
		['BVR2'] = {picture = _('jf39_i-derby.png'), wstype = 'weapons.missiles.jf39_i-derby', display_name = _('I-Derby ER BVRAAM Active Rdr AAM'), shape = _('jf39_i-derby'), cx_pil = 0.00059, mass = 118.0},
		['BVR3'] = {picture = _('us_aim-120b.png'), wstype = 'weapons.missiles.jf39_aim-120b', display_name = _('AIM-120B AMRAAM Active Rdr AAM'), shape = _('aim-120b'), cx_pil = 0.00061, mass = 156.0},
		['BVR4'] = {picture = _('us_aim-120c.png'), wstype = 'weapons.missiles.jf39_aim-120c5', display_name = _('AIM-120C-5 AMRAAM Active Rdr AAM'), shape = _('aim-120c'), cx_pil = 0.00061, mass = 161.5},
		['BVR5'] = {picture = _('us_aim-120c.png'), wstype = 'weapons.missiles.jf39_aim-120c7', display_name = _('AIM-120C-7 AMRAAM Active Rdr AAM'), shape = _('aim-120c'), cx_pil = 0.00061, mass = 161.5},
	
		['GB6_1']  = {picture = _('AGM154.png')	  , wstype = 'weapons.missiles.AGM_154A'	  , display_name = _('AGM-154A - JSOW CEB (CBU-type)'), cx_pil = 0.0018, mass = 485},
		['GB6_2']  = {picture = _('bk90.png')	  , wstype = 'weapons.missiles.BK_90'	  , display_name = _('bk90'), shape = _('MUS_JAS_1'), cx_pil = 0.0018, mass = 485},
		['GB6_HE_1']  = {picture = _('AGM154.png') , wstype = 'weapons.missiles.AGM_154B'	  , display_name = _('AGM-154B - JSOW Anti-Armour'), cx_pil = 0.0018, mass = 485},
		--['GB6_TSP_1']  = {picture = _('AGM154.png'), wstype = 'weapons.missiles.AGM_154C'	  , display_name = _('AGM-154C - JSOW Unitary BROACHZZZ'), shape = _('RB15'), cx_pil = 0.0018, mass = 485},
	
		['C701_IR_1']  = {picture = _('agm65.png')	  , wstype = 'weapons.missiles.AGM_65F'	  , display_name = _('AGM-65G IR Guided Missile'), cx_pil = 0.0009765625, mass = 301},
		['C701_T_1']  = {picture = _('agm65.png')	  , wstype = 'weapons.missiles.AGM_65L'	  , display_name = _('AGM-65K TV Guided Missile'), cx_pil = 0.0009765625, mass = 292},
	
		['C802AK_1']  = {picture = _('Rb15.png')	  , wstype = 'weapons.missiles.C_802AK_AS'	  , display_name = _('Rb-15F Programmable Anti-ship Missile'), shape = _('RB15'), cx_pil = 0.0001, mass = 610},
	}


local pylon_mass = 1.0
local pylon_dual_mass = 160.0
----------------------------------------------------------------------------------------
-- GB6
----------------------------------------------------------------------------------------
local function JF39_GB6(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_MISSILES,
        CLSID = 'DIS_GB6',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
		ejectVelocity   = 4,
        Elements = {	
			[1] =
			{
				DrawArgs =
				{
					[1] = {1, 1},
					[2] = {2, 1},
				}, -- end of DrawArgs
				Position  = {0, 0, 0},
				ShapeName = var.shape,
			},
		}, -- end of Elements
    })
end

JF39_GB6(missile['GB6'])
----------------------------------------------------------------------------------------
-- GB6_HE
----------------------------------------------------------------------------------------
local function JF39_GB6_HE(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_MISSILES,
        CLSID = 'DIS_GB6_HE',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
		ejectVelocity   = 4,
        Elements = {	
			[1] =
			{
				DrawArgs =
				{
					[1] = {1, 1},
					[2] = {2, 1},
				}, -- end of DrawArgs
				Position  = {0, 0, 0},
				ShapeName = var.shape,
			},
		}, -- end of Elements
    })
end

JF39_GB6_HE(missile['GB6_HE'])
--[[
----------------------------------------------------------------------------------------
-- GB6_TSP
----------------------------------------------------------------------------------------
local function JF39_GB6_TSP(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_MISSILES,
        CLSID = 'DIS_GB6_TSP',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
		ejectVelocity   = 4,
        Elements = {	
			[1] =
			{
				DrawArgs =
				{
					[1] = {1, 1},
					[2] = {2, 1},
				}, -- end of DrawArgs
				Position  = {0, 0, 0},
				ShapeName = var.shape,
			},
		}, -- end of Elements
    })
end

JF39_GB6_TSP(missile['GB6_TSP'])
]]--
----------------------------------------------------------------------------------------
-- C701_IR
----------------------------------------------------------------------------------------
local function JF39_C701_IR(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_MISSILES,
        CLSID = 'DIS_C-701IR',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
        Elements = {			
            [1] = 
			{
                ShapeName = var.shape,
				Position = {0, 0, 0}
            }
        } -- end of Elements
    })
end

JF39_C701_IR(missile['C701_IR'])
----------------------------------------------------------------------------------------
-- C701_T
----------------------------------------------------------------------------------------
local function JF39_C701_T(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_MISSILES,
        CLSID = 'DIS_C-701T',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
        Elements = {			
            [1] = 
			{
                ShapeName = var.shape,
				Position = {0, 0, 0}
            }
        } -- end of Elements
    })
end

JF39_C701_T(missile['C701_T'])
----------------------------------------------------------------------------------------
-- IRAAM
----------------------------------------------------------------------------------------
local function JF39_PL_5EII(variant)
    local var = missile_type[variant]
    local var_mass = var.mass

    declare_loadout({
        category = CAT_AIR_TO_AIR,
        CLSID = 'DIS_PL-5EII',
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
        Elements = {			
            [1] = 
			{
                ShapeName = var.shape,
				Position = {0, 0, 0}
            },
			[2]	= 
			{
				ShapeName	= 'aero-3b',
				Position = {0, 0, 0},
				IsAdapter 	= true,
			}
        } -- end of Elements
    })
end

JF39_PL_5EII(missile['IRAAM'])
----------------------------------------------------------------------------------------
-- BVRAAM
----------------------------------------------------------------------------------------
local function JF39_SD_10(variant)
	local var = missile_type[variant]
	local var_mass = var.mass
		
	declare_loadout({
		category    = CAT_AIR_TO_AIR,
		CLSID       = 'DIS_SD-10', 
        Picture = var.picture,
        attribute = var.wstype,
        displayName = '1x '.. var.display_name,
        Cx_pil = var.cx_pil,
        Count = 1,
        Weight = var.mass + pylon_mass,
        Elements = {	
			[1] =
			{
				DrawArgs =
				{
					[1] = {1, 1},
					[2] = {2, 1},
				}, -- end of DrawArgs
				Position  = {0, 0, 0},
				ShapeName = var.shape,
			},
		}, -- end of Elements
	})

	declare_loadout({
		category       = CAT_AIR_TO_AIR,
		CLSID          = 'DIS_SD-10_DUAL_L',
		Picture 	   = var.picture,
		wsTypeOfWeapon = var.wstype,
		attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
		displayName    = '2x '.. var.display_name,
		Cx_pil         = var.cx_pil,
		Count          = 2,
		Weight         = 2 * var.mass + pylon_dual_mass,
		Elements = { {
			IsAdapter = true,
			ShapeName = "TER-9A"
		}, {
			ShapeName = var.shape,
			connector_name = "Point03"
		}, {
			ShapeName = var.shape,
			connector_name = "Point02"
        }, {
			ShapeName = var.shape,
			connector_name = "Point01"
		} },
		JettisonSubmunitionOnly = true,
	})

	declare_loadout({
		category       = CAT_AIR_TO_AIR,
		CLSID          = 'DIS_SD-10_DUAL_R',
		Picture 	   = var.picture,
		wsTypeOfWeapon = var.wstype,
		attribute      = {4,4,32,WSTYPE_PLACEHOLDER},
		displayName    = '3x '.. var.display_name,
		Cx_pil         = var.cx_pil,
		Count          = 3,
		Weight         = 3 * var.mass + pylon_dual_mass,
		Elements = { {
			IsAdapter = true,
			ShapeName = "TER-9A"
		}, {
			ShapeName = var.shape,
			connector_name = "Point03"
		}, {
			ShapeName = var.shape,
			connector_name = "Point02"
        }, {
			ShapeName = var.shape,
			connector_name = "Point01"
		} },
		JettisonSubmunitionOnly = true,
	})
	end

JF39_SD_10(missile['BVRAAM'])
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------