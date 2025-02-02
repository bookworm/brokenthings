data Bool = False | True
data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 
data Shape = Circle Float Float Float | Rectangle Float Float Float Float

surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1)  * (abs $ y2 - y1)

data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show) 

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)


baseRect :: Float -> Float -> Shap
baseRect width height = Rectangle (Point 0 0) (Point width height)

data Person = Person { firstName :: String
                     , lastName :: String  
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)       
                     
data Car = Car { company :: String
               , model :: String
               , year :: Int
               } deriving (Show)  

Car { company = "Ford"}                    