class Bob       
  accessibleInTestFunc: "bob"
  constructor: ->
    joe = @operate(@testFunc) 
    # console.log('hey')    
  
  operation: (f) =>  
    result = f.apply(this, arguments)
    return result
    
  testFunc: =>     
    console.log(@accessibleInTestFunc)
    console.log('shit')         
  
  operate: (f) =>
    return @operation(f) 
                          
george = new Bob()
# console.log(george)     

# something = ->       
#   console.log('wtf')
#   joe = operate(testFunc) 
#   console.log(joe)  
#   console.log('hey')    
# 
# operation = (f) ->       
#   return f.apply(george, arguments)
#   
# testFunc = ->
#   console.log('shit')         
# 
# operate = (f) =>
#   return operation(f)()
# 
# something()  