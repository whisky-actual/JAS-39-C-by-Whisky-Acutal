----------------------------------------------------------------------------------------
-- Meteor BVRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_meteor_name = 'jf39_meteor'
local jf39_meteor_mass = 190.0
local jf39_meteor_warhead = enhanced_a2a_warhead(24, 203)

jf39_meteor = {
    category = CAT_AIR_TO_AIR,
    name = jf39_meteor_name,
    model = 'jf39_meteor',
    user_name = _(jf39_meteor_name),
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AA_Missile, WSTYPE_PLACEHOLDER},
    mass = jf39_meteor_mass,

    Escort = 0,
    Head_Type = 2,
    sigma = {4, 4, 4},
    M = jf39_meteor_mass,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 203.0,
    Cx_pil = 2.5,
    D_max = 80000.0,
    D_min = 1000.0,
    Head_Form = 1,
    Life_Time = 180.0,

    Nr_max = 35,
    v_min = 140.0,
    v_mid = 2575.0,
    Mach_max = 4.5,
    t_b = 0.0,
    t_acc = 6.0,
    t_marsh = 50.0,

    Range_max = 160000.0,

    H_min_t = 1.0,
    Fi_start = 0.780,
    Fi_rak = 3.14152,
    Fi_excort = 1.0472,
    Fi_search = 1.05,
    OmViz_max = 0.6981,
    exhaust = {1, 1, 1, 0.3},
    X_back = -1.54,
    Y_back = 0.0, -- -0.11
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 15.0,
    loft = 1,
    hoj = 1,
    ccm_k0 = 0.025,

    warhead = jf39_meteor_warhead,
    warhead_air = jf39_meteor_warhead,

    shape_table_data = {{
        name = jf39_meteor_name,
        file = 'jf39_meteor',
        life = 1,
        fire = {0, 1},
        username = "jf39_meteor",
        index = WSTYPE_PLACEHOLDER
    }},

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь) -- 9
    -- параметры зависимости Сx
    0.015, -- планка Сx0 на дозвуке ( M << 1) cx_k0
    0.050, -- высота пика волнового кризиса cx_k1
    0.012, -- крутизна фронта на подходе к волновому кризису cx_k2
    0.004, -- планка Cx0 на сверхзвуке ( M >> 1) cx_k3
    1.20, -- крутизна спада за волновым кризисом cx_k4
    0.90, -- коэффициент отвала поляры
    -- параметры зависимости Cy
    0.90, -- планка Сy0 на дозвуке ( M << 1)
    0.75, -- планка Cy0 на сверхзвуке ( M >> 1)
    1.20, -- крутизна спада(фронта) за волновым кризисом
    0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.00, -- угловая скорость создаваймая моментом газовых рулей
    --    t_statr   t_b      t_accel  t_march   t_inertial   t_break  t_end
    -1.0, -1.0, 8.0, 30.0, 0.0, 0.0, 1.0e9, -- time interval
    0.0, 0.0, 6.0, 0.4, 0.0, 0.0, 0.0, -- fuel flow rate in second kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 19000.0, 1000.0, 0.0, 0.0, 0.0, -- thrust
    1.0e9, -- таймер самоликвидации, сек  Self-destructive time, sec
    180.0, -- время работы энергосистемы, сек  Working time of power system, sec
    0, -- абсолютная высота самоликвидации, м  Absolute height of self-destruction, M
    0.5, -- время задержки включения управления (маневр отлета, безопасности), сек  Connection delay time (shunting departure, safety), sec
                 30000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр 'горка', м
                 18000, -- дальность до цели, при которой маневр 'горка' завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м
                 0.26, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя  Longitudinal acceleration of fuze arming
                 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
                 0.0, -- 30000.0, -- дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 на высоте H=2000
                 0.0, -- 3.92, -- крутизна зависимости  дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 от высоты H
                 0.0, -- 3.2,
    0.0, -- 0.75, -- безразмерный коэф. эффективности САУ ракеты
    0, 0, -- 70.0, -- расчет времени полета
    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
    80000.0, -- дальность ракурс   180(навстречу) град,  Н=10000м, V=900км/ч, м
    80000.0, -- дальность ракурс 0(в догон) град,  Н=10000м, V=900км/ч
    25000.0, -- дальность ракурс     180(навстречу) град, Н=1000м, V=900км/ч
    0.2, 0.6, 1.4, -3.0, 0.5}
}
declare_weapon(jf39_meteor)
----------------------------------------------------------------------------------------
-- I-Derby ER BVRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_iderby_name = 'jf39_i-derby'
local jf39_iderby_mass = 118.0
local jf39_iderby_warhead = enhanced_a2a_warhead(23, 160)

jf39_iderby = {
    category = CAT_AIR_TO_AIR,
    name = jf39_iderby_name,
    model = 'jas39_i-derby',
    user_name = _(jf39_iderby_name),
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AA_Missile, WSTYPE_PLACEHOLDER},
    mass = jf39_iderby_mass,

    Escort = 0,
    Head_Type = 2,
    sigma = {4, 4, 4},
    M = jf39_iderby_mass,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 160.0,
    Cx_pil = 2.0,
    D_max = 50000.0,
    D_min = 1000.0,
    Head_Form = 1,
    Life_Time = 180.0,
    Nr_max = 35,
    v_min = 140.0,
    v_mid = 2575.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 6.0,
    t_marsh = 8.0,
    Range_max = 100000.0,
    H_min_t = 1.0,
    Fi_start = 0.780,
    Fi_rak = 3.14152,
    Fi_excort = 1.0472,
    Fi_search = 1.05,
    OmViz_max = 0.6981,
    exhaust = {1, 1, 1, 0.3},
    X_back = -1.4,
    Y_back = 0.0, -- -0.11
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 15.0,
    loft = 1,
    hoj = 1,
    ccm_k0 = 0.05,
    rad_correction = 1,
    loft_factor = 2.5,
    loft_angle = 0.17,

    active_radar_lock_dist = 18000.0,
    go_active_by_default = 1,

    PN_coeffs = {4, 15000.0, 1.0, 25000.0, 0.85, 40000.0, 0.65, 100000.0, 0.3},

    warhead = jf39_iderby_warhead,
    warhead_air = jf39_iderby_warhead,

    shape_table_data = {{
        name = jf39_iderby_name,
        file = 'jf39_i-derby',
        life = 1,
        fire = {0, 1},
        username = "jf39_i-derby",
        index = WSTYPE_PLACEHOLDER
    }},

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь) -- 9
    -- параметры зависимости Сx
    0.015, -- планка Сx0 на дозвуке ( M << 1) cx_k0
    0.050, -- высота пика волнового кризиса cx_k1
    0.012, -- крутизна фронта на подходе к волновому кризису cx_k2
    0.004, -- планка Cx0 на сверхзвуке ( M >> 1) cx_k3
    1.20, -- крутизна спада за волновым кризисом cx_k4
    0.90, -- коэффициент отвала поляры
    -- параметры зависимости Cy
    0.90, -- планка Сy0 на дозвуке ( M << 1)
    0.75, -- планка Cy0 на сверхзвуке ( M >> 1)
    1.20, -- крутизна спада(фронта) за волновым кризисом
    0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.00, -- угловая скорость создаваймая моментом газовых рулей
    --    t_statr   t_b      t_accel  t_march   t_inertial   t_break  t_end
    -1.0, -1.0, 6.0, 6.0, 0.0, 0.0, 1.0e9, -- time interval
    0.0, 0.0, 6.0, 0.4, 0.0, 0.0, 0.0, -- fuel flow rate in second kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 17000.0, 1000.0, 0.0, 0.0, 0.0, -- thrust
    1.0e9, -- таймер самоликвидации, сек  Self-destructive time, sec
    180.0, -- время работы энергосистемы, сек  Working time of power system, sec
    0, -- абсолютная высота самоликвидации, м  Absolute height of self-destruction, M
    0.5, -- время задержки включения управления (маневр отлета, безопасности), сек  Connection delay time (shunting departure, safety), sec
                 30000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр 'горка', м
                 30000, -- дальность до цели, при которой маневр 'горка' завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м
                 0.26, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя  Longitudinal acceleration of fuze arming
                 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 21.0, -23.0, -3.0, 48500, 17000, 80000, 31500, 33000, 9500, 4500, 0.4, -0.015, 0.5}
}
declare_weapon(jf39_iderby)
----------------------------------------------------------------------------------------
-- AIM-120B AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120b_name = 'jf39_aim-120b'
local jf39_aim120b_mass = 156.0
local jf39_aim120b_warhead = enhanced_a2a_warhead(11, 178)

local jf39_aim120b = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim120b_name,
    model = 'aim-120b',
    user_name = _(jf39_aim120b_name),
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AA_Missile, WSTYPE_PLACEHOLDER},
    mass = jf39_aim120b_mass,

    Escort = 0,
    Head_Type = 2,
    sigma = {5, 5, 5},
    M = jf39_aim120b_mass,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 178.0,
    Cx_pil = 2.5,
    D_max = 14000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 3.0,
    t_marsh = 5.0,
    Range_max = 57000.0,
    H_min_t = 3.0,
    Fi_start = 0.4,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05},
    X_back = -1.95,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.04,
    KillDistance = 15.0,
    Loft = 1,
    Hoj = 1,
    ccm_k0 = 0.2,
    rad_correction = 1,
    loft_factor = 2.0,
    loft_angle = 0.17,

    active_radar_lock_dist = 15000.0,
    go_active_by_default = 1,

    PN_coeffs = {3, -- Number of Entries	
    15000.0, 1.0, -- Less 5 km to target Pn = 1
    25000.0, 0.5, -- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
    40000.0, 0.25}, -- Between 15 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.

    warhead = jf39_aim120b_warhead,
    warhead_air = jf39_aim120b_warhead,

    shape_table_data = {{
        name = jf39_aim120b_name,
        file = 'aim-120b',
        life = 1,
        fire = {0, 1},
        username = "aim-120b", -- Shortened name for cockpit displays
        index = WSTYPE_PLACEHOLDER
    }},

    ModelData = {58, -- model params count
    0.5, -- characteristic square (характеристическая площадь) -- 9
    -- параметры зависимости Сx
    0.026, -- планка Сx0 на дозвуке ( M << 1) cx_k0
    0.053, -- высота пика волнового кризиса cx_k1
    0.01, -- крутизна фронта на подходе к волновому кризису cx_k2
    -0.245, -- планка Cx0 на сверхзвуке ( M >> 1) cx_k3
    0.075, -- крутизна спада за волновым кризисом cx_k4
    0.7, -- коэффициент отвала поляры
    -- параметры зависимости Cy
    1.5, -- планка Сy0 на дозвуке ( M << 1)
    0.6, -- планка Cy0 на сверхзвуке ( M >> 1)
    0.7, -- крутизна спада(фронта) за волновым кризисом
    0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.00, -- угловая скорость создаваймая моментом газовых рулей
    --    t_statr   t_b      t_accel  t_march   t_inertial   t_break  t_end
    -1.0, -1.0, 4.0, 4.0, 0.0, 0.0, 1.0e9, -- time interval
    0.0, 0.0, 7.69, 3.94, 0.0, 0.0, 0.0, -- fuel flow rate in second kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 19600.0, 10045.0, 0.0, 0.0, 0.0, -- thrust
    1.0e9, -- таймер самоликвидации, сек  Self-destructive time, sec
    80.0, -- время работы энергосистемы, сек  Working time of power system, sec
    0, -- абсолютная высота самоликвидации, м  Absolute height of self-destruction, M
    1.0, -- время задержки включения управления (маневр отлета, безопасности), сек  Connection delay time (shunting departure, safety), sec
                 25000, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр 'горка', м
                 15000, -- дальность до цели, при которой маневр 'горка' завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м
                 0.52356, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя  Longitudinal acceleration of fuze arming
                 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 21.0, -23.0, -3.0, 30500.0, 10500.0, 50000.0, 19500.0, 20500.0, 6000.0, 4000.0, 0.4, -0.015, 0.5}
}
declare_weapon(jf39_aim120b)
----------------------------------------------------------------------------------------
-- AIM-120C-5 AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120c5_name = 'jf39_aim-120c5'
local jf39_aim120c5_mass = 161.5
local jf39_aim120c5_warhead = enhanced_a2a_warhead(9, 178)

local jf39_aim120c5 = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim120c5_name,
    model = 'aim-120c',
    user_name = _(jf39_aim120c5_name),
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AA_Missile, WSTYPE_PLACEHOLDER},
    mass = jf39_aim120c5_mass,

    Escort = 0,
    Head_Type = 2,
    sigma = {5, 5, 5},
    M = jf39_aim120c5_mass,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 178.0,
    Cx_pil = 2.5,
    D_max = 20000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 0.0,
    t_marsh = 8.0,
    Range_max = 80000.0,
    H_min_t = 1.0,
    Fi_start = 0.5,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05},
    X_back = -1.94,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.04,
    KillDistance = 15.0,
    loft = 1,
    hoj = 1,
    ccm_k0 = 0.15,
    rad_correction = 1,
    loft_factor = 2.0,
    loft_angle = 0.17,

    active_radar_lock_dist = 15000.0,
    go_active_by_default = 1,

    PN_coeffs = {3, -- Number of Entries	
    15000.0, 1.0, -- Less 5 km to target Pn = 1
    25000.0, 0.5, -- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
    40000.0, 0.25}, -- Between 15 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.

    warhead = jf39_aim120c5_warhead,
    warhead_air = jf39_aim120c5_warhead,

    shape_table_data = {{
        name = jf39_aim120c5_name,
        file = 'aim-120c',
        life = 1,
        fire = {0, 1},
        username = "jf39_aim-120c5", -- Shortened name for cockpit displays
        index = WSTYPE_PLACEHOLDER
    }},

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.029, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.06, -- Cx_k1 высота пика волнового кризиса
    0.01, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    -0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    0.08, -- Cx_k4 крутизна спада за волновым кризисом 
    0.7, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    1.4, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.6, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.	
    --	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
    -1.0, -1.0, 8.5, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 7.5, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 18500.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    90.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    1.0, -- время задержки включения управления (маневр отлета, безопасности), сек
                 25000, -- 40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 15000, -- 40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.52356, -- 0.17, -- синус угла возвышения траектории набора горки
                 50.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 21.0, -- производная дальности по скорости носителя на высоте 1км, ППС
                 -23.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
                 -3.0, -- производная по высоте производной дальности по скорости цели, ЗПС
                 39500, 13500, 65000, 25500, 27000, 7800, 4000, 0.4, -0.015, 0.5}
}
declare_weapon(jf39_aim120c5)
----------------------------------------------------------------------------------------
-- AIM-120C-7 AMRAAM Active Rdr AAM
----------------------------------------------------------------------------------------
local jf39_aim120c7_name = 'jf39_aim-120c7'
local jf39_aim120c7_mass = 161.5
local jf39_aim120c7_warhead = enhanced_a2a_warhead(9, 178)

local jf39_aim120c7 = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim120c7_name,
    model = 'aim-120c',
    user_name = _(jf39_aim120c7_name),
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_AA_Missile, WSTYPE_PLACEHOLDER},
    mass = jf39_aim120c7_mass,
    Escort = 0,
    Head_Type = 2,
    sigma = {5, 5, 5},
    M = jf39_aim120c7_mass,
    H_max = 20000.0,
    H_min = 1.0,
    Diam = 178.0,
    Cx_pil = 2.5,
    D_max = 29000.0,
    D_min = 700.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 30,
    v_min = 140.0,
    v_mid = 700.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 0.0,
    t_marsh = 8.0,
    Range_max = 90000.0,
    H_min_t = 1.0,
    Fi_start = 0.5,
    Fi_rak = 3.14152,
    Fi_excort = 1.05,
    Fi_search = 1.05,
    OmViz_max = 0.52,
    exhaust = {0.8, 0.8, 0.8, 0.05},
    X_back = -1.94,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.04,
    KillDistance = 15.0,
    loft = 1,
    hoj = 1,
    ccm_k0 = 0.1,
    rad_correction = 1,
    loft_factor = 2.0,
    loft_angle = 0.17,
    active_radar_lock_dist = 15000.0,
    go_active_by_default = 1,

    PN_coeffs = {4, -- Number of Entries	
    15000.0, 1.0, -- Less 5 km to target Pn = 1
    25000.0, 0.5, -- Between 10 and 5 km  to target, Pn smoothly changes from 0.5 to 1.0. 
    40000.0, 0.25, 60000.0, 0.10}, -- Between 15 and 10 km  to target, Pn smoothly changes from 0.2 to 0.5. Longer then 15 km Pn = 0.2.

    warhead = jf39_aim120c7_warhead,
    warhead_air = jf39_aim120c7_warhead,

    shape_table_data = {{
        name = jf39_aim120c7_name,
        file = 'aim-120c',
        life = 1,
        fire = {0, 1},
        username = "jf39_aim-120c7", -- Shortened name for cockpit displays
        index = WSTYPE_PLACEHOLDER
    }},

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.029, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.06, -- Cx_k1 высота пика волнового кризиса
    0.01, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    -0.245, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    0.08, -- Cx_k4 крутизна спада за волновым кризисом 
    0.7, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    1.4, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.6, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.	
    --	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
    -1.0, -1.0, 10.0, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 8.5, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 20000.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    90.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    1.0, -- время задержки включения управления (маневр отлета, безопасности), сек
                 25000, -- 40000 -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 15000, -- 40000 -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.52356, -- 0.17, -- синус угла возвышения траектории набора горки
                 50.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 21.0, -23.0, -3.0, 45500, 15500, 75000, 29500, 31000, 9000, 4000, 0.4, -0.015, 0.5}
}
declare_weapon(jf39_aim120c7)
----------------------------------------------------------------------------------------
--                            File by whisky.actual@gmail.com                         --
----------------------------------------------------------------------------------------
