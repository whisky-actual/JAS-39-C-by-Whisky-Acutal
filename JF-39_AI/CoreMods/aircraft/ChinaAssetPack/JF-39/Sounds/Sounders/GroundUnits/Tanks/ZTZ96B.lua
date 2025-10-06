dofile("Tools.lua")

dofile("GroundUnits/Engines/Tanks/MB873KA501.lua")
dofile("GroundUnits/Engines/Environment.lua")

host = ED_AudioAPI.createHost(ED_AudioAPI.ContextWorld, "main")

mb873ka501:init(host)
--- environment
env = environment:newDefault(host)
env.max_speed = 19.44

function env:calculateCommonSoundPitch(value)
    return 0.1083 * value + 0.7
end

function env:calculateCommonSoundGain(value)
    return (value / 12.0) ^ 0.22
end
--- environment

function onUpdate(params)
    updateHost(host, params)
    
    mb873ka501:update(params)
    env:update(params)
end