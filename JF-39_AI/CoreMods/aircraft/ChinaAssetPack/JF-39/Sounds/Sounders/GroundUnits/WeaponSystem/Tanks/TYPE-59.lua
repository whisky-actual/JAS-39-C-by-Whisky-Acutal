dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

TYPE59_weapons = weapons:new()

TYPE59_weapons:addTurret(1, "GndTech/TurretRotation_Electric")

TYPE59_weapons:addLauncher(1, 1, tank_gun_105mm) -- AP rounds
TYPE59_weapons:addLauncher(1, 2, tank_gun_105mm) -- HE rounds
TYPE59_weapons:addLauncher(1, 3, PKT) -- coaxial machinegun    

TYPE59_weapons:addTurret(2, "GndTech/SphericalHingeRotation")

TYPE59_weapons:addLauncher(2, 1, machinegun_12_7_utes)
