Variables are not automatically local.  You've to explicitly set them that way by using `local`

```lua
  
x = 10 
i = 1    

while i <= x do 
  local x = i*2 
  print(x) 
  i=i+1   
end  
         
x = 40
if i > 10 then  
  local x
  x = 20
  print(x + 2)       
else
  print(x) 
end
print(x)
```       

In interactive mode you can get weird bugs with locals; but you are allowed to create chunks/scopes manually using do/end.   

Lua provides do while and it calls it repeat-until  
```lua
repeat
  line = os.read()
until line ~= "" 
print(line)     
```      

The scope of variable defined in a rpeeat-until block extends to the condition e.g      
      
```lua
local sqr = x/2 repeat
sqr = (sqr + x/sqr)/2
  local error = math.abs(sqr^2 - x) 
until error < x/10000     
```      

you can break a loop by calling break anywhere in the loop.

Lua has an or statement

`n = n or 1`        

Return multiple values using a comma
           
`
function bob()
  return a, a2  
end
v, v2 = bob({1,2})      
`         
Lua is smart enough to adjust things for return not enough values or to many; lua will fill them out with nils.  
 
Quote From Programming in Lua:

Beware that a return statement does not need parentheses around the returned value; any pair of parentheses placed there counts as an extra pair. So, a statement like return(f(x)) always returns one single value, no matter how many values f returns. 
 
/ end Quote From Programming in Lua:

Lua treats 0 and an empty string as false.       

double brackets for doc strings 
```lua
string = [[        
  String
]]    
```   

you can use anything to delimitate the string though i.e 

--[=[  
  string
]=] 

`..` is the concatenation operator            


# On Tables 


Tables are central to Lua, they allow not just arrays & hashes but objects as well. They are used by many to bring the sense of OOP to Lua sorta like prototype and objects in javascript. 

Think of them as a hash doesn't quite cover their capabilities. I prefer to think of them as dynamic C Structs.

C structs can contain a variety of stuff, but cant be modified at runtime. Lua tables are even more flexible in what they can
contain & can be modified at runtime.                          

You do this

array = {"one", "two", "three", "four", "five"}
      
or

hash = {name="Foo", bar="foo", cats="cute"} 
print(hash.name)
print(hash['name'])         

Quote From Programming in Lua:

A table is always anonymous. There is no fixed relationship between a variable that holds a table and the table itself:  
                                                                                                                           
```lua         
  a = {}
  a["x"] = 10 
  b = a  -- ’b’ refers to the same table as ’a’ --> 10
  print(b["x"]) 
  b["x"] = 20
  print(a["x"])  --> 20
  a = nil -- only ’b’ still refers to the table 
  b = nil -- no references left to the table      
```

When a program has no references to a table left, Lua’s garbage collector will eventually delete the table and reuse its memory.     

/ end Quote From Programming in Lua:                     

Lua stores global variables in tables. Interesting. We can probably access globals in interesting ways. Is this the metatable?

Pound symbol `#` is a length operator.

```lua    
array = {"one", "two", "three"} 
print(#array)
for i=1, #array do
  print(array[i])
end
```          

It's important to note that Lua uses nil values to detect the end of a table. If you want to count the elements in something that might have nil values (say an object) you need to use `print(table.maxn(array))`   

Lua has an optional record-style key/value system for tables you can do.

`days = {[0]="Sunday"} `

Not sure what the practical (besides explicitly numbering a key e.g `{[i+0] = 'value'}`) use of this is yet.   

Colons and commas are interchangeable e.g `{x=10, y=45; "one", "two", "three"}`    

Quote From Programming in Lua:

Lua always adjusts the number of values to the number of variables: when the list of values is shorter than the list of variables, the extra variables receive nil as their values; when the list of values is longer, the extra values are silently discarded:       

/ end Quote From Programming in Lua:    


Variable arguments. You can use (...) for variable arguments. Interestingly this is how you refer to those args as well. 

```lua    
function add(...) 
  local s = 0 
  for i, v in ipairs{...} do
    s = s+v 
  end
  return s   
end
print(add(3, 4, 10, 25, 12))
``` 

`function foo (a, b, c)`
 
is equivalent to

`
function foo (...) 
  local a, b, c = ...`
    
Functions are nothing more than values, function names just point to them. You can actually do stuff like `print = math.sin`

Tail calls are pretty damn neat and can operate just like goto statements

Following example from Programming In Lua:
      
```lua
function room1() 
  local move = io.read() 
  if move == "south" then 
    return room3() 
  elseif move == "east" 
    then return room2() 
  else
    print("invalid move")
    return room1()	-- stay in the same room
  end     
end     

function room2() 
  local move = io.read() 
  if move == "south" then 
    return room4() 
  elseif move == "west" then 
    return room1() 
  else
    print("invalid move")
    return room2()  
  end    
end 

function room3() 
  local move = io.read() 
  if move == "north" then 
    return room1() 
  elseif move == "east" then 
    return room4()
  else
    print("invalid move")
    return room3()
  end    
end  

function room4() 
  print("congratulations!")
end 
```      

The beautiful thing about closures is they can maintain state across successive calls. Which means they can be used as iterators.

Numeric For Loops work like this:

1. Initial Value    
2. End value
3. Increment  
  
```lua
for i = 0, 10, 2 do
	print(i)
end   
```

Generic For Loops 

When a function is used as an iterator that function is called until a nil value is produced.   

An iterator function needs to maintain it's it can do this by being closure inside a function (factory) e.g

```lua
function values(t) 
  local i = 0
  return function() 
    i = i + 1
    return t[i]
  end
end
```  

Quote From Programming In Lua:
  
for <var-list> in <exp-list> do 
  --body
end

Here, var-list is a list of one or more variable names, separated by commas, and exp-list is a list of one or more expressions, also separated by commas.     

/ end Quote From Programming Lua       

So both the vars that are incremented and the expression can take multiple args. This means we can use the for loop to keep state instead of in the closure.     

The first var is special and is the control var. When it's value becomes nil the loop ends.

It's important to explain invariants here.

An invariant is something that should always remain true and when it doesn't the loop should end.

This is something distinct from the test condition.

If we think of the following

`
while B
  S
end 
`   

We actually have quite few things going on in a for loop.

1. A precondition Q
2. A postcondition R
3. An invariant P.

Ummm what?  

Lets try to explain this with an example. Say we've an array of people. 

If we loop over those items

I shall return to this.

# Exceptions

Exceptions in Lua aren't fully developed but you can throw errors. Use assert() which will either return the functions results or throw an error. Tr/Catch doesn't seem to be available. But it can be hacked on http://failboat.me/2010/lua-exception-handling/

The altenrative to try and catch is special function called pcall() just wrap the function call in pcall and handle erorrs that way e.g

```lua
if pcall(foo) then 
  -- no errors
else 
  -- errors
end  
``` 

The first result from pcall is always whether or not it failed followed by what the function returned.

If pcall returns false the second value is the error message.
e.g `status, err = pcall(f())`   

You can use a coroutine as an iterator if in the returned closur you call coroutine.resume()  

```lua
function permutations (a) 
  local co = coroutine.create(function () permgen(a) end) 
  return function()
    local code, res = coroutine.resume(co)
    return res 
  end   
end 

for p in permutations{"a", "b", "c"} do 
  printResult(p)
end 
```   

take this data 

```lua   
Entry {   
  author = "bob"
}
```
     
and this code        

```
local authors = {}
function Entry(e)    
  print(e.author)
end            

dofile("data.txt")
```  

Entry function global is called. Thats because the function serves as a constructor for the `Entry`. It's like calling Entry.new() in other languages. 


Interesting gotcha about Lua load paths. Rather than being directories they're patterns. Had to do `export LUA_CPATH="?.dylib;/Users/kenerickson/code/lua/lib/?.dylib;/usr/local/Cellar/gegl/0.2.0/?.dylib;"` to get lua to load dylibs instead of .so


Modules are nothing more than a table with methods added to it e.g
    
```lua
local M = {} 
complex = M	
M.i = {r=0, i=1}   

function M.new(r, i) 
  return {r=r, i=i} 
end
function M.add(c1, c2)
 return M.new(c1.r + c2.r, c1.i + c2.i)
end 
```

To use it you'd do

```
require 'complex'

complex.new()
```    

Interestingly we don't need to define module names explicitly. They're actually passed to the module e.g

```
local modname = ... 
local M = {} 
_G[modname] = M
```

The three dots `...` are the args passed to the module. Which  apparently means that module chunks are treated just like functions, i.e can receive args. Pretty damn cool.    

module function `module(...)` can be used to eliminate the boilerplate above.


Tables have an identity i.e self. The difference between class methods and instance methods is all dependent on implementation. Rather or not you operate on self or on a global var matching the "class" name.

Static method example:

```lua
Account = {balance = 0} 
function Account.withdraw(v)
  Account.balance = Account.balance - v 
end
```
 
You can create instance methods using 

```lua
function Account.withdraw(self, v) 
  self.balance = self.balance - v
end
```    

Remember you can construct an object by just calling the table so you'd have

```lua
a1 = Account 
a1.withdraw(a1, 100.00) 
```
 
and somewhere you'd have

```lua
function Account(values)
end
```    

which would be called as the constructor.  

Operating on self in a method is a common enough idiom that there is special "colon" syntax for it. This is the defferent between dot methods and colon style methods.

Example:

```lua
function Account:withdraw(v) 
  self.balance = self.balance - v
end
```   

What's interesting is that to Lua they're the exact same so you could define it using dot syntax and still call it with a colon e.g

```lua
function Account.withdraw(self, v) 
  self.balance = self.balance - v
end

a1:withdraw()
```  

Because self is actually just defaults to instance we can us it on the global var and pass in an instance. 

An example to make it clear

```lua
Account.deposit(Account, 200.00)
```  

That is pretty nifty and makes things pretty flexible.

Metatables are nothing more than overloads. It's how you can tell Lua to do things it doesn't know how to do.


If we want to add classes then we do that prototypically by setting the __index metatable and default values will hit the prototype.         

```lua
function Account:new(o) 
  o = o or {}  
  setmetatable(o, self) 
  self.__index = self 
  return o   
end
```   

Inheritance is dead simple and you just create an instance (yes an instance) of the Account model

`SpecialAccount = Account:new()` and then we just create new instances of the inherited object. `s = SpecialAccount:new{limit=1000.00}`  


Quote From Programming In Lua:     

When we evaluate `s:deposit(100.00)`

Lua cannot find a deposit field in s, so it looks into SpecialAccount; it cannot find a deposit field there, too, so it looks into Account and there it finds the original implementation for a deposit.

/ end Quote From Programming In Lua

An interesting side effect of Lua objects is that you can add functionality onto individual instances. e.g

```lua
function s:getLimit() 
  return self.balance * 0.10
end
```   

To accomplish multiple inheritance we just wrap things all fancy like and create classes using a createClass function. Hey, this means we can create fancy classes at run time.    

luaL_ = lua lib functions
lua = lua functions