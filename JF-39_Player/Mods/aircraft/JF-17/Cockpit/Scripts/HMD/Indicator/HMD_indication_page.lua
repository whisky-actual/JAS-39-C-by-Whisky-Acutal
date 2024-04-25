addHMDCircle("Next_WP", nil, {90}, base, hcr.rw, nil, {"NEXT_WP_RANGE", "ROLL_RAD", "NEXT_WP_HMD_Az", "NEXT_WP_HMD_El"}, {{ctrl.inRange,0, 0, 999}, {ctrl.rotate,1, 1}, {ctrl.moveY,2, mult}, {ctrl.moveX,3, mult}}, 5, 4, 180, 8)
addHMDSimpleLine(nil, nil, nil, base, nil, nil, {"NEXT_WP_RANGE", "NEXT_WP_HMD_CLAMPED", "ROLL_RAD", "NEXT_WP_HMD_Az", "NEXT_WP_HMD_El", "NEXT_WP_Az", "NEXT_WP_El"}, {{ctrl.inRange,0, 0, 999}, {ctrl.compareNum,1, 1}, {ctrl.rotate,2, 1}, {ctrl.setPoint,0, 3, 4, -mult, mult}, {ctrl.setPoint,1, 5, 6, -mult, mult}})
addHMDSimple("Next_WP_Offset_Text", nil, {-90}, "Next_WP", nil, nil, {"NEXT_WP_HMD_CLAMPED", "ROLL_RAD"}, {{ctrl.compareNum,0, 1}, {ctrl.rotate,1, -1}})
addHMDTextParam(nil, {0, -12.5}, "Next_WP_Offset_Text", hcr.rw, nil, {"SC_TYPE", "NEXT_WP_HMD_OFFSET"}, {{ctrl.compareNum,0, 2}, {ctrl.inRange,1, 0, 999}, {ctrl.text,1}}, nil, nil, nil, strdef.half)



addHMDText("AoA", {-140.5, 55.5}, base, nil, nil, nil, nil, "@", nil, strdef.alpha)
addHMDTextParam(nil, {6, -8}, "AoA", nil, nil, nil, nil, "CUR_AOA", align.LB)


addHMDSimpleLine(nil, {-83}, nil, base, nil, nil, {"HUD_DECLUTT"}, {{ctrl.compareNum,0, 0}}, nil, {{-15, 4.1}, {0, 0}, {-15, -4.1}})
addHMDTextParam(nil, {-112}, base, nil, nil, nil, nil, "SPEED_KCAS")


addHMDText(nil, {-121, 12}, base, nil, nil, {"AUTOTHROTTLE_ONOFF"}, {{ctrl.compareNum,0, 1}}, "AT")

local ATMode12 = addHMDText(nil, {-107.24, 12}, base, nil, nil, {"AUTOTHROTTLE_MODE"}, {{ctrl.compareNum,0, 0.5}}, "12")
copyHMDElement(ATMode12, {"controllers", "value"}, {{{ctrl.compareNum,0, 1}, {ctrl.opacity,1}}, "14"})


addHMDText("Mach", {-134, -13}, base, nil, nil, {"MACH_B", "HUD_DECLUTT"}, {{ctrl.inRange,0, 1, 999}, {ctrl.compareNum,1, 0}}, "M")
addHMDTextParam(nil, {5.14, 0}, "Mach", nil, nil, {"MACH_A", "HMD_BRIGHTNESS"}, {{ctrl.inRange,0, 0.995, 9}, {ctrl.text,0}, {ctrl.opacity,1}}, nil, align.LC, {"%.2f"})
addHMDText(nil, {14.5}, "Mach", nil, nil, {"MACH_B"}, {{ctrl.inRange,0, 1, 199.5}}, ".")
addHMDTextParam(nil, {17}, "Mach", nil, nil, {"MACH_B", "HMD_BRIGHTNESS"}, {{ctrl.inRange,0, 1, 99.5}, {ctrl.text,0}, {ctrl.opacity,1}}, nil, align.LC, {"%.0f"})


addHMDText("GS", {-133, -26}, base, nil, nil, {"MASTERMODE", "CURRENT_PHASE", "HUD_DECLUTT"}, {{ctrl.compareNum,0, 0}, {ctrl.inRange,1, 6.9, 9.9}, {ctrl.compareNum,2, 0}}, "GS")
addHMDTextParam(nil, {20}, "GS", nil, nil, nil, nil, "CURR_GS")



addHMDSimpleLine(nil, {107}, nil, base, nil, nil, {"DECLUTT_ALT"}, {{ctrl.compareNum,0, 0}}, nil, {{-15, 4.1}, {0, 0}, {-15, -4.1}})
--\/==ALTITUDE TAPE HERE==\/ Panda pls make the alt tape.

--/\==ALTITUDE TAPE HERE==/\


local decluttAltInd = addHMDText(nil, {130, 15}, base, nil, nil, {"DECLUTT_ALT", "ALTITUDE_MODE"}, {{ctrl.compareNum,0, 1}, {ctrl.compareNum,1, 1}}, "A")
local dA            = addHMDTextParam(nil, {0, -15}, decluttAltInd, nil, nil, nil, nil, "ALTITUDE_BARO")

copyHMDElement(decluttAltInd, {"name", "value", "controllers",}, {"Declutt_Ralt", "RA", {{ctrl.compareNum,0, 1}, {ctrl.compareNum,1, 2}, {ctrl.opacity,2}}})
copyHMDElement(dA, {"parent_element", "element_params"}, {"Declutt_Ralt", {"ALTITUDE_RALT"}})



addHMDSimpleLine("Range_Stick", {0, -85}, nil, base, nil, nil, {"SC_RANGE"}, {{ctrl.inRange,0, -1, 999}}, nil, {{-45, 5}, {-45, -5}, {-45}, {0}, {0, 3}, {0}, {45}}) --Currently only shows range to W2 or prif1.
addHMDSimpleLine(nil, nil, nil, "Range_Stick", nil, nil, {"SC_TYPE"}, {{ctrl.compareNum,0, 1}}, nil, {{-45.5, 4.5}, {-51, 4.5}, {-51, -4.5}, {-45.5, -4.5}})

addHMDSimpleLine("RS_Caret", {-45, -0.5}, nil, "Range_Stick", nil, nil, {"RANGE_STICK_CARET"}, {{ctrl.moveX,0, 0.0664}}, nil, {{-4, 10}, {0, 1.8}, {4, 10}})
addHMDSimpleLine(nil, {0, -0.3}, nil, "RS_Caret", nil, nil, {"Prif_1_Coalition"}, {{ctrl.compareNum,0, 2}}, nil, {{-4, 10}, {0, 17.2}, {4, 10}})
--local RSCaret30s = addHMDSimpleLine(nil, nil, nil, "RS_Caret", nil, nil, {"CRANGEIN30S", "ONE"}, {{ctrl.setPoint,0, 0, 1, 0.0664, 0.007023}}, nil, {{0, 9.5}, {-3.5, 9.5}}) --Fix time.
--copyHMDElement(RSCaret30s, {"element_params", "vertices"}, {{"NCRANGEIN30S", "ONE"}, {{0, 9.5}, {3.5, 9.5}}})

addHMDTextParam(nil, {45, -10}, "Range_Stick", nil, nil, nil, nil, "RANGE_STICK_SCALE", align.RC)
addHMDText("RS_Range", {-13.5, -10}, "Range_Stick", nil, nil, {"SC_TYPE"}, {{ctrl.compareNum,0, 1}}, "R")
local RSRunder10 = addHMDTextParam(nil, {16}, "RS_Range", nil, nil, {"SC_RANGE", "HMD_BRIGHTNESS"}, {{ctrl.inRange,0, 0, 9.9}, {ctrl.text,0}, {ctrl.opacity,1}}, nil, align.RR, {"%.1f"})
copyHMDElement(RSRunder10, {"init_pos", "formats", "controllers"}, {{12.3}, {"%.0f"}, {{ctrl.inRange,0, 9.9, 999}, {ctrl.text,0}, {ctrl.opacity,1}}})



addHMDSimple("Status_Bar", {0, -166}, nil, base, nil, nil, {"PULLUPQUE"}, {{ctrl.inRange,0, -1, 999999}})


addHMDText("WP_Range_Ind", {-21, 0}, "Status_Bar", nil, nil, {"NEXT_WP_RANGE"}, {{ctrl.inRange,0, 0, 999}}, "R")
local WPRUnder10 = addHMDTextParam(nil, {16}, "WP_Range_Ind", nil, nil, {"NEXT_WP_RANGE", "HMD_BRIGHTNESS"}, {{ctrl.inRange,0, 0, 9.9}, {ctrl.text,0}, {ctrl.opacity,1}}, nil, align.RR, {"%.1f"})
copyHMDElement(WPRUnder10, {"init_pos", "formats", "controllers"}, {{12.3}, {"%.0f"}, {{ctrl.inRange,0, 9.9, 999}, {ctrl.text,0}, {ctrl.opacity,1}}})



local GCWY = 180
addHMDSimple("GCW_Base", nil, nil, base, nil, nil, {"ROLL_RAD", "CURRENT_PHASE_STATIONARY", "CURRENT_PHASE_PARKED", "CURRENT_PHASE_TAXI", "CURRENT_PHASE_TGR", "CURRENT_PHASE_ROT", "CURRENT_PHASE_LR"}, {{ctrl.rotate,0, 1}, {ctrl.compareNum,1, 0}, {ctrl.compareNum,2, 0}, {ctrl.compareNum,3, 0}, {ctrl.compareNum,4, 0}, {ctrl.compareNum,5, 0}, {ctrl.compareNum,6, 0}})

local GCWLL = addHMDSimpleLine(nil, nil, nil, "GCW_Base", nil, nil, {"PULLUPQUE", "PULLMORE"}, {{ctrl.inRange,0, -10000, 0}, {ctrl.inRange,1, -0.99, 0.5}}, nil, {{-52, 40 - GCWY}, {-52, 0 - GCWY}, {-32.17, 0 - GCWY}})
copyHMDElement(GCWLL, {"vertices"}, {{{-46, 40 - GCWY}, {-46, 2.8 - GCWY}, {-32.17, 2.8 - GCWY}}})
copyHMDElement(GCWLL, {"vertices"}, {{{11.25, 2.8 - GCWY}, {-11.25, 2.8 - GCWY}}})
copyHMDElement(GCWLL, {"vertices"}, {{{11.25, 0 - GCWY}, {-11.25, 0 - GCWY}}})
copyHMDElement(GCWLL, {"vertices"}, {{{46, 40 - GCWY}, {46, 2.8 - GCWY}, {32.17, 2.8 - GCWY}}})
copyHMDElement(GCWLL, {"vertices"}, {{{52, 40 - GCWY}, {52, 0 - GCWY}, {32.17, 0 - GCWY}}})

local GCWLArrow = copyHMDElement(GCWLL, {"init_pos", "vertices", "controllers"}, {{0, -2}, {{-54.5, 35 - GCWY}, {-49, 50 - GCWY}, {-43.5, 35 - GCWY}, {-54.5, 35 - GCWY}}, {{ctrl.inRange,0, -10000, 0}, {ctrl.moveY,0, -0.00001}, {ctrl.inRange,1, -0.99, 0.5}, {ctrl.opacity,2}}})
copyHMDElement(GCWLArrow, {"vertices"}, {{{54.5, 35 - GCWY}, {49, 50 - GCWY}, {43.5, 35 - GCWY}, {54.5, 35 - GCWY}}})



local aILeftLine = addHMDSimpleLine(nil, {-attIndRadius}, nil, base, nil, nil, nil, nil, nil, {{-18, 0}, {-6, 0}})
copyHMDElement(aILeftLine, {"init_pos", "vertices"}, {{attIndRadius}, {{6, 0}, {18, 0}}})


addHMDSimpleLine(nil, nil, nil, base, nil, nil, {"ROLL_RAD"}, {{ctrl.rotate,0, 1}}, nil, {{-4, -attIndRadius + 8.1}, {0, -attIndRadius + 0.6}, {4, -attIndRadius + 8.1}})


local attIndBase = addHMDSimple(nil, nil, nil, base, nil, nil, {"ROLL_RAD"}, {{ctrl.rotate,0, 1}})
copyHMDElement(attIndBase, {"name"}, {"Att_Ind_Base2"})

local aIMaskRight = addHMDCircle(nil, nil, {-180}, attIndBase, hcr.rw, lvl.alt, {"HMD_PITCH"}, {{ctrl.rotate,0, math.rad(1)}}, attIndRadius + 1.5, attIndRadius, 180, 18, matl.mask, true)
local aIR         = addHMDCircle(nil, nil, nil, "Att_Ind_Base2", hcr.cmp, lvl.alt, nil, nil, attIndRadius + 1.5, attIndRadius, 180, 18, matl.mG)

copyHMDElement(aIMaskRight, {"init_rot", "parent_element", "level", "controllers"}, {{0}, "Att_Ind_Base2", lvl.alt2, {{ctrl.rotate,0, -math.rad(1)}}})
copyHMDElement(aIR, {"init_rot", "level"}, {{180}, lvl.alt2})


copyHMDElement(aILeftLine, {"init_pos", "vertices"}, {{0, -attIndRadius}, {{-4, -10}, {0, -2.5}, {4, -10}}})



dofile(LockOn_Options.script_path .. "HMD/Indicator/HMD_Tac_Page.lua")