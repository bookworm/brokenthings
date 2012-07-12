What happens when you take a HTML/CSS playground and combine it with a good UI framework? Well, [Pears](http://pea.rs) [^1] happens. Now I know what you're thinking: `jsfiddle + bootstrap = oddly shaped fruit?` [^2] Well, your intuition has lead you down a rabbit hole of absurdity. Pears is actually a collection of interface patterns and a simplified HTML/CSS playground packaged up as a WordPress theme. Its intended as a superbase [^3] from which you can quickly build your own interface patterns.

If all that isn't cool enough its authored by the super hero Dan Cederholm, better known as [@simplebits](http://simplebits.com). 

Dan describes the philosophy of Pears:

  > I wanted a handy way of collecting HTML & CSS pattern pairs. 
    Often used modules with a minimal of style applied...

I can see Pears as being very useful for creating styles/patterns quickly(ier). Especially in environments (like WP) where projects like [Compass](http://compass-style.org) and [Bourbon](https://github.com/thoughtbot/bourbon) are not easily used [^4]. The theme itself is a bit unpolished [^5] and I think its intended (at least for now) to be used simply as a way to generate patterns and not as a starter theme for your own WP theme.         

The existing patterns are well designed (as you might expect) but a bit sparse compared to something like [Bootstrap](http://twitter.github.com/bootstrap). All the basics are there; forms, navs, tags, headings, article, search etc but there are none of the spiffy extras like dialog boxes, progress bars etc that are common to more mature UI kits. That said, it is open source and open for contributions, so I imagine the number of patterns will grow quickly.     

The focus of Pears compared, to say bootstrap, is that its meant to put you in the drivers seat. Its intended as a tool for you to create and experiment with your own patterns. Its not just there to add to your arsenal of design weaponry but to also encourage you to build your own weapons. As Dan says in his philosophy statement:    

  > It's become 
    a valuable learning tool, whereby breaking interfaces down into 
    small pieces make it easier to learn and improve running code.        

The environment of [Compass](http://compass-style.org), [Sass](http://sass-lang.com/), [LESS](http://lesscss.org) and their like are often overcomplicated for many designers, so hopefully Pears can bring UI pattern creation to a new audience. It'll be interesting to see what people do with Pears; I'm watching closely. 

Pears has both a demo site [http://pea.rs](http://pea.rs) and a [github repo](https://github.com/simplebits/Pears) available. Check it out!      

## Footnotes  

[^1]: The name "Pears" seems to be a rather complicated Turing cypher that produces vowel replacements. When passing in "Pairs" one gets out "Pears". The simplest explanation for this creative outburst of naming conventions is that Dan received this cipher after communicating with a sentient fruit bowl.
       
[^2]: Just to clarify the project has nothing to do with [jsfiddle](http://jsfiddle.net/) or [Bootstrap](http://twitter.github.com/bootstrap).  

[^3]: Not to be confused with a superellipse (a squircle) which is a geometrical shape renowned for its super powers.   

[^4]: You might checkout [Wordless](http://welaika.github.com/wordless) which attempts to bring Sass, Compass, Coffeescript & Haml to WP theme dev. 

[^5]: Before you think I'm being a bit over critical, Dan himself views it as a "bit rough": `I'll admit the code is a bit rough, initially based on the default 'twentyone' theme.`
