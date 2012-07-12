int l_map(lua_State *L)
{
  int i, n;
  
  luaL_checktype(L, 1, LUA_TTABLE);
  luaL_checktype(L, 2, LUA_TFUNCTION);
  
  n = lua_objlen(L, 1);
  
  for(i = 1; i <= n; i++)
  {
    lua_pushvalue(L, 2);
    lua_rawgeti(L, 1, i);
    lua_call(L, 1, 1);
    lua_rawseti(L, 1, i);
  }     
  
  return 0;
}   

static int l_split(lua_State *L)
{
  const char *s = luaL_checkstring(L, 1);
  const char *sep = luaL_checkstring(L, 2);
  const char *e;
  int i = 1;
  
  lua_newtable(L);
  
  while((e = strchr(s, *sep)) != NULL)
  {
    lua_pushlstring(L, s, e-s);
    lua_rawseti(L, -2, i++);
    s = e + 1;
  } 
  
  lua_pushstring(L, s);
  lua_rawseti(L, -2, i);              
  
  return 1;
}   

static int str_upper(lua_State *L)
{
  size_t l;
  size_t i;
  luaL_Buffer b;
  
  const char *s = luaL_checklstr(L, 1, &l);
  
  luaL_buffinit(L, &b);
  
  for(i = 0; i < l; i++)
    luaL_addchar(&b, toupper((unsigned char)(s[i]))); 
  
  luaL_pushresult(&b);
  
  return 1;    
}   