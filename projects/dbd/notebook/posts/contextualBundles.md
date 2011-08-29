title: Contextdual Bundles.  
type: Default  
status: public             
body: |    
      
I love bundles like [mCSS](http://minimaldesign.net/downloads/tools/textmate-css-bundle) and
[Sparkup](https://github.com/rstacruz/sparkup). They make me faster as a front end developer, but as a writer I feel like
that slow guy on the team of super-heros whose only real power is naming things after himself, I'm looking at you Mr.
Fantastic.

But I digress. Why is that when I do `link + tab` in selfPraise.html I get that magical I just skipped a whole bunch work
feeling, but when I do the same thing in selfDepreciation.md I feel like a stylesheet that doesn't belong?

The problem is a lack of contextual awareness, to this TM bundle there is no difference between the links in my .html file
and links in my .md file. I want my commands to be intelligent, to know the difference between oranges, apples, and certainly
not fruit at all. I should be able to have a separate link snippet for md and one for html. Not have them collide with each
other like two down syndrome kids in soccer helmets.

Because lets face it, every kid in a soccer "helmet" is a down syndrome looking kid in a soccer "helmet". Your kid looks
retarded, trust me he does. The sad conundrum we face here is, if Johnny removes his helmet to look less retarded he might
very well end up retarded. Which is only okay if his desired position was grass consuming goalie.

But I digress. As I write this find myself typing thinks like ".me link text" and then going back through the doc
replacing those with the correct syntax. This is incredibly inefficient. I should be able to create bundle and have it know
the difference. If I type link in stuff.md I would get `[link text here](link.address.here "link title here")' and in html
I'd get `<link rel="stylesheet" href="/css/master.css" type="text/css" media="screen" title="no title" charset="utf-8">`.

How can we solve this? If bundles could be scoped to formats, it would be solved. Perhaps there is an editor out there
like this? Would a scoped editor please stand up?

As always, I believe in building things. So I will put my money where my mouth is (interesting enough its eating money.)
and prototype this shit as soon as the problem annoys me enough.   