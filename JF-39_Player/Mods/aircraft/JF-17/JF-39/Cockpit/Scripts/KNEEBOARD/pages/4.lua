dofile(LockOn_Options.script_path .. "KNEEBOARD/kneeboard_defs.lua")

KBDBase          = CreateElement "ceSimple"
KBDBase.name     = "KBDBase"
KBDBase.init_pos = {0, 0}
AddElement(KBDBase)

-- Page for Comm

text_str = {
    -- Title
    {
        init_pos = {KBD_TITLE_X, KBD_TITLE_Y}, value = "ILS CHANNEL FREQ", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF_X15,
    },

    -- Body

}

NUM_X = 2
NUM_Y = 20

--LINE_X = {-0.8, -0.4, 0.0, 0.4, 0.8}
LINE_X = {-0.5, 0.5}
--l_bias = -0.15
l_bias = 0.0

TOP_Y = KBD_TITLE_Y - 0.2

for i=1, NUM_X do
    for j=1, NUM_Y do
        text_str[#(text_str) + 1] = 
        {
            init_pos = {LINE_X[i] + l_bias, TOP_Y - (j - 1) * 0.06}, value = "01 XXX.XXXMHZ", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF_X08,
            ctrls = {{"kbd_ils_channel", 1 + (j - 1) + (i - 1) * NUM_Y},}, mat = KBD_FONT_D,
        }
    end
end

AddStrTblElements(text_str, KBDBase.name)