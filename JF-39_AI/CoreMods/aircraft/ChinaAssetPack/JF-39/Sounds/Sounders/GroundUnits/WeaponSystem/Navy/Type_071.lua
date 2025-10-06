dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")


_071_weapons = weapons:new()

-- main gun
_071_weapons:addTurret(5)
_071_weapons:addLauncher(5, 1, MainGun76)

-- ciws
for i=6,9 do
    _071_weapons:addTurret(i)
    _071_weapons:addLauncher(i, 1, CIWS)
end
