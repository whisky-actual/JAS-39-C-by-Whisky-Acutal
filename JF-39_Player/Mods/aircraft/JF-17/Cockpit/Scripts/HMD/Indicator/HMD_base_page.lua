dofile(LockOn_Options.common_script_path .. "elements_defs.lua")
dofile(LockOn_Options.common_script_path .. "devices_defs.lua")
dofile(LockOn_Options.script_path .. "HMD/Indicator/HMD_Def.lua")



base = "HMD_Base"



addHMDCircle(nil, nil, nil, nil, hcr.rw, lvl.noclip, {"NVG_STATE"}, {{ctrl.compareNum,0, 0}}, 310, 0, 360, 36, MakeMaterial(nil, {15, 15, 15, 0.15})) --Would like it to be more visible.
addHMDCircle(nil, nil, nil, nil, hcr.incIf, lvl.noclip, nil, nil, 310, 0, 360, 36, matl.mask, true)


addHMDSimple(base, nil, nil, nil, nil, nil, {"DisplaysBooted", "HMD_STATE"}, {{ctrl.compareNum,0, 1}, {ctrl.compareNum,1, 1}})


addHMDCircle("Sphere_Roll", nil, nil, base, nil, nil, {"ROLL_HUD"}, {{ctrl.rotate,0, 1}}, 20, 0, 360, 10, MakeMaterial(nil, {0, 0, 255, 255/2}), true) --The true means it's invis.
addHMDCircle("Sphere_Pitch", nil, {0, 90}, "Sphere_Roll", nil, nil, {"PITCH_HUD"}, {{ctrl.rotate,0, 1}}, 20, 0, 360, 10, MakeMaterial(nil, {0, 255, 0, 255/2}), true)
addHMDCircle("Sphere_Heading", nil, {0, 0, 90}, "Sphere_Pitch", nil, nil, {"HEADING_HUD"}, {{ctrl.rotate,0, math.rad(1)}}, 20, 0, 360, 10, MakeMaterial(nil, {255, 0, 0, 255/2}), true)

--addHMDSimple("HMD_Mounter", nil, {0, -90}, "Sphere_Pitch")
addHMDSimple("HMD_Mounter", nil, {0, -90}, base) --Temporary.



dofile(LockOn_Options.script_path .. "HMD/Indicator/HMD_Indication_Page.lua")