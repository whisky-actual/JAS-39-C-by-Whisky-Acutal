----------------------------------------------------------------------------------------
-- IRIS-T
----------------------------------------------------------------------------------------
jf39_irist_name = 'jf39_iris-t'
jf39_irist_model = 'jf39_iris-t'
jf39_irist_mass = 87.4

jf39_irist = {
    category = CAT_AIR_TO_AIR,
    name = jf39_irist_name,
    model = jf39_irist_model,
    user_name = _(jf39_irist_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_irist_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {2, 2, 2},
    M = jf39_irist_mass,
    H_max = 20000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = 1.88,
    D_max = 20000.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 60,
    v_min = 140.0,
    v_mid = 400.0,
    Mach_max = 3.0,
    t_b = 0.0,
    t_acc = 8.0,
    t_marsh = 0.0,
    Range_max = 25000.0,
    H_min_t = 1.0,
    Fi_start = 0.3,
    Fi_rak = 3.14152,
    Fi_excort = 1.57,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = enhanced_a2a_warhead(11.4),
    exhaust = {0.84, 0.66, 0.43, 0.08},
    X_back = -1.6,
    Y_back = -0.1,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 8.0,

    -- seeker sensivity params
    SeekerSensivityDistance = 30000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.12, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_irist_name,
        file = jf39_irist_model,
        life = 1,
        fire = {0, 1},
        username = jf39_irist_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.040, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.080, -- Cx_k1 высота пика волнового кризиса
    0.020, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    1.0, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.7, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    10.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.    
    --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
    -1.0, -1.0, 6, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 12500.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    30.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
                 0.0, -- дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 на высоте H=2000
                 0.0, -- крутизна зависимости  дальность полета в горизонт с располагаемой перегрузкой Navail >= 1.0 от высоты H
                 0.0, 0.0, -- безразмерный коэф. эффективности САУ ракеты
    0.0, -- расчет времени полета
    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
    20000.0, -- дальность ракурс   180(навстречу) град,  Н=10000м, V=900км/ч, м
    8000.0, -- дальность ракурс 0(в догон) град,  Н=10000м, V=900км/ч, м
    10000.0, -- дальность ракурс     180(навстречу) град, Н=1000м, V=900км/ч, м
    0.2, -- Уменьшение разрешенной дальности пуска при отклонении вектора скорости носителя от линии визирования цели.
                 1.0, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в нижнюю полусферу. Уменьшение дальности при стрельбе вниз.
                 1.4, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в верхнюю полусферу. Увеличение дальности при стрельбе вверх.
                 -3.0, -- Вертикальная плоскость. Угол перегиба кривой разрешенной дальности, верхняя - нижняя полусфера.
                 0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
                 0.5 -- Change in slope curve coefficients in the upper and lower hemispheres with carrier altitude.
    }
}
declare_weapon(jf39_irist)
----------------------------------------------------------------------------------------
-- A-Darter
----------------------------------------------------------------------------------------
jf39_adarter_name = 'jf39_a-darter'
jf39_adarter_model = 'jf39_a-darter'
jf39_adarter_mass = 89.0

jf39_adarter = {
    category = CAT_AIR_TO_AIR,
    name = jf39_adarter_name,
    model = jf39_adarter_model,
    user_name = _(jf39_adarter_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_adarter_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {3, 3, 3},
    M = jf39_adarter_mass,
    H_max = 20000.0,
    H_min = -1,
    Diam = 166.0,
    Cx_pil = 2,
    D_max = 17500.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 100,
    v_min = 140.0,
    v_mid = 400.0,
    Mach_max = 3.0,
    t_b = 0.0,
    t_acc = 8.0,
    t_marsh = 0.0,
    Range_max = 22000.0,
    H_min_t = 1.0,
    Fi_start = 3.14152,
    Fi_rak = 3.14152,
    Fi_excort = 3.14152,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = enhanced_a2a_warhead(17),
    exhaust = {0.84, 0.66, 0.43, 0.08},
    X_back = -1.35,
    Y_back = -0.1,
    Z_back = 0.0,
    Reflection = 0.035,
    KillDistance = 8.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 22000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.05, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_adarter_name,
        file = jf39_adarter_model,
        life = 1,
        fire = {0, 1},
        username = jf39_adarter_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.040, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.080, -- Cx_k1 высота пика волнового кризиса
    0.020, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    1.0, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.7, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    10.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.    
    --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
    -1.0, -1.0, 6, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 12500.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 13400, 4600, 22000, 8600, 9100, 2600, 1500, 0.5, -0.01, 0.5}

}
declare_weapon(jf39_adarter)
----------------------------------------------------------------------------------------
-- Python-5
----------------------------------------------------------------------------------------
jf39_python5_name = 'jf39_python-5'
jf39_python5_model = 'jf39_python-5'
jf39_python5_mass = 105.0

jf39_python5 = {
    category = CAT_AIR_TO_AIR,
    name = jf39_python5_name,
    model = jf39_python5_model,
    user_name = _(jf39_python5_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_python5_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {2, 2, 2},
    M = jf39_python5_mass,
    H_max = 20000.0,
    H_min = -1,
    Diam = 160.0,
    Cx_pil = 2.2,
    D_max = 16000.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 70,
    v_min = 140.0,
    v_mid = 400.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 8.0,
    t_marsh = 0.0,
    Range_max = 20000.0,
    H_min_t = 1.0,
    Fi_start = 3.14152,
    Fi_rak = 3.14152,
    Fi_excort = 3.14152,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = enhanced_a2a_warhead(11),
    exhaust = {0.84, 0.66, 0.43, 0.08},
    X_back = -1.45,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.045,
    KillDistance = 8.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.05, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_python5_name,
        file = jf39_python5_model,
        life = 1,
        fire = {0, 1},
        username = jf39_python5_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.040, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.080, -- Cx_k1 высота пика волнового кризиса
    0.020, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    1.0, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.7, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    10.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.    
    --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
    -1.0, -1.0, 6.5, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.5, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 16500.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 12200, 4200, 20000, 7800, 8200, 2400, 1500, 0.5, -0.015, 0.5}

}
declare_weapon(jf39_python5)
----------------------------------------------------------------------------------------
-- AIM9-X
----------------------------------------------------------------------------------------
jf39_aim9x_name = 'jf39_aim9-x'
jf39_aim9x_model = 'aim-9x'
jf39_aim9x_mass = 85.5

jf39_aim9x = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim9x_name,
    model = jf39_aim9x_model,
    user_name = _(jf39_aim9x_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_aim9x_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {2, 2, 2},
    M = jf39_aim9x_mass,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = 1.88,
    D_max = 11000.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 55,
    v_min = 140.0,
    v_mid = 350.0,
    Mach_max = 2.7,
    t_b = 0.0,
    t_acc = 5.0,
    t_marsh = 0.0,
    Range_max = 14000.0,
    H_min_t = 1.0,
    Fi_start = 0.3,
    Fi_rak = 3.14152,
    Fi_excort = 1.57,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = enhanced_a2a_warhead(5.0),
    exhaust = {0.7, 0.7, 0.7, 0.08},
    X_back = -1.65,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 7.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 14000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.05, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_aim9x_name,
        file = jf39_aim9x_model,
        life = 1,
        fire = {0, 1},
        username = jf39_aim9x_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.35, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.04, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.08, -- Cx_k1 высота пика волнового кризиса
    0.02, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.05, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    1.2, -- Cx_k4 крутизна спада за волновым кризисом 
    1.0, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.7, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    10.0, -- Extra G by trust vector
    -- Engine data. Time, fuel flow, thrust.	
    --	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
    -1.0, -1.0, 5.0, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.44, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 12802.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    30.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 8500, 2900, 14000, 5500, 5800, 1700, 1500, 0.5, -0.014, 0.5}
}
declare_weapon(jf39_aim9x)
----------------------------------------------------------------------------------------
-- AIM9-L
----------------------------------------------------------------------------------------
jf39_aim9l_name = 'jf39_aim9-l'
jf39_aim9l_model = 'aim-9l'
jf39_aim9l_mass = 85.5

jf39_aim9l = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim9l_name,
    model = jf39_aim9l_model,
    user_name = _(jf39_aim9l_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_aim9l_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {3, 3, 3},
    M = jf39_aim9l_mass,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = 2.58,
    D_max = 7000.0,
    D_min = 300.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 40,
    v_min = 140.0,
    v_mid = 350.0,
    Mach_max = 2.7,
    t_b = 0.0,
    t_acc = 5.0,
    t_marsh = 0.0,
    Range_max = 14000.0,
    H_min_t = 1.0,
    Fi_start = 0.3,
    Fi_rak = 3.14152,
    Fi_excort = 0.79,
    Fi_search = 0.09,
    OmViz_max = 0.61,
    warhead = enhanced_a2a_warhead(9.4, 127),
    exhaust = {0.7, 0.7, 0.7, 1.0},
    X_back = -1.55,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.0182,
    KillDistance = 5.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 14000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.75, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_aim9l_name,
        file = jf39_aim9l_model,
        life = 1,
        fire = {0, 1},
        username = jf39_aim9l_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.35, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.082, -- Cx_k1 высота пика волнового кризиса
    0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.001, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    0.550, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    2.5, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.13, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.00, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.	
    --	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
    -1.0, -1.0, 5.20, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.27, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 11890.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    30.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 8500, 2900, 14000, 5500, 5800, 1700, 1500, 0.5, -0.015, 0.5}
}
declare_weapon(jf39_aim9l)
----------------------------------------------------------------------------------------
-- AIM9-M
----------------------------------------------------------------------------------------
jf39_aim9m_name = 'jf39_aim9-m'
jf39_aim9m_model = 'aim-9l'
jf39_aim9m_mass = 85.5

jf39_aim9m = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim9m_name,
    model = jf39_aim9m_model,
    user_name = _(jf39_aim9m_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_aim9m_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {3, 3, 3},
    M = jf39_aim9m_mass,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = 2.58,
    D_max = 7000.0,
    D_min = 300.0,
    Head_Form = 0,
    Life_Time = 60.0,
    Nr_max = 40,
    v_min = 140.0,
    v_mid = 350.0,
    Mach_max = 2.7,
    t_b = 0.0,
    t_acc = 5.0,
    t_marsh = 0.0,
    Range_max = 14000.0,
    H_min_t = 1.0,
    Fi_start = 0.3,
    Fi_rak = 3.14152,
    Fi_excort = 0.79,
    Fi_search = 0.09,
    OmViz_max = 0.61,
    warhead = enhanced_a2a_warhead(9.4, 127),
    exhaust = {0.8, 0.8, 0.8, 1.0},
    X_back = -1.55,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.0162,
    KillDistance = 5.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 14000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.05, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_aim9m_name,
        file = jf39_aim9m_model,
        life = 1,
        fire = {0, 1},
        username = jf39_aim9m_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.55, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.35, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.082, -- Cx_k1 высота пика волнового кризиса
    0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.001, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    0.550, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    2.5, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.13, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    0.00, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.	
    --	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
    -1.0, -1.0, 5.20, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.27, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 11890.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    30.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 8500, 2900, 14000, 5500, 5500, 1700, 1500, 0.5, -0.015, 0.5}
}
declare_weapon(jf39_aim9m)
----------------------------------------------------------------------------------------
-- AIM-132
----------------------------------------------------------------------------------------
jf39_aim132_name = 'jf39_aim-132'
jf39_aim132_model = 'jf39_aim-132'
jf39_aim132_mass = 88.0

jf39_aim132 = {
    category = CAT_AIR_TO_AIR,
    name = jf39_aim132_name,
    model = jf39_aim132_model,
    user_name = _(jf39_aim132_name),
    wsTypeOfWeapon = {4, 4, 7, WSTYPE_PLACEHOLDER},
    mass = jf39_aim132_mass,
    Escort = 0,
    Head_Type = 1,
    sigma = {2, 2, 2},
    M = jf39_aim132_mass,
    H_max = 20000.0,
    H_min = -1,
    Diam = 166.0,
    Cx_pil = 2.1,
    D_max = 28000.0,
    D_min = 200.0,
    Head_Form = 0,
    Life_Time = 80.0,
    Nr_max = 60,
    v_min = 140.0,
    v_mid = 400.0,
    Mach_max = 3.5,
    t_b = 0.0,
    t_acc = 8.0,
    t_marsh = 0.0,
    Range_max = 35000.0,
    H_min_t = 1.0,
    Fi_start = 3.14152,
    Fi_rak = 3.14152,
    Fi_excort = 3.14152,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = enhanced_a2a_warhead(10),
    exhaust = {0.84, 0.66, 0.43, 0.08},
    X_back = -1.72,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.040,
    KillDistance = 8.0,
    -- seeker sensivity params
    SeekerSensivityDistance = 35000, -- The range of target with IR value = 1. In meters. --25km
    ccm_k0 = 0.05, -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
    SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.

    shape_table_data = {{
        name = jf39_aim132_name,
        file = jf39_aim132_model,
        life = 1,
        fire = {0, 1},
        username = jf39_aim132_name,
        index = WSTYPE_PLACEHOLDER
    }},

    PN_coeffs = {3, -- Number of Entries
    15000.0, 1.00, -- 18000.0, 0.75,
    25000.0, 0.50, -- Less 5 km to target Pn = 1
    40000.0, 0.25 -- Between 15 and 5 km  to target, Pn smoothly changes from 0.4 to 1.0. Longer then 15 km Pn = 0.4.
    },

    ModelData = {58, -- model params count
    0.4, -- characteristic square (характеристическая площадь)
    -- параметры зависимости Сx
    0.040, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
    0.080, -- Cx_k1 высота пика волнового кризиса
    0.020, -- Cx_k2 крутизна фронта на подходе к волновому кризису
    0.050, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
    1.0, -- Cx_k4 крутизна спада за волновым кризисом 
    0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
    -- параметры зависимости Cy
    0.9, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
    0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
    1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
    0.7, -- 7 Alfa_max  максимальный балансировачный угол, радианы
    10.0, -- угловая скорость создаваймая моментом газовых рулей
    -- Engine data. Time, fuel flow, thrust.    
    --    t_statr        t_b        t_accel        t_march        t_inertial        t_break        t_end            -- Stage
    -1.0, -1.0, 8, 0.0, 0.0, 0.0, 1.0e9, -- time of stage, sec
    0.0, 0.0, 5.5, 0.0, 0.0, 0.0, 0.0, -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
                 0.0, 0.0, 17800.0, 0.0, 0.0, 0.0, 0.0, -- thrust, newtons
    1.0e9, -- таймер самоликвидации, сек
    60.0, -- время работы энергосистемы, сек
    0, -- абсолютная высота самоликвидации, м
    0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
                 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
                 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
                 0.0, -- синус угла возвышения траектории набора горки
    50.0, -- продольное ускорения взведения взрывателя
    0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
                 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
                 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
                 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления

    -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
                 14.0, -15.0, -2.5, 21300, 7300, 35500, 13700, 14500, 4200, 1500, 0.5, -0.015, 0.5}
}
declare_weapon(jf39_aim132)
----------------------------------------------------------------------------------------
--                            File by whisky.actual@gmail.com                         --
----------------------------------------------------------------------------------------