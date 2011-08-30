One thing that is central to understanding screen readers is to realize that the DOM itself is object, it is continuously updated and changed. 
Those changes with few exceptions (mostly on IE) are reflected in the DOM object itself. This may seem obvious to anyone who has done some real JS coding (not using jQuery or another library) but I have found that allot of both non JS coders and even prolific JS library users do not 
grasp this.   

All screen readers interact directly with the DOM, they are not text parsers. 

What this means that anything added via JS to the DOM, is fully accessible to a screen reader. The trick of accessibility is 

1. Making what is added contextually relevant    

Adding a tooltip before the end body tag for instance is terrible practice. If and when the screen read does read such a thing its going to 
read them one after another, to the user the tooltips will sound like they are describing the footer or whatever is the last text in the body.

2. Making the screen reader aware of those changes.

The problem is not that the screenreader cant read the changes, its that it has know way to know the changes have been made. Most Screenreaders can handle JS events, but how they handle them differs greatly from screenreader to screenreader. I really don't know too much about this but quick google search turned up this http://www.webaim.org/techniques/javascript/eventhandlers.php