Presets = 
{
    JF17_STARTER_SMOKE =
    {
        {
            Type    = "speedSmoke",
            Texture = "smoke5.dds",
            ParticlesLimit = 800,
            LODdistance    = 500,
            BaseColor      = {0.1*1.4, 0.12*1.4, 0.14*1.4},

            SoftParticle = true,
            Radius       = 0.15, -- meters
            RadiusMax    = 0.2, -- max rotation radius of each particle, m
            ScaleBase    = 1, --  meters
        
            ScaleJitter = {
                {  20, 1.2},
                { 100, 3.5},
                {1000, 5}
            },
            ConvectionSpeed = {
                {1, 6.6},  
                {5, 8.8}
            },
            OffsetMax = {
                {  20, 0.25},
                {1000, 0.29}
            },
            FrequencyMin = {
                {  20, 0.25},
                {1000, 0.7}
            },
            FrequencyJitter = {
                {  20, 0.25},
                {1000, 0.2}
            },
            AngleJitter = {
                {  20, 0.45},
                {1000, 0.2}
            },
            DistMax = {
                {   3, 0.35},
                {  20, 0.95},
                {1000, 3.0},
                {2000, 1.0}
            },
            TrailLength = {
                {   1, 4},
                {  20, 2},
                { 300, 2},
                {1000, 2},
                {2000, 2}
            }
        }
    },
}

