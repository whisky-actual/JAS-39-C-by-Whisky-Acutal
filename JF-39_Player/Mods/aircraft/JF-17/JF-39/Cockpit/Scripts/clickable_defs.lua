
cursor_mode =
{
    CUMODE_CLICKABLE            = 0,
    CUMODE_CLICKABLE_AND_CAMERA = 1,
    CUMODE_CAMERA               = 2,
};

clickable_mode_initial_status = cursor_mode.CUMODE_CLICKABLE

direction                     = 1
use_pointer_name              = true
cyclic_by_default             = true -- to cycle two-way thumblers or not by default
--[[
anim_speed_default            = 16
anim_speed_def_buttons        = 17
animated_short_way_btns       = false
anim_speed_short_way_btns     = anim_speed_default * 1.5
]]

function default_button(hint_, device_, command_, arg_, arg_val_, arg_lim_, snd_)

    local   arg_val_ = arg_val_ or 1
    local   arg_lim_ = arg_lim_ or {0,1}

    sound_ = {{SND_BTN_GENERAL_PUSH},{SND_BTN_GENERAL_RELEASE}}
    if snd_ then
        sound_ = snd_
    end

    return  {
                class               = {class_type.BTN},
                hint                = hint_,
                device              = device_,
                action              = {command_},
                --stop_action         = {command_}, --need remove duplicated message
                arg                 = {arg_},
                arg_value           = {arg_val_},
                arg_lim             = {arg_lim_},
                use_release_message = {true},

                sound = sound_,
            }
end

function default_push_button(hint_, device_, command_, arg_, arg_val_, arg_lim_, snd_)

    local   arg_val_ = arg_val_ or 1
    local   arg_lim_ = arg_lim_ or {0,1}

    sound_ = {{SND_BTN_GENERAL_PUSH},{SND_BTN_GENERAL_RELEASE}}
    if snd_ then
        sound_ = snd_
    end

    return  {
                class               = {class_type.BTN},
                hint                = hint_,
                device              = device_,
                action              = {command_},
                stop_action         = {command_}, --need remove duplicated message
                arg                 = {arg_},
                arg_value           = {arg_val_},
                arg_lim             = {arg_lim_},
                use_release_message = {true},

                sound = sound_,
            }
end

function default_1_position_tumb(hint_, device_, command_, arg_, arg_val_, arg_lim_)
    local   arg_val_ = arg_val_ or 1
    local   arg_lim_ = arg_lim_ or {0,1}
    return  {
                class       = {class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_},
                arg         = {arg_},
                arg_value   = {arg_val_},
                arg_lim     = {arg_lim_},
                updatable   = true,
                use_OBB     = true
            }
end

function default_2_position_tumb(hint_, device_, command_, arg_, snd_)
    sound_ = {{SND_SW_GENERAL_NEXT},{SND_SW_GENERAL_PREV}}
    if snd_ then
        sound_ = snd_
    end
    return  {
                class       = {class_type.TUMB, class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_, command_},
                arg         = {arg_, arg_},
                arg_value   = {1,-1},
                arg_lim     = {{0,1},{0,1}},
                updatable   = true,
                use_OBB     = true,

                sound = sound_,
            }
end

function default_3_position_tumb(hint_, device_, command_, arg_, cycled_, inversed_, snd_)
    local cycled = true

    local val =  1
    if inversed_ then
          val = -1
    end
    if cycled_ ~= nil then
       cycled = cycled_
    end

    sound_ = {{SND_SW_GENERAL_NEXT},{SND_SW_GENERAL_PREV}}
    if snd_ then
        sound_ = snd_
    end

    return  {
                class       = {class_type.TUMB, class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_, command_},
                arg         = {arg_, arg_},
                arg_value   = {val, -val},
                arg_lim     = {{-1,1}, {-1,1}},
                updatable   = true,
                use_OBB     = true,
                cycle       = cycled,

                sound = sound_,
            }
end

function default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_)

    local default = default_ or 1
    local gain = gain_ or 0.1
    local updatable = updatable_ or false
    local relative  = relative_ or false

    return  {
                class       = {class_type.LEV},
                hint        = hint_,
                device      = device_,
                action      = {command_},
                arg         = {arg_},
                arg_value   = {default},
                arg_lim     = {{0,1}},
                updatable   = updatable,
                use_OBB     = true,
                gain        = {gain},
                relative    = {relative},
            }
end

function default_axis_cycle(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_)

    local default = default_ or 1
    local gain = gain_ or 0.1
    local updatable = updatable_ or false
    local relative  = relative_ or false

    return  {
                class       = {class_type.LEV},
                hint        = hint_,
                device      = device_,
                action      = {command_},
                arg         = {arg_},
                arg_value   = {default},
                arg_lim     = {{0,1}},
                updatable   = updatable,
                use_OBB     = true,
                gain        = {gain},
                relative    = {relative},
                cycle       = true,
            }
end

function default_movable_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_)

    local default = default_ or 1
    local gain = gain_ or 0.1
    local updatable = updatable_ or false
    local relative  = relative_ or false

    return  {
                class       = {class_type.MOVABLE_LEV},
                hint        = hint_,
                device      = device_,
                action      = {command_},
                arg         = {arg_},
                arg_value   = {default},
                arg_lim     = {{0,1}},
                updatable   = updatable,
                use_OBB     = true,
                gain        = {gain},
                relative    = {relative},
            }
end

function default_axis_limited(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, arg_lim_)

    local relative = false
    local default = default_ or 0
    local updatable = updatable_ or false
    if relative_ ~= nil then
        relative = relative_
    end

    local gain = gain_ or 0.1
    return  {
                class       = {class_type.LEV},
                hint        = hint_,
                device      = device_,
                action      = {command_},
                arg         = {arg_},
                arg_value   = {default},
                arg_lim     = {arg_lim_},
                updatable   = updatable,
                use_OBB     = false,
                gain        = {gain},
                relative    = {relative},
                cycle       = false,
            }
end


function multiposition_switch(hint_, device_, command_, arg_, count_, delta_, inversed_, min_, snd_)
    local min_   = min_ or 0
    local delta_ = delta_ or 0.5

    local inversed = 1
    if    inversed_ then
        inversed = -1
    end

    sound_ = {{SND_KNOB_GENERAL},{SND_KNOB_GENERAL}}
    if snd_ then
        sound_ = snd_
    end

    return  {
                class       = {class_type.TUMB, class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_, command_},
                arg         = {arg_, arg_},
                arg_value   = {-delta_ * inversed, delta_ * inversed},
                arg_lim     = {{min_, min_ + delta_ * (count_ -1)},
                               {min_, min_ + delta_ * (count_ -1)}},
                updatable   = true,
                use_OBB     = true,

                sound = sound_,
            }
end

function multiposition_switch_limited(hint_, device_, command_, arg_, count_, delta_, inversed_, min_, snd_)
    local min_   = min_ or 0
    local delta_ = delta_ or 0.5

    local inversed = 1
    if    inversed_ then
        inversed = -1
    end

    sound_ = {{SND_KNOB_GENERAL},{SND_KNOB_GENERAL}}
    if snd_ then
        sound_ = snd_
    end

    return  {
                class       = {class_type.TUMB, class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_, command_},
                arg         = {arg_, arg_},
                arg_value   = {-delta_ * inversed, delta_ * inversed},
                arg_lim     = {{min_, min_ + delta_ * (count_ -1)},
                               {min_, min_ + delta_ * (count_ -1)}},
                updatable   = true,
                use_OBB     = true,
                cycle       = false,

                sound = sound_,
            }
end

function default_button_axis(hint_, device_,command_1, command_2, arg_1, arg_2, limit_1, limit_2)
    local limit_1_   = limit_1 or 1.0
    local limit_2_   = limit_2 or 1.0
    return {
                class               = {class_type.BTN, class_type.LEV},
                hint                = hint_,
                device              = device_,
                action              = {command_1, command_2},
                stop_action         = {command_1, 0},
                arg                 = {arg_1, arg_2},
                arg_value           = {1, 0.5},
                arg_lim             = {{0, limit_1_}, {0,limit_2_}},
                animated            = {false,true},
                animation_speed     = {0, 0.4},
                gain                = {0, 0.1},
                relative            = {false, false},
                updatable           = true,
                use_OBB             = true,
                use_release_message = {true, false}
           }
end

function default_animated_lever(hint_, device_, command_, arg_, animation_speed_,arg_lim_)
    local arg_lim__ = arg_lim_ or {0.0,1.0}
    return {
                class           = {class_type.TUMB, class_type.TUMB},
                hint            = hint_,
                device          = device_,
                action          = {command_, command_},
                arg             = {arg_, arg_},
                arg_value       = {1, 0},
                arg_lim         = {arg_lim__, arg_lim__},
                updatable       = true,
                gain            = {0.1, 0.1},
                animated        = {true, true},
                animation_speed = {animation_speed_, 0},
                cycle = true
           }
end

function default_button_tumb(hint_, device_, command1_, command2_, arg_)
    return {
                class               = {class_type.BTN, class_type.TUMB},
                hint                = hint_,
                device              = device_,
                action              = {command1_, command2_},
                stop_action         = {command1_, 0},
                arg                 = {arg_, arg_},
                arg_value           = {-1, 1},
                arg_lim             = {{-1,0}, {0,1}},
                updatable           = true,
                use_OBB             = true,
                use_release_message = {true,false}
           }
end

function FCS_Tumb(hint_, device_, command1_, command2_, arg_)
    return {
                class         = {class_type.TUMB,class_type.TUMB},
                hint          = hint_,
                device        = device_,
                action        = {command1_,command2_},
                arg           = {arg_, arg_},
                arg_value     = {-0.5,0.5},
                arg_lim       = {{0,1},{0,1}},
                cycle         = false
           }
end

function default_basic_Lever(hint_, device_, command1_, arg_)
    return {
                class      = {class_type.LEV,class_type.LEV},
                hint       = hint_,
                device     = device_,
                action     = {command1_,    command1_},
                arg        = {arg_,arg_},
                arg_value  = {0.05},
                arg_lim    = {{0.0, 1.0}}
           }
end

function default_2_way_spring_switch(hint_, device_, command1_, arg_, inversed_, snd_)

    local inversed = 1
    if inversed_ then
        inversed = -1
    end

    sound_ = {{SND_SW_GENERAL_NEXT},{SND_SW_GENERAL_PREV}}
    if snd_ then
        sound_ = snd_
    end

    return {
                class               = {class_type.BTN, class_type.BTN},
                hint                = hint_,
                device              = device_,
                action              = {command1_, command1_},
                stop_action         = {command1_, command1_},
                arg                 = {arg_, arg_},
                arg_value           = {1.0*inversed, -1.0*inversed},
                arg_lim             = {{0.0, 1.0}, {-1.0, 0.0}},
                use_release_message = {true},

                sound = sound_,
           }
end

function default_multiposition_knob(hint_,device_,command_,arg_,count_,delta_,inversed_,min_)
    local min_   = min_ or 0
    local delta_ = delta_ or 0.5

    local inversed = 1
    if inversed_ then
        inversed = -1
    end

    return {
                class       = {class_type.TUMB, class_type.TUMB},
                hint        = hint_,
                device      = device_,
                action      = {command_, command_},
                arg         = {arg_, arg_},
                arg_value   = {-delta_ * inversed,delta_ * inversed},
                arg_lim     = {{min_, min_ + delta_ * (count_ -1)},
                               {min_, min_ + delta_ * (count_ -1)}},
                updatable   = true,
                use_OBB     = true,
                cycle       = true,
           }
end

function intercom_rotate_tumb(hint_, device_,command_1, command_2, arg_1, arg_2)
    return {
                class           = {class_type.TUMB, class_type.TUMB, class_type.LEV},
                hint            = hint_,
                device          = device_,
                action          = {command_1, command_1, command_2},
                arg             = {arg_1, arg_1, arg_2},
                arg_value       = {1, -1, 1},
                arg_lim         = {{0, 1}, {0, 1}, {0,1}},
                --animated        = {false,false,false},
                --animation_speed = {0, 0, 0.5},
                relative        = {false, false, false},
                updatable       = false,
                use_OBB         = false,
                gain            = {1.0, 1.0, 0.1},
                cycle           = false,
           }
end
