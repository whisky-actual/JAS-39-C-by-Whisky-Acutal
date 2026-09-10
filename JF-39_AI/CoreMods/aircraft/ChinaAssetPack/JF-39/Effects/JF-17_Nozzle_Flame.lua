Presets = 
{
    JF17_NOZZLE_FLAME =
    {
        {
            Type = "uh1h_pipeJetFire",
            ParticlesLimit = 290,
            LODdistance = 10000,
            
            Lifetime  = 2.7,
            RadiusMin = 0.05,
            Radius    = 0.28, -- meters
            ScaleBase = 0.24, -- meters
            Speed     = 4.2, -- m/s
            
            DistMax = 0.007,
            TrailLength = {
                {0.00, 0.5},
                {0.20, 0.8},
                {0.40, 1.0},
                {0.50, 0.7},
                {1.00, 0.5}
            }
        }
    },
}

