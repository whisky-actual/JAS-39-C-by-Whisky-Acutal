------- Steps to create customized radio freqs
-- 1. create a Custom_Radio.lua file in Customization\radio\ folder (file name case sensitive)
-- 2. follow below sample to change the channel freq as needed
-- 3. channel index from 22 to 200 (channels 1 to 21 are set by MissionEditor)

------- Begin: sample content of Custom_Radio.lua -------
-- Note! no need to add presets = {} !!!!

presets[22] = 110750000
presets[40] = 210750000
presets[200] = 410750000


return presets

------- End: sample content of Custom_Radio.lua -------
