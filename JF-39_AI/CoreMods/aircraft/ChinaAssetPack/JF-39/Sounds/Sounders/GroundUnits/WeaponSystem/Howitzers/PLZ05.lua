dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

Msta_weapons = weapons:new()

Msta_weapons:addTurret(1)
Msta_weapons:addLauncher(1, 1, howitzer_2A64)

Msta_weapons:addTurret(2, "GndTech/SphericalHingeRotation")

Msta_weapons:addLauncher(2, 1, machinegun_12_7_utes)
