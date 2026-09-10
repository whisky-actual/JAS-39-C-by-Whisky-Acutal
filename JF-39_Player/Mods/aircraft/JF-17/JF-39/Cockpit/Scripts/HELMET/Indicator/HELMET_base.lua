dofile(LockOn_Options.script_path .. "HELMET/Indicator/HELMET_defs.lua")

local glass       = CreateElement "ceTexPoly"
glass.name        = "HelmetSunVisor"

local vertSide    = 2.2

glass.material    = HELMET_TEX_DEF
glass.vertices    = {{ vertSide,  vertSide},
                     { vertSide, -vertSide},
					 {-vertSide, -vertSide},
					 {-vertSide,  vertSide}
					}
glass.tex_coords  = {{1, 0}, {1, 1}, {0, 1}, {0, 0}}
glass.init_pos    = {0, 0, 0}
glass.indices     = DEF_BOX_INDICES

--glass.screenspace = ScreenType.SCREENSPACE_TRUE
glass.controllers = {{"helmet_sun_visor", vertSide}}
Add(glass)

