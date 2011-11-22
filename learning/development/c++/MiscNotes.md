C++/C seems to like vars begining with uppercase letters. Might be useful for pseudo objects. e.g objects that aren't really objects but act like ones. Good to denote them with a special naming convention. Stuff like Gobject in GTK+ etc.    

# Virtual Methods

C++ uses a "real" inheritance model that requires you to explicitly declare when a method is overridable using the virtual keyword. 

`virtual void eat() {}` 


# Member initialization lists  

The first time I saw this was a big WTF moment. Languages like php require you to manually pass off params to the parent. Every PHP programmer places the follow in front of their code every fucking time, its like second nature.

`parent::__constructor(args)`         


Strange how C++ thought of a better way decades before.   

Interestingly it seems like you get setters for free.  

class Baz
{
  public:
    Baz(string foo) : foo(Foo)
  private:
    string foo;  
};

is essentially the same as

class Baz
{
  public:
    Baz( std::string foo )
    {
      this->foo = foo;
    }           
  private:
    string foo; 
};  

[source](http://www.cprogramming.com/tutorial/initialization-lists-c++.html)

# Constructors

Interestingly it seems that multiple constructors are possible in C++.
How the fuck does that work? It appears that the compiler determines which constructor to call based on the number and types of arguments. So don't declare two with the same number of arguments and the same type.
 

# Music I'm listening to while studying C++ today.

1. Safetysuit
2. One Republic     
3. Fireflight
4. Paramore
5. Vanessa Carlton     

Have you heard "Vanessa Carlton - Hands on Me"? Its about a grabby Buddhist monk that Brad Pitt rescues while trapped in the Himalayas. Or something like that. Really listen to it.

Don't judge me.