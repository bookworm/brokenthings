board = [
   0, 1, 2, 3,
   4, 5, 6, 7,
   8, 9, 10, 11,
   12, 13, 14, 15,
   16, 17, 18, 19,
   20, 21, 22, 23, 
   24, 25, 26, 27, 
   28, 29, 30, 31,
]   

red = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  1, 1, 1, 1, 
  1, 1, 1, 1,
  1, 1, 1, 1 
]

empty = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  1, 1, 1, 1,
  1, 1, 1, 1,
  0, 0, 0, 0, 
  0, 0, 0, 0,
  0, 0, 0, 0 
]  

white = [
  1, 1, 1, 1,
  1, 1, 1, 1,
  1, 1, 1, 1,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0, 
  0, 0, 0, 0,
  0, 0, 0, 0 
] 

white_kings = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0, 
  0, 0, 0, 0,
  0, 0, 0, 0 
] 

moving = '20-16' 
start = 20
dest = 16 

if canJump()
  # We are jumping.  
  return unless dest = opponent(dest + 4) || dest = opponent(dest - 4)
  
return unless empty[dest]  
return unless color[start] || isKing()
return unless (start - 4) = dest || (start + 4) = dest  

if isRed() && dest > 19  
  return unless isKing()   
if isWhite() && dest < 12  
  return unless isKing()

empty[start] = 1   
empty[dest] = 0     
if isKing()
  red[20] = 0
  red[16] = 1    
  
canJump = ->
  return false unless opponent(start - 4) || opponent(start + 4)
  return true