-- Notes
--
-- AGC - Automatic Gain Control.
-- Refer to global presets for possible values of AGC parameters. ARC-164 can be used as a good average, suitable for most cases.
-- Also refer to AGC_excerpt.cpp example if custom AGC tuning is still needed.

preset = 
{
	-- describes VOIP UI encryption capability, and the 'crypto key' used by default
    Encryption = 
    {
		-- default state at the moment of cockpit entry
        enable = false,
		-- 'crypto key'
        key = 1,
		-- principal presence of the feature
        present = true,
    }, -- end of Encryption
	-- squelch - 'noise cancelling', presence of the feature
    Squelch = true,
	-- frequency step
    Step = 500,
	-- AGC parameter, output signal deviation, Db
    OutputSD = 5,
	-- The radio ID
    ID = "JF17_COMM1",
	-- Frequency ranges, Hz
	-- Modulation: 0 - AM; 1 - FM
    Ranges = 
    {
        [1] = 
        {
            minFreq = 108000000,
            maxFreq = 399975000,
            modulation = 0,
        }, -- end of [2]
        [2] = 
        {
            minFreq = 108000000,
            maxFreq = 399975000,
            modulation = 0,
        }, -- end of [2]
    }, -- end of Ranges
	-- Transmitter poser, Watt, can be a table of values (thus it will be selectable via VOIP UI)
    Power = 
    {
        [1] = 
        {
            value = 10,
        }, -- end of [1]
    }, -- end of Power
	-- AGC parameter, input signal deviation, Db
    InputSD = 50,
	-- AGC parameter, input signal linear zone, Db
    InputSLZ = 10,
	-- maximum frequency tuning time (to the farthest frequency of the range), seconds
    MaxSearchTime = 0,
	-- frequency tuning accuracy, Hz
    FrequencyAccuracy = 500,
	-- minimum frequency tuning time (to the nearest frequency according to the step), seconds
	MinSearchTime = 0,
	-- List of avaiable guard channels
    Guards = 
    {
        [1] = 
        {
            modulation = 0,
            freq = 121500000,
        }, -- end of [1]
    }, -- end of Guards
	-- Receiver inner noise, Volts
    InnerNoise = 1.1561e-06,
	-- UI name
    Name = "JF17-COMM1",
	-- AGC parameter, time constant, seconds
    RegulationTime = 0.25,
	-- List of channels presets, currently not used, as it was considered to be a dynamic parameter, rather than a static setting
    Channels = 
    {        
    }, -- end of Channels
	-- Receiver bandwidth, Hz
    BandWidth = 12000,
} -- end of preset
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.1                       --
----------------------------------------------------------------------------------------