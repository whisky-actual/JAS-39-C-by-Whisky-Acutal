addHMDSimpleLine("Prif_1_Box", nil, nil, base, hcr.rw, nil, {"Prif_1_ObjNum", "ROLL_RAD", "Prif_1_HMD_AZ", "Prif_1_HMD_EL"}, {{ctrl.inRange,0, -1, 999}, {ctrl.rotate,1, 1}, {ctrl.moveX,2, mult --[[Panda fix?]]}, {ctrl.moveY,3, mult}}, nil, {{-5, 0}, {-5, 5}, {5, 5}, {5, 0}})
addHMDSimpleLine(nil, {0, 0.25}, nil, "Prif_1_Box", hcr.rw, nil, {"Prif_1_Coalition"}, {{ctrl.compareNum,0, 2}}, nil, {{-5, 5}, {0, 10}, {5, 5}})
addHMDSimpleLine(nil, nil, nil, base, nil, nil, {"Prif_1_ObjNum", "Prif_1_HMD_CLAMPED", "ROLL_RAD", "Prif_1_HMD_AZ", "Prif_1_HMD_EL", "Prif_1_Az", "Prif_1_El"}, {{ctrl.inRange,0, -1, 999}, {ctrl.compareNum,1, 1}, {ctrl.rotate,2, 1}, {ctrl.setPoint,0, 3, 4, mult, mult}, {ctrl.setPoint,1, 5, 6, mult, mult}})
addHMDSimple("Prif_1_Offset_Text", nil, nil, "Prif_1_Box", nil, nil, {"Prif_1_HMD_CLAMPED", "ROLL_RAD"}, {{ctrl.compareNum,0, 1}, {ctrl.rotate,1, -1}})
addHMDTextParam(nil, {0, -12.5}, "Prif_1_Offset_Text", hcr.rw, nil, {"SC_TYPE", "PRIF_1_HMD_OFFSET"}, {{ctrl.compareNum,0, 1}, {ctrl.inRange,1, 0, 999}, {ctrl.text,1}}, nil, nil, nil, strdef.half)


for i = 2, 4 do
	i = "Prif_" .. i .. "_"

	addHMDSimpleLine(i .. "Box", nil, nil, base, hcr.rw, nil, {i .. "ObjNum", "ROLL_RAD", i .. "HMD_EL", i .. "HMD_AZ"}, {{ctrl.inRange,0, -1, 999}, {ctrl.rotate,1, 1}, {ctrl.moveY,2, mult}, {ctrl.moveX,3, mult}}, nil, {{-5, 2.5}, {5, 2.5}, {2.5, 2.5}, {2.5, -2.5}, {5, -2.5}, {-5, -2.5}, {-2.5, -2.5}, {-2.5, 2.5}})
	addHMDSimpleLine(nil, {0, 0.25}, nil, i .. "Box", hcr.rw, nil, {i .. "Coalition"}, {{ctrl.compareNum,0, 2}}, nil, {{-5, 5}, {0, 10}, {5, 5}})
	addHMDSimpleLine(nil, nil, nil, base, nil, nil, {i .. "ObjNum", i .. "HMD_CLAMPED", "ROLL_RAD", i .. "HMD_AZ", i .. "HMD_EL", i .. "Az", i .. "El"}, {{ctrl.inRange,0, -1, 999}, {ctrl.compareNum,1, 1}, {ctrl.rotate,2, 1}, {ctrl.setPoint,0, 3, 4, mult, mult}, {ctrl.setPoint,1, 5, 6, mult, mult}})
end


addHMDSimpleLine("IR_Box", nil, nil, base, hcr.rw, nil, {"WEAPONMODE", "ROLL_RAD", "IRHMDX", "IRHMDY"}, {{ctrl.compareNum,0, 2}, {ctrl.rotate,1, 1}, {ctrl.moveX,2, mult}, {ctrl.moveY,3, mult}}, nil, {{-5, 0}, {-3, -6.25}, {3, -6.25}, {5, 0}})
addHMDSimpleLine(nil, nil, nil, base, nil, nil, {"WEAPONMODE", "IRHMDCLAMPED", "ROLL_RAD", "IRHMDX", "IRHMDY", "WS_IR_MISSILE_TARGET_AZIMUTH", "WS_IR_MISSILE_TARGET_ELEVATION"}, {{ctrl.compareNum,0, 2}, {ctrl.compareNum,1, 1}, {ctrl.rotate,2, 1}, {ctrl.setPoint,0, 3, 4, mult, mult}, {ctrl.setPoint,1, 5, 6, mult, mult}})


for ia = 1, 20 do --Fixa paramsen i RWR_init.lua.
	local i = ""
	if ia < 10 then
		i = "RWR_CONTACT_0".. ia .."_"
	else
		i = "RWR_CONTACT_".. ia .."_"
	end

	addHMDSimple("RWR_Contact_" .. ia .. "_Base", nil, nil, base, hcr.rw, nil, {i .. "POWER", "ROLL_RAD", i .. "AZIMUTH_HMD", i .. "ELEVATION"}, {{ctrl.inRange,0, 0, 1.1}, {ctrl.rotate,1, 1}, {ctrl.moveX,2, -mult}, {ctrl.moveY,3, 0}})
	addHMDSimpleLine(nil, nil, nil, "RWR_Contact_" .. ia .. "_Base", nil, nil, {i .. "HMDCLAMPED", "ROLL_RAD", "IRHMDX", "IRHMDY", "WS_IR_MISSILE_TARGET_AZIMUTH", "WS_IR_MISSILE_TARGET_ELEVATION"}, {{ctrl.compareNum,0, 2}, {ctrl.compareNum,1, 1}, {ctrl.rotate,2, 1}, {ctrl.setPoint,0, 3, 4, mult, mult}, {ctrl.setPoint,1, 5, 6, mult, mult}})

	for j = 0, 7 do
		addHMDSimpleLine(nil, nil, {j * 45}, "RWR_Contact_" .. ia .. "_Base", hcr.rw, nil, nil, nil, nil, {{0, 1}, {0, 3.5}})
	end
end







--Trigger X.
for i = 0, 3 do
	addHMDSimpleLine(nil, nil, {45 + i * 90}, base, nil, nil, {"WEAPONMODE", "TRIGGERX"}, {{ctrl.inRange,0, 0, 3}, {ctrl.compareNum,1, 1}}, nil, {{0, 0}, {0, 82.5}})
end


--Aiming cross.
addHMDSimple("Aiming_Cross_Base", nil, nil, base, nil, nil, {"AIMING_CROSS_Y"}, {{ctrl.moveY,0, 0.22}})
for i = 0, 3 do
	addHMDSimpleLine(nil, nil, {45 + i * 90}, "Aiming_Cross_Base", nil, nil, {"MASTERMODE"}, {{ctrl.compareNum,0, 0}}, nil, {{3, 0}, {15, 0}})
end

addHMDText(nil, {0, -30}, base, nil, nil, {"WS_IR_MISSILE_LOCK"}, {{ctrl.compareNum,0, 1}}, "LOCK") --Temporary.
--local Aiming_Circle_Base          = CreateElement "ceMeshPoly"
--Aiming_Circle_Base.name           = create_guid_string()
--Aiming_Circle_Base.primitivetype  = "triangles"
--Aiming_Circle_Base.material       = MakeMaterial(nil, materials["HUD_HMD_GREEN"])
--Aiming_Circle_Base.parent_element = base
--Aiming_Circle_Base.element_params = {"HMD_BRIGHTNESS", "MASTERMODE"}
--Aiming_Circle_Base.controllers    = {{ctrl.opacity,0}, {ctrl.compareNum,1, 4}}
--set_circle(Aiming_Circle_Base, 1, 0, 360, 7)
--Add(Aiming_Circle_Base)
--
--
--

--
--
--
--aimingCircleXRadius = 35 * math.cos(math.rad(90)) --Only one needed???
--aimingCircleYRadius = 35 * math.sin(math.rad(90))
--
--for i = 0, 360, 30 do
--	local Aiming_Circle_Circles    = Copy(Aiming_Circle_Base)
--	Aiming_Circle_Circles.init_pos = {35 * math.cos(math.rad(i + 90)), 35 * math.sin(math.rad(i + 90))}
--	set_circle(Aiming_Circle_Circles, 1, 0, 360, 7)
--	Add(Aiming_Circle_Circles)
--
--
--	if i == 0 then
--		Aiming_Circle_Vertical_Line                = CreateElement "ceSimpleLineObject"
--		Aiming_Circle_Vertical_Line.name           = create_guid_string()
--		Aiming_Circle_Vertical_Line.material       = MakeMaterial(nil, materials["HUD_HMD_GREEN"])
--		Aiming_Circle_Vertical_Line.parent_element = Aiming_Circle_Circles.name
--		Aiming_Circle_Vertical_Line.vertices       = {{0, 14}, {0, 28}}
--		Aiming_Circle_Vertical_Line.width          = 0.75
--		Aiming_Circle_Vertical_Line.element_params = {"HMD_BRIGHTNESS"}
--		Aiming_Circle_Vertical_Line.controllers    = {{ctrl.opacity,0}}
--		Add(Aiming_Circle_Vertical_Line)
--	end
--
--
--	if i == 90 then
--		local Aiming_Circle_Left_Line           = Copy(Aiming_Circle_Vertical_Line)
--		Aiming_Circle_Left_Line.parent_element  = Aiming_Circle_Circles.name
--		Aiming_Circle_Left_Line.vertices        = {{0, 0}, {-7, 0}}
--		Add(Aiming_Circle_Left_Line)
--	end
--
--	if i == 270 then
--		local Aiming_Circle_Right_Line          = Copy(Aiming_Circle_Vertical_Line)
--		Aiming_Circle_Right_Line.parent_element = Aiming_Circle_Circles.name
--		Aiming_Circle_Right_Line.vertices       = {{0, 0}, {7, 0}}
--		Add(Aiming_Circle_Right_Line)
--	end
--end
--
--
--local Aiming_Circle_Min_Range_Mark          = Copy(Aiming_Circle_Vertical_Line)
--Aiming_Circle_Min_Range_Mark.parent_element = Aiming_Circle_Base.name
--Aiming_Circle_Min_Range_Mark.init_rot       = {90}
--Aiming_Circle_Min_Range_Mark.vertices       = {{aimingCircleXRadius, -0.8 + aimingCircleYRadius}, {aimingCircleXRadius, 4.8 + aimingCircleYRadius}, {-2.5 + aimingCircleXRadius, 4.8 + aimingCircleYRadius}}
--Aiming_Circle_Min_Range_Mark.element_params = {"HMD_BRIGHTNESS", "AIMING_CIRCLE_MIN_RANGE"}
--Aiming_Circle_Min_Range_Mark.controllers    = {{ctrl.opacity,0}, {ctrl.rotate,1, 0.01745}}
--Add(Aiming_Circle_Min_Range_Mark)
--
--local Aiming_Circle_Rec_Range_Mark          = Copy(Aiming_Circle_Min_Range_Mark)
--Aiming_Circle_Rec_Range_Mark.parent_element = Aiming_Circle_Base.name
--Aiming_Circle_Rec_Range_Mark.init_rot       = {90}
--Aiming_Circle_Rec_Range_Mark.vertices       = {{aimingCircleXRadius, -0.8 + aimingCircleYRadius}, {aimingCircleXRadius, 4.8 + aimingCircleYRadius}, {2.5 + aimingCircleXRadius, 4.8 + aimingCircleYRadius}, {-2.5 + aimingCircleXRadius, 4.8 + aimingCircleYRadius}}
--Aiming_Circle_Rec_Range_Mark.element_params = {"HMD_BRIGHTNESS", "AIMING_CIRCLE_REC_RANGE"}
--Aiming_Circle_Rec_Range_Mark.controllers    = {{ctrl.opacity,0}, {ctrl.rotate,1, 0.01745}}
--Add(Aiming_Circle_Rec_Range_Mark)
--
--for i = 1, 360, 1 do
--	local Aiming_Range_Range_Circle          = CreateElement "ceMeshPoly"
--	Aiming_Range_Range_Circle.name           = create_guid_string()
--	Aiming_Range_Range_Circle.primitivetype  = "triangles"
--	Aiming_Range_Range_Circle.material       = MakeMaterial(nil, materials["HUD_HMD_GREEN"])
--	Aiming_Range_Range_Circle.parent_element = Aiming_Circle_Base.name
--	Aiming_Range_Range_Circle.init_rot       = {90, 180}
--	Aiming_Range_Range_Circle.element_params = {"HMD_BRIGHTNESS", "AIMING_CIRCLE_CARROT_RANGE"}
--	Aiming_Range_Range_Circle.controllers    = {{ctrl.opacity,0}, {ctrl.inRange,1, (i - 1)/180 , i/180}}
--	set_circle(Aiming_Range_Range_Circle, 35.7, 34.3, i, 25)
--	Add(Aiming_Range_Range_Circle)
--end
--
--local Aiming_Range_Range_Circle_Carrot          = Copy(Aiming_Circle_Min_Range_Mark)
--Aiming_Range_Range_Circle_Carrot.parent_element = Aiming_Circle_Base.name
--Aiming_Range_Range_Circle_Carrot.init_rot       = {90}
--Aiming_Range_Range_Circle_Carrot.vertices       = {{2 + aimingCircleXRadius, -7 + aimingCircleYRadius}, {aimingCircleXRadius, -2.1 + aimingCircleYRadius}, {-2 + aimingCircleXRadius, -7 + aimingCircleYRadius}}
--Aiming_Range_Range_Circle_Carrot.element_params = {"HMD_BRIGHTNESS", "AIMING_CIRCLE_CARROT_RANGE"}
--Aiming_Range_Range_Circle_Carrot.controllers    = {{ctrl.opacity,0}, {ctrl.rotate,1, math.rad(360)/2}}
--Add(Aiming_Range_Range_Circle_Carrot)
--
----local Aiming_Range_Range_Circle_Carrot_IFF          = Copy(Aiming_Circle_Min_Range_Mark) --Fixa!
----Aiming_Range_Range_Circle_Carrot_IFF.vertices       = {{2 + aimingCircleXRadius, -6.5}, {aimingCircleXRadius, 9.1}, {-2 + aimingCircleXRadius, -6.5}} --Kontrollera position.
----Aiming_Range_Range_Circle_Carrot_IFF.parent_element = Aiming_Range_Range_Circle_Carrot.name
----Aiming_Range_Range_Circle_Carrot_IFF.element_params = {"HMD_BRIGHTNESS"}--, "Prif_1_Coalition"}
----Aiming_Range_Range_Circle_Carrot_IFF.controllers    = {{ctrl.opacity,0}}--, {ctrl.compareNum,1, 2}}
----Add(Aiming_Range_Range_Circle_Carrot_IFF)
--

--local Aiming_Circle_SC_RANGE = addTextHMDParam("", 0, -55, Aiming_Circle_Base,  "%.1f")
--for i = 0, 9 do
--	local Aiming_Circle_Weapon_Indicator          = addTextHMDParam("PYLONINFO_" .. i, -25, -70, Aiming_Circle_Base, "%0.4s")
--	Aiming_Circle_Weapon_Indicator.element_params = {"HUD_BRIGHTNESS", "SELECTED_PYLON", "PYLONINFO_" .. i}
--	Aiming_Circle_Weapon_Indicator.controllers    = {{ctrl.opacity,0}, {ctrl.compareNum,1, i}, {ctrl.text,2}}
--end
--local Aiming_Circle_Trigger_Safe = addTextHMD("SAFE", 25, -70, Aiming_Circle_Base)
--local Aiming_Circle_HMD_Search = addTextHMD("HMD", -20, -85, Aiming_Circle_Base)
--local Aiming_Circle_HUD_Search = addTextHMD("HUD", 20, -85, Aiming_Circle_Base)
--local Aiming_Circle_MASK = addTextHMD("MASK", 25, -100, Aiming_Circle_Base)
----local Aiming_Circle_VECT = addTextHMD("VECT", -25, -100, Aiming_Circle_Base) --Don't know yet what it means.
--
--
--
--for ia = 1, 20 do
--	local i = ""
--	if ia < 10 then
--		i = "_0".. ia .."_"
--	else
--		i = "_".. ia .."_"
--	end
--
--	local RWR_Contact_Base          = CreateElement "ceSimple"
--	RWR_Contact_Base.name           = create_guid_string()
--	RWR_Contact_Base.parent_element = base
--	RWR_Contact_Base.element_params = {"RWR_CONTACT" .. i .. "POWER", "ROLL_RAD", "RWR_CONTACT" .. i .. "ELEVATION_HMD", "RWR_CONTACT" .. i .. "AZIMUTH_HMD"}
--	RWR_Contact_Base.controllers    = {{ctrl.inRange,0, 0, 1.1}, {ctrl.rotate,1, 1}, {ctrl.moveY,2, mult}, {ctrl.moveX,3, -mult}}
--	Add(RWR_Contact_Base)
--
--	for j = 0, 7 do
--		local RWR_Contact          = Copy(Attitude_Reference_Stationary_Left_Line)
--		RWR_Contact.init_pos       = {0} --max 225
--		RWR_Contact.init_rot       = {j * 45}
--		RWR_Contact.vertices       = {{0, 1}, {0, 3.5}}
--		RWR_Contact.width          = 0.35
--		RWR_Contact.parent_element = RWR_Contact_Base.name
--		RWR_Contact.element_params = {"HMD_BRIGHTNESS"}
--		RWR_Contact.controllers    = {{ctrl.opacity,0}}
--		Add(RWR_Contact)
--	end
--end
--
--
--
--
----
----local Deacc_Mask               = CreateElement "ceMeshPoly"
----Deacc_Mask.name                = create_guid_string()
----Deacc_Mask.primitivetype       = "triangles"
----Deacc_Mask.material            = TST_G
----Deacc_Mask.parent_element      = HUD_Left_Side_Indication_Base.name
----Deacc_Mask.vertices            = {{-0.003 * Fov2MilRad,0 * Fov2MilRad }, {0.003 * Fov2MilRad,0 * Fov2MilRad}, {-0.003 * Fov2MilRad,0.26 * Fov2MilRad}, {0.003 * Fov2MilRad,0.26 * Fov2MilRad}}
----Deacc_Mask.indices             = {0,1,2, 3,2,1}
----Deacc_Mask.init_pos            = {-0.613 * Fov2MilRad, -0.408 * Fov2MilRad + 7.26413}
----Deacc_Mask.h_clip_relation     = hcr.incIf 
----Deacc_Mask.level               = HUD_DEFAULT_LEVEL
----Deacc_Mask.element_params      = {"DEACC"}
----Deacc_Mask.controllers         = {{ctrl.moveY,0, 0.0001203}}
----Deacc_Mask.isvisible           = false
----Add(Deacc_Mask)
----
----
----local Deacc_indicator          = CreateElement "ceMeshPoly"
----Deacc_indicator.name           = create_guid_string()
----Deacc_indicator.primitivetype  = "triangles"
----Deacc_indicator.material       = MakeMaterial(nil, materials["HUD_HMD_GREEN"])
----Deacc_indicator.parent_element = SpeedScaleArrow.name
----Deacc_indicator.vertices       = {{-0.002 * Fov2MilRad,0 * Fov2MilRad}, {0.002 * Fov2MilRad,0}, {-0.002 * Fov2MilRad,0.186 * Fov2MilRad}, {0.002 * Fov2MilRad,0.186 * Fov2MilRad}}
----Deacc_indicator.indices        = {0,1,2 , 3,2,1}
----Deacc_indicator.init_pos       = {0.201 * Fov2MilRad, -0.0156 * Fov2MilRad}
----Deacc_indicator.init_rot       = {90, 0}
----Deacc_indicator.element_params = {"HUD_BRIGHTNESS"}
----Deacc_indicator.controllers    = {{ctrl.opacity, 0}}
----AddHudElement(Deacc_indicator)
--
----for i = 0, 9 do
----	local Lower_Weapon_Indicator          = addTextHMDParam("PYLONINFO_" .. i, 0, -165, base, "%0.4s")
----	Lower_Weapon_Indicator.element_params = {"HMD_BRIGHTNESS", "SELECTED_PYLON", "PYLONINFO_" .. i}
----	Lower_Weapon_Indicator.controllers    = {{ctrl.opacity,0}, {ctrl.compareNum,1, i}, {ctrl.text,2}}
----end
--
--local Missile_Time_To_Impact_MINS = addTextHMDParam("WPN_TIME_TO_IMPACT", -100, -100, base, "%2.0s")