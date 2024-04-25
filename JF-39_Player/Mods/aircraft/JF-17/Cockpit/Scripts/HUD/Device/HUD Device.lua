dofile(LockOn_Options.script_path .. "command_defs.lua")
dofile(LockOn_Options.script_path .. "devices.lua")
dev = GetSelf()
local update_time_step = 0.006 --update will be called 166 times per second
make_default_activity(update_time_step)
local sensor_data = get_base_data()

-- Conversions

local RAD_TO_DEGREE  = 57.29577951308233


--hud indicator params
HUD_CUR_AOA          = get_param_handle("CUR_AOA")
local CURR_IAS       = get_param_handle("CURR_IAS")	--Airspeed.
local speedTimeCounter = 0.3
local CURR_GS        = get_param_handle("CURR_GS")
local MACH_A   	     = get_param_handle("MACH_A")
local MACH_B         = get_param_handle("MACH_B")
local TransonicLower = get_param_handle("TransonicLower")
local TransonicUpper = get_param_handle("TransonicUpper")

get_param_handle("ONE"):set(1)

local HUD_MACH = 0

local IAS = 0
local GS = 0
local ACC   = get_param_handle("ACC")
local DEACC = get_param_handle("DEACC")
local OverSpeedBlink  = 0
local UnderSpeedBlink = 0
get_param_handle("ROTATE_SPEED"):set(128)

local Landing_Mode_Mov = 0
-- Direction related params

local PITCH_HUD  = get_param_handle("PITCH_HUD")

local ROLL_HUD  = get_param_handle("ROLL_HUD")

local HEADING_HUD = get_param_handle("HEADING_HUD")
local HEADING_MODE = get_param_handle("HEADING_MODE")

local RALTITUDE_HUD = get_param_handle("RALTITUDE_HUD")
local ALT_77 = get_param_handle("ALT_77")
local ALTITUDE_HUD = get_param_handle("ALTITUDE_HUD")
local TEXT_RALT     = get_param_handle("TEXT_RALT")
local TEXT_ALT     = get_param_handle("TEXT_ALT")


local VELVEC_HUD_Y  = get_param_handle("VELVEC_HUD_Y")
local VELVEC_HUD_X  = get_param_handle("VELVEC_HUD_X")

local VV_LimitedLower = get_param_handle("VV_LimitedLower")
local VV_LimitedUpper = get_param_handle("VV_LimitedUpper")

local HUD_DECLUTT = get_param_handle("HUD_DECLUTT")

get_param_handle("HUD_PULLUPQUE"):set(101)

-- System indications
local AT = get_param_handle("AUTOTHROTTLE_ONOFF")
AT:set(0)	-- 0 = off 1 = on
local AT_MODE = get_param_handle("AUTOTHROTTLE_MODE")
AT_MODE:set(0)	-- 0 = off, 0.5 = 12, 1 = 14

local Autothrottle_mode = 12

local ALT_HOLD = get_param_handle("ALT_HOLD")
local GPS_ALTITUDE_FEET = get_param_handle("GPS_ALTITUDE_FEET")

local PreviousIAS = 0


dev:listen_command(Keys.S1_Trigger)
dev:listen_command(Keys.Trigger)

dev:listen_command(Keys.HUDDeclutt)


dev:listen_command(10064) -- Toggle autothrottle
dev:listen_command(10065) -- Toggle AoA 12/14

dev:listen_command(389) -- on Alt hold
dev:listen_command(408) -- off Alt hold


function SetCommand(command,value)
	--Auto throttle			
	if command == 10064 then
		if AT:get() == 1 then
			AT:set(0)
		else
			AT:set(1)
		end
	elseif command == 10065 then
		if Autothrottle_mode == 12  then
			Autothrottle_mode = 14
		else
			Autothrottle_mode = 12
		end
	end
	
	--Autopilot
	if command == 389 then
		ALT_HOLD:set(1)
	end	
	if command == 408 then
		ALT_HOLD:set(0)
	end

	--HUD_DECLUTT
	if command == Keys.HUDDeclutt and HUD_DECLUTT:get() == 0 then
		HUD_DECLUTT:set(1)
	elseif command == Keys.HUDDeclutt and HUD_DECLUTT:get() == 1 then
		HUD_DECLUTT:set(0)
	end
end	

function update()
	if get_param_handle("MASTERMODE"):get() ~= 0 or HUD_DECLUTT:get() == 1 then
		get_param_handle("DECLUTT_ALT"):set(1)
	else
		get_param_handle("DECLUTT_ALT"):set(0)
	end


	--get_param_handle("RADAR_STT_RANGE_NM"):set(get_param_handle("RADAR_STT_RANGE"):get() * 0.00053)
	--if get_param_handle("RADAR_STT_RANGE_NM"):get() / 1.35 > 2 then
	--	get_param_handle("RADAR_STT_RANGE_CARROT_RANGE"):set(2)
	--else
	--	get_param_handle("RADAR_STT_RANGE_CARROT_RANGE"):set(get_param_handle("RADAR_STT_RANGE_NM"):get() / 1.35)
	--end



	if get_param_handle("LANDING_MODE"):get() == 1 then
		if get_param_handle("GLIDE_SLOPE_MOVE"):get() <= math.rad(-2.86) then
			get_param_handle("GLIDE_SLOPE_MOVE"):set(math.rad(-2.86))
		else
			get_param_handle("GLIDE_SLOPE_MOVE"):set(get_param_handle("GLIDE_SLOPE_MOVE"):get() - (update_time_step * math.rad(2.86) / 5))
		end
	else
		get_param_handle("GLIDE_SLOPE_MOVE"):set(0)
	end

	local Hud_Ralt = sensor_data.getRadarAltitude() * 3.2808399

	local VerticalSpeed     = sensor_data.getVerticalVelocity() * 3.2808399
	local BarometricAltFeet = (sensor_data.getBarometricAltitude() * 3.2808399)
	TEXT_ALT:set(math.floor(BarometricAltFeet / 10) * 10)
	TEXT_RALT:set(math.floor(Hud_Ralt / 10) * 10)

	get_param_handle("ROLL_RAD"):set(sensor_data.getRoll())
	ROLL_HUD:set(sensor_data.getRoll())

	PITCH_HUD:set(sensor_data.getPitch())


	local VelVec_x = get_param_handle("Efm_BetaAngle"):get()
	local VelVec_y = -get_param_handle("FilteredAOA"):get()


	if get_param_handle("CURRENT_PHASE_STATIONARY"):get() == 1 or get_param_handle("CURRENT_PHASE_PARKED"):get() == 1 or get_param_handle("CURRENT_PHASE_TAXI"):get() == 1 or get_param_handle("CURRENT_PHASE_TGR"):get() == 1 or get_param_handle("CURRENT_PHASE_LR"):get() == 1 then
		get_param_handle("HudSidesAOA"):set((VelVec_y - 0.06) + ((get_param_handle("HUD_VELVEC_VER_LINE_POS"):get() * 14) * 0.001) - 0.014) --((get_param_handle("HUD_VELVEC_VER_LINE_POS"):get() * 14) * 0.001) - 0.084
		get_param_handle("HudSidesAOS"):set(0)
		if VelVec_y - 0.06 < -0.225 then
			VELVEC_HUD_Y:set(-0.225)
		else
			VELVEC_HUD_Y:set(VelVec_y - 0.06)
		end
		VELVEC_HUD_X:set(0)
		VV_LimitedLower:set(1)
	elseif get_param_handle("CURRENT_PHASE_ROT"):get() == 1 then
		if VelVec_y - 0.06 < -0.225 then
			get_param_handle("HudSidesAOA"):set(-0.225)
		elseif VelVec_y > -0.005 then
			get_param_handle("HudSidesAOA"):set(-0.005)
		else
			get_param_handle("HudSidesAOA"):set((VelVec_y - 0.06) + ((get_param_handle("HUD_VELVEC_VER_LINE_POS"):get() * 14) * 0.001) - 0.014)
		end
		get_param_handle("HudSidesAOS"):set(0)
		if VelVec_y - 0.06 < -0.225 then
			VELVEC_HUD_Y:set(-0.225) --8aoa ska det vara.
		else
			VELVEC_HUD_Y:set(VelVec_y - 0.06)
		end
		VELVEC_HUD_X:set(0)
	else
		if HUD_CUR_AOA:get() >= 12.5 then --idk what I did here.
			VV_LimitedLower:set(1)
			VELVEC_HUD_Y:set(math.rad(-12.5))
			get_param_handle("HudSidesAOA"):set(math.rad(-12.5))
		elseif HUD_CUR_AOA:get() <= -4.5 then
			VV_LimitedUpper:set(1)
			VELVEC_HUD_Y:set(math.rad(4.5))
		else
			VV_LimitedLower:set(0)
			VV_LimitedUpper:set(0)
			VELVEC_HUD_Y:set(VelVec_y)
			get_param_handle("HudSidesAOA"):set(VelVec_y)
		end
		if VelVec_x <= -0.16 then
			VELVEC_HUD_X:set(-0.16)
		elseif VelVec_x >= 0.16 then
			VELVEC_HUD_X:set(0.16)
		else
			VELVEC_HUD_X:set(VelVec_x)
		end



		if VelVec_y >= -0.036 then
			if VelVec_x < 0 then
				if VelVec_x < (-0.06 - ((VelVec_y * 0.45) * -1)) then
					get_param_handle("HudSidesAOS"):set((-0.06 - ((VelVec_y * 0.45) * -1)))
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			elseif VelVec_x > 0 then
				if VelVec_x > (0.05 - (VelVec_y * 0.45)) then
					get_param_handle("HudSidesAOS"):set((0.03 - (VelVec_y * 0.45))) --0.025
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			end
		elseif VelVec_y < -0.036 and VelVec_y >= -0.08 then
			if VelVec_x < 0 then
				if VelVec_x < (-0.06 - (VelVec_y * 0.2)) then -- - (VelVec_y * 0.3)
					get_param_handle("HudSidesAOS"):set((-0.06 - (VelVec_y * 0.2))) ---0.065 ---0.068
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			elseif VelVec_x > 0 then
				if VelVec_x > (0.06 - (VelVec_y * 0.2)) then -- - (VelVec_y * 0.3)
					get_param_handle("HudSidesAOS"):set((0.06 - (VelVec_y * 0.2))) ---0.065 ---0.068
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			end
		elseif VelVec_y < -0.08 and get_param_handle("HudSidesAOA"):get() > -0.175 then
			if VelVec_x < 0 then
				if VelVec_x < (-0.08 - (VelVec_y * 0.45)) then
					get_param_handle("HudSidesAOS"):set((-0.08 - (VelVec_y * 0.45)))
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			elseif VelVec_x > 0 then
				if VelVec_x > (0.085 - ((VelVec_y * 0.45) * -1)) then
					get_param_handle("HudSidesAOS"):set((0.085 - ((VelVec_y * 0.45) * -1)))
				else
					get_param_handle("HudSidesAOS"):set(VelVec_x)
				end
			end
		elseif get_param_handle("HudSidesAOA"):get() <= -0.225 then
			if VelVec_x < -0.013 then
				get_param_handle("HudSidesAOS"):set(-0.013)
			elseif VelVec_x > 0.014 then
				get_param_handle("HudSidesAOS"):set(0.014)
			else
				get_param_handle("HudSidesAOS"):set(VelVec_x)
			end
		end
	end

	
	--get_param_handle("TEST_PITCHER"):set(math.cos(ROLL_HUD:get()) * (PITCH_HUD:get() + VELVEC_HUD_Y:get()))

	--get_param_handle("TEST_ROLLER"):set(math.sin(ROLL_HUD:get()) * (PITCH_HUD:get() + VELVEC_HUD_Y:get()))

	if (get_param_handle("PULLUPQUE"):get() + (math.rad(20) * 1000)) - (VELVEC_HUD_Y:get() * 10) < -130 then
		get_param_handle("HUD_PULLUPQUE"):set(-130)
	else
		get_param_handle("HUD_PULLUPQUE"):set((get_param_handle("PULLUPQUE"):get() + (math.rad(20) * 1000)) - (VELVEC_HUD_Y:get() * 10))
	end


	if get_param_handle("CURRENT_PHASE_CO"):get() == 1 then
		get_param_handle("DSI_UP"):set(0)
		if VV_LimitedLower:get() == 1 then
			get_param_handle("DSI_STATE"):set(0)
		else
			get_param_handle("DSI_STATE"):set(1)
		end
	elseif get_param_handle("CURRENT_PHASE_PAL"):get() == 1 then
		get_param_handle("DSI_STATE"):set(1)
		if get_param_handle("HudSidesAOA"):get() < -0.1 then
			get_param_handle("DSI_UP"):set(1)
		else
			get_param_handle("DSI_UP"):set(0)
		end
	else
		get_param_handle("DSI_STATE"):set(0)
	end



		if HEADING_MODE:get() == 1 then
			HEADING_HUD:set(360 - math.deg(sensor_data.getHeading()))
		else	
			HEADING_HUD:set(math.deg(sensor_data.getMagneticHeading()))
		end


		if get_param_handle("AutoPilotMode"):get() == -2 or get_param_handle("AutoPilotMode"):get() == 2 then
			get_param_handle("HUD_AP_ALT_BOXES"):set(1)
		else
			get_param_handle("HUD_AP_ALT_BOXES"):set(0)
		end

		ALTITUDE_HUD:set(BarometricAltFeet)
		--ALTITUDE_HUD:set(81000)
		if (Hud_Ralt > 5249.4) and (Hud_Ralt < 5249.6) then
			RALTITUDE_HUD:set(GPS_ALTITUDE_FEET:get() - get_param_handle("TERRAIN_ALT"):get()) 
			get_param_handle("RadarAltAvail"):set(0)
		else
			RALTITUDE_HUD:set(Hud_Ralt)
			get_param_handle("RadarAltAvail"):set(1)
		end

	get_param_handle("ALTITUDE_BARO"):set(math.floor((sensor_data.getBarometricAltitude() * 3.2808399) / 10) * 10)
    get_param_handle("ALTITUDE_RALT"):set(math.floor((sensor_data.getRadarAltitude() * 3.2808399) / 10) * 10)

		ALT_77:set(get_param_handle("TERRAIN_ALT"):get() * -(BarometricAltFeet * 0.00001))
	-- Speeds =================================================================================================================================
		IAS = sensor_data.getIndicatedAirSpeed() * 1.94384449 -- m/s to kts
		local self_vel_l,self_vel_v,self_vel_h = sensor_data.getSelfAirspeed() -- Prereq for ground speed in kts
		GS = math.sqrt(self_vel_h^2 + self_vel_l^2) * 1.94384449
		get_param_handle("GS"):set(GS)
		

	-- Below 50 kts use ground speed reading instead
		if IAS < 50 then
			CURR_IAS:set(GS)
		else
			CURR_IAS:set(IAS)
		end

		if IAS > 5 then
			if speedTimeCounter + update_time_step >= 0.3 then
				if IAS > 80 then
					get_param_handle("SPEED_KCAS"):set(IAS)
				else
					get_param_handle("SPEED_KCAS"):set(GS)
				end
				CURR_GS:set(GS)

				speedTimeCounter = 0
			else
				speedTimeCounter = speedTimeCounter + update_time_step
			end
		else
			get_param_handle("SPEED_KCAS"):set(0)
		end

		SuperSonic = IAS / sensor_data.getMachNumber()
		TransonicLower:set(SuperSonic * 0.95)
		TransonicUpper:set(SuperSonic * 1.05)

		HUD_MACH = sensor_data.getMachNumber() * 0.1
		
		if HUD_MACH < 0.995 then
			HUD_MACH = HUD_MACH * 1000
		end

		MACH_A:set(sensor_data.getMachNumber())

		MACH_B:set(HUD_MACH)

		local Acceleration   = ((IAS - PreviousIAS) / update_time_step) * 5 --45
		PreviousIAS  = IAS
		if Acceleration < 0.1 then
			ACC:set(0)
			DEACC:set(Acceleration + 22.5)
		else
			ACC:set(Acceleration - 22.5)
			DEACC:set(0)
		end



		if get_param_handle("CURRENT_PHASE_STATIONARY"):get() == 1 or get_param_handle("CURRENT_PHASE_PARKED"):get() == 1 or get_param_handle("CURRENT_PHASE_TAXI"):get() == 1 then
			get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(0)
			get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(0)
		elseif get_param_handle("CURRENT_PHASE_TGR"):get() == 1 or get_param_handle("CURRENT_PHASE_ROT"):get() == 1 or get_param_handle("CURRENT_PHASE_TD"):get() == 1 or get_param_handle("CURRENT_PHASE_LR"):get() == 1 then
			local TakeOffSpeed     = 0
			local TakeOffOverspeed = 0
			local RotationSpeed    = 128
			
			if CURR_IAS:get() < RotationSpeed then
				TakeOffOverspeed = 0
			else
				TakeOffSpeed     = 1
				TakeOffOverspeed = 1
			end
			if CURR_IAS:get() < RotationSpeed and CURR_IAS:get() >= 100 then
				TakeOffSpeed = (CURR_IAS:get() - 100) / (RotationSpeed - 100)
			end

			if TakeOffOverspeed == 1 then
				if OverSpeedBlink < 1 then
					OverSpeedBlink = OverSpeedBlink + update_time_step
				else
					OverSpeedBlink = 0
				end
			else
				OverSpeedBlink = 0
			end

			if get_param_handle("CURRENT_PHASE_TGR"):get() == 1 then
				get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(OverSpeedBlink)
			else
				get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(0)
			end
			get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(TakeOffSpeed)
		elseif get_param_handle("CURRENT_PHASE_CO"):get() == 1 then
			get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(0)
			if get_param_handle("MASTERMODE"):get() ~= 0 then
				get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(2.6)
			else
				get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(0.72)
			end
		elseif get_param_handle("CURRENT_PHASE_PAL"):get() == 1 then
			local Landing_Speed          = 128
			local Current_Approach_Speed = Landing_Speed - CURR_IAS:get()

			if Current_Approach_Speed == 0 then
				get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(0.72)
			else
				if 0.72 - Current_Approach_Speed * 0.05 < 0.32 then --UnderSpeedBlink
					get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(0.32)
					if UnderSpeedBlink < 1 then
						UnderSpeedBlink = UnderSpeedBlink + update_time_step
					else
						UnderSpeedBlink = 0
					end
					get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(UnderSpeedBlink)
				elseif 0.72 - Current_Approach_Speed * 0.05 > 1.13 then
					get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(1.13)
					get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(0)
				else
					get_param_handle("HUD_VELVEC_VER_LINE_POS"):set(0.72 - Current_Approach_Speed * 0.05)
					get_param_handle("HUD_VELVEC_VER_LINE_BLINK"):set(0)
				end
			end
		end

	-- Auto Throttle ==========================================================================================================================
		if (AT:get() == 1) and ((get_param_handle("CURRENT_PHASE_LO"):get() > 0.0) or (get_param_handle("CURRENT_PHASE_PAL"):get() > 0.0)) then
			if Autothrottle_mode == 12 then
				AT_MODE:set(0.5)
			elseif Autothrottle_mode == 14 then
				AT_MODE:set(1)
			end
		elseif (get_param_handle("CURRENT_PHASE_LO"):get() < 1.0) or (get_param_handle("CURRENT_PHASE_PAL"):get() < 1.0) or (AT:get() < 0.5 ) then
			AT_MODE:set(0)
		end
	end
need_to_be_closed = false






--[[
getAngleOfAttack()
getAngleOfSlide()
getBarometricAltitude()
getCanopyPos()
getCanopyState()
getEngineLeftFuelConsumption()
getEngineLeftRPM()
getEngineLeftTemperatureBeforeTurbine()
getEngineRightFuelConsumption()
getEngineRightRPM()
getEngineRightTemperatureBeforeTurbine()
getFlapsPos()
getFlapsRetracted()
getHeading()
getHorizontalAcceleration()
getIndicatedAirSpeed()
getLandingGearHandlePos()
getLateralAcceleration()
getLeftMainLandingGearDown()
getLeftMainLandingGearUp()
getMachNumber()
getMagneticHeading()
getNoseLandingGearDown()
getNoseLandingGearUp()
getPitch()
getRadarAltitude()
getRateOfPitch()
getRateOfRoll()
getRateOfYaw()
getRightMainLandingGearDown()
getRightMainLandingGearUp()
getRoll()
getRudderPosition()
getSpeedBrakePos()
getSelfAirspeed()
getSelfCoordinates()
getSelfVelocity()
getStickPitchPosition()
getStickRollPosition()
getThrottleLeftPosition()
getThrottleRightPosition()
getTotalFuelWeight()
getTrueAirSpeed()
getVerticalAcceleration()
getVerticalVelocity()
getWOW_LeftMainLandingGear()
getWOW_NoseLandingGear()
getWOW_RightMainLandingGear()
--]]