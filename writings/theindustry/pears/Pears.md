What happens when you take a HTML/CSS playground and combine it with a good UI framework? Well, Pears [^1] happens. Now I know what you're thinking: `jsfiddle + bootstrap = oddly shaped fruit` [^2] ? But your thinking is very wrong. Pears is a collection of interface patterns and a HTML/CSS playground packaged up as a WordPress theme. Its intended as a superbase [^3] from which you can quickly build your own interface patterns.

If all that isn't cool enough its authored by the super hero Dan Cederholm, better known as @simplebits. 

Dan describes the philosophy of Pears:

  > I wanted a handy way of collecting HTML & CSS pattern pairs. 
    Often used modules with a minimal of style applied. It's become 
    a valuable learning tool, whereby breaking interfaces down into 
    small pieces make it easier to learn and improve running code.        

I can see Pears as being very useful for creating styles/patterns quickly(ier). Especially in environments (like WP) where projects like compass and thoughtbot are not easily used [^4]. The theme itself is a bit unpolished [^5] and I think its intended (at least for now) to be used simply as a way to generate patterns and not as a starter theme for your own WP theme.    

The existing patterns are well designed (as you might expect) but a bit sparse compared to something like bootstrap. All the basics are there; forms, navs, tags, headings, article, search etc but there are none of the spiffy extras like dialog boxes, progress bars etc that are common to more mature UI kits. That said, it is open source and open for contributions, so I imagine the number of patterns will grow quickly. 
   
The focus of Pears compared to say bootstrap is that is meant to put you in the drivers seat. Its intended as a tool for you to create and experiment with your own patterns. As Dan says in his philosophy statement `It's become a valuable learning tool...`. The environment of compass and LESS are kinda overcomplicated for many designers, so hopefully Pears can bring UI pattern creation to a new audience. It'll be interesting to see what people do with Pears; I'm watching closely.       

There is both a demo site http://pea.rs and a github available. Check it out!

## Footnotes  

[^1: The name "Pears" seems to be a rather complicated Turing cypher that produces vowel replacements. When passing in "Pairs" one gets out 
"Pears". The simplest explanation for this creative outburst of naming conventions is that Dan received this cipher after communicating with a sentient fruit bowl.
       
[^2]: Just to clarify the project has nothing to do with jsfiddle or bootstrap.  

[^3]: Not to be confused with a superellipse (a squircle) which is a geometrical shape renowned for its super powers.   

[^4]:

[^5]: Before you think I'm being a bit over critical, Dan himself views it as a "bit rough" 
  `I'll admit the code is a bit rough, initially based on the default 'twentyone' theme.`
