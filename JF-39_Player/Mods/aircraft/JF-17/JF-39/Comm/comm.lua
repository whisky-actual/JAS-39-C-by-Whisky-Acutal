assert(db.Formations ~= nil)

local formation = db.FormationID.HEL_WEDGE
local overwatch = false
assert(formation ~= nil)

function specialEvent(params)
    return staticParamsEvent(Message.wMsgLeaderSpecialCommand,params)
end

function refuelEvent(percent)
    return staticParamsEvent(Message.wMsgLeaderRequestRefueling,{fuel_mass = percent})
end


local FormationDirection = {
    RIGHT = 1,
    LEFT  = 2
}

local formationDirection = FormationDirection.RIGHT

local FormationVariant = {
    TIGHT  = 1,
    CRUISE = 2,
    COMBAT = 3
}

local availableVariant = {
    [db.FormationID.HEL_ECHELON] = {
        [FormationVariant.TIGHT]  = 1,
        [FormationVariant.CRUISE] = 2,
        [FormationVariant.COMBAT] = 3
    },
    [db.FormationID.HEL_FRONT] = {
        [FormationVariant.CRUISE] = 1,
        [FormationVariant.COMBAT] = 2
    }
}

local formationVariant = {
    [db.FormationID.HEL_ECHELON] = FormationVariant.CRUISE,
    [db.FormationID.HEL_FRONT]   = FormationVariant.CRUISE
}

local menus = data.menus

menus['Engage'] = {
    name = _('Engage'),
    items = {
        {name = _('My Target'),                         command = sendMessage.new(Message.wMsgLeaderEngageMyTarget)},
        {name = _('My Enemy'),                          command = sendMessage.new(Message.wMsgLeaderMyEnemyAttack)},
        {name = _('Bandits'),                           command = sendMessage.new(Message.wMsgLeaderEngageBandits, false, false)},
        {name = _('Air Defences'),                      command = sendMessage.new(Message.wMsgLeaderEngageAirDefenses, false, false)},
        {name = _('Ground Targets'),                    command = sendMessage.new(Message.wMsgLeaderEngageGroundTargets, false, false)},
        {name = _('Mission and Rejoin'),                command = sendMessage.new(Message.wMsgLeaderFulfilTheTaskAndJoinUp)},
        {name = _('Mission and RTB'),                   command = sendMessage.new(Message.wMsgLeaderFulfilTheTaskAndReturnToBase)},
    }
}
menus['Go Pincher'] = {
    name = _('Go Pincher'),
    items = {
        { name = _('Right'),                            command = sendMessage.new(Message.wMsgLeaderPincerRight) },
        { name = _('Left'),                             command = sendMessage.new(Message.wMsgLeaderPincerLeft) }
    }
}
menus['Go To'] = {
    name = _('Go To'),
    items = {
        { name = _('Return to Base'),                   command = sendMessage.new(Message.wMsgLeaderReturnToBase) },
        { name = _('Route'),                            command = sendMessage.new(Message.wMsgLeaderFlyRoute) },
        { name = _('Fly to Tanker'),                    command = sendMessage.new(Message.wMsgLeaderGoRefueling) },
    }
}
menus['Reconnaissance'] = {
    name = _('Reconnaissance'),
    items = {
        { name = _('1 km'),                             command = sendMessage.new(Message.wMsgLeaderMakeRecon, 1000)},
        { name = _('2 km'),                             command = sendMessage.new(Message.wMsgLeaderMakeRecon, 2000)},
        { name = _('3 km'),                             command = sendMessage.new(Message.wMsgLeaderMakeRecon, 3000)},
        { name = _('5 km'),                             command = sendMessage.new(Message.wMsgLeaderMakeRecon, 5000)},
        { name = _('8 km'),                             command = sendMessage.new(Message.wMsgLeaderMakeRecon, 8000)},
        { name = _('10 km'),                            command = sendMessage.new(Message.wMsgLeaderMakeRecon, 10000)},
    }
}
menus['Direction'] = {
    name = _('Direction'),
    items = {
        [1] = {name = _('Default'),   command = sendMessage.new2(2, nil)},
        [2] = {name = _('North'),     command = sendMessage.new2(2, math.rad(0))},
        [3] = {name = _('South'),     command = sendMessage.new2(2, math.rad(180))},
        [4] = {name = _('East'),      command = sendMessage.new2(2, math.rad(90))},
        [5] = {name = _('West'),      command = sendMessage.new2(2, math.rad(270))}
    }
}

menus['Weapon'] = {
    name = _('Weapon'),
    items = {
        [1] = {name = _('Missile'),                 submenu = menus['Direction'],         parameter = 1},
        [2] = {name = _('Unguided Bomb'),           submenu = menus['Direction'],         parameter = 2},
        [3] = {name = _('Guided bomb'),             submenu = menus['Direction'],         parameter = 3},
        [4] = {name = _('Rocket'),                  submenu = menus['Direction'],         parameter = 4},
        [5] = {name = _('Marker'),                  submenu = menus['Direction'],         parameter = 5},
        [6] = {name = _('Gun'),                     submenu = menus['Direction'],         parameter = 6}
    }
}

menus['Engage with'] = {
    name = _('Engage with'),
    items = {
        [1] = {name = _('Engage Ground Targets'),     submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageGroundTargets, true, true}},
        [2] = {name = _('Engage Armor'),              submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageArmor, true, true}},
        [3] = {name = _('Engage Artillery'),          submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageArtillery, true, true}},
        [4] = {name = _('Engage Air Defenses'),       submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageAirDefenses, true, true}},
        [5] = {name = _('Engage Utility Vehicles'),   submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageUtilityVehicles, true, true}},
        [6] = {name = _('Engage Infantry'),           submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageInfantry, true, true}},
        [7] = {name = _('Engage Ships'),              submenu = menus['Weapon'],         parameters = {Message.wMsgLeaderEngageNavalTargets, true, true}}
    }
}

local function getFormationSubmenu(self)
    local tbl = {
        name = _('Formation'),
        items = {
            [1] = {name = _('Go Line Abreast'),             command = sendMessage.new(Message.wMsgLeaderLineAbreast)},
            [2] = {name = _('Go Trail'),                    command = sendMessage.new(Message.wMsgLeaderGoTrail)},
            [3] = {name = _('Go Wedge'),                    command = sendMessage.new(Message.wMsgLeaderWedge)},
            [4] = {name = _('Go Echelon Right'),            command = sendMessage.new(Message.wMsgLeaderEchelonRight)},
            [5] = {name = _('Go Echelon Left'),             command = sendMessage.new(Message.wMsgLeaderEchelonLeft)},
            [6] = {name = _('Go Finger Four'),              command = sendMessage.new(Message.wMsgLeaderFingerFour)},
            [7] = {name = _('Go Spread Four'),              command = sendMessage.new(Message.wMsgLeaderSpreadFour)},
        }
    }
    if not openFormation then
        tbl.items[8] = {
            name = _('Open formation'),
            command = {
                sendMessage = sendMessage.new(Message.wMsgLeaderOpenFormation),
                perform = function(self, parameters)
                    self.sendMessage:perform(parameters)
                    openFormation = true
                end
            }
        }
    else
        tbl.items[9] = {
            name = _('Close formation'),
            command = {
                sendMessage = sendMessage.new(Message.wMsgLeaderCloseFormation),
                perform = function(self, parameters)
                    self.sendMessage:perform(parameters)
                    openFormation = false
                end
            }
        }
    end
    return tbl
end

menus['Flight'] = {
    name = _('Flight'),
    items = {
        [1] = {
            name = _('Engage'),
            submenu = menus['Engage']
        },
        [2] = {
            name = _('Engage with'),
            submenu = menus['Engage with']
        },
        [3] = {
            name = _('Go Pincher'),
            submenu = menus['Go Pincher'],
        },
        [4] = {
            name = _('Go To'),
            submenu = menus['Go To'],
        },
        [5] = {
            name = _('Cover Me'),
            command = sendMessage.new(Message.wMsgLeaderCoverMe)
        },
        [6] = {
            name = _('Formation'),
            getSubmenu = getFormationSubmenu,
        },
        [7] = {
            name = _('Hold Position'),
            submenu = menus['Hold Position'],
            command = sendMessage.new(Message.wMsgLeaderAnchorHere)
        },
        [8] = {
            name = _('Rejoin Formation'),
            command = sendMessage.new(Message.wMsgLeaderJoinUp)
        },
        [10] = {
            name = _('Jettison Weapons'),
            command = sendMessage.new(Message.wMsgLeaderJettisonWeapons)
        },
    }
}
local wingmenMenuItems = {
    [1] = {
        name = _('Engage'),
        submenu = menus['Engage']
    },
    [2] = {
        name = _('Engage with'),
        submenu = menus['Engage with']
    },
    [3] = {
        name = _('Go Pincher'),
        submenu = menus['Go Pincher'],
    },
    [4] = {
        name = _('Go To'),
        submenu = menus['Go To'],
    },
    [5] = {
        name = _('Cover Me'),
        command = sendMessage.new(Message.wMsgLeaderCoverMe)
    },
    [6] = {
        name = _('Reconnaissance'),
        submenu = menus['Reconnaissance'],
    },
    [7] = {
        name = _('Hold Position'),
        submenu = menus['Hold Position'],
        command = sendMessage.new(Message.wMsgLeaderAnchorHere)
    },
    [8] = {
        name = _('Rejoin Formation'),
        command = sendMessage.new(Message.wMsgLeaderJoinUp)
    },
    [10] = {
        name = _('Jettison Weapons'),
        command = sendMessage.new(Message.wMsgLeaderJettisonWeapons)
    },
}

local function makeWingmenMenu(number)
    return {
        name = _('Wingman ')..(number + 1),
        submenu = {
            name = _('Wingman ')..(number + 1),
            items = wingmenMenuItems
        },
        condition = {
            check = function(self)
                if not data.showingOnlyPresentRecepients then
                    return true
                end
                local pWingmen = data.pUnit:getGroup():getUnit(number + 1)
                return pWingmen ~= nil
            end
        },
        color = {
            get = function(self)
                local pWingmen = data.pUnit:getGroup():getUnit(number + 1)
                return getRecepientColor(pWingmen and pWingmen:getCommunicator())
            end
        },
        command = {
            perform = function(self)
                local pWingmen = data.pUnit:getGroup():getUnit(number + 1)
                selectAndTuneCommunicator(pWingmen and pWingmen:getCommunicator())
            end
        },
        parameter = number,
    }
end

local function hasFlight()
    local pGroup = data.pUnit:getGroup()
    for i = 2, 4 do
        local pWingmen = pGroup:getUnit(i)
        if pWingmen ~= nil then
            return true
        end
    end
    return false
end

data.rootItem = {
    name = _('Main'),
    getSubmenu = function(self)
        local tbl = {
            name = _('Main'),
            items = {}
        }

        if data.pUnit == nil or data.pUnit:isExist() == false then
            return tbl
        end


        if not data.showingOnlyPresentRecepients or
            hasFlight() then
            tbl.items[1] = {
                name = _('Flight'),
                submenu = menus['Flight'],
                color = {
                    get = function(self)
                        local pGroup = data.pUnit:getGroup()
                        for i = 2, 4 do
                            local pWingmen = pGroup:getUnit(i)
                            if pWingmen ~= nil then
                                return getRecepientColor(pWingmen and pWingmen:getCommunicator())
                            end
                        end
                        return getRecepientColor(nil)
                    end
                },
                command = {
                    perform = function(self)
                        local pGroup = data.pUnit:getGroup()
                        for i = 2, 4 do
                            local pWingmen = pGroup:getUnit(i)
                            if pWingmen ~= nil then
                                selectAndTuneCommunicator(pWingmen and pWingmen:getCommunicator())
                                return
                            end
                        end
                    end
                },
                parameter = 5,
            }
        end

        for number = 2, 4 do
            if not data.showingOnlyPresentRecepients or
                data.pUnit:getGroup():getUnit(number + 1) ~= nil then
                tbl.items[number] = makeWingmenMenu(number - 1)
            end
        end

        if self.builders ~= nil then
            for index, builder in pairs(self.builders) do
                builder(self, tbl)
            end
        end

        if #data.menuOther.submenu.items > 0 then
            tbl.items[10] = {
                name = _('Other'),
                submenu = data.menuOther.submenu
            }
        end

        return tbl
    end,
    builders = {}
}

utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/JTAC.lua', getfenv()))(4)
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/ATC.lua', getfenv()))(5, {['Airdrome'] = true, ['Helipad'] = false} )
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Tanker.lua', getfenv()))(6)
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/AWACS.lua', getfenv()))(7, {tanker = true, radar = true})
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Ground Crew.lua', getfenv()))(8)

--[[
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/JTAC.lua', getfenv()))(4)
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/ATC.lua', getfenv()))(5, {['Airdrome'] = true, ['Helipad'] = false} )
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Tanker.lua', getfenv()))(6)
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/AWACS.lua', getfenv()))(7, {tanker = false, radar = false})
utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/Common/Ground Crew.lua', getfenv()))(8)
]]

-- Wheel Chocks
menus['Wheel chocks'] = {
    name  = _('Wheel chocks'),
    items = {
        [1] = {name = _('Place_'),         command = sendMessage.new(Message.wMsgLeaderGroundToggleWheelChocks, true)},
        [2] = {name = _('Remove_'),        command = sendMessage.new(Message.wMsgLeaderGroundToggleWheelChocks, false)}
    }
}
table.insert(menus['Ground Crew'].items, { name = _('Wheel chocks'), submenu = menus['Wheel chocks']})

------ local device
local dev_radio_int_id = 24

-- customized
local lfs          = require("lfs")
local DialogLoader = require("DialogLoader")

local cdata = 
{
    ConfigPanel         = _("Configuration Panel"),
    LaserCodeEditor     = _("Laser Code Config"),
    DTCEditor           = _("DTC Config"),
    cancel              = _("CANCEL"),
    ok                  = _("APPLY"),
    notification        = _("Update the DTC to apply the changes!"),

    DMAP_TYPE           = _('DMAP Type'),
    AIRSPACE_SRC        = _('Air Space'),
    UpdateINS           = _('Update INS Align Data'),
    AAR_Probe           = _('AAR Probe'),
    RefillUtil          = _('Refill Utilities'),
    LadderInletCover    = _('Inlet Cover and Ladder'),
}

local window_ = nil
local updateDiag = {}

updateDiag.init = function(wnd)
    window_ = wnd
	
	if not window_ then
		--print("config panel window null init")
    	local avINT = data.base.GetDevice(dev_radio_int_id)
		if avINT then
			avINT:avDev_input_layer(true)
		end
		return
	end
	
    window_:centerWindow()

    containerMain   = window_.containerMain
    
    local findWidgetByName = DialogLoader.findWidgetByName

    btnCancel           = findWidgetByName(containerMain, 'btnCancel')
    btnCancel.onChange  = updateDiag.onButtonCancel

    btnOk               = findWidgetByName(containerMain, 'btnOk')
    btnOk.onChange      = updateDiag.onButtonOk

    selectLCSt2         = findWidgetByName(containerMain, 'editBoxLaserCodeStation2')
    selectLCSt3         = findWidgetByName(containerMain, 'editBoxLaserCodeStation3')
    selectLCSt4         = findWidgetByName(containerMain, 'editBoxLaserCodeStation4')
    selectLCSt5         = findWidgetByName(containerMain, 'editBoxLaserCodeStation5')
    selectLCSt6         = findWidgetByName(containerMain, 'editBoxLaserCodeStation6')

    checkINSdata        = findWidgetByName(containerMain, 'checkUpdateINS')
    
    checkProbe          = findWidgetByName(containerMain, 'checkAARProbe')
    --[[probestat           = true
    checkProbe:addChangeCallback(function()
        updateProbeState(checkProbe:getState())
        probestat = checkProbe:getState()
    end)]]

    checkUtil           = findWidgetByName(containerMain, 'checkRefillUtil')
    checkLadderNCover   = findWidgetByName(containerMain, 'checkLadderInletCover')

    selectDMAP          = findWidgetByName(containerMain, 'listBoxDMAP')
    dmaptype            = 0

    selectDMAP.onChange = function(self,item)
        if item and item.itemId then
            dmaptype = item.itemId
            --print("selectDMAP "..dmaptype)
        end
    end
    
    selectAIRSPACE      = findWidgetByName(containerMain, 'listBoxAIRSPACE')
    airspacesrc         = 0
	
    selectAIRSPACE.onChange = function(self,item)
        if item and item.itemId then
            airspacesrc = item.itemId
            --print("selectAIRSPACE "..airspacetype)
        end
    end
	
    --window_:addHotKeyCallback('escape', function() updateDiag.onButtonCancel(window_) end)
    
    function window_:onClose()
        btnCancel:onChange()
    end
end

updateDiag.applyConfig = function(self)
    local avINT = data.base.GetDevice(dev_radio_int_id)
	
	if not window_ then
		--print("config panel window null")
		if avINT then
			avINT:avDev_input_layer(true)
		end
		return
	end
	
    if avINT then
        local lc_changed = false
        if selectLCSt2:getText() ~= tostring(avINT:avSMS_get_lasercode(1)) or
           selectLCSt3:getText() ~= tostring(avINT:avSMS_get_lasercode(2)) or
           selectLCSt4:getText() ~= tostring(avINT:avSMS_get_lasercode(3)) or
           selectLCSt5:getText() ~= tostring(avINT:avSMS_get_lasercode(4)) or
           selectLCSt6:getText() ~= tostring(avINT:avSMS_get_lasercode(5)) then
            lc_changed = true
            print("laser code has change")
        end

        if lc_changed then
            avINT:avSMS_set_lasercode(1, selectLCSt2:getText())
            avINT:avSMS_set_lasercode(2, selectLCSt3:getText())
            avINT:avSMS_set_lasercode(3, selectLCSt4:getText())
            avINT:avSMS_set_lasercode(4, selectLCSt5:getText())
            avINT:avSMS_set_lasercode(5, selectLCSt6:getText())
            avINT:avSMS_update_lasercode(true)
            --print("pl 2 set lc "..selectLCSt2:getText())
        end

        avINT:avDMAP_set_map_type(dmaptype)
        avINT:avDTC_set_airspace_src(airspacesrc)
        avINT:avFUEL_update_probe(checkProbe:getState())

        if checkINSdata:getState() then
            avINT:avDTC_update_ins(true)
        end

        if checkUtil:getState() then
            avINT:avDev_reset_supply(true)
        end

        if not checkLadderNCover:getState() and avINT:avDev_get_ladder_cover_state() then
            avINT:avDev_remove_ladder(true)
		else
			if checkLadderNCover:getState() and not avINT:avDev_get_ladder_cover_state() then
				avINT:avDev_remove_ladder(false)
			end
        end

        avINT:avDev_input_layer(true)
    else
        print("cannot find device ", dev_radio_int_id)
    end
end

updateDiag.updateDisplay = function(self)
	if not window_ then
		--print("config panel window nil")
		return
	end
	
    local avINT = data.base.GetDevice(dev_radio_int_id)
    if avINT then
        selectLCSt2:setText(avINT:avSMS_get_lasercode(1))
        selectLCSt3:setText(avINT:avSMS_get_lasercode(2))
        selectLCSt4:setText(avINT:avSMS_get_lasercode(3))
        selectLCSt5:setText(avINT:avSMS_get_lasercode(4))
        selectLCSt6:setText(avINT:avSMS_get_lasercode(5))

        if selectDMAP then
            selectDMAP:clear()
            local item1 = selectDMAP:newItem(_('RASTER CHARTS'))
            item1.itemId = 0
            local item2 = selectDMAP:newItem(_('MAP ALT'))
            item2.itemId = 1

            dmaptype = avINT:avDMAP_get_map_type()
            if item2.itemId == dmaptype then
                selectDMAP:selectItem(item2)
            else
                selectDMAP:selectItem(item1)
            end
        end

        if selectAIRSPACE then
            selectAIRSPACE:clear()
            local item1 = selectAIRSPACE:newItem(_('Mission'))
            item1.itemId = 0
            local item2 = selectAIRSPACE:newItem(_('F10 Label'))
            item2.itemId = 1
            local item3 = selectAIRSPACE:newItem(_('Preset'))
            item3.itemId = 2
            local item4 = selectAIRSPACE:newItem(_('Clean'))
            item4.itemId = 3

            airspacesrc = avINT:avDTC_get_airspace_src()
            if item4.itemId == airspacesrc then
                selectAIRSPACE:selectItem(item4)
            elseif item3.itemId == airspacesrc then
                selectAIRSPACE:selectItem(item3)
            elseif item2.itemId == airspacesrc then
                selectAIRSPACE:selectItem(item2)
            else
                selectAIRSPACE:selectItem(item1)
            end
        end
		
        if checkProbe then
            checkProbe:setState(avINT:avFUEL_get_probe())
            --print("probe state: "..tostring(avINT:avFUEL_get_probe()))
        else
            --print("cannot find checkProbe")
        end

        if checkLadderNCover then
            checkLadderNCover:setState(avINT:avDev_get_ladder_cover_state())
            --print("ladder state: "..tostring(avINT:avDev_get_ladder_cover_state()))
        else
            --print("cannot find checkProbe")
        end

        checkINSdata:setState(false)
        checkUtil:setState(false)
    end
end

updateDiag.onDMAPChange = function(self)
end

updateDiag.create = function(self)
	-- for release
    --updateDiag.init(DialogLoader.spawnDialogFromFile('./Mods/aircraft/JF-17/Comm/customized_diag.dlg', cdata))
	-- for dev
	diag_dlg = DialogLoader.spawnDialogFromFile(lfs.writedir()..'Mods/aircraft/JF-17/Comm/customized_diag.dlg', cdata)
	if diag_dlg == nil then
		diag_dlg = DialogLoader.spawnDialogFromFile('Mods/aircraft/JF-17/Comm/customized_diag.dlg', cdata)
	end
    updateDiag.init(diag_dlg)
end

updateDiag.onButtonCancel = function(self)
    updateDiag.show(false)
    local avINT = data.base.GetDevice(dev_radio_int_id)
    if avINT then
        avINT:avDev_input_layer(true)
    end
end

updateDiag.onButtonOk = function(self)
    updateDiag.applyConfig()
    updateDiag.show(false)
end

updateDiag.show = function(state)
	if window_ then
		window_:setVisible(state)
	end
end

updateDiag.perform = function(self, parameters)
    local avINT = data.base.GetDevice(dev_radio_int_id)
    if avINT then
        --print("is on ground: "..tostring(avINT:avDev_on_ground()))
        if avINT:avDev_on_ground(false) then
            avINT:avDev_input_layer(false)
            if not window_ then
                updateDiag.create()
            end
            updateDiag.updateDisplay()
            updateDiag.show(true)
        end
    end
end


updateDiag.__index = updateDiag

function updateDiag.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, updateDiag)
    return todo
end

table.insert(menus['Ground Crew'].items, { name = _('Configuration Panel'), command = updateDiag.new(true) })


-- contact GC to update DTC data
local updateDTC = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avDTC_update_dtc(self.update)
        end
    end
}

updateDTC.__index = updateDTC

function updateDTC.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, updateDTC)
    return todo
end

menus['Update DTC Data'] = {
    name = _('Update DTC Data'),
    items = {
        [1] = {name = _('Update Data'), command = updateDTC.new(true)},
    }
}
table.insert(menus['Ground Crew'].items, { name = _('Update DTC Data'), submenu = menus['Update DTC Data']})

-- Refuel External Tank
--RefillExtTank       = _('Refuel External Tank'),
local RefillExtTank = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avDTC_refill_ext_tank(self.update)
        end
    end
}

RefillExtTank.__index = RefillExtTank

function RefillExtTank.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, RefillExtTank)
    return todo
end

table.insert(menus['Ground Crew'].items, { name = _('Refuel External Tank'), command = RefillExtTank.new(true)})

-- contact GC to update INS data
--[[
local updateINS = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avDTC_update_ins(self.update)
        end
    end
}

updateINS.__index = updateINS

function updateINS.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, updateINS)
    return todo
end

menus['Update INS Align Data'] = {
    name = _('Update INS Align Data'),
    items = {
        [1] = {name = _('Get Parking Coord'), command = updateINS.new(true)},
    }
}
table.insert(menus['Ground Crew'].items, { name = _('Update INS Align Data'), submenu = menus['Update INS Align Data']})
]]
---- contact GC to update laser code
--
--[[
local updatePylon = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avSMS_choose_pylon(self.pylon)
        end
    end
}

updatePylon.__index = updatePylon

function updatePylon.new(idx)
    local todo = { pylon = idx }
    data.base.setmetatable(todo, updatePylon)
    return todo
end

--
local chooseAllpylon = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avSMS_choose_all_pylons(self.is_all)
        end
    end
}

chooseAllpylon.__index = chooseAllpylon

function chooseAllpylon.new(is_all)
    local todo = { is_all = is_all }
    data.base.setmetatable(todo, chooseAllpylon)
    return todo
end

--
local changeAllcode = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avSMS_choose_code_digit(self.is_all)
        end
    end
}

changeAllcode.__index = changeAllcode

function changeAllcode.new(is_all)
    local todo = { is_all = is_all }
    data.base.setmetatable(todo, changeAllcode)
    return todo
end

--
local updateLaserCode = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avSMS_update_lasercode(self.cmd_idx)
        end
    end
}

updateLaserCode.__index = updateLaserCode

function updateLaserCode.new(idx)
    local todo = { cmd_idx = idx }
    data.base.setmetatable(todo, updateLaserCode)
    return todo
end

menus['Update Laser Code'] = {
    name = _('Update Laser Code'),
    items = {
        --[1] = {name = _('Choose Pylon'),        command = updateLaserCode.new(true)},
        --[2] = {name = _('Choose Rocket'),       command = updateLaserCode.new(false)},
    }
}

menus['Choose Pylon For Laser Code'] = {
    name = _('Choose Pylon'),
    items = {
        [1]  = {name = _('Pylon Left Outer'),  command = updatePylon.new(1)},
        [2]  = {name = _('Pylon Left Inner'),  command = updatePylon.new(2)},
        [3]  = {name = _('Pylon Center'),      command = updatePylon.new(3)},
        [4]  = {name = _('Pylon Right Inner'), command = updatePylon.new(4)},
        [5]  = {name = _('Pylon Right Outer'), command = updatePylon.new(5)},
    }
}
table.insert(menus['Update Laser Code'].items, { name = _('Choose Pylon'), submenu = menus['Choose Pylon For Laser Code']})

table.insert(menus['Update Laser Code'].items, { name = _('Choose All Pylons'), command = chooseAllpylon.new(true)})

table.insert(menus['Update Laser Code'].items, { name = _('Change All Digits'), command = changeAllcode.new(true)})

menus['Enter Laser Code (Hundreds)'] = {
    name = _('Enter Laser Code (Hundreds)'),
    items = {
        [1]  = {name = _('1'), command = updateLaserCode.new(100)},
        [2]  = {name = _('2'), command = updateLaserCode.new(200)},
        [3]  = {name = _('3'), command = updateLaserCode.new(300)},
        [4]  = {name = _('4'), command = updateLaserCode.new(400)},
        [5]  = {name = _('5'), command = updateLaserCode.new(500)},
        [6]  = {name = _('6'), command = updateLaserCode.new(600)},
        [7]  = {name = _('7'), command = updateLaserCode.new(700)},
    }
}
table.insert(menus['Update Laser Code'].items, { name = _('Change Code (Hundreds)'), submenu = menus['Enter Laser Code (Hundreds)']})


menus['Enter Laser Code (Tens)'] = {
    name = _('Enter Laser Code (Tens)'),
    items = {
        [1]  = {name = _('1'), command = updateLaserCode.new(10)},
        [2]  = {name = _('2'), command = updateLaserCode.new(20)},
        [3]  = {name = _('3'), command = updateLaserCode.new(30)},
        [4]  = {name = _('4'), command = updateLaserCode.new(40)},
        [5]  = {name = _('5'), command = updateLaserCode.new(50)},
        [6]  = {name = _('6'), command = updateLaserCode.new(60)},
        [7]  = {name = _('7'), command = updateLaserCode.new(70)},
        [8]  = {name = _('8'), command = updateLaserCode.new(80)},
    }
}
table.insert(menus['Update Laser Code'].items, { name = _('Change Code (Tens)'),     submenu = menus['Enter Laser Code (Tens)']})


menus['Enter Laser Code (Unit)'] = {
    name = _('Enter Laser Code (Unit)'),
    items = {
        [1]  = {name = _('1'), command = updateLaserCode.new(1)},
        [2]  = {name = _('2'), command = updateLaserCode.new(2)},
        [3]  = {name = _('3'), command = updateLaserCode.new(3)},
        [4]  = {name = _('4'), command = updateLaserCode.new(4)},
        [5]  = {name = _('5'), command = updateLaserCode.new(5)},
        [6]  = {name = _('6'), command = updateLaserCode.new(6)},
        [7]  = {name = _('7'), command = updateLaserCode.new(7)},
        [8]  = {name = _('8'), command = updateLaserCode.new(8)},
    }
}
table.insert(menus['Update Laser Code'].items, { name = _('Change Code (Unit)'), submenu = menus['Enter Laser Code (Unit)']})

table.insert(menus['Update Laser Code'].items, { name = _('Setting Complete'), command = updateLaserCode.new(true)})


table.insert(menus['Ground Crew'].items, { name = _('Update Laser Code'), submenu = menus['Update Laser Code']})
]]

-- contact GC to install/uninstall fuel probe
--[[
local updateProbe = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avFUEL_update_probe(self.update)
        end
    end
}

updateProbe.__index = updateProbe

function updateProbe.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, updateProbe)
    return todo
end

menus['AAR Probe'] = {
    name = _('AAR Probe'),
    items = {
        [1] = {name = _('Install Probe'),   command = updateProbe.new(true)},
        [2] = {name = _('Uninstall Probe'), command = updateProbe.new(false)},
    }
}
table.insert(menus['Ground Crew'].items, { name = _('AAR Probe'), submenu = menus['AAR Probe']})
]]

-- contact GC to reset supplies
--[[
local resetSupplies = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avDev_reset_supply(self.update)
        end
    end
}

resetSupplies.__index = resetSupplies

function resetSupplies.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, resetSupplies)
    return todo
end

table.insert(menus['Ground Crew'].items, { name = _('Refill Utilities'), command = resetSupplies.new(true)})
]]

-- contact GC to remove ladder/inlet cover
--[[
local removeLadder = {
    perform = function(self, parameters)
        local avINT = data.base.GetDevice(dev_radio_int_id)
        if avINT then
            avINT:avDev_remove_ladder(self.update)
        end
    end
}

removeLadder.__index = removeLadder

function removeLadder.new(updated)
    local todo = { update = updated }
    data.base.setmetatable(todo, removeLadder)
    return todo
end

table.insert(menus['Ground Crew'].items, { name = _('Remove Inlet Cover and Ladder'), command = removeLadder.new(true)})
]]