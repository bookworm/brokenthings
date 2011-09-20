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
    alert "My current crap backup is #{@crap_level}"
    
class HealthyAnimal
  crap_level: 4

  shit: =>
    alert "My current crap backup is #{@crap_level}"

animal1 = new HealthyAnimal
animal1.shit

animal2 = new AnimalWithConstipationandBadContext
animal2.shit