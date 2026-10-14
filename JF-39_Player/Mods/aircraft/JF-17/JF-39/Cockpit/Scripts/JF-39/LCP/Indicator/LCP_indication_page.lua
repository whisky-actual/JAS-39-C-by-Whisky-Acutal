dofile(LockOn_Options.script_path.."/JF-39/LCP/Indicator/Displays_def.lua")

JF17_COM1_FREQ  = get_param_handle("JF17_COM1_FREQ")
JF17_COM2_FREQ  = get_param_handle("JF17_COM2_FREQ")
JF17_COM1_CHAN  = get_param_handle("JF17_COM1_CHAN")
JF17_COM2_CHAN  = get_param_handle("JF17_COM2_CHAN")
JF17_COM1_VOL   = get_param_handle("JF17_COM1_VOL")
JF17_COM2_VOL   = get_param_handle("JF17_COM2_VOL")
JF17_COM1_STAT  = get_param_handle("JF17_COM1_STAT")
JF17_COM2_STAT  = get_param_handle("JF17_COM2_STAT")
JF17_DATALINK   = get_param_handle("JF17_DATALINK")
JF17_RADIO_MODE = get_param_handle("JF17_RADIO_MODE")
JF17_RADIO_SQL  = get_param_handle("JF17_RADIO_SQL")

--[[
LCP_BASE                    = CreateElement "ceSimple"
LCP_BASE.init_pos           = {0,0}
LCP_BASE.name               = create_guid_string()
--LCP_BASE.element_params   = {"MAINPOWER"}
--LCP_BASE.controllers      = {{"parameter_compare_with_number",0, 1}}
AddElement(LCP_BASE)


GlowEffect                  = CreateElement "ceMeshPoly"
GlowEffect.name             = create_guid_string()
GlowEffect.primitivetype    = "triangles"
GlowEffect.vertices         = { {-1.0 , 1.0 }, { 1.0,1.0}, { 1.0,-1.0}, {-1.0,-1.0}, }
GlowEffect.indices          = {0, 1, 2, 0, 2, 3}
GlowEffect.init_pos         = {0, 0, 0}
GlowEffect.material         = MakeMaterial(nil,{0, 255, 0, 8})  --RGBA
GlowEffect.parent_element   = LCP_BASE.name
GlowEffect.h_clip_relation  = h_clip_relations.REWRITE_LEVEL
GlowEffect.level            = LCP_DEFAULT_LEVEL
--GlowEffect.change_opacity = false
--GlowEffect.collimated         = false
GlowEffect.isvisible        = true
GlowEffect.element_params    = {"JF39_LCP" }
GlowEffect.controllers       = {{"opacity_using_parameter",0}}
Add(GlowEffect)
]]

local AlignLeft = -0.80

-- =========================================================
-- COMMUNICATION
-- =========================================================

add_text_with_opacity(
    "COMMUNICATION",
    0.00,
    0.70,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

-- =========================================================
-- LCP or UFC Radio Mode (Upper Left)
-- =========================================================

textParamWithOpacity(
    -0.98,
     0.48,
    "JF39_LCP",
    "JF17_RADIO_TAKE",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)

-- =========================================================
-- Radio Squelch Status (Upper Right)
-- =========================================================

add_text_with_opacity(
    "SQL",
     0.85,
     0.58,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
     0.85,
     0.48,
    "JF39_LCP",
    "JF17_RADIO_SQL",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)

-- =========================================================
-- COM1 (Frequency + Channel)
-- =========================================================

add_text_with_opacity(
    "COM1:",
    AlignLeft,
    0.125,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "LeftLeft"
)

textParamWithOpacity(
    AlignLeft + 0.55,
    0.125,
    "JF39_LCP",
    "JF17_COM1_FREQ",
    "%0.3f",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)

-- Added COM1 Channel display further to the right
textParamWithOpacity(
    AlignLeft + 1.25,
    0.125,
    "JF39_LCP",
    "JF17_COM1_CHAN",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)


add_text_with_opacity(
    "--------------------",
    AlignLeft,
    -0.065,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "LeftLeft"
)


-- =========================================================
-- COM2 (Frequency + Channel)
-- =========================================================

add_text_with_opacity(
    "COM2:",
    AlignLeft,
    -0.25,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "LeftLeft"
)

textParamWithOpacity(
    AlignLeft + 0.55,
    -0.25,
    "JF39_LCP",
    "JF17_COM2_FREQ",
    "%0.3f",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)

-- Added COM2 Channel display further to the right
textParamWithOpacity(
    AlignLeft + 1.25,
    -0.25,
    "JF39_LCP",
    "JF17_COM2_CHAN",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)

-- =========================================================
-- DLINK (Data Link) Status
-- =========================================================
add_text_with_opacity(
    "DLNK:",
    AlignLeft,
    -0.35,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "LeftLeft"
)

textParamWithOpacity(
     AlignLeft + 0.55,
    -0.35,
    "JF39_LCP",
    "JF17_DATALINK",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "LeftLeft"
)

-- =========================================================
-- COM1 Status
-- =========================================================
add_text_with_opacity(
    "COM1",
    -0.75,
    -0.60,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
    -0.75,
    -0.70,
    "JF39_LCP",
    "JF17_COM1_STAT",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)


-- =========================================================
-- COM1 Volume
-- =========================================================
add_text_with_opacity(
    "VOL1",
    -0.38,
    -0.60,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
    -0.38,
    -0.70,
    "JF39_LCP",
    "JF17_COM1_VOL",
    "%.0f%%",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)

-- =========================================================
-- COM2 Status
-- =========================================================
add_text_with_opacity(
    "COM2",
    -0.00,
    -0.60,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
    -0.00,
    -0.70,
    "JF39_LCP",
    "JF17_COM2_STAT",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)


-- =========================================================
-- COM2 Volume
-- =========================================================
add_text_with_opacity(
    "VOL2",
     0.38,
    -0.60,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
     0.38,
    -0.70,
    "JF39_LCP",
    "JF17_COM2_VOL",
    "%.0f%%",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)

-- =========================================================
-- Radio Mode
-- =========================================================
add_text_with_opacity(
    "MODE",
     0.75,
    -0.60,
    "JF39_LCP",
    LCP_BASE,
    "Gripen_Font_LCP",
    lcp_strdefs_digit,
    "CenterCenter"
)

textParamWithOpacity(
     0.75,
    -0.70,
    "JF39_LCP",
    "JF17_RADIO_MODE",
    "%s",
    LCP_BASE,
    lcp_strdefs_digit,
    "Gripen_Font_LCP",
    "CenterCenter"
)


----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.5.1                       --
----------------------------------------------------------------------------------------