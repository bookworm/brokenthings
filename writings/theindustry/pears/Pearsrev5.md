What happens when you take an HTML/CSS playground and put it in a WordPress theme? Well, [Pears](http://pea.rs) [^1] happens. Now I know what you're thinking: `jsfiddle + WP = oddly shaped fruit?` [^2] Well, your intuition has lead you down a rabbit hole of absurdity. Pears is not fruit at all, its actually a tool for creating markup & CSS patterns; authored by the super hero Dan Cederholm, better known as [@simplebits](http://simplebits.com). 

Patterns consist of an HTML fragment plus some CSS for styling. Patterns are created using the minimalist medium of two text areas. Patterns are saved as posts to your WP DB using the HTML and CSS meta fields. Pears is a simple yet very effective self hosted version of something like [jsfiddle](http://jsfiddle.net/) or [dabblet](http://dabblet.com/ "Dabblet – An Interactive Playground for CSS and HTML") (which we [recently covered](http://example.com/ "Dabblet – An Interactive Playground for CSS and HTML")).  

<a href="http://theindustry.cc/assets/2012/02/Pears-TagsPattern.png"><img class="aligncenter size-large wp-image-1396" title="Pears Tags Patttern" src="http://theindustry.cc/assets/2012/02/Pears-TagsPattern-750x475.png" alt="" width="750" height="475" /></a>        

## Pears is about your UI patterns. 

As web designers we often find ourselves smashed between two desires; 

1. To design websites that fit standards and look good. 
2. The desire to step out on our own and create our own UI patterns; to be a unique little flower.        

The focus of Pears in contrast, to say bootstrap, is that it's meant to put you in the drivers seat. It's intended as a tool for you to create and experiment with your own patterns. It's meant for you to create your own weapons and to set you off into the world of CSS like a Ninja in a dark suit, only with a flashlight and reflectors for safety [^3]. Welcome to the sandbox for your patterns.  

Pears is an attempt at finding that middle ground between; throwing you headfirst into the pool of UI kits like compass or Sass, and holding your hand like bootstrap. It gives you an extremely easy to use tool to create your own patterns [^4] and helps facilitate you getting started with an excellent demo site of starter patterns. The ultimate goal is to get you to be better at what you do. 

As Dan says:

  > It's become 
    a valuable learning tool, whereby breaking interfaces down into 
    small pieces make it easier to learn and improve running code.

## It's totally easy.   

For most designers out there installing Ruby libs like compass and then creating plugins/mixins for UI patterns is not only hard but overwhelming. It's part of the reason why HTML/CSS playgrounds [^5] are so popular, most out there simply don't have skills or even the desire to use something like compass. Simple works well, and whats simpler than a WordPress theme. Most of us can install a WordPress theme in minutes.

In contrast to sites like [jsfiddle](http://jsfiddle.net/) or [dabblet](http://dabblet.com/ "Dabblet – An Interactive Playground for CSS and HTML") Pears provides a much needed self hosted environment and one that is really easy to setup. 
    
I can also see Pears as being useful for creating styles/patterns in environments (like WordPress) where projects like [Compass](http://compass-style.org) and [Bourbon](https://github.com/thoughtbot/bourbon) are not easily used [^6]. The theme itself is a bit unpolished [^7] and I think it's intended - at least for now - to be used simply as a way to generate patterns and not as a starter theme for your own WordPress theme.    

## Pears is UI patterns for the rest of us. 

The environments of [Compass Plugins](http://compass-style.org), [Sass Mixins](http://sass-lang.com/) and their like are often overcomplicated solutions for many designers, so its great to see something simpler arriving on the scene. Hopefully Pears can bring UI pattern creation to a new audience. It'll be interesting to see what people do with Pears; I'm watching closely. 

Pears has both a demo site [http://pea.rs](http://pea.rs) and a [github repo](https://github.com/simplebits/Pears) available. Check it out!      

## Footnotes  

[^1]: The name "Pears" seems to be a rather complicated Turing cypher that produces vowel replacements. When passing in "Pairs" one gets out "Pears". The simplest explanation for this creative outburst of naming conventions is that Dan received this cipher after communicating with a sentient fruit bowl.
       
[^2]: Just to clarify the project has nothing to do with [jsfiddle](http://jsfiddle.net).       

[^3]: Ninja injuries should be a far more common occurrence in films. How is it they never end up hit by cars or low flying hovercraft? They have hovercraft now right? I should really google before writing articles.    

[^4]: I'd definitely like to see a set of starter patterns available. The drawback of using the WP DB is that patterns aren't easily shared on github. That said, you can always get started with some from the demo site [http://pea.rs](http://pea.rs).  

[^5]: I don't mean to imply that UI patterns are the only use of playgrounds, they've a variety of uses; collaboration and quick sharing etc.      

[^6]: You might checkout [Wordless](http://welaika.github.com/wordless) which attempts to bring Sass, Compass, Coffeescript & Haml to WP theme dev. 

[^7]: Before you think I'm being a bit over critical, Dan himself views it as a "bit rough": `I'll admit the code is a bit rough, initially based on the default 'twentyone' theme.`