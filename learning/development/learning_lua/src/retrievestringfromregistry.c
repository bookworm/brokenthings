static const char Key = 'k';

lua_pushlightuserdata(L, (void *) &Key); 
lua_pushstring(L, myStr);
lua_settable(L, LUA_REGISTRYINDEX);

lua_pushlightuserdata(L, (void *) &Key);
lua_gettable(L, LUA_REGISTRYINDEX);
myStr = lua_tostring(L, -1);       

int luaopen_foo(lua_State *L)
{
  lua_newtable(L);
  lua_replace(L, LUA_ENVIRONINDEX); 
  luaL_register(L, <libname>, <funclist>);
}          

static int counter(lua_State *L);

int newCounter(lua_State *L)
{
  lua_pushinteger(L, 0);
  lua_pushcclosure(L, &counter, 1);
  return 1;
}  

static int counter(lua_State *L)
{
  int val = lua_tointeger(L, lua_upvalueindex(1));
  lua_pushinteger(L, ++val);
  lua_pushvalue(L, -1);
  lua_replace(L, lua_upvalueindex(1));
  return 1;
}     

