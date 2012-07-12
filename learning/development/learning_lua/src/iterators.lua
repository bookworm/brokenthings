function values(t) 
  local i = 0
  return function() 
    i = i + 1
    return t[i]
  end
end                         

t = {10, 20, 30}
iter = values(t)
while true do
  local elem = iter()           
  if elem == nil then 
    break
  end
  print(elem)
end    

for elem in values(t) do   
  print(elem)
end             

function allwords()        
  local line = io.read()
  local pos = 1
  
  return function()    
    while line do  
      local s, e = string.find(line, "%w+", pos) 
      if s then
        pos = e + 1
        return string.sub(line, s, e) 
      end                           
        line = io.read()
        pos = 1
      end
    end
    return nil  
  end   
end   


local function iter(a, i) 
  i = i + 1
  local v = a[i]
  if v then 
    return i, v
  end
end   

function ipairs(a)
  return iter, a, 0
end   

function pairs (t) 
  return next, t, nil
end   

for k, v in next, t do
  -- <loop body>
end    
