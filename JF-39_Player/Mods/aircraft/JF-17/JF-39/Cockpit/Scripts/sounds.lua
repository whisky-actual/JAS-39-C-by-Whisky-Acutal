local snd_count = -1
local function snd_counter()
    snd_count = snd_count + 1
    return snd_count
end

-- btn
SND_BTN_GENERAL_PUSH      = snd_counter()
SND_BTN_GENERAL_RELEASE   = snd_counter()

SND_BTN_AAP_PUSH          = snd_counter()
SND_BTN_AAP_RELEASE       = snd_counter()

SND_BTN_FCS_BIT_PUSH      = snd_counter()
SND_BTN_FCS_BIT_RELEASE   = snd_counter()

SND_BTN_FCS_REC_PUSH      = snd_counter()
SND_BTN_FCS_REC_RELEASE   = snd_counter()

SND_BTN_FCS_RESET_PUSH    = snd_counter()
SND_BTN_FCS_RESET_RELEASE = snd_counter()

SND_BTN_MC_PUSH           = snd_counter()
SND_BTN_MC_RELEASE        = snd_counter()

SND_BTN_PANIC_PUSH        = snd_counter()
SND_BTN_PANIC_RELEASE     = snd_counter()

SND_BTN_MFCD_PUSH         = snd_counter()
SND_BTN_MFCD_RELEASE      = snd_counter()

SND_BTN_UFCP_PUSH         = snd_counter()
SND_BTN_UFCP_RELEASE      = snd_counter()

-- flip
SND_FLIP_A  = snd_counter()
SND_FLIP_B  = snd_counter()

-- grip
SND_GRIP_DOWN = snd_counter()
SND_GRIP_UP   = snd_counter()
SND_GRIP_END  = snd_counter()

-- handle
SND_HANDLE_LG         = snd_counter()
SND_HANDLE_EBRAKE_IN  = snd_counter()
SND_HANDLE_EBRAKE_OUT = snd_counter()

-- knob
SND_KNOB_GENERAL    = snd_counter()
SND_KNOB_CPT_LT_OFF = snd_counter()
SND_KNOB_EXT_LT     = snd_counter()
SND_KNOB_INT_MODE   = snd_counter()

-- sw
SND_SW_GENERAL_NEXT  = snd_counter()
SND_SW_GENERAL_PREV  = snd_counter()
SND_SW_GENERAL_A     = snd_counter()
SND_SW_GENERAL_B     = snd_counter()
SND_SW_GENERAL_C     = snd_counter()
