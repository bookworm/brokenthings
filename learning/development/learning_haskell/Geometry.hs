module Geometry
(sphereVolume
, sphereArea
, cubeVolume
, cubeArea
, cuboidArea
, cuboidVolume
) where
  
sphereVolume :: Float -> Float
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)     


module Geometry.Sphere
( volume
, area
) where
  
volume :: Float -> Float
volume radius = (4.0 / 3.0) * pi * (radius ^ 3) 

import qualified Geometry.Sphere as Sphere