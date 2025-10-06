dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

ZTZ96A_weapons = weapons:new()

ZTZ96A_weapons:addTurret(1, "GndTech/TurretRotation_Electric")

ZTZ96A_weapons:addLauncher(1, 1, tank_gun_2A46) -- AP rounds
ZTZ96A_weapons:addLauncher(1, 2, tank_gun_2A46) -- HE rounds
ZTZ96A_weapons:addLauncher(1, 3, Reflex) -- ATGM rounds
ZTZ96A_weapons:addLauncher(1, 4, PKT) -- coaxial machinegun    

ZTZ96A_weapons:addTurret(2, "GndTech/SphericalHingeRotation")

ZTZ96A_weapons:addLauncher(2, 1, machinegun_12_7_utes)