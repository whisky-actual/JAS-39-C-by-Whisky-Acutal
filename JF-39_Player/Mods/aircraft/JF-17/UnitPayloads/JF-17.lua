
local tIntercept    = 10
local tCAP          = 11
local tAFAC         = 16
local tRecon        = 17
local tEscort       = 18
local tFighterSweep = 19
local tSEAD         = 29
local tAntiShip     = 30
local tCAS          = 31
local tGndAttack    = 32
local tPinpntStrike = 33
local tRwyAttack    = 34

local unitPayloads = {
    ["name"] = "JF-17",
    ["payloads"] = {
		{
			["name"] = "PL-5Ex2, C802AKx2, 800L Tank",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 5,
				},
				[2] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[3] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 3,
				},
				[4] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
				[5] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[6] = {
					["CLSID"] = "DIS_C-701IR",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "DIS_C-701IR",
					["num"] = 2,
				},
				[8] = {
					["CLSID"] = "{Jeff}",
					["num"] = 8,
				},
			},
			["tasks"] = {
				[1] = tIntercept,
			},
		},

    },
    ["unitType"] = "JF-17",
}
return unitPayloads
