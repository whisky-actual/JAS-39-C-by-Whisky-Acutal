local unitPayloads = {
	["name"] = "JF-17",
	["payloads"] = {
		[1] = {
			["name"] = "Escort",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_TANK1100",
					["num"] = 5,
				},
				[2] = {
					["CLSID"] = "DIS_TANK1100",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "DIS_SD-10_DUAL_L",
					["num"] = 4,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 18,
			},
		},
		[2] = {
			["name"] = "Runway Attack",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 5,
				},
				[5] = {
					["CLSID"] = "{BRU33_2X_MK-82}",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 34,
			},
		},
		[3] = {
			["name"] = "Ground Strike Rabarber",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "DIS_GB6",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "DIS_GB6",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 32,
			},
		},
		[4] = {
			["name"] = "Fighter Sweep",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[3] = {
					["CLSID"] = "DIS_SD-10_DUAL_L",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10_DUAL_R",
					["num"] = 6,
				},
				[5] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 5,
				},
			},
			["tasks"] = {
				[1] = 19,
			},
		},
		[5] = {
			["name"] = "CAP",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 3,
				},
				[6] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 5,
				},
				[7] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
			},
			["tasks"] = {
				[1] = 11,
			},
		},
		[6] = {
			["name"] = "Antiship Strike",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 3,
				},
				[2] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 5,
				},
				[3] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 6,
				},
				[4] = {
					["CLSID"] = "DIS_C-802AK",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 30,
			},
		},
		[7] = {
			["name"] = "Intercept",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[4] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 10,
			},
		},
		[8] = {
			["name"] = "Reconnaissance",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 5,
				},
				[2] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 17,
			},
		},
		[9] = {
			["name"] = "SEAD",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[4] = {
					["CLSID"] = "DIS_LD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_LD-10",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_LD-10",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "DIS_LD-10",
					["num"] = 5,
				},
			},
			["tasks"] = {
				[1] = 29,
			},
		},
		[10] = {
			["name"] = "CAS",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_WMD7",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "DIS_C-701T",
					["num"] = 2,
				},
				[3] = {
					["CLSID"] = "DIS_C-701T",
					["num"] = 6,
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
					["CLSID"] = "DIS_BRM1_90",
					["num"] = 3,
				},
				[7] = {
					["CLSID"] = "DIS_BRM1_90",
					["num"] = 5,
				},
			},
			["tasks"] = {
				[1] = 31,
			},
		},
		[11] = {
			["name"] = "Pinpoint Strike",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_LS_6_500",
					["num"] = 4,
				},
				[2] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 3,
				},
				[3] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 5,
				},
				[4] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[5] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
				[6] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[7] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
			},
			["tasks"] = {
				[1] = 33,
			},
		},
		[12] = {
			["name"] = "AFAC",
			["pylons"] = {
				[1] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 1,
				},
				[2] = {
					["CLSID"] = "DIS_PL-5EII",
					["num"] = 7,
				},
				[3] = {
					["CLSID"] = "DIS_WMD7",
					["num"] = 4,
				},
				[4] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 3,
				},
				[5] = {
					["CLSID"] = "DIS_TANK800",
					["num"] = 5,
				},
				[6] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 2,
				},
				[7] = {
					["CLSID"] = "DIS_SD-10",
					["num"] = 6,
				},
			},
			["tasks"] = {
				[1] = 16,
			},
		},
	},
	["unitType"] = "JF-17",
}
return unitPayloads
