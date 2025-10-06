-- debug页面

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
SetScale(FOV)

dofile(LockOn_Options.script_path .. "DebugWindow/debug_page_defs.lua")

local half_width   = GetScale()
local half_height  = GetAspect() * half_width

local aspect       = GetAspect() -- GetHalfHeight()/GetHalfWidth()

ppa_base                    = CreateElement "ceMeshPoly"
ppa_base.name               = "UFCP_base"
ppa_base.material           = MakeMaterial(nil,{255,0,0,50})
ppa_base.h_clip_relation    = h_clip_relations.REWRITE_LEVEL
ppa_base.level              = DEBUG_WIN_DEF_LEVEL
ppa_base.collimated         = false
ppa_base.isvisible          = false
ppa_base.z_emable           = false
ppa_base.vertices           = { {1, 1}, { 1, -1}, { -1,-1}, {-1, 1}, }
ppa_base.indices            =  {0,1,2 ,  0,2,3 }
Add(ppa_base)
