voad load(lua_State *L, const char *fname, int *w, int *h)
{
  if(luaL_loadfile(L, fname) || lua_pcall(L, 0, 0, 0))  
    error(L, "cannot run config. file: %s", lau_tostring(L, -1));
                              
  -- These will push the values on the stack
  lua_getglobal(L, "width");  
  lua_getglobal(L, "height");
  
  if(!lua_isnumber(L, -2)) 
    error(L, "'width' should be a number\n");
  
  if(!lua_isnumber(L, -1))
    error(L, "'height' should be a number\n");
    
  *w = lua_tointeger(L, -2);                       
  *h = lua_tointeger(L, -1);    
  
  lua_getglobal(L, "background");
  
  if(!lua_istable(L, -1))
    error(L, "'background' is not a table"); 
  
  red   = getfield(L, "r");
  green = getfield(L, "g");
  blue  = getfield(L, "b"); 
}     

#define MAX_COLOR 255   

struct ColorTable {
  char *name;
  unsigned char red, green, blue; 
} colortable[] = {
  
} 

int getfield(lua_State *L, const char *key)
{
  int result;
  lua_getfield(L, -1, key);
  
  if(!lua_isnumber(L, -1))
    error(L, "invalid component in background color");
    
  result = (int) lua_tonumber(L, -1) * MAX_COLOR;     
  lua_pop(L, 1);
  return result;
}

void setfield(lua_State *L, const char *index, int value) 
{
  lua_pushnumber(L, (double) value/MAX_COLOR);
  lua_setfield(L, -2, index);
}     

void setcolor(lua_State *L, struct ColorTable *ct)
{
  lua_newtable(L);
  setfield(L, "r", ct->red);
  setfield(L, "g", ct->green);
  setfield(L, "b", ct->blue);
  lua_setglobal(L, ct->name);
}     

double f(double x, double y)
{
  double z;
  
  lua_getglobal(L, "f");
  lua_pushnumber(L, x);
  lua_pushnumber(L, y);
  
  if(lua_pcall(L, 2, 1, 0) != 0)
    error(L, "error running function 'f': %s",
      lua_tostring(L, -1)); 
      
  if(!lua_isnumber(L, -1))
    error(L, "function 'f' must return a number");    
      
  z = lua_tonumber(L, -1);   
  lua_pop(L, 1);
  return z;      
}  

void call_va(const char *func, const char *sig, ...)
{
  va_list v1;
  int narg, nres;
  
  va_start(v1, sig);
  lua_getglobal(L, func);
  
  nres = strlen(sig);
  
  if(lua_pcall(L, narg, nres, 0) != 0)
    error(L, "error calling '%s': %s", func, 
      lua_tostring(L, -1));
       
  va_end(v1);
  
  for(narg = 0; *sig; narg++)
  {
    luaL_checkstack(L, 1, "too many arguments");
    
    switch(*sig++)
    {
      case 'd':
        lua_pushnumber(L, var_arg(v1, double));
        break;
        
      case 'i':
        lua_pushinteger(L, va_arg(vl, int));
        break;
        
      case 's': 
        lua_pushstring(L, va_arg(vl, char *));
        break;
        
      case '>':   
        lua_pushstring(L, va_arg(v1, char *));
        break;
        
      default:
        error(L, "invalid option (%c)", *(sig - 1));
    }
  }
  
  endargs:
  
  nres = -nres;
  
  while(*sig)
  {
    switch(*sig++)
    {
      case 'd':
        if(!lua_isnumber(L, nres))
          error(L, "wrong result type");
        *va_arg(v1, double *) = lua_tonumber(L, nres);
        break;
        
      case 'i':
        if(!lua_isnumber(L, nres))
          error(L, "wrong result type");
          
        *va_arg(v1, int *) = lua_tointeger(L, nres);
        break;
        
      case 's':   
        if(!lua_isstring(L, nres))
          error(L, "wrong result type");
          
        *va_arg(v1, const char **) = lua_tostring(L, nres);
        break;
        
      default:
        error(L, "invalid option (%c)", *(sig - 1));
    } 
    nres++;
  }
}