--dofile('./CoreMods/aircraft/AircraftWeaponPack/aim9_family.lua')
--dofile(current_mod_path .. '/JF-39/JF39_Loadouts/aim9_family.lua')


local AIM_9_CX_PIL = 1.03

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

--Missile types for backward compatibility with AJS37
--11019 = A (01) J (10) S (19) + 11 => 11030
local wsType_Rb24 = 11037
local wsType_Rb24J = 11038
local wsType_Rb74 = 11039

local GAR_8 =
{
	category		= CAT_AIR_TO_AIR,
	name			= "GAR-8", -- AIM-9B
	user_name		= _("AIM-9B"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort 			= 0,
	Head_Type 		= 1,
	sigma 			= {3, 3, 3},
	M 				= 74.39,
	H_max 			= 18000.0,
	H_min 			= -1,
	Diam 			= 127.0,
	Cx_pil			= AIM_9_CX_PIL,
	D_max 			= 4000.0,
	D_min 			= 300.0,
	Head_Form 		= 0,
	Life_Time 		= 24.0,
	Nr_max 			= 12,
	v_min 			= 140.0,
	v_mid 			= 350.0,
	Mach_max 		= 3.2,
	t_b 			= 0.0,
	t_acc			= 2.2,
	t_marsh			= 0.0,
	Range_max		= 11000.0,
	H_min_t		    = 1.0,
	Fi_start 		= 0.44,
	Fi_rak 		    = 1.1,
	Fi_excort 		= 0.44, --25deg
	Fi_search 		= 0.034, --2deg
	OmViz_max 		= 0.165, --9.5deg/s
	warhead 		= simple_aa_warhead(10),
	exhaust 		=  { 0.7, 0.7, 0.7, 1.0 },
	X_back 			= -1.5,
	Y_back 			= 0.0,
	Z_back			= 0.0,
	Reflection		= 0.03,
	KillDistance 	= 7.0,
	PN_gain = 3,
	SeekerGen = 1,  -- Seeker generation
	ccm_k0 = 5.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	--seeker sensivity params
	SeekerSensivityDistance = 5000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	SeekerCooled	 = false, -- True is cooled seeker and false is not cooled seeker.
	
	shape_table_data =
	{
		{
			name	 = "GAR-8",
			file	 = "aim-9b",
			life	 = 1,
			fire	 = { 0, 1},
			username = "GAR-8",
			index = WSTYPE_PLACEHOLDER,
		},
	},
	
	supersonic_A_coef_skew = 0.2, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.005, -- площадь выходного сечения сопла
	
	ModelData = 
	{   58 ,  -- model params count
		0.35 ,   -- characteristic square (характеристическая площадь)
		
		-- параметры зависимости Сx
		0.0325, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
		0.069,  -- Cx_k1 высота пика волнового кризиса
		0.02,   -- Cx_k2 крутизна фронта на подходе к волновому кризису
		0.03,  -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
		0.4,   -- Cx_k4 крутизна спада за волновым кризисом 
		0.50,  -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
		
		-- параметры зависимости Cy
		1.8, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
		0.1,  -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
		1,    -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
		
		0.14, -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.0, --угловая скорость создаваймая моментом газовых рулей
		
	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,		-1.0,	2.2,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		 0.0,		0.0,	8.45,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		 0.0,		0.0,	17170.0,	0.0,	0.0,			0.0,		0.0,           -- thrust, newtons
	
		 24.0, -- таймер самоликвидации, сек
		 21.0, -- время работы энергосистемы, сек
		 0, -- абсолютная высота самоликвидации, м
		 0.5, -- время задержки включения управления (маневр отлета, безопасности), сек
		 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		 0.0,  -- синус угла возвышения траектории набора горки
		 30.0, -- продольное ускорения взведения взрывателя
		 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		 -- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
		 4.65   ,
		 -10.98 ,
		 -2.24  ,
		 12880  ,
		 2916   ,
		 21942  , -- дальность ракурс   180(навстречу) град,  Н=10000м, V=900км/ч, м
		 5242   , -- дальность ракурс 0(в догон) град,  Н=10000м, V=900км/ч, м
		 8937   , -- дальность ракурс 	180(навстречу) град, Н=1000м, V=900км/ч, м
		 1918   , -- Уменьшение разрешенной дальности пуска при отклонении вектора скорости носителя от линии визирования цели.
		 2500.0 , -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в нижнюю полусферу. Уменьшение дальности при стрельбе вниз.
		 0.35   , -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в верхнюю полусферу. Увеличение дальности при стрельбе вверх.
		-0.01   , -- Вертикальная плоскость. Угол перегиба кривой разрешенной дальности, верхняя - нижняя полусфера.
		 0.5, 	 -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
}



local Rb24 = deepcopy(GAR_8)
Rb24.wsTypeOfWeapon[4] = wsType_Rb24
Rb24.name = "Rb 24"
Rb24.user_name = _("Rb 24")
Rb24.display_name_short = "Rb24"
Rb24.shape_table_data[1].name = "Rb 24"
Rb24.shape_table_data[1].username = "Rb 24"
Rb24.shape_table_data[1].index = wsType_Rb24
--TODO replace model

declare_weapon(GAR_8)
declare_weapon(Rb24)

local AIM_9E =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9E", -- AIM-9E
	user_name		= _("AIM-9E"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 76.43,
	H_max = 18000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = AIM_9_CX_PIL,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 20.0,
	Nr_max = 12,
	v_min = 140.0,
	v_mid = 350.0,
	Mach_max = 2.5,
	t_b = 0.0,
	t_acc = 2.2,
	t_marsh = 0.0,
	Range_max = 14000.0,
	H_min_t = 1.0,
	Fi_start = 0.3,
	Fi_rak = 1.8,
	Fi_excort = 0.7, --40deg
	Fi_search = 0.017, --1deg
	OmViz_max = 0.21, --12deg/s
	warhead = simple_aa_warhead(11.0),
	exhaust = { 0.7, 0.7, 0.7, 1.0 },
	X_back = -1.55,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 2,  -- Seeker generation
	SeekerSensivityDistance = 6000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 2.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "aim-9E",
			file	 = "aim-9J",--TODO replace
			life	 = 1,
			fire	 = {0, 1},
			username = "AIM-9E",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.005, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
		0.35,   -- characteristic square (характеристическая площадь)

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
			
		0.14, -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.00, --угловая скорость создаваймая моментом газовых рулей
			
	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,	   -1.0,	2.2,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		 0.0,		0.0,	8.45,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		 0.0,		0.0,	17170.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
		
		24.0, -- таймер самоликвидации, сек
		21.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		1.2, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
		7.34,   -- производная дальности по скорости носителя на высоте 1км, ППС
		-7.93,  -- производная дальности по скорости цели на высоте 1км, ЗПС
		-1.96,  -- производная по высоте производной дальности по скорости цели, ЗПС
		11526.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
		2805.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
		19655.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
		5192.6,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
		7837.1, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
		1786.9, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
		2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
		0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
		-0.01, -- производная процента гарантированной дальности в ППС по высоте
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
} 
declare_weapon(AIM_9E)

local AIM_9J =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9J", -- AIM-9J
	user_name		= _("AIM-9J"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 76.93,
	H_max = 18000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = AIM_9_CX_PIL,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 40.0,
	Nr_max = 22,
	v_min = 140.0,
	v_mid = 350.0,
	Mach_max = 2.5,
	t_b = 0.0,
	t_acc = 2.2,
	t_marsh = 0.0,
	Range_max = 14000.0,
	H_min_t = 1.0,
	Fi_start = 0.3,
	Fi_rak = 1.8,
	Fi_excort = 0.7,
	Fi_search = 0.017,
	OmViz_max = 0.29,
	warhead = simple_aa_warhead(11.0),
	exhaust = { 0.7, 0.7, 0.7, 1.0 },
	X_back = -1.55,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 2,  -- Seeker generation
	SeekerSensivityDistance = 7000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 2.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "aim-9J",
			file	 = "aim-9J",
			life	 = 1,
			fire	 = {0, 1},
			username = "AIM-9J",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.005, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
		0.35,   -- characteristic square (характеристическая площадь)

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
		0.00, --угловая скорость создаваймая моментом газовых рулей
			
	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,	   -1.0,	2.2,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		 0.0,		0.0,	8.45,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		 0.0,		0.0,	17170.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
		
		1.0e9, -- таймер самоликвидации, сек
		40.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		1.2, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
		7.34,   -- производная дальности по скорости носителя на высоте 1км, ППС
		-7.93,  -- производная дальности по скорости цели на высоте 1км, ЗПС
		-1.96,  -- производная по высоте производной дальности по скорости цели, ЗПС
		11526.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
		2805.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
		19655.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
		5192.6,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
		7837.1, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
		1786.9, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
		2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
		0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
		-0.01, -- производная процента гарантированной дальности в ППС по высоте
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
} 
declare_weapon(AIM_9J)

local AIM9P =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9P", -- AIM-9P
	user_name		= _("AIM-9P"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,AIM_9P},
    Escort = 0,
    Head_Type = 1,
	sigma = {3, 3, 3},
    M = 74.84,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = AIM_9_CX_PIL,
    D_max = 4000.0,
    D_min = 300.0,
    Head_Form = 0,
    Life_Time = 40.0,
    Nr_max = 22,
    v_min = 140.0,
    v_mid = 350.0,
    Mach_max = 2.2,
    t_b = 0.0,
    t_acc = 2.2,
    t_marsh = 0.0,
    Range_max = 11000.0,
    H_min_t = 1.0,
    Fi_start = 0.3,
    Fi_rak = 2.1,
    Fi_excort = 0.7,
    Fi_search = 0.017,
    OmViz_max = 0.29,
    warhead = predefined_warhead("AIM_9P"),
    exhaust = { 0.7, 0.7, 0.7, 1.0 },
    X_back = -1.46,
    Y_back = -0.0,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 2,  -- Seeker generation
	ccm_k0 = 2.0,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	--seeker sensivity params
	SeekerSensivityDistance = 10000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.

	shape_table_data =
	{
		{
			name	 = "aim-9p",
			file	 = "aim-9p",
			life	 = 1,
			fire	 = {0, 1},
			username = "AIM-9P",
			index 	 = AIM_9P,
		},
	},
	
	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.005, -- площадь выходного сечения сопла
	
	ModelData = {   58 ,  -- model params count
		0.35 ,   -- characteristic square (характеристическая площадь)
		
		-- параметры зависимости Сx
		0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
		0.082, -- Cx_k1 высота пика волнового кризиса
		0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
		0.001,-- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
		0.550,-- Cx_k4 крутизна спада за волновым кризисом 
		0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
		
		-- параметры зависимости Cy
		2.5, --- Cy_k0 планка Сy0 на дозвуке ( M << 1)
		0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
		1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
		
		0.13,  -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.0, --угловая скорость создаваймая моментом газовых рулей
			
		-- Engine data. Time, fuel flow, thrust.	
		--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,		   -1.0,	2.2,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		0.0,		    0.0,	8.45,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		0.0,		    0.0,	17170.0,	0.0,	    0.0,			0.0,		0.0,           -- thrust, newtons
		
		1.0e9, -- таймер самоликвидации, сек
		40.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		2.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		7.34,   
		-7.93,  
		-1.96,  
		11526.0,
		2805.0, 
		19655.0,
		5192.6, 
		7837.1, 
		1786.9, 
		2500.0, 
		0.55, 	
		-0.01, 	
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
}

local AIM_9P5 =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9P5", -- AIM-9P5
	user_name		= _("AIM-9P5"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort 			= 0,
	Head_Type 		= 1,
	sigma 			= {3, 3, 3},
	M 				= 80.7,
	H_max 			= 18000.0,
	H_min 			= -1,
	Diam 			= 127.0,
	Cx_pil			= AIM_9_CX_PIL,
	D_max 			= 4000.0,
	D_min 			= 300.0,
	Head_Form 		= 0,
	Life_Time 		= 40.0,
	Nr_max 			= 22,
	v_min 			= 140.0,
	v_mid 			= 350.0,
	Mach_max 		= 2.2,
	t_b 			= 0.0,
	t_acc			= 5.0,
	t_marsh			= 0.0,
	Range_max		= 11000.0,
	H_min_t		    = 1.0,
	Fi_start 		= 0.3,
	Fi_rak 		    = 3.14152,
	Fi_excort 		= 0.7,
	Fi_search 		= 0.031,
	OmViz_max 		= 0.38,
	warhead 		= simple_aa_warhead(11.0),
	exhaust 		= { 0.7, 0.7, 0.7, 0.3 },
	smoke_opacity_type = 1,
	X_back 			= -1.46,
	Y_back 			= 0.0,
	Z_back			= 0.0,
	Reflection		= 0.03,
	KillDistance 	= 7.0,
	ccm_k0 			= 0.75,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	--seeker sensivity params
	SeekerGen = 3,  -- Seeker generation
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	SeekerCooled	 		= true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "aim-9p5",
			file	 = "aim-9p5",
			life	 = 1,
			fire	 = { 0, 1},
			username = "AIM-9P5",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},
	
	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла
	
	ModelData = 
	{
		58 ,  -- model params count
		0.35 ,   -- characteristic square (характеристическая площадь)
		
		-- параметры зависимости Сx
		0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
		0.082, -- Cx_k1 высота пика волнового кризиса
		0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
		0.001,-- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
		0.550,-- Cx_k4 крутизна спада за волновым кризисом 
		0.8,  -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
		
		-- параметры зависимости Cy
		2.5, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
		0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
		1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
		
		0.13,  -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.0, --угловая скорость создаваймая моментом газовых рулей
		
	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,		-1.0,	5.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		0.0,		0.0,	4.84,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		0.0,		0.0,	11020,		0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
	
		 1.0e9, -- таймер самоликвидации, сек
		 40.0, -- время работы энергосистемы, сек
		 0, -- абсолютная высота самоликвидации, м
		 0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
		 1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		 1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		 0.0,  -- синус угла возвышения траектории набора горки
		 30.0, -- продольное ускорения взведения взрывателя
		 0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		 1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		 1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		 2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		 8.0,
		 -11.1,
		 -2.33,
		 16700.5,
		 5040.5,
		 28498.2, 
		 9345.3, 
		 11466.0, 
		 3206.3, 
		 2500, 
		 0.55, 
		 -0.01,
		 0.5, 
	},
}

local AIM_9P3 = deepcopy(AIM9P)

AIM_9P3.wsTypeOfWeapon = {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER}
AIM_9P3.t_acc = AIM_9P5.t_acc
AIM_9P3.exhaust = AIM_9P5.exhaust
AIM_9P3.smoke_opacity_type = AIM_9P5.smoke_opacity_type
AIM_9P3.M = AIM_9P5.M
AIM_9P3.ccm_k0 = AIM9P.ccm_k0
AIM_9P3.ModelData = deepcopy(AIM_9P5.ModelData)
AIM_9P3.shape_table_data = deepcopy(AIM_9P5.shape_table_data)
AIM_9P3.name = "AIM-9P3"
AIM_9P3.user_name = _("AIM-9P3")
AIM_9P3.display_name_short = "AIM-9"
AIM_9P3.shape_table_data[1].name = "AIM-9P3"
AIM_9P3.shape_table_data[1].username = "AIM-9P3"

local Rb24J = deepcopy(AIM_9P3)
Rb24J.wsTypeOfWeapon[4] = wsType_Rb24J
Rb24J.name = "Rb 24J"
Rb24J.user_name = _("Rb 24J")
Rb24J.display_name_short = "Rb24"
Rb24J.shape_table_data[1].name = "Rb 24J"
Rb24J.shape_table_data[1].username = "Rb 24J"
Rb24J.shape_table_data[1].index = wsType_Rb24J
--TODO replace model

declare_weapon(AIM9P)
declare_weapon(AIM_9P5)
declare_weapon(AIM_9P3)
declare_weapon(Rb24J)

local AIM_9JULI =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9JULI", -- AIM-9JULI - foreign J9 + 9L seeker
	user_name		= _("AIM-9JULI"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 82.3,
	H_max = 21000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = AIM_9_CX_PIL,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 40.0,
	Nr_max = 32,
	v_min = 140.0,
	v_mid = 350.0,
	Mach_max = 2.5,
	t_b = 0.0,
	t_acc = 5.0,
	t_marsh = 0.0,
	Range_max = 14000.0,
	H_min_t = 1.0,
	Fi_start = 0.3,
	Fi_rak = 3.14152,
	Fi_excort = 0.79,
	Fi_search = 0.031,
	OmViz_max = 0.44,
	warhead = simple_aa_warhead(11.0),
	exhaust = { 0.7, 0.7, 0.7, 0.3 },
	smoke_opacity_type = 1,
	X_back = -1.6,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 3,  -- Seeker generation
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.75,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "aim-9JULI",
			file	 = "aim-9JULI", -- TODO replace model
			life	 = 1,
			fire	 = {0, 1},
			username = "AIM-9JULI",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
					0.35,   -- characteristic square (характеристическая площадь)
	
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
					0.00, --угловая скорость создаваймая моментом газовых рулей
						
				-- Engine data. Time, fuel flow, thrust.	
				--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,		-1.0,	5.0,  		0.0,		0.0,			0.0,		1.0e9,        -- time of stage, sec
					0.0,		0.0,	4.96,		0.0,		0.0,			0.0,		0.0,          -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					 0.0,		0.0,	11280.0,	0.0,	0.0,			0.0,		0.0,              -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					40.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
					1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.0,  -- синус угла возвышения траектории набора горки
					30.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					1.2, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					8.05,	-- производная дальности по скорости носителя на высоте 1км, ППС
					-11.65,	-- производная дальности по скорости цели на высоте 1км, ЗПС
					-2.08,	-- производная по высоте производной дальности по скорости цели, ЗПС
					16789.4,	 -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
					4975.8,	-- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
					28596.1, 	 -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
					9195.1, 	 -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					11591.9, 	-- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
					3186.5, 	-- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
					2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.01, -- производная процента гарантированной дальности в ППС по высоте
					0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
} 
declare_weapon(AIM_9JULI)

local AIM_9L =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM-9L", -- AIM-9L
	user_name		= _("AIM-9L"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 85.73,
	H_max = 18000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = AIM_9_CX_PIL,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 60.0,
	Nr_max = 32,
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
	Fi_search = 0.031,
	OmViz_max = 0.44,
	warhead = simple_aa_warhead(11.0),
	exhaust = { 0.7, 0.7, 0.7, 1.0 },
	X_back = -1.5,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 3,  -- Seeker generation
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.75,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.				
	shape_table_data =
	{
		{
			name	 = "aim-9L",
			file	 = "aim-9L",
			life	 = 1,
			fire	 = { 0, 1},
			username = "AIM-9L",
			index 	 = WSTYPE_PLACEHOLDER,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
					0.35,   -- characteristic square (характеристическая площадь)
	
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
					0.00, --угловая скорость создаваймая моментом газовых рулей
						
				-- Engine data. Time, fuel flow, thrust.	
				--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
					-1.0,	   -1.0,	5.20,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
					 0.0,		0.0,	5.27,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
					 0.0,		0.0,	11890.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
					
					1.0e9, -- таймер самоликвидации, сек
					60.0, -- время работы энергосистемы, сек
					0, -- абсолютная высота самоликвидации, м
					0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
					1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
					1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
					0.0,  -- синус угла возвышения траектории набора горки
					30.0, -- продольное ускорения взведения взрывателя
					0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
					1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
					1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
					2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
					-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
					9.0, -- производная дальности по скорости носителя на высоте 1км, ППС
					-13.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
					-2.1, -- производная по высоте производной дальности по скорости цели, ЗПС
					15500.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
					5500.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
					27000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
					10000.0,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
					10500.0, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
					3500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
					2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
					0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
					-0.01, -- производная процента гарантированной дальности в ППС по высоте
					0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
				},
}

local Rb74 = deepcopy(AIM_9L)
Rb74.wsTypeOfWeapon[4] = wsType_Rb74
Rb74.name = "Rb 74"
Rb74.user_name = _("Rb 74")
Rb74.display_name_short = "Rb74"
Rb74.shape_table_data[1].name = "Rb 74"
Rb74.shape_table_data[1].username = "Rb 74"
Rb74.shape_table_data[1].index = wsType_Rb74
--TODO replace model

declare_weapon(AIM_9L)
declare_weapon(Rb74)

local AIM9M =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM_9", -- AIM-9M
	user_name		= _("AIM-9M"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,AIM_9},
    Escort = 0,
    Head_Type = 1,
	sigma = {3, 3, 3},
    M = 85.73,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = AIM_9_CX_PIL,
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
    Fi_search = 0.031,
    OmViz_max = 0.611,
    warhead = predefined_warhead("AIM_9"),
    exhaust = { 0.7, 0.7, 0.7, 0.3 },
	smoke_opacity_type = 1,
    X_back = -1.5,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 3,  -- Seeker generation
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.5,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.
	
	shape_table_data =
	{
		{
			name	 = "aim-9",
			file	 = "aim-9",
			life	 = 1,
			fire	 = { 0, 1},
			username = "AIM-9M",
			index 	 = AIM_9,
		},
	},

	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла
		
	ModelData = {   58,  -- model params count
		0.35,   -- characteristic square (характеристическая площадь)
		
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
		0.00, --угловая скорость создаваймая моментом газовых рулей
		
		-- Engine data. Time, fuel flow, thrust.	
		--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,	       -1.0,	5.20,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		0.0,		    0.0,	5.27,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		0.0,		    0.0,	11890.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons
		
		1.0e9, -- таймер самоликвидации, сек
		60.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.8, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		1.19, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		2.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
		9.0, -- производная дальности по скорости носителя на высоте 1км, ППС
		-13.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
		-2.1, -- производная по высоте производной дальности по скорости цели, ЗПС
		15500.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
		5500.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
		27000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
		10000.0,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
		10500.0, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
		3500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
		2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
		0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
		-0.01, -- производная процента гарантированной дальности в ППС по высоте
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
}

declare_weapon(AIM9M)

local AIM9X =
{
	category		= CAT_AIR_TO_AIR,
	name			= "AIM_9X", -- AIM-9X
	user_name		= _("AIM-9X"),
	display_name_short = "AIM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,AIM_9X},
    Escort = 0,
    Head_Type = 1,
	sigma = {2, 2, 2},
    M = 84.46,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = AIM_9_CX_PIL,
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
    Fi_start = 1.57,
    Fi_rak = 3.14152,
    Fi_excort = 1.57,
    Fi_search = 0.09,
    OmViz_max = 1.10,
    warhead = predefined_warhead("AIM_9"),
    exhaust = { 0.7, 0.7, 0.7, 0.08 },
	smoke_opacity_type = 1,
    X_back = -1.6,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 4,  -- Seeker generation
	SeekerSensivityDistance = 25000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.2,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled = true, -- True is cooled seeker and false is not cooled seeker.
	x_wing_anim = -1,
	PN_gain = 6,
	SeekerGen = 4,

	shape_table_data =
	{
		{
			name	 = "aim-9x",
			file	 = "aim-9x",
			life	 = 1,
			fire	 = { 0, 1},
			username = "AIM-9X",
			index 	 = AIM_9X,
		},
	},
	
	supersonic_A_coef_skew = 0.3, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла

	ModelData = {   58 ,  -- model params count
		0.35 ,   -- characteristic square (характеристическая площадь)
		
		-- параметры зависимости Сx
		0.04 , -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
		0.08 , -- Cx_k1 высота пика волнового кризиса
		0.02 , -- Cx_k2 крутизна фронта на подходе к волновому кризису
		0.05, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
		1.2 , -- Cx_k4 крутизна спада за волновым кризисом 
		1.0 , -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))
		
		-- параметры зависимости Cy
		1.2 , -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
		0.8	 , -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
		1.0  , -- Cy_k2 крутизна спада(фронта) за волновым кризисом  
		
		0.5, -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.8, -- Alfa_max by trust vectoring
		
		-- Engine data. Time, fuel flow, thrust.	
		--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,		   -1.0,	5.0,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
		0.0,		    0.0,	5.44,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
		0.0,		    0.0,	12802.0,	0.0,	    0.0,			0.0,		0.0,           -- thrust, newtons
		
		1.0e9, -- таймер самоликвидации, сек
		60.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.45, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		2.2, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характеристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		1.0, -- характеристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		-- ЗРП. Данные для рассчета дальностей пуска (индикация на прицеле)
		9.0, -- производная дальности по скорости носителя на высоте 1км, ППС
		-13.0, -- производная дальности по скорости цели на высоте 1км, ЗПС
		-2.1, -- производная по высоте производной дальности по скорости цели, ЗПС
		15500.0, -- дальность ракурс 180 град(навстречу), Н=5000м, V=900км/ч, м
		5500.0, -- дальность ракурс 0(в догон) град, Н=5000м, V=900км/ч, м 
		27000.0, -- дальность ракурс 180(навстречу) град, Н=10000м, V=900км/ч, м
		10000.0,  -- дальность ракурс 0(в догон) град, Н=10000м, V=900км/ч, м
		10500.0, -- дальность ракурс 180(навстречу) град, Н=1000м,  V=900км/ч, м
		3500.0, -- дальность ракурс 0(в догон) град, Н=1000м, V=900км/ч, м
		2500.0, -- смещение назад отнсительно нуля задней точки зоны достижимости
		0.55, -- процент гарантированной дальности от дальности в ППС на высоте 1км
		-0.01, -- производная процента гарантированной дальности в ППС по высоте
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
}

declare_weapon(AIM9X)

local CATM9 =
{
	category		= CAT_AIR_TO_AIR,
	name			= "CATM_9M",
	user_name		= _("CATM-9M"),
	display_name_short = "CATM-9",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_TRAIN_Missile,CATM_9},
    Escort = 0,
    Head_Type = 1,
	sigma = {3, 3, 3},
    M = 85.73,
    H_max = 18000.0,
    H_min = -1,
    Diam = 127.0,
    Cx_pil = AIM_9_CX_PIL,
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
    Fi_search = 0.028,
    OmViz_max = 0.611,
    warhead = predefined_warhead("AIM_9"),
    exhaust = { 0.7, 0.7, 0.7, 0.08 },
    X_back = -1.6,
    Y_back = 0.0,
    Z_back = 0.0,
    Reflection = 0.03,
    KillDistance = 7.0,
	--seeker sensivity params
	SeekerGen = 3,  -- Seeker generation
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.5,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.
	
	shape_table_data =
	{
		{
			name	 = "CATM-9M",
			file	 = "catm-9",
			life	 = 1,
			fire	 = { 0, 1},
			username = "CATM-9M",
			index 	 = CATM_9,
		},
	},
}

declare_weapon(CATM9)

local desc_sidwinder = " ".._("Sidewinder IR AAM")

local PL_5EII =
{
	["AIM-9"]  		= {picture = "us_AIM-9L.png",   CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", display_name = AIM9M.user_name ..desc_sidwinder	  	,wstype = AIM9M.wsTypeOfWeapon,	    category = CAT_AIR_TO_AIR, mass = AIM9M.M },
	["AIM-9P"] 		= {picture = "us_AIM-9P.png",   CLSID = "{9BFD8C90-F7AE-4e90-833B-BFD0CED0E536}", display_name = AIM9P.user_name ..desc_sidwinder	  	,wstype = AIM9P.wsTypeOfWeapon,	    category = CAT_AIR_TO_AIR, mass = AIM9P.M },
	["AIM_9X"] 		= {picture = "us_AIM-9X.png",   CLSID = "DIS_PL-5EII", display_name = AIM9X.user_name ..desc_sidwinder	  	,wstype = AIM9X.wsTypeOfWeapon,	    category = CAT_AIR_TO_AIR, mass = AIM9X.M },
	["CATM-9M"] 	= {picture = "us_CATM-9.png",   CLSID = "CATM-9M", 								  display_name = _("Captive AIM-9M for ACM")	  	 	,wstype = CATM9.wsTypeOfWeapon,	    category = CAT_AIR_TO_AIR, mass = CATM9.M },
	["ais-pod-t50"] = {picture = "ais-pod-t50.png",                                                   display_name = _("AN/ASQ-T50 TCTS Pod - ACMI Pod")	,wstype = {4,	15,	47	,	 108},	category = CAT_PODS,       mass = 62.6  },
	["GAR-8"]		= {picture = "us_AIM-9B.png",   CLSID = "{AIM-9B}",                               display_name = GAR_8.user_name  ..desc_sidwinder      ,wstype = GAR_8.wsTypeOfWeapon,		category = CAT_AIR_TO_AIR, mass = GAR_8.M },
	["AIM-9E"]	    = {picture = "us_AIM-9L.png",   CLSID = "{AIM-9E}",							  	  display_name = AIM_9E.user_name ..desc_sidwinder		,wstype = AIM_9E.wsTypeOfWeapon, 	category = CAT_AIR_TO_AIR, mass = AIM_9E.M },
	["AIM-9P5"]		= {picture = "us_AIM-9P-5.png", CLSID = "{AIM-9P5}",							  display_name = AIM_9P5.user_name  ..desc_sidwinder	,wstype = AIM_9P5.wsTypeOfWeapon,	category = CAT_AIR_TO_AIR, mass = AIM_9P5.M },
	["AIM-9L"]		= {picture = "us_AIM-9L.png",   CLSID = "{AIM-9L}", 							  display_name = AIM_9L.user_name ..desc_sidwinder 		,wstype = AIM_9L.wsTypeOfWeapon,	category = CAT_AIR_TO_AIR, mass = AIM_9L.M },
	["AIM-9J"]		= {picture = "us_AIM-9P.png",   CLSID = "{AIM-9J}", 							  display_name = AIM_9J.user_name ..desc_sidwinder 		,wstype = AIM_9J.wsTypeOfWeapon,	category = CAT_AIR_TO_AIR, mass = AIM_9J.M },
	["AIM-9JULI"]	= {picture = "us_AIM-9P.png",   CLSID = "{AIM-9JULI}", 							  display_name = AIM_9JULI.user_name ..desc_sidwinder 	,wstype = AIM_9JULI.wsTypeOfWeapon,	category = CAT_AIR_TO_AIR, mass = AIM_9JULI.M },
	["AIM-9P3"]		= {picture = "us_AIM-9P.png",   CLSID = "{AIM-9P3}",							  display_name = AIM_9P3.user_name  ..desc_sidwinder	,wstype = AIM_9P3.wsTypeOfWeapon,	category = CAT_AIR_TO_AIR, mass = AIM_9P3.M },
	["Rb_24"]	    = {picture = "us_AIM-9B.png",   CLSID = "{Rb_24}",							      display_name = Rb24.user_name.. " (AIM-9B)"..desc_sidwinder, wstype = Rb24.wsTypeOfWeapon, category = CAT_AIR_TO_AIR, mass = Rb24.M },
	["Rb_24J"]	    = {picture = "us_AIM-9P.png",   CLSID = "{Rb_24J}",							  display_name = Rb24J.user_name.. " (AIM-9P3)"..desc_sidwinder, wstype = Rb24J.wsTypeOfWeapon, category = CAT_AIR_TO_AIR, mass = Rb24J.M },
	["Rb_74"]	    = {picture = "us_AIM-9L.png",   CLSID = "{Rb_74}",							  display_name = Rb74.user_name.. " (AIM-9L)"..desc_sidwinder, wstype = Rb74.wsTypeOfWeapon, category = CAT_AIR_TO_AIR, mass = Rb74.M },
}

local function PL_5EII_without_adapter(CLSID,aim_9_variant)
	local var = PL_5EII[aim_9_variant] or PL_5EII["AIM-9"]
	local var_mass = var.mass or 85.5
	declare_loadout({
		category			= 	var.category,
		CLSID 				= 	CLSID,
		Picture				=	var.picture,
        PictureBlendColor   = "0xffffffff",
		displayName			=	var.display_name,
		attribute			=	var.wstype,
		Cx_pil				=	aim_9_drag_on_pilon,
		Count				=	1,
		Weight				=	var_mass,
		Elements			=  {{ShapeName = aim_9_variant}}-- end of Elements
	})
end
---------------------------------------------------------------------------------
PL_5EII_without_adapter("{DIS_PL-5EII}"	,"AIM_9X")
--PL_5EII_without_adapter("{AIM-9E}"	    ,"AIM-9E")


-------------------------------------------------------------------
-- SPEAR-3 Anti-Radiation Missile
-------------------------------------------------------------------
--[[
local cm802akg_model = 'jf39_spear-3'
local cm802akg_disp = 'SPEAR-3 Air-to-Ground Glide Missile'
local cm802akg_mass = 90
local quad_pylon_mass = 145.0

local C802AKG_warhead =
{
    mass                 = 6.3, 
    caliber              = 180,
    expl_mass            = 6.3,
    piercing_mass        = 6.3*1.2,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 1.0, 1.0, 1.0 },
    concrete_obj_factor  = 0.0,
    obj_factors          = { 1.0, 1.0 },
    cumulative_factor    = 5.0,
    cumulative_thickness = 2.0, 
}


JF39_SPEAR3 =
{
	category		= CAT_MISSILES,
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AS_Missile,WSTYPE_PLACEHOLDER},
	
	name			= cm802akg_disp,
	display_name	= cm802akg_disp,
	user_name		= cm802akg_disp,
	display_name_short = cm802akg_disp,
	
	scheme			= "AGM-84E",
	class_name		= "wAmmunitionAntiShip",
	model			= cm802akg_model,
	
	Escort		= 0,
	Head_Type	= 5,
	sigma		= {25, 25, 25},
	M			= 670.0,
	H_max		= 10000.0,
	H_min		= 500,
	Diam		= 360.0,
	Cx_pil		= 8,
	D_max		= 230000.0,
	D_min		= 15000.0,
	Head_Form	= 0,
	Life_Time	= 1850.0,
	Nr_max		= 18,
	v_min		= 150.0,
	v_mid		= 272.0,
	Mach_max	= 0.9,
	t_b			= 0.01,
	t_acc		= 5.0,
	t_marsh		= 1800.0,
	Range_max	= 230000.0,
	H_min_t		= 0.0,
	Fi_start	= 0.5,
	Fi_rak		= 3.14152,
	Fi_excort	= 1.05,
	Fi_search	= 99.9,
	OmViz_max	= 99.9,

	X_back			= -1.581,
	Y_back			= 0,
	Z_back			= 0.0,
	Reflection		= 0.25,
	KillDistance	= 0.0,
		
	Damage_correction_coeff = 0.7,
	
	add_attributes = {"Cruise missiles", "Anti-Ship missiles", "Air"},
	
	LaunchDistData =
	{
		17,		9,

				100,	150,	200,	250,	300,	350,	400,	450,	500,		
		100,	0,		0,		205025,	208800,	211725,	214900,	217775,	220750,	224250,	
		200,	0,		200075,	205325,	208675,	212075,	215225,	218150,	221100,	224625,	
		300,	0,		200325,	205175,	209000,	212400,	215575,	218525,	221450,	224525,	
		400,	195575,	200575,	205475,	209350,	212725,	215925,	218900,	221775,	224850,	
		500,	195800,	200825,	205775,	209675,	213075,	216250,	219225,	222125,	225125,	
		600,	196000,	200600,	206050,	209950,	213400,	216550,	219500,	222400,	225300,	
		700,	196200,	200900,	206350,	210300,	213700,	216900,	219850,	222650,	225600,	
		800,	196400,	201150,	206650,	210650,	214000,	217300,	220150,	222900,	225800,	
		900,	196650,	201400,	206950,	210950,	214350,	217550,	220400,	223150,	225950,	
		1000,	196850,	201700,	207200,	211300,	214650,	217900,	220650,	223400,	226250,	
		2000,	199900,	206300,	210600,	214300,	217300,	219900,	222500,	225000,	228000,	
		3000,	204800,	209300,	213100,	216700,	219500,	222000,	224200,	226800,	229900,	
		4000,	207500,	211700,	215100,	218500,	221800,	223900,	226100,	228700,	231900,	
		5000,	209500,	213500,	217000,	220200,	223800,	226100,	228100,	230700,	234000,	
		6000,	211250,	215000,	218500,	221750,	225250,	228000,	230250,	232750,	236000,	
		7000,	213000,	216750,	220250,	223250,	226750,	230250,	232250,	235000,	238250,	
		7500,	213750,	217500,	220750,	224000,	227250,	230750,	233250,	236000,	240500,	
	},

	MinLaunchDistData =
	{
		17,		9,

				100,	150,	200,	250,	300,	350,	400,	450,	500,		
		100,	0,		0,		21700,	21950,	16325,	16775,	17100,	17900,	24150,	
		200,	0,		21475,	21425,	15950,	16450,	16950,	17450,	17975,	24000,	
		300,	0,		21250,	15475,	16050,	16600,	17125,	17550,	18125,	18900,	
		400,	22250,	21025,	15575,	16175,	16725,	17250,	17700,	18300,	19225,	
		500,	22000,	20800,	15700,	16225,	16850,	17325,	17900,	18475,	19350,	
		600,	21800,	14950,	15750,	16400,	16950,	17500,	18000,	18550,	19250,	
		700,	21550,	15000,	15800,	16400,	17000,	17550,	18050,	18650,	19350,	
		800,	21350,	15100,	15900,	16550,	17100,	17650,	18150,	18700,	19450,	
		900,	21150,	15150,	16000,	16600,	17150,	17700,	18250,	18800,	19500,	
		1000,	20900,	15200,	16000,	16650,	17300,	17800,	18300,	18900,	19600,	
		2000,	14500,	15500,	16200,	16900,	17600,	18200,	18800,	19500,	20000,	
		3000,	14600,	15100,	16000,	16900,	17300,	18300,	18900,	19600,	21200,	
		4000,	14800,	15100,	15300,	15600,	15800,	16100,	16600,	19300,	21300,	
		5000,	14900,	15200,	15500,	15700,	15900,	16200,	16600,	17000,	21300,	
		6000,	15000,	15500,	15750,	15750,	16000,	16250,	16750,	17000,	17500,	
		7000,	15250,	15500,	15750,	16000,	16250,	16500,	16500,	17000,	17500,	
		7500,	15250,	15500,	15750,	16000,	16250,	16500,	16750,	17000,	18000,	
	},
	
	shape_table_data =
	{
		{
			name		= "CM_802AKG",
			file		= cm802akg_model,
			life		= 1,
			fire		= { 0, 1},
			username	= _("CM-802AKG"),
			index		= WSTYPE_PLACEHOLDER,
		},
	},
	
		controller = {
		boost_start	= 0,
		march_start = 0,
	},

	control_block = {
		default_cruise_height = 1000.0,
	},


	boost = {				--	air launch - no booster
		impulse								= 0,
		fuel_mass							= 0,
		work_time							= 0,
		boost_time							= 0,
		boost_factor						= 0,
		nozzle_position						= {{0, 0, 0}},
		nozzle_orientationXYZ				= {{0, 0, 0}},
		tail_width							= 0.0,
		smoke_color							= {0.0, 0.0, 0.0},
		smoke_transparency					= 0.0,
		custom_smoke_dissipation_factor		= 0.0,
	},

	march = {
		impulse			= 3000,
		fuel_mass		= 68,
		work_time		= 9999,
		min_fuel_rate	= 0.005,
		min_thrust		= -100,
		max_thrust		= 5000,
		thrust_Tau		= 0.0018,

		nozzle_position						= {{-2.26, 0.0, 0.0}},
		nozzle_orientationXYZ				= {{0.0, 0.0, 0.0}},
		tail_width							= 0.5,
		smoke_color							= {0.5, 0.5, 0.5},
		smoke_transparency					= 0.03,
		custom_smoke_dissipation_factor		= 0.2,

		start_burn_effect			= 1,
		start_effect_delay			= {0.0,		0.3, 	0.8},
		start_effect_time			= {0.7,		1.0, 	0.1},
		start_effect_size			= {0.09,	0.104,	0.11},
		start_effect_smoke			= {0.01,	0.4, 	0.01},
		start_effect_x_pow			= {1.0,		1.0,	1.0},
		start_effect_x_dist			= {1.1,		0.9,	0.0},
		start_effect_x_shift		= {0.15,	0.15,	0.2},
	},

	engine_control = {
		default_speed	= 285,
		K				= 240,
		Kd				= 1.0,
		Ki				= 0.01,
		speed_delta		= 5,
	},


	seeker = {
		delay				= 0.0,
		op_time				= 800,
		activate_on_update	= 1,

		FOV					= math.rad(60),

		max_target_speed			= 33,
		max_target_speed_rnd_coeff	= 10,

		max_lock_dist		= 30000,
	},

	ins = {
		aim_sigma		= 350,
		check_AI		= 1,
		error_coeff		= 0.03,
	},

	fm = {
		mass        = cm802akg_mass,
		caliber     = 0.360,
		cx_coeff    = {1,0.39,0.38,0.236,1.31},
		L           = 5.145,
		I           = 1 / 12 * 670.0 * 5.145 * 5.145,
		Ma          = 0.68,
		Mw          = 1.116,
		wind_sigma	= 0.0,
		wind_time	= 1000.0,
		Sw			= 0.75,
		dCydA		= {0.07, 0.036},
		A			= 0.5,
		maxAoa		= 0.3,
		finsTau		= 0.02,
		Ma_x		= 3,
		Ma_z		= 3,
		Mw_x		= 2.6,
	},

	autopilot =
	{
		glide_height				= 1000,
		dont_climb_on_cruise_height	= 0,
		vel_proj_div 				= 6.0,
		default_glide_height		= 1000,
		pre_maneuver_glide_height	= 1000,
		skim_glide_height			= 8,
		use_start_bar_height		= 1,
		altim_vel_k					= 4,

		delay				= 1.0,
		op_time				= 9999,
		Kw					= 4.0,
		Ks					= 1.0,
		K					= 1.0,
		Kd 					= 0.0,
		Ki 					= 30.0,--10
		Kx					= 0.04,
		Kdx					= 0.001,
		w_limit				= math.rad(5),
		fins_limit			= math.rad(50),
		fins_limit_x		= math.rad(25),
		rotated_WLOS_input	= 0,
		conv_input			= 0,
		PN_dist_data 		= {	2000,	0,
								500,	0},

		max_climb_angle		= math.rad(10),
		max_dive_angle		= math.rad(-30),
		max_climb_ang_hdiff	= 180,
		max_dive_ang_hdiff	= -500,

		Ksd						= 0.0,
		Ksi						= 0.0,
		integr_val_limit		= 0.5,
		hor_err_limit			= 0.5,
		max_climb_vel			= 200,
		min_climb_vel			= 120,
		min_climb_vel_factor	= 0,
		max_climb_h				= 3000,
		min_climb_h				= 10000,
		min_climb_h_factor		= 0.5,
		
		inertial_km_error		= 4.0,
		glide_height_eq_error	= 0.02,

		
		vert_ctrl_data 		= {	100,	math.rad(-24),
								115,	math.rad(-16),
								130,	math.rad(-8),
								145,	math.rad(0),
								185,	math.rad(10),	},
	},

	final_autopilot = {
		delay				= 1.0,
		op_time				= 9999,
		Kw					= 1.0,
		Ks					= 5.0,
		K					= 5.0,
		Kd 					= 0.0,
		Ki 					= 0.0,
		Kx					= 0.0,
		Kix					= 0.0,
		w_limit				= math.rad(15),
		fins_limit			= math.rad(50),
		rotated_WLOS_input	= 0,
		conv_input			= 0,
		PN_dist_data 		= {	2000,	1,
								500,	1},

		add_err_val				= 0,
		add_err_vert			= 0,
		add_out_val				= 0.1,
		add_out_vert			= 1,
		loft_angle				= math.rad(8),
		loft_trig_angle			= math.rad(14),
		K_loft_err				= 1,
		loft_angle_vert			= 1,
		loft_active_by_default	= 0,
	},

	triggers_control = {
		action_wait_timer				= 5,	-- wait for dist functions n sen, then set default values
		default_sensor_tg_dist			= 10000, -- turn on seeker and start horiz. correction if target is locked
		default_final_maneuver_tg_dist	= 7000,
		default_straight_nav_tg_dist	= 7000,
		default_destruct_tg_dist		= 3000,	-- if seeker still can not find a target explode warhead after reaching pred. target point + n. km
		trigger_by_path					= 1,
		final_maneuver_trig_v_lim		= 3,
		use_horiz_dist					= 1,
		pre_maneuver_glide_height		= 1000,	-- triggers st nav instead of fin. maneuver if h>2*pre_maneuver_glide_height at fin. maneuver distance
		min_cruise_height				= 1000,
		min_cruise_height_trigger_sum	= 10000,
		min_cruise_height_trigger_mlt	= 285/33,
	},
	
	warhead		= predefined_warhead("C_802A"),
	warhead_air = predefined_warhead("C_802A"),
}

declare_weapon(JF39_SPEAR3)

declare_loadout({
    category         = CAT_MISSILES,
    CLSID            = 'DIS_CM-400AKG',	
	Count            = 4,
	Cx_pil           = 0.00043,
    Picture          = 'jf39_spear-3.png',
	displayName      = _(cm802akg_disp .. ' x4'),
	Weight           = cm802akg_mass + quad_pylon_mass,
    Elements = {
        {
            ShapeName = 'jf39_bru_61',
            IsAdapter = true
        },
        {
			connector_name =	'AttachPoint001',
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
        {
			connector_name =	'AttachPoint002',		
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
        {
			connector_name =	'AttachPoint003',		
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
        {
			connector_name =	'AttachPoint004',		
			ShapeName	=	cm802akg_model,
			Rotation = {0,0,0},
        },
    },
	wsTypeOfWeapon   = JF39_SPEAR3.wsTypeOfWeapon,
	attribute        = {4, 4, 32, WSTYPE_PLACEHOLDER},
	ejectImpulse     = eject_speed_msl,
	ejectDirection   = {0, -1, 0},
})
]]
----------------------------------------------------------------------------------------
--                    File by whisky.actual@gmail.com - v.1.3.0                       --
----------------------------------------------------------------------------------------