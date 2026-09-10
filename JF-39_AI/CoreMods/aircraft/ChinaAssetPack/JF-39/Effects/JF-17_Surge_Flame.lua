Presets = 
{
    JF17_SURGE_FLAME =
    {
        {
            Type = "speedFire",
            Texture = "firePuff_03_low2.dds",
            ParticlesLimit = 500,
            
            Radius = 1, -- meters
            ScaleBase = 2.5, --  meters
            
            ConvectionSpeed = { -- speed value by emitter scale
                {1, 3},  
                {5, 12}
            },	
            
            DistMax = {
                {5, 0.06},
                {20, 0.1},
                {1000, 0.65},
                {2000, 0.8}
            },
            
            TrailLength = {
                {5, 2},
                {20, 5},
                {500, 6},
                {2000, 10}
            },
        }
    }
}

