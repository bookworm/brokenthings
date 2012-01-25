class Bob
  # Do nothing  
  operation: =>
    console.log('called operation')    
    return 'shit'

Bob::going = -> 
  console.log('going')   

class Joe extends Bob       
  constructor: ->
    @thing = this.operation('bob')
    
   move: ->   
     console.log('go')
   
   calloperation: =>
     console.log('calling operation') 
     @operation()
  
bob = new Joe   
console.log('wtf?')
bob.move()
bob.going()   
bob.calloperation() 
console.log(bob.thing)