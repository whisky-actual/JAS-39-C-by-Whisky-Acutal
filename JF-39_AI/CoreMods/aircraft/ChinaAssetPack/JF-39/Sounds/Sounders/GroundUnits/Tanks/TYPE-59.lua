dofile("Tools.lua")

dofile("GroundUnits/Engines/Tanks/V55.lua")
dofile("GroundUnits/Engines/Environment.lua")

host = ED_AudioAPI.createHost(ED_AudioAPI.ContextWorld, "main")

v55:init(host)
--- environment
env = environment:newDefault(host)
env.max_speed = 12.0
--- environment

function onUpdate(params)
    updateHost(host, params)
    
    v55:update(params)
    env:update(params)
end