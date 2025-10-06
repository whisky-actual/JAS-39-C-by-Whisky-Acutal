dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")


_093_weapons = weapons:new()

-- YU-6
_093_weapons:addTurret(1)
_093_weapons:addLauncher(1, 1, TorpedoLaunch)

-- YJ-82
_093_weapons:addLauncher(2, 1, AntiShipMissile)
