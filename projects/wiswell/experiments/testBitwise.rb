require "rubygems"
require 'bitset'
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
board = Bitset.new(32)    

def intersect(array1, array2)
  array1.collect{ |item| item if array2.include? item }.compact
end  

def map_square(square) 
  (square + 1) * 2 / 8
end     

# start = "20"  
# dest  = '16'
# player = 'red'
# 
# white_squares = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
# empty_squares = [12, 13, 14, 15, 16, 17, 18, 19]     
# white = Bitset.new(32)
# empty = Bitset.new(32)   
# red = Bitset.new(32)   
# red_kings   = Bitset.new(32)
# white_kings = Bitset.new(32)    
puts 'e'
# white.set(white_squares) 
# empty.set(empty_squares)    
# red = ~(white | empty)
# puts red   
# 

#("20-16") 

# do I have a piece on 20 color[20]
# empty = white and red inteesection.
# empty[16]?
# + 4?
# - 4? if king?
# 

#red = board.map { |item| item if !(white + empty).include? item }.compact

# white = [
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   1, 1, 1, 1, 
#   1, 1, 1, 1,
#   1, 1, 1, 1 
# ]
# 
# empty = [
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   1, 1, 1, 1,
#   1, 1, 1, 1,
#   0, 0, 0, 0, 
#   0, 0, 0, 0,
#   0, 0, 0, 0 
# ]    

# eval("white = 0b#{white.join('')}")
# eval("empty = 0b#{empty.join('')}")  

# red = (white | empty)
# puts red.to_s(2)    

# white = [
#   1, 1, 1, 1, 
#   1, 1, 1, 1,
#   1, 1, 1, 1,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0,
#   0, 0, 0, 0
# ]   
# 
# 