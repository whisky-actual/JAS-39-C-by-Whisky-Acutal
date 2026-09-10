Presets = {
    JF17 = {
        {
            Type = "overwingVapor",
            ShadingFX = "ParticleSystem2/overwingVapor.fx",
            UpdateFX  = "ParticleSystem2/overwingVaporComp.fx",
            Technique = "techOverwingVapor",

            Texture = "overwingVapor.dds",
            TextureDetailNoise = "puffNoise.png",
            LODdistance = 1500,

            SpawnLocationsFile = "JF-17_OverwingVapor.owv",

            ParticlesCount = 300,
            ParticleSize = 2.7,
            ScaleOverAgeFactor = 1.8, -- scale = ParticleSize * (1 + (normalized age) * ScaleOverAgeFactor)
            
            VaporLengthMax = 7.0, -- meters
            
            AlbedoSRGB = 0.86,
            
            OpacityMax = 0.85,
            OpacityOverPower = {-- vapor power -> normalized opacity. In this case opacity = sqrt(vapor power)
                {0.000, 0.0},
                {0.125, 0.35355339059327376220042218105242},
                {0.250, 0.5},
                {0.500, 0.70710678118654752440084436210485},
                {1.000, 1.0},
            },
        },
    },
}
