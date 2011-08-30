type: default  
status: public
intro: |  

Ever wanted to override the Joomla! classes that Joomla! wont let you. You can force bypass Joomla! and force the overrides.    
   
body: |    

Back when Simplex was called ThemeMagic I was overriding the JModuleHelper class; problem was if a component or module tried to use this class before the template framework php would throw "class already declared" errors. 

The cause is basically this, you can't over-ride a class once its already been declared and Joomla! declares a class once its utilized. 

At the time I was unable to think up a solution. 

It was a year later while tackling module cache issues for JB that a solution came to me in the form of autoload magic.

```php
class Loader 
{      
  $files = array('JModuleHelper');
  static public function load($class) 
  {  
    if(array_key_exists($class, $files))
    {
      // Load The File.
    }  
    else
    {
      if(JLoader::load($class)) {
    		return true;
    	}
    	return false;
    }
  }
}
spl_autoload_register('Loader::load'); 
```       

More how that works, if I get around to writing about it. 