dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")

dofile("GroundUnits/WeaponSystem/Tools/_cap_common_sounder.lua")


_054a_weapons = weapons:new()

-- main gun
_054a_weapons:addTurret(1)
_054a_weapons:addLauncher(1, 1, MainGun76)
_054a_weapons:addLauncher(1, 2, MainGun76)

-- HHQ16
for i=6,37 do
    _054a_weapons:addTurret(i)
    _054a_weapons:addLauncher(i, 1, SAM_Hot_Single)
end

-- CIWS
_054a_weapons:addTurret(38)
_054a_weapons:addLauncher(38, 1, CIWS)

_054a_weapons:addTurret(39)
_054a_weapons:addLauncher(39, 1, CIWS)

-- YJ83
for i=40,41 do
    _054a_weapons:addTurret(i)
    _054a_weapons:addLauncher(i, 1, AntiShipMissile)
end
