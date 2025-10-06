dofile(LockOn_Options.script_path.."args_def.lua")

args_initial_state =
{
}

if get_option_value("difficulty.hideStick", "local") then
    args_initial_state[cpt_args.STICK_SHOW_HIDE] = 1.0
end
