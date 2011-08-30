type: 'default'
title: "Compilation Times Suck" 
status: 'public'  
intro: |
Compilation times oh my. Over the past few days I've suddenly realized how much of a barrier compilation times present in languages like C/C++. I've been manually
building KDE and writing/testing some patches and I've experienced the hell of hours of compile times just to test the code. I've come to really respect
those who work on the massive libraries behind the software we take for granted. These guys are far more resilient mentally than I ever imagined. I could never
deal with such compilation hell.   
body: |
Compilation times oh my. Over the past few days I've suddenly realized how much of a barrier compilation times present in languages like C/C++. I've been manually
building KDE and writing/testing some patches and I've experienced the hell of hours of compile times just to test the code. I've come to really respect
those who work on the massive libraries behind the software we take for granted. These guys are far more resilient mentally than I ever imagined. I could never
deal with such compilation hell.

Compilation times pretty much destroyed my workflow over the last few days and I had to set aside the project I was working on for now while I work on my own C#
bindings for QT. The KDE made C# bindings for QT have way too many dependancies and require patches to get working on Mac. It takes me a good 1-2 hours to compile
and test a patch, ouch. I'll write a bit later about why I needed C# QT bindings in the first place. I'll just say this, the project is born out my frustration
with existing design workflows and Adobe products.

Anyways this compilation issue got me a little curious about how Go achieves such fast compilation times.       

From their [FAQ](http://golang.org/doc/go_faq.html#What_is_the_purpose_of_the_project).                             

> Go provides a model for software construction that makes dependency analysis easy and avoids much of the overhead of C-style include files and libraries. 
> Go's type system has no hierarchy, so no time is spent defining the relationships between types. Also, although Go has static types the language attempts to > 
> make types feel lighter weight than in typical OO languages.    

You see C/C++ dependency management is well known issue and has been for a long time. It frankly sucks. What amazes is that people have put up with this for so 
long on large desktop software & game projects. Coming from an interpreted language background compilation time drives me insane and I now have a greater respect 
those who deal with it on a day to day basis.  

Some more thoughts about language design later. For now I've got to get to committing DBD stuff and uploading stuff I've held off on during the last couple of 
days while my cpu fan spun and spun and spun. I can hear my little dual core cpu crying out in pain now.     