------- Steps to create customized rwr symbols
-- 1. create a Custom_EW_Database.lua file in Customization\ew\ folder (file name case sensitive)
-- 2. follow below sample to create your own ew database for sead

------- Begin: sample content of Custom_EW_Database.lua -------


-- ============================================================================
-- JF-17 反辐射武器 - 威胁数据库
-- ============================================================================
--
-- 【设计目的】
-- 为JF-17反辐射导弹导引头提供目标识别和匹配逻辑
-- 支持两种工作模式：对比模式（精确匹配）和非对比模式（相似度匹配）
--
-- 【核心设计原则】
-- 1. 所有雷达按工作频段分组，同频段雷达具有相似的电磁特征
-- 2. 搜索雷达（SR）和跟踪雷达（TR）永远不会混淆（频段不同）
-- 3. 对比模式：必须精确匹配选定的unit_type，防止误击
-- 4. 非对比模式：匹配同频段分组，允许打击相似目标
--
-- 【防滥用设计】
-- 甲方要求：防止玩家投机取巧，关闭对比后随意打击任何目标
-- 解决方案：非对比模式 ≠ 随便打
--   - 非对比模式仍然受频段限制
--   - 选择SA-10的TR（H/I频段）只能打H/I频段的其他TR
--   - 不能跨频段打击（如打Ku频段的SA-15）
--   - SR和TR天然隔离，不会混淆
--
-- ============================================================================
-- 分组定义（SimilarityGroups）
-- ============================================================================
--
-- 基于雷达工作频段的相似度分组
-- 同组内的雷达具有相似的电磁特征，导引头可能混淆
--
-- 频段参考（NATO标准）：
--   C/D Band: 1-2 GHz  - 远程搜索雷达（预警、远程监视）
--   E/F Band: 2-4 GHz  - 中程搜索/跟踪雷达
--   H/I Band: 6-10 GHz - 火控/跟踪雷达（中远程SAM）
--   I/J Band: 8-12 GHz - 火控雷达（中近程SAM）
--   Ku Band: 12-18 GHz - 近程火控雷达（近程SAM、自行防空）
--
-- SimilarityGroups = {
    -- 搜索雷达（按频段细分）
    -- { id = "SR_C",  name = "SR C/D-Band (1-2 GHz)",  band = "C/D", freq_ghz = {1, 2} },
    -- { id = "SR_E",  name = "SR E/F-Band (2-4 GHz)",  band = "E/F", freq_ghz = {2, 4} },

    -- 跟踪雷达（按频段细分）
    -- { id = "TR_E",  name = "TR E/F-Band (2-4 GHz)",  band = "E/F", freq_ghz = {2, 4} },
    -- { id = "TR_H",  name = "TR H/I-Band (6-10 GHz)", band = "H/I", freq_ghz = {6, 10} },
    -- { id = "TR_J",  name = "TR I/J-Band (8-12 GHz)", band = "I/J", freq_ghz = {8, 12} },
    -- { id = "TR_Ku", name = "TR Ku-Band (12-18 GHz)", band = "Ku",  freq_ghz = {12, 18} },

    -- 火控雷达（高炮等，频段混合）
    -- { id = "FCR",   name = "Fire Control Radar",     band = "Mixed" },
-- }

-- ============================================================================
-- 威胁数据库（EW_Database）
-- ============================================================================
--
-- 每个条目包含：
--   unit_type:    DCS内部单位类型标识（唯一）
--   threatsName:  显示名称（对应RWR符号）
--   group:        相似度分组ID（基于频段）
--
EW_Database_Custom = {
    -- {
    --    unit_type = "XXXX",
    --    threatsName = "XXXX",
    --    group = "XXXX",
    -- },

    {
        unit_type = "SAM_Sample",
        threatsName = "SAM Sample",
        group = "FCR", -- you can define your own group
    },
}


------- End: sample content of Custom_EW_Database.lua -------

