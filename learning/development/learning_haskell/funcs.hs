doubleSmallNumber x =          
  if x > 100
    then
      x
  else
    x*2
    
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
  | bmi <= 18.5 = "underweight"
  | bmi <= 25.0 = "normal"
  | bmi <= 30.0 = "fat" 
  | otherwise = "whale"
  
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height 
  | bmi <= skinny = "underweight"
  | bmi <= normal = "normal"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"  
  | otherwise                 = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2   
    (skinny, normal, fat) = (18.5, 25.0, 30.0)
  
bmiTell 85 1.90

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b
  
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT    
  
3 `myCompare` 2   

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [1] ++ "."    
  where (f:_) = firstname
        (l:_) = lastname    
        
        
import Data.list    
import Data.list (nub, sort)
import Data.list hiding (nub)   

import qualified Data.map
-- filter is now Data.map.filter

import qualified Data.map as M
-- filter is now M.filter