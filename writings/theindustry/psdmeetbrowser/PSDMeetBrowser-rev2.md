There is a certain amount of hatred from developers against the PSD format. Over the years Adobe has tried to maintain backwards compatibility while tacking on more and more features. New features are often rushed and their structure poorly thought out; often added without ever even being documented. The format has been touched by countless different developers/dev teams. All these factors have combined to give PSD a reputation as a terrible image format.

The developer Aristotle Pagaltzis once wrote [^1]:  

> PSD is not a good format. PSD is not even a bad format. Calling it such would be an insult to other bad formats, such as PCX or JPEG. No, PSD
is an abysmal format.   

Thats not a very positive endorsement for the worlds most popular format for design documents.

[psd.js](http://meltingice.github.com/psd.js/) is a project that has ignored the spikes on heads, the nuclear testing ground signs, the bodies of failed image editors and journeyed into the heart of Adobe's lair. The creator has built a Photoshop Document Parser in JS that runs both in the browser & node.js.

> psd.js is a general purpose file parser for PSD files created in Photoshop. Given a PSD file, it can parse out information such as image size
and color modes, image resources, layer info, image contents, etc.  

When I heard about a PSD parser in JS that runs in the browser I was; surprised, impressed and skeptical. Will this even work? How is this even possible? If it does work, will the performance [^2] even be remotely adequate for real world usage? What are the real world usage aspects of such a script? 

Some of the stated goals of psd.js are:

* Output flattened image to PNG
* Output image to HTML canvas
* Selectively enable/disable layers for export
* Extract image contents of single layers
   
In the short term I can envision this being used to build previews of a PSD without the need to upload thumbs. [^3] One can also see the benefits of being able to extract meta data like; title, layer names, width, depth, color mode etc. Services can utilize this to cut down on the extra steps required to add metadata for PSD files. The metadata is already there, so why not use it?

In the long term the possibilities are great. Imagine creating sprite PSDs and having the css (even the html) automatically generated. In-browser mockup tools that can spit out PSDs. HTML5 image editing apps that import PSDs and allow you to edit your PSDs. There have been tools built in the past [^4] to layer images above or below a design to use a reference; now imagine being able to actually turn on/off layers in that reference. How about something that extracts layer styles & builds the equivalent CSS. The possibilities are exciting. 
         
It seems obvious to me now that the browser should speak some PSD. As designers we constantly play translator to the browser. We slice in dice our sprites. We choose "interlaced" or "non interlaced" (Seriously photoshop?). We adjust font smoothing until we get something that roughly approximates the vision of failing eyesight. We do our best to approximate line-heights, kerning etc in css. We replicate complicated layer effects with even more complicated CSS. So its about time we start the long road toward something better.
      
The future of the browser and its relationship to our design tools is looking better than ever. As our tools get better so will our designs and that is well, awesome. Keep a close eye on [psd.js](http://meltingice.github.com/psd.js/). It could very well spawn something awesome and possibly save the cheerleader & the world. Okay, maybe not that last bit.   

## Footnotes

[^1]: [One heartfelt indictment](http://plasmasturm.org/log/541/). Also that guy has the coolest name ever. 

[^2]: I was able to create a few test PSDs that parsed just fine but most of the other PSDs I tried did not work. The hackernews thread isn't too    encouraging either [https://news.ycombinator.com/item?id=3533987](https://news.ycombinator.com/item?id=3533987). It seems a bit fickle at this point but hopefully the bugs will be worked out.  
      
[^3]: Its actually pretty rare to find a site that extracts thumbs from PSDs for you. Perhaps having a JS script that does this available would increase the number of sites that do this. God knows that every time a jQuery script makes "something" easy the number of sites doing that "something" explodes.
      
[^4]: That would be [Pixel Perfect](https://addons.mozilla.org/en-US/firefox/addon/pixel-perfect/)  