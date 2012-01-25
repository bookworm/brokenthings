class Animal  
  constructor: (@name) ->
  dup: ->
    return new Animal(@name)  
    
bob = new Animal('darwin')
joe = bob.dup()
console.log(bob)
console.log(joe)    