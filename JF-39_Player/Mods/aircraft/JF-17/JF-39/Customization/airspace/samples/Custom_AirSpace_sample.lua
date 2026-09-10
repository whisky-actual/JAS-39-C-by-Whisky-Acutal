--[[ 
*********** Steps to create customized rwr symbols

1. create a Custom_AirSpace_xxx.lua file in 'Customization/airspace/' folder (name case sensitive)
   1.1 create 'airspace' folder if not exist
   1.2 xxx is terrain name (case sensitive):
       Caucasus, Nevada, PersianGulf, Syria, SinaiMap, MarianaIslands, Falklands, Normandy, TheChannel
	   i.e Custom_AirSpace_PersianGulf.lua
      
2. follow below sample to create your own airspace for each coalition
   2.1 each coalition supports up to 4 airspace drawings
   2.2 name of each airspace drawing
       RED : RKYA, RKYB, RKYC, RKYD
       BLUE: BKYA, BKYB, BKYC, BKYD
       NEUT: NKYA, NKYB, NKYC, NKYD

--]]

------- Begin: sample content of customerRWR.lua -------
airspace = {} -- don't edit this line

airspace['RKYA'] = 
{
    --['color']  = {160/255, 32/255, 240/255}, -- default {160/255, 32/255, 240/255}
	['closed'] = true,
	['points'] = {
		[1] = {
			lat = 42.152500, lon = 41.656111,		-- Example: N42-09-09.00 E41-39-22.00
		},
		[2] = {
			lat = 41.651389, lon = 41.649167,		-- Example: N41-39-05.00 E41-38-57.00
		},
		[3] = {
			lat = 41.199167, lon = 41.499444,		-- Example: N41-11-57.00 E41-29-58.00
		},
		[4] = {
			lat = 41.668333, lon = 41.500556,		-- Example: N41-40-06.00 E41-30-02.00
		},
	}
	-- ...
}
airspace['RKYB'] = 
{
    --['color']  = {0/255, 255/255, 255/255}, -- default {0/255, 255/255, 255/255}
	['closed'] = false,
	['points'] = {
		[1] = {
			lat = 41.152500, lon = 41.556111,		-- Example: N42-09-09.00 E41-39-22.00
		},
		[2] = {
			lat = 41.251389, lon = 42.649167,		-- Example: N41-39-05.00 E41-38-57.00
		},
		[3] = {
			lat = 43.168333, lon = 42.600556,		-- Example: N41-40-06.00 E41-30-02.00
		},
	}
	-- ...
}

airspace['RKYC'] = 
{
    --['color']  = {0/255, 0/255, 255/255}, -- default {0/255, 0/255, 255/255}
	['closed'] = false,
	['points'] = {
		[1] = {
			lat = 41.152500, lon = 41.556111,		-- Example: N42-09-09.00 E41-39-22.00
		},
		[2] = {
			lat = 41.251389, lon = 42.649167,		-- Example: N41-39-05.00 E41-38-57.00
		},
		[3] = {
			lat = 43.168333, lon = 42.600556,		-- Example: N41-40-06.00 E41-30-02.00
		},
	}
	-- ...
}

airspace['RKYD'] = 
{
    --['color']  = {209/255, 146/255, 117/255}, -- default {209/255, 146/255, 117/255}
	['closed'] = false,
	['points'] = {
		[1] = {
			lat = 41.152500, lon = 41.556111,		-- Example: N42-09-09.00 E41-39-22.00
		},
		[2] = {
			lat = 41.251389, lon = 42.649167,		-- Example: N41-39-05.00 E41-38-57.00
		},
		[3] = {
			lat = 43.168333, lon = 42.600556,		-- Example: N41-40-06.00 E41-30-02.00
		},
	}
	-- ...
}

------- End: sample content of Custom_AirSpace_XXXX.lua -------
