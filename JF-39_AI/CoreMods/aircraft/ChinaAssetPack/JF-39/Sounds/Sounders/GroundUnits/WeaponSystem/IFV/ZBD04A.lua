dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

ZBD04A_weapons = weapons:new()

ZBD04A_weapons:addTurret(1)

ZBD04A_weapons:addLauncher(1, 1, automatic_gun_2A72)
ZBD04A_weapons:addLauncher(1, 2, PKT)
ZBD04A_weapons:addLauncher(1, 3, gun_2A70)
ZBD04A_weapons:addLauncher(1, 4, _9M117)

