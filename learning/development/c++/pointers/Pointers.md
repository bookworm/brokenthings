What I think of as passing by value in higher languages is not the same in lower languages. Someone along the way wrote this down and it stuck, its wrong. What actually happens in higher level languages is “call by object".

Now essential to understanding pointers is that they make up for missing features in C/C++. The most glaring of these is that you can return mixed values from a function, no `@returns mixed` magic. To get around this you modify the variables value from inside the function.      

This fundamentally changes the way you think about constructing functions. I'm not sure if anyway can be considered the right way, the high level way certainly brings more flexibility, but ultimately modifying stuff by reference is leaps and bounds better performance wise.

Typically a variable when passed by value or call by object, its copied into the function. This essentially doubles the memory usage. I'm sure some nifty ways have been found to alleviate this extra load this in some languages, but at least in C/C++ thats what happens.  

For example

```c++
#include <iostream>    

using namespace std; 

int Calculate(int v) {
  v += 100;
  return v;
}

int main()
{     
  int i, final;
  i = 500;
  final = Calculate(i); 
  
  cout << final;
  return 0;     
}   
```     

```c++ 
#include <iostream>    

using namespace std; 

void Calculate(int *v) {
  *v += 200;  
}

int main()
{     
  int i;
  i = 500; 
  int* final = &i; 
  Calculate(final); 
  
  cout << i;
  return 0;     
}
```           

Actually that is a bad example because of the nature of ints, ints are handled so well that copying is less heavy than creating a pointer. But you get the point, lets cement it with an char example.

```c++
#include <stdio.h>              
#include <string.h>
            
void GetCar(char *vehicle) {
  strncat(vehicle, "Year: 2007 hybrid", 18);  
}        

int main()
{
  char Car[500];
  sprintf(Car, 'Toyata Camry');
  GetCar(Car);

  printf("%s", Car); 
  
  return 0; 
}
```    
{:note}
Interesting to note how much pointers are utilized throughout STD libs. For example `sprintf()` takes a pointer to a char, and then modifies that inline. Kinda confusing coming from languages where I nearly always expect values back, pointers require a paradigm shift in thinking.
Pointers are everywhere. [Reference](http://www.cplusplus.com/reference/clibrary/cstdio/sprintf/).        
yo dawg we heard you like pointers so we added pointers to your pointers.
{:/note}

C\C++ at their heart are human friendly way of doing real computer operations, i.e assembly for humans.
High level languages pull off a great deception, they throw fancy things like JIT and lure us into bad thinking. Some of us forget what happens behind the scenes, but others they never understand it all. Like a Mexican in a parking garage at midnight, like an out of place analogy, we're lost. 

Its hard to wrap ones head around the idea of references and pointers when you're stuck thinking variables are all the same. It was one said by a wise man with few friends that: Any sufficiently Advanced Magic is indistinguishable from Steve Jobs.

Think about when was the last time you saw `&` in a php program?

Finally grasping a low level language, requires throwing out your rotten foundation & building up from the ground again. Approach it with a fresh mind and C/C++ actually makes a hell of allot of sense.

When you pass a variable in your favorite high level language you're actually not passing a variable. There is references
being magically handle behind the scenes.

They make us weak as programmers, they teach us to think in ways we shouldn't they make doing the really cool shit fly above our heads

So anyways how exactly does that change things for us architecturally? Lets take a simple example of a 'factory' method.
In php I would typically return either false or the object. In C++ what might we do instead?      

Also should note that the performance issue of copying is why we return a pointer and not the actual object. Otherwise we'd duplicate the object! Ouch!

Reading complex pointers confused the fuck out of me until I read this http://ieng9.ucsd.edu/~cs30x/rt_lt.rule.html. Makes
understanding them much easier. Internalize that article & make it second nature, you'll thank me later.


# Differences between pointers and references.

"A reference *is* the object" Remember that & understand then you'll know references see [http://yosefk.com/c++fqa/ref.html](http://yosefk.com/c++fqa/ref.html) and [http://stackoverflow.com/questions/57483/what-are-the-differences-between-pointer-variable-and-reference-variable-in-c](http://stackoverflow.com/questions/57483/what-are-the-differences-between-pointer-variable-and-reference-variable-in-c) 

Its also possible to think of references as being _the address_. Where as with pointers by default we are messing with the addresses and pointing it to new addresses in memory with references we are copy things into that memory adress.

Basically with pointers you are always doing '*pointer = value;'. This can make things confusing when reading over the code, but thats why prefixes were invented.

Once you grasp this you start to realize that a good general rule is to use `references` unless you need `pointers`.  

Side note I find it funny how the C++ FAQ jumps through hoops to point at that their execeptions to the rules. Do they get angry letters from developers who followed the rules to strictly. Anyone with half  brain realizes that principles are not set in stone. Spending paragraphs explaining why this rule might not apply to all cases just adds fluff and makes the zFAQ harder to read.

Some definitions:
  address-of operator: &  
  value-of operator: *  

`Variable1=*Pointer;`

is the same as

`Variable1=Variable2;`      

So if we want to point a pointer to an address we do `pointer = &var;` and to change the value use `*pointer = value;`.

What makes pointers confusing is that they just point to memory addresses and modify their values.

Which means `var = x;` is equivalent to `*pointer = x;` if the pointer points to the same memory adress. We are just changing the contents of memory address. When you've pointers to pointers to pointers things can get mind blowing convoluted, thats why its important to follow good guidelines & not get carried away.   

One of the arguments C proponents use is that it forces you to use good programming habits. If you use bad habits you cant get far. Higher level languages are much more forgiving to bad coding.     



    
# Arrays 
Arrays are interesting in that they're essentially syntactic sugar around pointers.  

`Array[4]=20;`

is actually just `*(Array1+4)=20;`    

This means that when we pass an array to a function we are actually passing pointers, not copying over an array.

# Links

1. http://www.infernodevelopment.com/simple-c-pointers-and-references
2. http://ieng9.ucsd.edu/~cs30x/rt_lt.rule.html 
3. http://duramecho.com/ComputerInformation/WhyCPointers.html
4. http://linuxconfig.org/c-understanding-pointers