dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")


_052b_weapons = weapons:new()

-- main gun
_052b_weapons:addTurret(1)
_052b_weapons:addLauncher(1, 1, MainGun76)
_052b_weapons:addLauncher(1, 2, MainGun76)

-- 9M317
_052b_weapons:addTurret(10)
_052b_weapons:addLauncher(10, 1, SAM_Hot_Reload)

_052b_weapons:addTurret(11)
_052b_weapons:addLauncher(11, 1, SAM_Hot_Reload)

-- CIWS
_052b_weapons:addTurret(12)
_052b_weapons:addLauncher(12, 1, CIWS)

_052b_weapons:addTurret(13)
_052b_weapons:addLauncher(13, 1, CIWS)

-- YJ83
for i=14,4 do
    _052b_weapons:addTurret(i)
    _052b_weapons:addLauncher(i, 1, AntiShipMissile)
end