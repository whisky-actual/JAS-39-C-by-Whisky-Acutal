dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

HQ7_weapons = weapons:new()

HQ7_weapons:addTurret(1)
HQ7_weapons:addLauncher(1, 1, _9A330)
