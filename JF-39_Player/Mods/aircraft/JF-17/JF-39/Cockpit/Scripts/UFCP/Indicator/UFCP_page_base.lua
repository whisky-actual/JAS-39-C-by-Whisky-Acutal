--UFCP页面
dofile(LockOn_Options.script_path .. "UFCP/UFCP_defs.lua")

local half_width   = GetScale()
local half_height  = GetAspect() * half_width

local aspect       = GetAspect() -- GetHalfHeight()/GetHalfWidth()

UFCP_base                    = CreateElement "ceMeshPoly"
UFCP_base.name               = "UFCP_base"
UFCP_base.material           = UFCP_MATERIAL_PAGEBASE
UFCP_base.h_clip_relation    = h_clip_relations.REWRITE_LEVEL
UFCP_base.level              = UFCP_DEFAULT_LEVEL
--UFCP_base.collimated       = false
UFCP_base.isvisible          = false
UFCP_base.use_mipfilter      = true
UFCP_base.additive_alpha     = true
UFCP_base.collimated         = false
--UFCP_base.z_emable         = true
UFCP_base.vertices           = {{-1, aspect},
                                { 1, aspect},
                                { 1,-aspect},
                                {-1,-aspect},}
UFCP_base.indices            = {0,1,2, 0,2,3}
Add(UFCP_base)
