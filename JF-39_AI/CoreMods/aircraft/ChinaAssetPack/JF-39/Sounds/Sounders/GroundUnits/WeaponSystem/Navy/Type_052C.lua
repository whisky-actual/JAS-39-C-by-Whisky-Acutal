dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")


_052c_weapons = weapons:new()

-- main gun
_052c_weapons:addTurret(1)
_052c_weapons:addLauncher(1, 1, MainGun100)
_052c_weapons:addLauncher(1, 2, MainGun100)

-- HHQ9
_052c_weapons:addTurret(10)
_052c_weapons:addLauncher(10, 1, SAM_Cold_Single)
_052c_weapons:addTurret(11)
_052c_weapons:addLauncher(11, 1, SAM_Cold_Single)

-- CIWS
_052c_weapons:addTurret(12)
_052c_weapons:addLauncher(12, 1, CIWS)

_052c_weapons:addTurret(13)
_052c_weapons:addLauncher(13, 1, CIWS)

-- YJ62
_052c_weapons:addTurret(14)
_052c_weapons:addLauncher(14, 1, AntiShipMissile)
_052c_weapons:addTurret(15)
_052c_weapons:addLauncher(15, 1, AntiShipMissile)
