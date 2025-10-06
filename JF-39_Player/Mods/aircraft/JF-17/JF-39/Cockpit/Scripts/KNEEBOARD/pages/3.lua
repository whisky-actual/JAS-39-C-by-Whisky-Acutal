dofile(LockOn_Options.script_path .. "KNEEBOARD/kneeboard_defs.lua")

KBDBase          = CreateElement "ceSimple"
KBDBase.name     = "KBDBase"
KBDBase.init_pos = {0, 0}
AddElement(KBDBase)

-- Page for Comm

text_str = {
    -- Title
    {
        init_pos = {KBD_TITLE_X, KBD_TITLE_Y}, value = "PRESET CHANNEL FREQ", align = "CenterCenter", strdefs = KBD_STRINGDEFS_DEF_X15,
    },

    -- Body

}

NUM_X = 5
NUM_Y = 40

LINE_X = {-0.8, -0.4, 0.0, 0.4, 0.8}
l_bias = -0.15

TOP_Y = KBD_TITLE_Y - 0.2

for i=1, NUM_X do
    for j=1, NUM_Y do
        text_str[#(text_str) + 1] = 
        {
            init_pos = {LINE_X[i] + l_bias, TOP_Y - (j - 1) * 0.06}, value = "001 XXX.XXXM", align = "LeftCenter", strdefs = KBD_STRINGDEFS_DEF_X05,
            ctrls = {{"kbd_comm_channel", (j - 1) + (i - 1) * NUM_Y},}, mat = KBD_FONT_D,
        }
    end
end

AddStrTblElements(text_str, KBDBase.name)