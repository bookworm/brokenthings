###
  Mixins are damn verbose in JS & I cant remeber evr doing them without a helper lib. Coffescript makes them as easy 
  as running over a dog on a Sunday morning.  The suprising brutal analogy, but its the first thing that came to mind. 
  Its not because I'm a particulary violent individual its just 
  I'd like to achieve a bloody Sunday purely*(has anyone notice surely is 1 letter away from purely?) 
  for metaphorical enactment purposes. 
  
  On that note heres a link to some people running with scissors . 
  [link](http://media.photobucket.com/image/running%20with%20scissors%20race/jakshadows/RacePics/RunWithScissors.jpg)    
  
  This code snippet from [The little book on coffeescript](http://arcturo.github.com/library/coffeescript/03_classes.html) 
###          

extend = (obj, mixin) ->
  obj[name] = method for name, method of mixin        
  obj

include = (klass, mixin) ->
  extend klass.prototype, mixin  # << Look at that magic. Look at absorb it, accept it, be amazed.

# Usage
include Parrot,
  isDeceased: true

(new Parrot).isDeceased