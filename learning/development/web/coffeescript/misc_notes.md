It seems like Coffeescript now has rather adequate community as far as education materials go.

You know, the coffeescript website is probably one of the most focused sites I've seen for an open source project. For some
reason too many projects like to throw a bunch of their own stuff out there. The creator(s) know you want to know what it
does, to try it out, and then you want links. It doesn't try to hide the community from you. Too many sites try & do things
in a canon manner & it just hurts them. With canon docs you tend to feel like everything is outdated & the real community
lies somewhere else not there. The coffescript site doesn't try to be the community site, its just the starting point.

I don't know if its egos that drives that way of doing things or not. Enough rambling...

https://github.com/autotelicum/Smooth-CoffeeScript
http://arcturo.github.com/library/coffeescript/

On a side not I have a fucking terrible time spelling coffee. Dyslexia, its a bitch only stopped by the power of auto
spellcheckers.  

Oooh la la loops in coffeescript are like python comprehensions. I think I'm in love.

```coffee
prisoners = ["Roger", "Roderick", "Brian"]
release prisoner for prisoner in prisoners when prisoner[0] is "R"
```                                                                

Ruby try esque awesomeness with the power of a ? mark. The follow is a nil check

```coffee
blackKnight.getLegs()?.kick()
```

You can also check that what your calling is a function by placing it before the paranthesis.

```coffee
blackKnight.getLegs().kick?()
```                                