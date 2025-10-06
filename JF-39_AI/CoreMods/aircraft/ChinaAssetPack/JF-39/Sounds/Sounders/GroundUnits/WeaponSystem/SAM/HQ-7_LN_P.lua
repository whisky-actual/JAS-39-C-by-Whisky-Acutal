dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/MissileSounds.lua")

HQ7_weapons_p = weapons:new()

HQ7_weapons_p:addTurret(1)
HQ7_weapons_p:addLauncher(1, 1, _9A330)
