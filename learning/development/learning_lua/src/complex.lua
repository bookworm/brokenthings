local M = {} 
complex = M	
M.i = {r=0, i=1}   

function M.new(r, i) 
  return {r=r, i=i} 
end
function M.add(c1, c2)
 return M.new(c1.r + c2.r, c1.i + c2.i)
end