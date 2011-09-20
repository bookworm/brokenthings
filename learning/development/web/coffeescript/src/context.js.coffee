### 
  As if this animal didn't have enough issues (like living in a zoo) it has constipation & bad context.
  
  As a sidenote zookeeper was the worst film about a gorilla (kevin james joke) I've ever seen.
  Like some sort of urban tarzan movie.    
  
  As a furhter sidenote the best movie about a gorilla I've eever seen was ironically a king of fishes. The fischer king.
  You should definitely give it a watch. 
  Robin Williams plays a schizophrenic gorilla that escapes & runs naked through central park. 
  Well, at least thats how I remember it. A great & hairy film.
###
class AnimalWithConstipationandBadContext       
  crap_level: 9       
  
  shit: ->
    "My current crap backup is #{@crap_level}"
    
class HealthyAnimal
  crap_level: 4

  shit: =>
    "My current crap backup is #{@crap_level}"

animal1 = new HealthyAnimal
#console.log(animal1.shit())

animal2 = new AnimalWithConstipationandBadContext
#console.log(animal2.shit())

# Well shit that returns correctly.
# I'm guessing I need to change context by placing the bad context inside another function. 
# Just like what happens in js callbacks.  

# Just for grins & murders lets chekc it anormal function first.
# bob = ->
#    console.log(animal2.shit())
# 
# bob()   

# And as anticipated that did absolutely fucking nothing. I'm begining to feel retarded lets try some actuall callbacks.
# A quick google search turns up [the coffeescript cookbook](http://coffeescriptcookbook.com/chapters/jquery/callback-bindings-jquery)

# I think the easiest way to do callbacks is just a dom event. 
# Sidenote anyone else code listening to Paramore & Blink-182 in the same playlist?   
# Its really strange to go from singing lyrics of Misery Business to thinking out loud in coffeescript.         
# Note: I don't sing along to Misery Business, I skip it just like very Taylor Swift song. Really I do.

# $('#elem').click(console.log(animal2.shit()))

# This does some wierd shit and appears to be called instantly.    
# This actually makes sense though because we're actually calling the click. click.
# We need to pass it a callback.

# $("#elem").click (event) => 
#   console.log('clicked')    
#   console.log(animal2.shit()) 

# Nothing? Seriously?  
# Lets makesure we got this elem slector working

# $("#elem").addClass('bob')

# No classed added hmm.
# I'm guessin its because jQuery is not loaded. We need to wrap everything ina dom.ready

$(document).ready =>  
  $("#elem").addClass('bob')    

# And bingo. Now lets wrap up our click event.
 
$(document).ready =>  
  $("#elem").click (event) => 
    @crap_level = 5     
    console.log('clicked')    
    console.log(animal2.shit())  

# Now I've proven I've no idea what I'm doing when it comes to context. Time to hit google. 