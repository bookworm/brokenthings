There is a certain amount of hatred from developers against the PSD format. Over the years Adobe has tried to maitain backwards compatibli while taking evermore features. Features that are sometimes rushed & their structure poorly thought out. All these factors have combined to give PSD a reputation as a terrible image format.  

The developer Aristotle Pagaltzis once wrote [^1]:  

  > PSD is not a good format. PSD is not even a bad format. Calling it such would be an insult to other bad formats, such as PCX or JPEG. No, PSD  
  is an abysmal format.  

Thats not the sort of review one would like to see of their format.    

[psd.js](http://meltingice.github.com/psd.js/) is a project that has ignored the spikes on heads, the nuclear testing ground signs, the bodies of
dead developers & journeyed into the heart of Adobe's lair. The creators have built a Photoshop Document Parser in JS that runs both in the
browser & node.js.

  > psd.js is a general purpose file parser for PSD files created in Photoshop. Given a PSD file, it can parse out information such as image size 
  and color modes, image resources, layer info, image contents, etc.  

When I heard about a PSD parser in JS that runs in the browser I was; surprised, impressed & skeptical. Will this even work? How is this even
possible? If it does work, will the performance [^2] even be remotely adequate for real world usage? What even are the real world usage aspects
of such a script?

Historians, sociologists anthropologists, economists etc all speak of technological tipping points. Its the moment when the potential of a new
technology enters the collective mind. New tech can sit idly by for years, decades or even centuries before someone finds a use for it. But there
always comes a point when we collectively realize what we can do with this new "thing" & then innovation explodes.

It seems obvious to me now that the browser should speak PSD. As designers we constantly play translator to the browser. We slice in dice, we
choose "interlaced" or "non interlaced". We adjust font smoothing until we get something that roughly approximates the vision of failing
eyesight. We do our best to approximate text heights and colors in css. We create sprites and replicate complicated layer effects with even more
complicated CSS.

Its about time we moved towards something better.  

Some of the stated goals of psd.js are:

* Output flattened image to PNG
* Output image to HTML canvas
* Selectively enable/disable layers for export
* Extract image contents of single layers
   
In the short term I can envision this being used to build previews of a PSD without the need to upload thumbs. [^3] One can also see the benefits of being able to extract meta data like; title, layer names, width, depth, color mode etc.    

In the long term the possibilities are great. Imagine creating sprite PSDs & having them automatically generated into css. Or in browser mockup tools that can spit out PSDs. HTML5 image editing apps that import PSDs & allow you to edit your images without converting. There have been tools built in the past [^4] to layer images above or below our design as reference; now imagine being able to actually turn off the layers in that design.

The future of the browser & its relationship to our design tools is looking better than ever. As our tools get better so will our designs and that is well, awesome.  

[^1]: [One heartfelt indictment](http://plasmasturm.org/log/541/)  

[^2]: I was able to create a few test PSDs that parsed just fine but most of the other PSDs I tried did not work. The hackernews thread isn't too  
      encouraging either (https://news.ycombinator.com/item?id=3533987)[https://news.ycombinator.com/item?id=3533987]. It seems a bit fickle at 
      this point but hopefully the bugs will be worked out.  
      
[^3]: Its actually pretty rare to find a site that extracts thumbs from PSDs for you. Perhaps having a JS script that does this 
      available would increase the number of sites that do this. God knows that every time a jQuery script makes "something" easy the number of 
      sites doing that "something" explodes.    
      
[^4]: Pixel Perfect: 
      (https://addons.mozilla.org/en-US/firefox/addon/pixel-perfect/)[https://addons.mozilla.org/en-US/firefox/addon/pixel-perfect/]  