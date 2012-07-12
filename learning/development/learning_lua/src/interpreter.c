#include <stdio.h> 
#include "lua.h" 
#include "lauxlib.h" 
#include "lualib.h"   

int main(void)
{
  char buff[256];
  int error;
  lua_State *L = luaL_newstate();
  luaL_openlibs(L);
  
  while(fgets(buff, sizeof(buff), stdin) != NULL)
  {
    error = luaL_loadbuffer(L, buff, strlen(buff), "line") ||
      lua_pcall(L, 0, 0, 0);
      
    if(error) {
      fprintf(stderr, "%s", lua_tostring(L, -1));
      lua_pop(L, 1);
    }               
  }                 
  
  lua_close(L); 
  
  return 0;
} 

void error(lua_State *L, const char *fmt, ...)
{
  va_list argp;
  va_start(argp, fmt);
  vfprintf(stderr, fmt, argp);
  va_end(argp);
  lua_close(L);
  exit(EXIT_FAILURE);  
}