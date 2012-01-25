class Bob     
  constructor: ->
    joe = @operate(@testFunc) 
    # console.log(joe)  
    console.log('hey')    
  
  operation: (f) ->  
    result = f
    return result
    
  testFunc: =>
    console.log('shit')         
  
  operate: (f) ->
    return @operation(f)()    

george = new Bob()