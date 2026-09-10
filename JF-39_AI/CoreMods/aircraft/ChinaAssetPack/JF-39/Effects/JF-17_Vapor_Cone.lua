Presets = 
{
    JF17_VAPOR_CONE =
    {
        {
            Type = "speedSmoke",
            Texture = "smoke6_nm.dds",
            Tech = "Steam",
            
            ParticlesLimit = 10000,
            LODdistance    = 500,	
            BaseColor      = {0.1*1.4, 0.12*1.4, 0.14*1.4},
            Radius         = 0.35, -- meters
            RadiusMax      = 1.55, -- max rotation radius of each particle, m
            ScaleBase      = 1.2, --  meters  密度

            ScaleJitter = {
                {  20, 2},
                { 100, 2},
                {1000, 1}
            },
            ConvectionSpeed = { --
                {1, 100},
                {5, 200},
            },
            OffsetMax = { -- 烟球的最大范围，数字越大范围越小
                {  20, 0.25},
                {1000, 0.15}
            },
            FrequencyMin = {
                {  20, 0.025},
                {1000, 0.700}
            },
            FrequencyJitter = {
                {  20, 25},
                {1000, 25}
            },
            AngleJitter = { -- 未发现有效果
                {20, 0.5},
                {1000, 0.2}
            },
            DistMax = {     -- 决定烟的浓密度，越小浓度越大
                {   3, 6},
                {  20, 3},
                {1000, 0.05},
                {2000, 1}
            },
            TrailLength = { --脱离速度
                {   1, 1},
                {  20, 2},
                { 300, 4},
                {1000, 8},
                {2000, 16}
            }

        }
    }
}

