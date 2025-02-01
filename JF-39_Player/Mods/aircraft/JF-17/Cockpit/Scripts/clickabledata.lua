dofile(LockOn_Options.script_path.."clickable_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."args_def.lua")

local gettext = require("i_18n")
_ = gettext.translate


elements = {}
-- 0-499 no clickable
-- 500-699 left console
-- 700-899 center front
-- 900-1999 right console


----

elements["PNT_500"] = multiposition_switch_limited(_(cmd_names.PNT_500), devices.WCS, click_cmds.PNT_500, 500, 4, 1.0/3, false, 0.0) -- WCSBACKUP 3档旋钮 SAIU备份开关
elements["PNT_501"] =     default_push_button(_(cmd_names.PNT_501), devices.GEAR, click_cmds.PNT_501, 501) -- 检灯按钮 起落架面板灯光测试按钮
elements["PNT_502"] = default_2_position_tumb(_(cmd_names.PNT_502), devices.GEAR, click_cmds.PNT_502, 502, {{SND_FLIP_A},{SND_FLIP_A}}) -- 起落架超控按钮保护盖
elements["PNT_503"] = default_2_position_tumb(_(cmd_names.PNT_503), devices.GEAR, click_cmds.PNT_503, 503, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- 应急放轮 起落架超控按钮
elements["PNT_504"] =    default_axis_limited(_(cmd_names.PNT_504), devices.GEAR, click_cmds.PNT_504, 504, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- 指示灯亮度
elements["PNT_505"] = default_2_position_tumb(_(cmd_names.PNT_505), devices.GEAR, click_cmds.PNT_505, 505, {{SND_HANDLE_LG},{SND_HANDLE_LG}}) -- 起落架手柄
elements["PNT_505"].animated = {true, true}
elements["PNT_505"].animation_speed = {1.2, 1.2}

elements["PNT_506"] = default_2_position_tumb(_(cmd_names.PNT_506), devices.SMS, click_cmds.PNT_506, 506, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}})-- 地面丢挂载开关 地面允许投放开关
elements["PNT_507"] = default_2_position_tumb(_(cmd_names.PNT_507), devices.SMS, click_cmds.PNT_507, 507, {{SND_FLIP_B},{SND_FLIP_B}})-- panic保险盖
elements["PNT_508"] =     default_push_button(_(cmd_names.PNT_508), devices.SMS, click_cmds.PNT_508, 508, nil, nil, {{SND_BTN_PANIC_PUSH},{SND_BTN_PANIC_RELEASE}})-- panic

--MASTER ARM
elements["PNT_509"] = default_3_position_tumb(_(cmd_names.PNT_509), devices.WCS, click_cmds.PNT_509, 509, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --WCS

--LANDING GEAR
elements["PNT_510"] = default_3_position_tumb(_(cmd_names.PNT_510), devices.GEAR, click_cmds.PNT_510, 510, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --break test on/oFF
elements["PNT_511"] = default_2_position_tumb(_(cmd_names.PNT_511), devices.GEAR, click_cmds.PNT_511, 511, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --break park/morm
elements["PNT_511"].arg_value = {2,-2}
elements["PNT_511"].arg_lim = {{-1,1},{-1,1}}
elements["PNT_512"] = default_3_position_tumb(_(cmd_names.PNT_512), devices.LIGHTS, click_cmds.PNT_512, 512, false, true, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) --3档开关 LAND/OFF/TAXI 着陆/滑行灯开关

elements["PNT_513"] = default_2_position_tumb(_(cmd_names.PNT_513), devices.FCS, click_cmds.PNT_513, 513, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- TEF up/down 襟翼开关
elements["PNT_513"].arg_value = {2,-2}
elements["PNT_513"].arg_lim = {{-1,1},{-1,1}}

--FUEL
elements["PNT_514"] = default_2_position_tumb(_(cmd_names.PNT_514), devices.FUEL, click_cmds.PNT_514, 514, {{SND_FLIP_A},{SND_FLIP_A}})-- FEED油阀保险盖
elements["PNT_515"] = default_2_position_tumb(_(cmd_names.PNT_515), devices.FUEL, click_cmds.PNT_515, 515, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}})-- FEED油阀 on/off
elements["PNT_516"] = default_2_position_tumb(_(cmd_names.PNT_516), devices.FUEL, click_cmds.PNT_516, 516, {{SND_FLIP_A},{SND_FLIP_A}})-- 油阀保险盖
elements["PNT_517"] = default_2_position_tumb(_(cmd_names.PNT_517), devices.FUEL, click_cmds.PNT_517, 517, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}})-- 油阀active /OFF
elements["PNT_518"] = default_2_position_tumb(_(cmd_names.PNT_518), devices.FUEL, click_cmds.PNT_518, 518, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}})-- start油泵 直流电动泵开关

elements["PNT_564"] = default_3_position_tumb(_(cmd_names.PNT_564), devices.FUEL, click_cmds.PNT_564, 564, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- AAR开关

--ENG
elements["PNT_519"] = default_2_position_tumb(_(cmd_names.PNT_519), devices.ENGINE, click_cmds.PNT_519, 519, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- ENG contrl ON/OFF 发动机系统开关
elements["PNT_520"] = default_2_position_tumb(_(cmd_names.PNT_520), devices.ENGINE, click_cmds.PNT_520, 520, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- 发动机空中启动开关
elements["PNT_561"] = default_2_position_tumb(_(cmd_names.PNT_561), devices.ENGINE, click_cmds.PNT_561, 561, {{SND_FLIP_A},{SND_FLIP_A}}) -- 发动机空中启动开关盖
elements["PNT_521"] =     default_push_button(_(cmd_names.PNT_521), devices.ENGINE, click_cmds.PNT_521, 521) -- 发动机地面启动开关
elements["PNT_522"] = default_3_position_tumb(_(cmd_names.PNT_522), devices.ENGINE, click_cmds.PNT_522, 522, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- 发动机工作状态转换开关 作战/作战+训练/训练 三档开关
elements["PNT_523"] = default_2_position_tumb(_(cmd_names.PNT_523), devices.ENGINE, click_cmds.PNT_523, 523, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- SEC发动机电子调节器开关  ON/OFF 备份系统转换开关
elements["PNT_524"] = default_2_position_tumb(_(cmd_names.PNT_524), devices.ENGINE, click_cmds.PNT_524, 524, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- A/B ON/OFF 加力切断开关
elements["PNT_525"] = default_2_position_tumb(_(cmd_names.PNT_525), devices.ENGINE, click_cmds.PNT_525, 525, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- A/SURGE 开关ON/OFF 防喘切断开关
elements["PNT_526"] = default_3_position_tumb(_(cmd_names.PNT_526), devices.ENGINE, click_cmds.PNT_526, 526, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}})

--FCS
elements["PNT_527"] = default_2_position_tumb(_(cmd_names.PNT_527), devices.FCS, click_cmds.PNT_527, 527, {{SND_BTN_FCS_REC_PUSH},{SND_BTN_FCS_REC_RELEASE}}) -- 记录开关
elements["PNT_528"] = default_2_position_tumb(_(cmd_names.PNT_528), devices.FCS, click_cmds.PNT_528, 528, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- EFCS强制开/自动 模拟备份开关
elements["PNT_529"] = default_2_position_tumb(_(cmd_names.PNT_529), devices.FCS, click_cmds.PNT_529, 529, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- 航向/滚转增稳开关
elements["PNT_530"] = default_2_position_tumb(_(cmd_names.PNT_530), devices.FCS, click_cmds.PNT_530, 530, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- 直连模式开关
elements["PNT_531"] = default_2_position_tumb(_(cmd_names.PNT_531), devices.FCS, click_cmds.PNT_531, 531, {{SND_BTN_FCS_BIT_PUSH},{SND_BTN_FCS_BIT_RELEASE}}) -- BIT按钮

elements["PNT_532"] = default_2_way_spring_switch(_(cmd_names.PNT_532), devices.FCS, click_cmds.PNT_532, 532, true, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- YAW配平
elements["PNT_544"] =              default_button(_(cmd_names.PNT_544), devices.FCS, click_cmds.PNT_544, 544, nil, nil, {{SND_BTN_FCS_RESET_PUSH},{SND_BTN_FCS_RESET_RELEASE}}) -- FCS重启按钮
elements["PNT_533"] =     default_2_position_tumb(_(cmd_names.PNT_533), devices.FCS, click_cmds.PNT_533, 533) -- 记录1, 不用 飞行测试接口开关
elements["PNT_534"] =     default_2_position_tumb(_(cmd_names.PNT_534), devices.FCS, click_cmds.PNT_534, 534) -- 记录2, 不用
elements["PNT_535"] =     default_2_position_tumb(_(cmd_names.PNT_535), devices.FCS, click_cmds.PNT_535, 535, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- AG1/AG2切换开关
elements["PNT_536"] =     default_2_position_tumb(_(cmd_names.PNT_536), devices.FCS, click_cmds.PNT_536, 536, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- AA/AG切换开关

--MISC
elements["PNT_537"] = default_2_position_tumb(_(cmd_names.PNT_537), devices.MISC, click_cmds.PNT_537, 537, {{SND_FLIP_B},{SND_FLIP_B}}) -- 信号弹发射保险盖
elements["PNT_538"] =     default_push_button(_(cmd_names.PNT_538), devices.MISC, click_cmds.PNT_538, 538, nil, nil, {{SND_BTN_PANIC_PUSH},{SND_BTN_PANIC_RELEASE}}) -- 信号弹发射按钮
elements["PNT_539"] = default_2_position_tumb(_(cmd_names.PNT_539), devices.MISC, click_cmds.PNT_539, 539, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- 应急液压泵开关
elements["PNT_540"] = default_2_position_tumb(_(cmd_names.PNT_540), devices.MISC, click_cmds.PNT_540, 540, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- SHARS捷联航姿开关
elements["PNT_563"] = default_2_position_tumb(_(cmd_names.PNT_563), devices.MISC, click_cmds.PNT_563, 563, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- P.H. 检测

elements["PNT_541"] = default_2_position_tumb(_(cmd_names.PNT_541), devices.ZCP, click_cmds.PNT_541, 541, {{SND_SW_GENERAL_B},{SND_SW_GENERAL_B}}) -- 弹射座椅启动销秘
elements["PNT_542"] = default_2_position_tumb(_(cmd_names.PNT_542), devices.ZCP, click_cmds.PNT_542, 542, {{SND_FLIP_B},{SND_FLIP_B}}) -- 销秘控制按钮盖
elements["PNT_543"] =     default_push_button(_(cmd_names.PNT_543), devices.ZCP, click_cmds.PNT_543, 543, nil, nil, {{SND_BTN_PANIC_PUSH},{SND_BTN_PANIC_RELEASE}}) -- 销秘控制按钮

elements["PNT_562"] = default_2_position_tumb(_(cmd_names.PNT_562), devices.MISC, click_cmds.PNT_562, 562) -- CSS手柄

--COMM
elements["PNT_545"] =         default_axis_limited(_(cmd_names.PNT_545), devices.INTERCOM, click_cmds.PNT_545, 545)
elements["PNT_546"] =      default_2_position_tumb(_(cmd_names.PNT_546), devices.INTERCOM, click_cmds.PNT_546, 546)
elements["PNT_547"] = multiposition_switch_limited(_(cmd_names.PNT_547), devices.INTERCOM, click_cmds.PNT_547, 547, 6, 1.0/5, false, 0.0)
elements["PNT_548"] =          default_push_button(_(cmd_names.PNT_548), devices.INTERCOM, click_cmds.PNT_548, 548)

elements["PNT_549"] = default_push_button(_(cmd_names.PNT_549), devices.INTERCOM, click_cmds.PNT_549, 549)
elements["PNT_550"] = default_push_button(_(cmd_names.PNT_550), devices.INTERCOM, click_cmds.PNT_550, 550)
elements["PNT_551"] = default_push_button(_(cmd_names.PNT_551), devices.INTERCOM, click_cmds.PNT_551, 551)
elements["PNT_552"] = default_push_button(_(cmd_names.PNT_552), devices.INTERCOM, click_cmds.PNT_552, 552)
elements["PNT_553"] = default_push_button(_(cmd_names.PNT_553), devices.INTERCOM, click_cmds.PNT_553, 553)
elements["PNT_554"] = default_push_button(_(cmd_names.PNT_554), devices.INTERCOM, click_cmds.PNT_554, 554)
elements["PNT_555"] = default_push_button(_(cmd_names.PNT_555), devices.INTERCOM, click_cmds.PNT_555, 555)
elements["PNT_556"] = default_push_button(_(cmd_names.PNT_556), devices.INTERCOM, click_cmds.PNT_556, 556)
elements["PNT_557"] = default_push_button(_(cmd_names.PNT_557), devices.INTERCOM, click_cmds.PNT_557, 557)
elements["PNT_558"] = default_push_button(_(cmd_names.PNT_558), devices.INTERCOM, click_cmds.PNT_558, 558)
elements["PNT_559"] = default_push_button(_(cmd_names.PNT_559), devices.INTERCOM, click_cmds.PNT_559, 559)
elements["PNT_560"] = default_push_button(_(cmd_names.PNT_560), devices.INTERCOM, click_cmds.PNT_560, 560)

-- 补充

elements["PNT_570"] = default_axis_limited(_(cmd_names.PNT_570), devices.ENGINE, click_cmds.PNT_570, 570)
elements["PNT_571"] = default_push_button(_(cmd_names.PNT_571),  devices.ENGINE, click_cmds.PNT_571, 571)
elements["PNT_572"] = default_push_button(_(cmd_names.PNT_572),  devices.ENGINE, click_cmds.PNT_572, 572)
elements["PNT_573"] = default_2_position_tumb(_(cmd_names.PNT_573),  devices.ENGINE, click_cmds.PNT_573, 573)


-- UFCP
elements["PNT_700"] = default_push_button(_(cmd_names.PNT_700), devices.UFCP, click_cmds.PNT_700, 700, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_701"] = default_push_button(_(cmd_names.PNT_701), devices.UFCP, click_cmds.PNT_701, 701, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_702"] = default_push_button(_(cmd_names.PNT_702), devices.UFCP, click_cmds.PNT_702, 702, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_703"] = default_push_button(_(cmd_names.PNT_703), devices.UFCP, click_cmds.PNT_703, 703, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_704"] = default_push_button(_(cmd_names.PNT_704), devices.UFCP, click_cmds.PNT_704, 704, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_705"] = default_push_button(_(cmd_names.PNT_705), devices.UFCP, click_cmds.PNT_705, 705, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_706"] = default_push_button(_(cmd_names.PNT_706), devices.UFCP, click_cmds.PNT_706, 706, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_707"] = default_push_button(_(cmd_names.PNT_707), devices.UFCP, click_cmds.PNT_707, 707, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_708"] = default_push_button(_(cmd_names.PNT_708), devices.UFCP, click_cmds.PNT_708, 708, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_709"] = default_push_button(_(cmd_names.PNT_709), devices.UFCP, click_cmds.PNT_709, 709, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_710"] = default_push_button(_(cmd_names.PNT_710), devices.UFCP, click_cmds.PNT_710, 710, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_711"] = default_push_button(_(cmd_names.PNT_711), devices.UFCP, click_cmds.PNT_711, 711, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_712"] = default_push_button(_(cmd_names.PNT_712), devices.UFCP, click_cmds.PNT_712, 712, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_713"] = default_push_button(_(cmd_names.PNT_713), devices.UFCP, click_cmds.PNT_713, 713, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_714"] = default_push_button(_(cmd_names.PNT_714), devices.UFCP, click_cmds.PNT_714, 714, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_715"] = default_push_button(_(cmd_names.PNT_715), devices.UFCP, click_cmds.PNT_715, 715, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_716"] = default_push_button(_(cmd_names.PNT_716), devices.UFCP, click_cmds.PNT_716, 716, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_717"] = default_push_button(_(cmd_names.PNT_717), devices.UFCP, click_cmds.PNT_717, 717, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_718"] = default_push_button(_(cmd_names.PNT_718), devices.UFCP, click_cmds.PNT_718, 718, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_719"] = default_push_button(_(cmd_names.PNT_719), devices.UFCP, click_cmds.PNT_719, 719, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_720"] = default_push_button(_(cmd_names.PNT_720), devices.UFCP, click_cmds.PNT_720, 720, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_721"] = default_push_button(_(cmd_names.PNT_721), devices.UFCP, click_cmds.PNT_721, 721, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_722"] = default_push_button(_(cmd_names.PNT_722), devices.UFCP, click_cmds.PNT_722, 722, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_723"] = default_push_button(_(cmd_names.PNT_723), devices.UFCP, click_cmds.PNT_723, 723, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_724"] = default_push_button(_(cmd_names.PNT_724), devices.UFCP, click_cmds.PNT_724, 724, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_725"] = default_push_button(_(cmd_names.PNT_725), devices.UFCP, click_cmds.PNT_725, 725, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_726"] = default_push_button(_(cmd_names.PNT_726), devices.UFCP, click_cmds.PNT_726, 726, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})
elements["PNT_727"] = default_push_button(_(cmd_names.PNT_727), devices.UFCP, click_cmds.PNT_727, 727, nil, nil, {{SND_BTN_UFCP_PUSH},{SND_BTN_UFCP_RELEASE}})


-- default_axis_limited(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, arg_lim_)
elements["PNT_728"] = default_axis_limited(_(cmd_names.PNT_728), devices.UFCP, click_cmds.PNT_728, 728, 0.5, nil, true, nil, {{0,1.0},{0,1.0}}) -- HUD对比度调节旋钮
elements["PNT_729"] = default_axis_limited(_(cmd_names.PNT_729), devices.UFCP, click_cmds.PNT_729, 729, 0.5, nil, true, nil, {{0,1.0},{0,1.0}}) -- HUD亮度调节旋钮
elements["PNT_730"] = default_2_way_spring_switch(_(cmd_names.PNT_730), devices.UFCP, click_cmds.PNT_730, 730, false) --3档 + . - 瞬态步进开关
elements["PNT_731"] = default_axis_limited(_(cmd_names.PNT_731), devices.UFCP, click_cmds.PNT_731, 731, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- HUD备用光栅
elements["PNT_732"] = default_axis_limited(_(cmd_names.PNT_732), devices.UFCP, click_cmds.PNT_732, 732, 0, nil, true, nil, {{0,1.0},{0,1.0}}) --UFCP亮度调节旋钮


--elements["PNT_733"] = default_2_way_spring_switch(_("Deploy/Jettison Parachute"), devices.FCS, click_cmds.PNT_733, 733, false) -- 减速伞开关
elements["PNT_733"] = default_3_position_tumb(_(cmd_names.PNT_733), devices.FCS, click_cmds.PNT_733, 733, false, true) -- 减速伞开关


-- Left MFCD
--default_button(hint_,device_,command_,arg_,arg_val_,arg_lim_)
elements["PNT_734"] = default_push_button(_(cmd_names.PNT_734), devices.MFCD, click_cmds.PNT_734, 734, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_735"] = default_push_button(_(cmd_names.PNT_735), devices.MFCD, click_cmds.PNT_735, 735, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_736"] = default_push_button(_(cmd_names.PNT_736), devices.MFCD, click_cmds.PNT_736, 736, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_737"] = default_push_button(_(cmd_names.PNT_737), devices.MFCD, click_cmds.PNT_737, 737, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_738"] = default_push_button(_(cmd_names.PNT_738), devices.MFCD, click_cmds.PNT_738, 738, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_739"] = default_push_button(_(cmd_names.PNT_739), devices.MFCD, click_cmds.PNT_739, 739, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_740"] = default_push_button(_(cmd_names.PNT_740), devices.MFCD, click_cmds.PNT_740, 740, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_741"] = default_2_position_tumb(_(cmd_names.PNT_741), devices.MFCD, click_cmds.PNT_741, 741)
elements["PNT_742"] = default_push_button(_(cmd_names.PNT_742), devices.MFCD, click_cmds.PNT_742, 742, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_743"] = default_push_button(_(cmd_names.PNT_743), devices.MFCD, click_cmds.PNT_743, 743, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_744"] = default_push_button(_(cmd_names.PNT_744), devices.MFCD, click_cmds.PNT_744, 744, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_745"] = default_push_button(_(cmd_names.PNT_745), devices.MFCD, click_cmds.PNT_745, 745, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_746"] = default_push_button(_(cmd_names.PNT_746), devices.MFCD, click_cmds.PNT_746, 746, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_747"] = default_push_button(_(cmd_names.PNT_747), devices.MFCD, click_cmds.PNT_747, 747, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_748"] = default_push_button(_(cmd_names.PNT_748), devices.MFCD, click_cmds.PNT_748, 748, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_749"] = default_push_button(_(cmd_names.PNT_749), devices.MFCD, click_cmds.PNT_749, 749, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_750"] = default_push_button(_(cmd_names.PNT_750), devices.MFCD, click_cmds.PNT_750, 750, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_751"] = default_push_button(_(cmd_names.PNT_751), devices.MFCD, click_cmds.PNT_751, 751, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_752"] = default_push_button(_(cmd_names.PNT_752), devices.MFCD, click_cmds.PNT_752, 752, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_753"] = default_push_button(_(cmd_names.PNT_753), devices.MFCD, click_cmds.PNT_753, 753, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_754"] = default_push_button(_(cmd_names.PNT_754), devices.MFCD, click_cmds.PNT_754, 754, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_755"] = default_push_button(_(cmd_names.PNT_755), devices.MFCD, click_cmds.PNT_755, 755, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_756"] = default_push_button(_(cmd_names.PNT_756), devices.MFCD, click_cmds.PNT_756, 756, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_757"] = default_push_button(_(cmd_names.PNT_757), devices.MFCD, click_cmds.PNT_757, 757, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_758"] = default_push_button(_(cmd_names.PNT_758), devices.MFCD, click_cmds.PNT_758, 758, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_759"] = default_push_button(_(cmd_names.PNT_759), devices.MFCD, click_cmds.PNT_759, 759, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_760"] = default_push_button(_(cmd_names.PNT_760), devices.MFCD, click_cmds.PNT_760, 760, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_761"] = default_push_button(_(cmd_names.PNT_761), devices.MFCD, click_cmds.PNT_761, 761, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_762"] = default_push_button(_(cmd_names.PNT_762), devices.MFCD, click_cmds.PNT_762, 762, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_763"] = default_push_button(_(cmd_names.PNT_763), devices.MFCD, click_cmds.PNT_763, 763, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_764"] = default_push_button(_(cmd_names.PNT_764), devices.MFCD, click_cmds.PNT_764, 764, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_765"] = default_push_button(_(cmd_names.PNT_765), devices.MFCD, click_cmds.PNT_765, 765, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_766"] = default_push_button(_(cmd_names.PNT_766), devices.MFCD, click_cmds.PNT_766, 766, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_758"] = default_axis_limited(_(cmd_names.PNT_758), devices.MFCD, click_cmds.PNT_758, 758, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_759"] = default_axis_limited(_(cmd_names.PNT_759), devices.MFCD, click_cmds.PNT_759, 759,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_765"] = default_axis_limited(_(cmd_names.PNT_765), devices.MFCD, click_cmds.PNT_765, 765, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_766"] = default_axis_limited(_(cmd_names.PNT_766), devices.MFCD, click_cmds.PNT_766, 766,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
-- end of Left MFCD
--[[
-- Center MFCD
elements["PNT_767"] = default_push_button(_(cmd_names.PNT_767), devices.MFCD, click_cmds.PNT_767, 767, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_768"] = default_push_button(_(cmd_names.PNT_768), devices.MFCD, click_cmds.PNT_768, 768, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_769"] = default_push_button(_(cmd_names.PNT_769), devices.MFCD, click_cmds.PNT_769, 769, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_770"] = default_push_button(_(cmd_names.PNT_770), devices.MFCD, click_cmds.PNT_770, 770, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_771"] = default_push_button(_(cmd_names.PNT_771), devices.MFCD, click_cmds.PNT_771, 771, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_772"] = default_push_button(_(cmd_names.PNT_772), devices.MFCD, click_cmds.PNT_772, 772, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_773"] = default_push_button(_(cmd_names.PNT_773), devices.MFCD, click_cmds.PNT_773, 773, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_774"] = default_2_position_tumb(_(cmd_names.PNT_774), devices.MFCD, click_cmds.PNT_774, 774)
elements["PNT_775"] = default_push_button(_(cmd_names.PNT_775), devices.MFCD, click_cmds.PNT_775, 775, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_776"] = default_push_button(_(cmd_names.PNT_776), devices.MFCD, click_cmds.PNT_776, 776, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_777"] = default_push_button(_(cmd_names.PNT_777), devices.MFCD, click_cmds.PNT_777, 777, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_778"] = default_push_button(_(cmd_names.PNT_778), devices.MFCD, click_cmds.PNT_778, 778, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_779"] = default_push_button(_(cmd_names.PNT_779), devices.MFCD, click_cmds.PNT_779, 779, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_780"] = default_push_button(_(cmd_names.PNT_780), devices.MFCD, click_cmds.PNT_780, 780, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_781"] = default_push_button(_(cmd_names.PNT_781), devices.MFCD, click_cmds.PNT_781, 781, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_782"] = default_push_button(_(cmd_names.PNT_782), devices.MFCD, click_cmds.PNT_782, 782, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_783"] = default_push_button(_(cmd_names.PNT_783), devices.MFCD, click_cmds.PNT_783, 783, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_784"] = default_push_button(_(cmd_names.PNT_784), devices.MFCD, click_cmds.PNT_784, 784, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_785"] = default_push_button(_(cmd_names.PNT_785), devices.MFCD, click_cmds.PNT_785, 785, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_786"] = default_push_button(_(cmd_names.PNT_786), devices.MFCD, click_cmds.PNT_786, 786, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_787"] = default_push_button(_(cmd_names.PNT_787), devices.MFCD, click_cmds.PNT_787, 787, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_788"] = default_push_button(_(cmd_names.PNT_788), devices.MFCD, click_cmds.PNT_788, 788, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_789"] = default_push_button(_(cmd_names.PNT_789), devices.MFCD, click_cmds.PNT_789, 789, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_790"] = default_push_button(_(cmd_names.PNT_790), devices.MFCD, click_cmds.PNT_790, 790, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_791"] = default_push_button(_(cmd_names.PNT_791), devices.MFCD, click_cmds.PNT_791, 791, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_792"] = default_push_button(_(cmd_names.PNT_792), devices.MFCD, click_cmds.PNT_792, 792, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_793"] = default_push_button(_(cmd_names.PNT_793), devices.MFCD, click_cmds.PNT_793, 793, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_794"] = default_push_button(_(cmd_names.PNT_794), devices.MFCD, click_cmds.PNT_794, 794, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_795"] = default_push_button(_(cmd_names.PNT_795), devices.MFCD, click_cmds.PNT_795, 795, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_796"] = default_push_button(_(cmd_names.PNT_796), devices.MFCD, click_cmds.PNT_796, 796, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_797"] = default_push_button(_(cmd_names.PNT_797), devices.MFCD, click_cmds.PNT_797, 797, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_798"] = default_push_button(_(cmd_names.PNT_798), devices.MFCD, click_cmds.PNT_798, 798, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_799"] = default_push_button(_(cmd_names.PNT_799), devices.MFCD, click_cmds.PNT_799, 799, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_796"] = default_axis_limited(_(cmd_names.PNT_796), devices.MFCD, click_cmds.PNT_796, 796, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_797"] = default_axis_limited(_(cmd_names.PNT_797), devices.MFCD, click_cmds.PNT_797, 797,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_798"] = default_axis_limited(_(cmd_names.PNT_798), devices.MFCD, click_cmds.PNT_798, 798, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_799"] = default_axis_limited(_(cmd_names.PNT_799), devices.MFCD, click_cmds.PNT_799, 799,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
-- end of Center MFCD

-- Right MFCD
elements["PNT_800"] = default_push_button(_(cmd_names.PNT_800), devices.MFCD, click_cmds.PNT_800, 800, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_801"] = default_push_button(_(cmd_names.PNT_801), devices.MFCD, click_cmds.PNT_801, 801, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_802"] = default_push_button(_(cmd_names.PNT_802), devices.MFCD, click_cmds.PNT_802, 802, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_803"] = default_push_button(_(cmd_names.PNT_803), devices.MFCD, click_cmds.PNT_803, 803, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_804"] = default_push_button(_(cmd_names.PNT_804), devices.MFCD, click_cmds.PNT_804, 804, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_805"] = default_push_button(_(cmd_names.PNT_805), devices.MFCD, click_cmds.PNT_805, 805, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_806"] = default_push_button(_(cmd_names.PNT_806), devices.MFCD, click_cmds.PNT_806, 806, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_807"] = default_2_position_tumb(_(cmd_names.PNT_807), devices.MFCD, click_cmds.PNT_807, 807)
elements["PNT_808"] = default_push_button(_(cmd_names.PNT_808), devices.MFCD, click_cmds.PNT_808, 808, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_809"] = default_push_button(_(cmd_names.PNT_809), devices.MFCD, click_cmds.PNT_809, 809, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_810"] = default_push_button(_(cmd_names.PNT_810), devices.MFCD, click_cmds.PNT_810, 810, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_811"] = default_push_button(_(cmd_names.PNT_811), devices.MFCD, click_cmds.PNT_811, 811, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_812"] = default_push_button(_(cmd_names.PNT_812), devices.MFCD, click_cmds.PNT_812, 812, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_813"] = default_push_button(_(cmd_names.PNT_813), devices.MFCD, click_cmds.PNT_813, 813, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_814"] = default_push_button(_(cmd_names.PNT_814), devices.MFCD, click_cmds.PNT_814, 814, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_815"] = default_push_button(_(cmd_names.PNT_815), devices.MFCD, click_cmds.PNT_815, 815, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_816"] = default_push_button(_(cmd_names.PNT_816), devices.MFCD, click_cmds.PNT_816, 816, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_817"] = default_push_button(_(cmd_names.PNT_817), devices.MFCD, click_cmds.PNT_817, 817, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_818"] = default_push_button(_(cmd_names.PNT_818), devices.MFCD, click_cmds.PNT_818, 818, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_819"] = default_push_button(_(cmd_names.PNT_819), devices.MFCD, click_cmds.PNT_819, 819, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_820"] = default_push_button(_(cmd_names.PNT_820), devices.MFCD, click_cmds.PNT_820, 820, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_821"] = default_push_button(_(cmd_names.PNT_821), devices.MFCD, click_cmds.PNT_821, 821, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_822"] = default_push_button(_(cmd_names.PNT_822), devices.MFCD, click_cmds.PNT_822, 822, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_823"] = default_push_button(_(cmd_names.PNT_823), devices.MFCD, click_cmds.PNT_823, 823, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_824"] = default_push_button(_(cmd_names.PNT_824), devices.MFCD, click_cmds.PNT_824, 824, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_825"] = default_push_button(_(cmd_names.PNT_825), devices.MFCD, click_cmds.PNT_825, 825, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_826"] = default_push_button(_(cmd_names.PNT_826), devices.MFCD, click_cmds.PNT_826, 826, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_827"] = default_push_button(_(cmd_names.PNT_827), devices.MFCD, click_cmds.PNT_827, 827, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_828"] = default_push_button(_(cmd_names.PNT_828), devices.MFCD, click_cmds.PNT_828, 828, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_829"] = default_push_button(_(cmd_names.PNT_829), devices.MFCD, click_cmds.PNT_829, 829, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_830"] = default_push_button(_(cmd_names.PNT_830), devices.MFCD, click_cmds.PNT_830, 830, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_831"] = default_push_button(_(cmd_names.PNT_831), devices.MFCD, click_cmds.PNT_831, 831, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_832"] = default_push_button(_(cmd_names.PNT_832), devices.MFCD, click_cmds.PNT_832, 832, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_829"] = default_axis_limited(_(cmd_names.PNT_829), devices.MFCD, click_cmds.PNT_829, 829, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_830"] = default_axis_limited(_(cmd_names.PNT_830), devices.MFCD, click_cmds.PNT_830, 830,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_831"] = default_axis_limited(_(cmd_names.PNT_831), devices.MFCD, click_cmds.PNT_831, 831, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_832"] = default_axis_limited(_(cmd_names.PNT_832), devices.MFCD, click_cmds.PNT_832, 832,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
-- end of Right MFCD
]]--

--elements["PNT_840"] = default_axis_limited(_(cmd_names.PNT_840), devices.ADC, click_cmds.PNT_840, 840, 0.5, 0.002, true, nil, {{0,1.0},{0,1.0}})
elements["PNT_840"] = default_axis_cycle  (_(cmd_names.PNT_840), devices.ADC,  click_cmds.PNT_840, 840, 0.5, 0.05, true, true)
elements["PNT_841"] = default_axis_limited(_(cmd_names.PNT_841), devices.GEAR, click_cmds.PNT_841, 841, 0.0, 0.05, true, nil, {{0,1.0},{0,1.0}})

elements["PNT_842"] = default_push_button(_(cmd_names.PNT_842), devices.WARNING_SYSTEM, click_cmds.PNT_842, 842, nil, nil, {{SND_BTN_MC_PUSH},{SND_BTN_MC_RELEASE}})
elements["PNT_843"] = default_push_button(_(cmd_names.PNT_843), devices.WARNING_SYSTEM, click_cmds.PNT_843, 843, nil, nil, {{SND_BTN_MC_PUSH},{SND_BTN_MC_RELEASE}})
elements["PNT_844"] = default_push_button(_(cmd_names.PNT_844), devices.WARNING_SYSTEM, click_cmds.PNT_844, 844, nil, nil, {{SND_BTN_MC_PUSH},{SND_BTN_MC_RELEASE}})

-- Clock
elements["PNT_845"] = default_2_position_tumb(_(cmd_names.PNT_845), devices.CLOCK, click_cmds.PNT_845, 845) -- 数字时钟开关
elements["PNT_846"] =     default_push_button(_(cmd_names.PNT_846), devices.CLOCK, click_cmds.PNT_846, 846) -- 数字时钟亮度+
elements["PNT_847"] =     default_push_button(_(cmd_names.PNT_847), devices.CLOCK, click_cmds.PNT_847, 847) -- 数字时钟亮度-
elements["PNT_848"] =     default_push_button(_(cmd_names.PNT_848), devices.CLOCK, click_cmds.PNT_848, 848) -- 数字时钟UTC
elements["PNT_849"] =     default_push_button(_(cmd_names.PNT_849), devices.CLOCK, click_cmds.PNT_849, 849) -- 数字时钟CHR

-- 告警面板
elements["PNT_900"] = default_2_position_tumb(_(cmd_names.PNT_900), devices.WARNING_SYSTEM, click_cmds.PNT_900, 900) --告警面板灯昼夜开关
elements["PNT_901"] =    default_axis_limited(_(cmd_names.PNT_901), devices.WARNING_SYSTEM, click_cmds.PNT_901, 901, 0, nil, true, nil, {{0,1.0},{0,1.0}}) --告警面板灯亮度调节旋钮
elements["PNT_902"] =     default_push_button(_(cmd_names.PNT_902), devices.WARNING_SYSTEM, click_cmds.PNT_902, 902) --告警面板测试按钮
elements["PNT_903"] =    default_axis_limited(_(cmd_names.PNT_903), devices.WARNING_SYSTEM, click_cmds.PNT_903, 903,0, nil, true, nil, {{0,1.0},{0,1.0}}) --氧气示流器亮度调节旋钮

-- 电力控制面板
elements["PNT_904"] = default_2_position_tumb(_(cmd_names.PNT_904), devices.ELECTRIC_SYSTEM, click_cmds.PNT_904, 904, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --蓄电池开关
elements["PNT_905"] = default_2_position_tumb(_(cmd_names.PNT_905), devices.ELECTRIC_SYSTEM, click_cmds.PNT_905, 905, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --主交流发电机开关
elements["PNT_906"] = default_2_position_tumb(_(cmd_names.PNT_906), devices.ELECTRIC_SYSTEM, click_cmds.PNT_906, 906, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) --直流发电机开关

elements["PNT_907"] = default_2_position_tumb(_(cmd_names.PNT_907), devices.AAP, click_cmds.PNT_907, 907) --whisky.actual@gmail.com
--elements["PNT_907"] = default_push_button(_(cmd_names.PNT_907), devices.AAP, click_cmds.PNT_907, 907, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})--whisky.actual@gmail.com

elements["PNT_908"] = multiposition_switch_limited(_(cmd_names.PNT_908), devices.INS, click_cmds.PNT_908, 908, 4, 1.0/3, false, 0.0, {{SND_KNOB_INT_MODE},{SND_KNOB_INT_MODE}}) --INS 3档旋钮惯导工作模式选择开关

--AAP 航空电子启动板按键
elements["PNT_909"] =    default_axis_limited(_(cmd_names.PNT_909), devices.AAP, click_cmds.PNT_909, 909, 0,  nil, true, nil, {{0,1.0},{0,1.0}})--亮度调节旋钮
elements["PNT_910"] = default_2_position_tumb(_(cmd_names.PNT_910), devices.AAP, click_cmds.PNT_910, 910) --防拥开关
elements["PNT_911"] =     default_push_button(_(cmd_names.PNT_911), devices.AAP, click_cmds.PNT_911, 911, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_912"] =     default_push_button(_(cmd_names.PNT_912), devices.AAP, click_cmds.PNT_912, 912, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_913"] =     default_push_button(_(cmd_names.PNT_913), devices.AAP, click_cmds.PNT_913, 913, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_914"] =     default_push_button(_(cmd_names.PNT_914), devices.AAP, click_cmds.PNT_914, 914, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_915"] =     default_push_button(_(cmd_names.PNT_915), devices.AAP, click_cmds.PNT_915, 915, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})--whisky.actual@gmail.com
elements["PNT_916"] =     default_push_button(_(cmd_names.PNT_916), devices.AAP, click_cmds.PNT_916, 916, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_917"] =     default_push_button(_(cmd_names.PNT_917), devices.AAP, click_cmds.PNT_917, 917, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_918"] =     default_push_button(_(cmd_names.PNT_918), devices.AAP, click_cmds.PNT_918, 918, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_919"] =     default_push_button(_(cmd_names.PNT_919), devices.AAP, click_cmds.PNT_919, 919, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_920"] =     default_push_button(_(cmd_names.PNT_920), devices.AAP, click_cmds.PNT_920, 920, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_921"] =     default_push_button(_(cmd_names.PNT_921), devices.AAP, click_cmds.PNT_921, 921, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_922"] =     default_push_button(_(cmd_names.PNT_922), devices.AAP, click_cmds.PNT_922, 922, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_923"] =     default_push_button(_(cmd_names.PNT_923), devices.AAP, click_cmds.PNT_923, 923, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_924"] =     default_push_button(_(cmd_names.PNT_924), devices.AAP, click_cmds.PNT_924, 924, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_925"] =     default_push_button(_(cmd_names.PNT_925), devices.AAP, click_cmds.PNT_925, 925, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_926"] =     default_push_button(_(cmd_names.PNT_926), devices.AAP, click_cmds.PNT_926, 926, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_927"] =     default_push_button(_(cmd_names.PNT_927), devices.AAP, click_cmds.PNT_927, 927, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_928"] =     default_push_button(_(cmd_names.PNT_928), devices.AAP, click_cmds.PNT_928, 928, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_929"] =     default_push_button(_(cmd_names.PNT_929), devices.AAP, click_cmds.PNT_929, 929, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_930"] =     default_push_button(_(cmd_names.PNT_930), devices.AAP, click_cmds.PNT_930, 930, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_931"] =     default_push_button(_(cmd_names.PNT_931), devices.AAP, click_cmds.PNT_931, 931, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_932"] =     default_push_button(_(cmd_names.PNT_932), devices.AAP, click_cmds.PNT_932, 932, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_933"] =     default_push_button(_(cmd_names.PNT_933), devices.AAP, click_cmds.PNT_933, 933, nil, nil, {{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})

-- ACP
elements["PNT_934"] =    default_axis_limited(_(cmd_names.PNT_934), devices.ACP, click_cmds.PNT_934, 934, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- COM1
elements["PNT_935"] = default_2_position_tumb(_(cmd_names.PNT_935), devices.ACP, click_cmds.PNT_935, 935) -- 机内/外通话控制开关
elements["PNT_936"] = default_2_position_tumb(_(cmd_names.PNT_936), devices.ACP, click_cmds.PNT_936, 936) -- 电台上线天线转换
elements["PNT_937"] = default_2_position_tumb(_(cmd_names.PNT_937), devices.ACP, click_cmds.PNT_937, 937) -- 音响控制盒通道切换天线开关
elements["PNT_938"] =    default_axis_limited(_(cmd_names.PNT_938), devices.ACP, click_cmds.PNT_938, 938, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- COM2电台2音量旋钮
elements["PNT_939"] =    default_axis_limited(_(cmd_names.PNT_939), devices.ACP, click_cmds.PNT_939, 939, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- TCN/ILS
elements["PNT_940"] =    default_axis_limited(_(cmd_names.PNT_940), devices.ACP, click_cmds.PNT_940, 940, 0, nil, true, nil, {{0,1.0},{0,1.0}}) -- MSL 导弹音量旋钮

-- ECS
--elements["PNT_941"] = multiposition_switch_limited(_("Air Temp Knob Selector"), devices.ECS, click_cmds.PNT_941, 941, 12, 1.0/12, false, 0.0) -- 12档旋钮供气温度选择旋钮
elements["PNT_941"] =         multiposition_switch(_(cmd_names.PNT_941), devices.ECS, click_cmds.PNT_941, 941, 12, 1.0/12, false, 0.0) -- 12档旋钮供气温度选择旋钮
elements["PNT_942"] = multiposition_switch_limited(_(cmd_names.PNT_942), devices.ECS, click_cmds.PNT_942, 942, 4, 1.0/3, false, 0.0)   -- 4档旋钮环控系统工作状态选择旋钮
elements["PNT_943"] =          default_push_button(_(cmd_names.PNT_943), devices.ECS, click_cmds.PNT_943, 943) -- 除雾按钮

-- lights
-- INT
elements["PNT_944"] = default_axis_limited(_(cmd_names.PNT_944), devices.LIGHTS, click_cmds.PNT_944, 944, 0,  nil, true, nil, {{0,1.0},{0,1.0}}) -- INST仪表照明旋钮
elements["PNT_945"] = default_axis_limited(_(cmd_names.PNT_945), devices.LIGHTS, click_cmds.PNT_945, 945, 0,  nil, true, nil, {{0,1.0},{0,1.0}}) -- CONSOLE操纵台照明旋钮
elements["PNT_946"] = default_axis_limited(_(cmd_names.PNT_946), devices.LIGHTS, click_cmds.PNT_946, 946, 0,  nil, true, nil, {{0,1.0},{0,1.0}}) -- FLOOD泛光灯旋钮

-- EXT
elements["PNT_947"] =      default_3_position_tumb(_(cmd_names.PNT_947), devices.LIGHTS, click_cmds.PNT_947, 947, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- 3档开关 master 机外主照明开关
elements["PNT_948"] = multiposition_switch_limited(_(cmd_names.PNT_948), devices.LIGHTS, click_cmds.PNT_948, 948, 5, 0.25, false, 0.0) -- 5档旋钮 编队灯旋转开关
elements["PNT_949"] = multiposition_switch_limited(_(cmd_names.PNT_949), devices.LIGHTS, click_cmds.PNT_949, 949, 5, 0.25, false, 0.0) -- 5档旋钮 防撞灯旋转开关
elements["PNT_950"] =      default_3_position_tumb(_(cmd_names.PNT_950), devices.LIGHTS, click_cmds.PNT_950, 950, false, true) -- 3档开关 航行灯亮/暗开关
elements["PNT_951"] =      default_2_position_tumb(_(cmd_names.PNT_951), devices.LIGHTS, click_cmds.PNT_951, 951) -- 2档开关 航行灯稳/闪开关
elements["PNT_951"].arg_value = {2,-2}
elements["PNT_951"].arg_lim = {{-1,1},{-1,1}}
elements["PNT_952"] =      default_3_position_tumb(_(cmd_names.PNT_952), devices.LIGHTS, click_cmds.PNT_952, 952, false, true, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- 3档开关 防撞灯/牵引照明开关

elements["PNT_963"] = default_2_position_tumb(_(cmd_names.PNT_963), devices.LIGHTS, click_cmds.PNT_963, 963, {{SND_SW_GENERAL_C},{SND_SW_GENERAL_C}}) -- 2档开关 AAR灯
elements["PNT_963"].arg_value = {2,-2}
elements["PNT_963"].arg_lim = {{-1,1},{-1,1}}
elements["PNT_964"] =    default_axis_limited(_(cmd_names.PNT_964), devices.LIGHTS, click_cmds.PNT_964, 964, 0,  nil, true, nil, {{0,1.0},{0,1.0}}) -- AAR灯旋钮

-- DTC
elements["PNT_953"] =      default_button(_(cmd_names.PNT_953), devices.DTC, click_cmds.PNT_953, 953)
elements["PNT_974"] = default_push_button(_(cmd_names.PNT_974), devices.DTC, click_cmds.PNT_974, 974)

-- Emergency LG
elements["PNT_954"] =      default_2_position_tumb(_(cmd_names.PNT_954), devices.GEAR, click_cmds.PNT_954, 954)
elements["PNT_955"] = multiposition_switch_limited(_(cmd_names.PNT_955), devices.GEAR, click_cmds.PNT_955, 955, 5, 0.25, false, 0.0)

-- Canopy
elements["PNT_957"] =      default_2_position_tumb(_(cmd_names.PNT_957), devices.FCS, click_cmds.PNT_957, 957)
elements["PNT_958"] = multiposition_switch_limited(_(cmd_names.PNT_958), devices.FCS, click_cmds.PNT_958, 958, 4, 1.0/3, true, 0.0)
elements["PNT_959"] =         default_axis_limited(_(cmd_names.PNT_959),   devices.FCS, click_cmds.PNT_959, 959, 0, 0.01, true, nil, {{0,1.0},{0,1.0}})

-- Flood light direction
elements["PNT_965"] = default_axis_limited(_(cmd_names.PNT_965), devices.LIGHTS, click_cmds.PNT_965, 965, 0, nil, true, nil, {{0,1.0},{0,1.0}})
elements["PNT_966"] = default_axis_limited(_(cmd_names.PNT_966), devices.LIGHTS, click_cmds.PNT_966, 966, 0, nil, true, nil, {{0,1.0},{0,1.0}})
elements["PNT_967"] = default_axis_limited(_(cmd_names.PNT_967), devices.LIGHTS, click_cmds.PNT_967, 967, 0, nil, true, nil, {{0,1.0},{0,1.0}})
elements["PNT_968"] = default_axis_limited(_(cmd_names.PNT_968), devices.LIGHTS, click_cmds.PNT_968, 968, 0, nil, true, nil, {{0,1.0},{0,1.0}})

-- Flash light
elements["PNT_969"] = default_2_position_tumb(_(cmd_names.PNT_969), 0, key_cmds.FlashLight, 969)

-- Stick
elements["PNT_970"] = default_2_position_tumb(_(cmd_names.PNT_970), devices.MISC, click_cmds.PNT_970, cpt_args.STICK_SHOW_HIDE) -- 驾驶杆显示/隐藏

elements["PNT_971"] = default_button(_(cmd_names.PNT_971), devices.EMMC, key_cmds.HOTAS_Stick_S7, cpt_args.STICK_AP_DISENGAGE) -- 断开自动驾驶

-- Eject Seat
elements["PNT_972"] =     default_2_position_tumb(_(cmd_names.PNT_972), devices.MISC, click_cmds.PNT_972, cpt_args.ESEAT_ARM_STARTER)
elements["PNT_973"] =     default_2_position_tumb(_(cmd_names.PNT_973), devices.MISC, click_cmds.PNT_973, cpt_args.ESEAT_ARM_IGNITOR)
elements["PNT_980"] = default_2_way_spring_switch(_(cmd_names.PNT_980), devices.MISC, click_cmds.PNT_980, cpt_args.ESEAT_POS_ADJUST, true)
elements["PNT_981"] =         default_push_button(_(cmd_names.PNT_981), devices.MISC, click_cmds.PNT_981, cpt_args.ESEAT_EJECT_HANDLE)

-- Oxygen
elements["PNT_975"] = default_2_position_tumb(_(cmd_names.PNT_975), devices.OXYGEN, click_cmds.PNT_975, cpt_args.OXYGEN_TUBE_CNT)
elements["PNT_976"] =    default_axis_limited(_(cmd_names.PNT_976), devices.OXYGEN, click_cmds.PNT_976, cpt_args.OXYGEN_SUPPLY_VALVE, 0, nil, true, nil, {{0,1.0},{0,1.0}})
elements["PNT_977"] = default_2_position_tumb(_(cmd_names.PNT_977), devices.OXYGEN, click_cmds.PNT_977, cpt_args.OXYGEN_100_O2)
elements["PNT_978"] = default_2_position_tumb(_(cmd_names.PNT_978), devices.OXYGEN, click_cmds.PNT_978, cpt_args.OXYGEN_SEAT_EMER)
elements["PNT_979"] = default_2_position_tumb(_(cmd_names.PNT_979), devices.OXYGEN, click_cmds.PNT_979, cpt_args.G_SUIT_TUBE_CNT)


-- mirrors
elements["PNT_960"] = default_2_position_tumb(_(cmd_names.PNT_960), 0, key_cmds.MirrorToggle, 960)
elements["PNT_961"] = default_2_position_tumb(_(cmd_names.PNT_961), 0, key_cmds.MirrorToggle, 961)
elements["PNT_962"] = default_2_position_tumb(_(cmd_names.PNT_962), 0, key_cmds.MirrorToggle, 962)


for i,o in pairs(elements) do
    if  o.class[1] == class_type.TUMB or
       (o.class[2]  and o.class[2] == class_type.TUMB) or
       (o.class[3]  and o.class[3] == class_type.TUMB)  then
       o.updatable = true
       o.use_OBB   = true
    end
end
----------------------------------------------------------------------------------------
-- JF-39
----------------------------------------------------------------------------------------
--JF39
--elements["PNT_915"] = default_2_position_tumb(_("HMD ON/OFF"),	devices.JF39, device_commands.JF39_HMD, 915,{0,1},{{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})
elements["PNT_999"] = default_2_position_tumb(_("TAN MFCD"),	devices.JF39, device_commands.JF39_MFCD, 999,{1,0},{{SND_BTN_AAP_PUSH},{SND_BTN_AAP_RELEASE}})

-- Center MFCD
elements["PNT_800"] = default_push_button(_(cmd_names.PNT_767), devices.MFCD, click_cmds.PNT_767, 767, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_801"] = default_push_button(_(cmd_names.PNT_768), devices.MFCD, click_cmds.PNT_768, 768, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_802"] = default_push_button(_(cmd_names.PNT_769), devices.MFCD, click_cmds.PNT_769, 769, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_803"] = default_push_button(_(cmd_names.PNT_770), devices.MFCD, click_cmds.PNT_770, 770, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_804"] = default_push_button(_(cmd_names.PNT_771), devices.MFCD, click_cmds.PNT_771, 771, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_805"] = default_push_button(_(cmd_names.PNT_772), devices.MFCD, click_cmds.PNT_772, 772, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_806"] = default_push_button(_(cmd_names.PNT_773), devices.MFCD, click_cmds.PNT_773, 773, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_807"] = default_2_position_tumb(_(cmd_names.PNT_774), devices.MFCD, click_cmds.PNT_774, 774)
elements["PNT_808"] = default_push_button(_(cmd_names.PNT_775), devices.MFCD, click_cmds.PNT_775, 775, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_809"] = default_push_button(_(cmd_names.PNT_776), devices.MFCD, click_cmds.PNT_776, 776, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_810"] = default_push_button(_(cmd_names.PNT_777), devices.MFCD, click_cmds.PNT_777, 777, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_811"] = default_push_button(_(cmd_names.PNT_778), devices.MFCD, click_cmds.PNT_778, 778, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_812"] = default_push_button(_(cmd_names.PNT_779), devices.MFCD, click_cmds.PNT_779, 779, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_813"] = default_push_button(_(cmd_names.PNT_780), devices.MFCD, click_cmds.PNT_780, 780, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_814"] = default_push_button(_(cmd_names.PNT_781), devices.MFCD, click_cmds.PNT_781, 781, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_815"] = default_push_button(_(cmd_names.PNT_782), devices.MFCD, click_cmds.PNT_782, 782, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_816"] = default_push_button(_(cmd_names.PNT_783), devices.MFCD, click_cmds.PNT_783, 783, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_817"] = default_push_button(_(cmd_names.PNT_784), devices.MFCD, click_cmds.PNT_784, 784, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_818"] = default_push_button(_(cmd_names.PNT_785), devices.MFCD, click_cmds.PNT_785, 785, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_819"] = default_push_button(_(cmd_names.PNT_786), devices.MFCD, click_cmds.PNT_786, 786, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_820"] = default_push_button(_(cmd_names.PNT_787), devices.MFCD, click_cmds.PNT_787, 787, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_821"] = default_push_button(_(cmd_names.PNT_788), devices.MFCD, click_cmds.PNT_788, 788, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_822"] = default_push_button(_(cmd_names.PNT_789), devices.MFCD, click_cmds.PNT_789, 789, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_823"] = default_push_button(_(cmd_names.PNT_790), devices.MFCD, click_cmds.PNT_790, 790, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_824"] = default_push_button(_(cmd_names.PNT_791), devices.MFCD, click_cmds.PNT_791, 791, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_825"] = default_push_button(_(cmd_names.PNT_792), devices.MFCD, click_cmds.PNT_792, 792, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_826"] = default_push_button(_(cmd_names.PNT_793), devices.MFCD, click_cmds.PNT_793, 793, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_827"] = default_push_button(_(cmd_names.PNT_794), devices.MFCD, click_cmds.PNT_794, 794, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_828"] = default_push_button(_(cmd_names.PNT_795), devices.MFCD, click_cmds.PNT_795, 795, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_829"] = default_push_button(_(cmd_names.PNT_796), devices.MFCD, click_cmds.PNT_796, 796, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_830"] = default_push_button(_(cmd_names.PNT_797), devices.MFCD, click_cmds.PNT_797, 797, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_831"] = default_push_button(_(cmd_names.PNT_798), devices.MFCD, click_cmds.PNT_798, 798, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_832"] = default_push_button(_(cmd_names.PNT_799), devices.MFCD, click_cmds.PNT_799, 799, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_829"] = default_axis_limited(_(cmd_names.PNT_796), devices.MFCD, click_cmds.PNT_796, 796, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_830"] = default_axis_limited(_(cmd_names.PNT_797), devices.MFCD, click_cmds.PNT_797, 797,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_831"] = default_axis_limited(_(cmd_names.PNT_798), devices.MFCD, click_cmds.PNT_798, 798, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_832"] = default_axis_limited(_(cmd_names.PNT_799), devices.MFCD, click_cmds.PNT_799, 799,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
-- end of Center MFCD

-- Right MFCD
elements["PNT_767"]  = default_push_button(_(cmd_names.PNT_800), devices.MFCD, click_cmds.PNT_800, 800, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_768"]  = default_push_button(_(cmd_names.PNT_801), devices.MFCD, click_cmds.PNT_801, 801, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_769"]  = default_push_button(_(cmd_names.PNT_802), devices.MFCD, click_cmds.PNT_802, 802, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_770"]  = default_push_button(_(cmd_names.PNT_803), devices.MFCD, click_cmds.PNT_803, 803, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_771"]  = default_push_button(_(cmd_names.PNT_804), devices.MFCD, click_cmds.PNT_804, 804, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_772"]  = default_push_button(_(cmd_names.PNT_805), devices.MFCD, click_cmds.PNT_805, 805, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_773"]  = default_push_button(_(cmd_names.PNT_806), devices.MFCD, click_cmds.PNT_806, 806, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_774"]  = default_2_position_tumb(_(cmd_names.PNT_807), devices.MFCD, click_cmds.PNT_807, 807)
elements["PNT_775"]  = default_push_button(_(cmd_names.PNT_808), devices.MFCD, click_cmds.PNT_808, 808, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_776"]  = default_push_button(_(cmd_names.PNT_809), devices.MFCD, click_cmds.PNT_809, 809, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_777"]  = default_push_button(_(cmd_names.PNT_810), devices.MFCD, click_cmds.PNT_810, 810, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_778"]  = default_push_button(_(cmd_names.PNT_811), devices.MFCD, click_cmds.PNT_811, 811, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_779"]  = default_push_button(_(cmd_names.PNT_812), devices.MFCD, click_cmds.PNT_812, 812, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_780"]  = default_push_button(_(cmd_names.PNT_813), devices.MFCD, click_cmds.PNT_813, 813, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_781"]  = default_push_button(_(cmd_names.PNT_814), devices.MFCD, click_cmds.PNT_814, 814, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_782"]  = default_push_button(_(cmd_names.PNT_815), devices.MFCD, click_cmds.PNT_815, 815, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_783"]  = default_push_button(_(cmd_names.PNT_816), devices.MFCD, click_cmds.PNT_816, 816, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_784"]  = default_push_button(_(cmd_names.PNT_817), devices.MFCD, click_cmds.PNT_817, 817, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_785"]  = default_push_button(_(cmd_names.PNT_818), devices.MFCD, click_cmds.PNT_818, 818, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_786"]  = default_push_button(_(cmd_names.PNT_819), devices.MFCD, click_cmds.PNT_819, 819, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_787"]  = default_push_button(_(cmd_names.PNT_820), devices.MFCD, click_cmds.PNT_820, 820, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_788"]  = default_push_button(_(cmd_names.PNT_821), devices.MFCD, click_cmds.PNT_821, 821, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_789"]  = default_push_button(_(cmd_names.PNT_822), devices.MFCD, click_cmds.PNT_822, 822, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_790"]  = default_push_button(_(cmd_names.PNT_823), devices.MFCD, click_cmds.PNT_823, 823, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_791"]  = default_push_button(_(cmd_names.PNT_824), devices.MFCD, click_cmds.PNT_824, 824, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_792"]  = default_push_button(_(cmd_names.PNT_825), devices.MFCD, click_cmds.PNT_825, 825, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_793"]  = default_push_button(_(cmd_names.PNT_826), devices.MFCD, click_cmds.PNT_826, 826, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_794"]  = default_push_button(_(cmd_names.PNT_827), devices.MFCD, click_cmds.PNT_827, 827, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_795"]  = default_push_button(_(cmd_names.PNT_828), devices.MFCD, click_cmds.PNT_828, 828, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_796"] = default_push_button(_(cmd_names.PNT_829), devices.MFCD, click_cmds.PNT_829, 829, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_797"] = default_push_button(_(cmd_names.PNT_830), devices.MFCD, click_cmds.PNT_830, 830, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_798"] = default_push_button(_(cmd_names.PNT_831), devices.MFCD, click_cmds.PNT_831, 831, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
--elements["PNT_799"] = default_push_button(_(cmd_names.PNT_832), devices.MFCD, click_cmds.PNT_832, 832, nil, nil, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_796"]  = default_axis_limited(_(cmd_names.PNT_829), devices.MFCD, click_cmds.PNT_829, 829, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_797"]  = default_axis_limited(_(cmd_names.PNT_830), devices.MFCD, click_cmds.PNT_830, 830,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_798"]  = default_axis_limited(_(cmd_names.PNT_831), devices.MFCD, click_cmds.PNT_831, 831, 0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
elements["PNT_799"]  = default_axis_limited(_(cmd_names.PNT_832), devices.MFCD, click_cmds.PNT_832, 832,0,  nil, true, nil, {{0,1.0},{0,1.0}}, {{SND_BTN_MFCD_PUSH},{SND_BTN_MFCD_RELEASE}})
-- end of Right MFCD
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.1.2                       --
----------------------------------------------------------------------------------------




































