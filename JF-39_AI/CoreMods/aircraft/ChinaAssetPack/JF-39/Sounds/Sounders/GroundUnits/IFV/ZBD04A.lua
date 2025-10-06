dofile("Tools.lua")

dofile("GroundUnits/Engines/IFV/BMP_engine.lua")
dofile("GroundUnits/Engines/Environment.lua")

host = ED_AudioAPI.createHost(ED_AudioAPI.ContextWorld, "main")

BMP_eng:init(host)

--- environment
env = environment:new()
env.max_speed = 22.0

function env:initNames()
    self.move_common = "GndTech/TankMoveLight"
    self.move_start  = "GndTech/TStartMove"
    self.move_end    = "GndTech/TEndMove"
    self.move_hit    = "Damage/VehHit"
    self.move_water  = "GndTech/GndWaterMove"
end

env:init(host)
--- environment

function onUpdate(params)
    updateHost(host, params)
    
    BMP_eng:update(params)
    env:update(params)
end