pretty = require 'pl.pretty'
math.round = (num, idp) ->
  mult = 10 ^ (idp or 0)
  return math.floor(num * mult + 0.5) / mult

interpolateStopsProperty = (behind, ahead, current, kind) ->
  print kind
  current_pos = current.position
  behind_pos  = behind.position
  ahead_pos   = ahead.position

  current_pos2 = current_pos
  i = behind_pos - ahead_pos

  final_pos = current_pos2 - ahead_pos
  final_pos = final_pos / i
  seed = 1 - final_pos

  if kind == 'color'
    print 'hey'
    red    = math.round(behind.color.red   * seed + ahead.color.red   * final_pos)
    green  = math.round(behind.color.green * seed + ahead.color.green * final_pos)
    blue   = math.round(behind.color.blue  * seed + ahead.color.blue  * final_pos)
    return { red: red, green: green, blue: blue }
  else
    return math.round((behind.opacity * seed + ahead.opacity * final_pos) * 100) / 100

interpolateStopsColor = (behind, ahead, current) ->
  return interpolateStopsProperty(behind, ahead, current, "color")

interpolateStopsOpacity = (behind, ahead, current) ->
  return interpolateStopsProperty(behind, ahead, current, "opacity")

getColorForOpacityOnlyStop = (key, positions, keyed_by_position) ->
  ahead = nil
  for i = key + 1,table.maxn(positions)
    if keyed_by_position[positions[i]].color
      ahead = keyed_by_position[positions[i]]
      break

  behind = nil
  for i = key - 1,1,-1
    if keyed_by_position[positions[i]].color
      behind = keyed_by_position[positions[i]]
      break

  if not behind
    behind = ahead

  if not ahead
    ahead = behind

  color = behind.color

  if behind.color != ahead.color 
    color = interpolateStopsColor(behind, ahead, keyed_by_position[positions[key]])
  
  -- may not need is cycle just a garbage collector flag? seems to be.
  return deepcopy(color)

getOpacityForColorOnlyStop = (key, positions, keyed_by_position) ->
  ahead = nil
  for i = key + 1,table.maxn(positions)
    if keyed_by_position[positions[i]].opacity
      ahead = keyed_by_position[positions[i]]
      break

  behind = nil
  for i = key - 1,1,-1
    if keyed_by_position[positions[i]].opacity
      behind = keyed_by_position[positions[i]]
      break

  if not behind
    behind = ahead

  if not ahead
    ahead = behind

  opacity = behind.opacity

  if behind.opacity != ahead.opacity
    opacity = interpolateStopsOpacity(behind, ahead, keyed_by_position[positions[key]])

  return opacity

color_stops = {
  {position: 0, color: {red: 100, green: 90, blue: 100}},
  {position: 10, color: {red: 100, green: 100, blue: 120}}, 
  {position: 50, color: {red: 300, green: 120, blue: 100}}, 
  {position: 30, color: {red: 300, green: 140, blue: 100}}, 
  {position: 100},
}

trans_stops = {
  {position: 0},
  {position: 10, opacity: 100}, 
  {position: 50, opacity: 30 }, 
  {position: 100},
}

sortStops = (a,b) ->
  a2 = a.position 
  b2 = b.position
  return a2 < b2

merging = {}

for k,v in pairs(color_stops)
  table.insert(merging, color_stops[k]) if k <= table.maxn(color_stops)
  table.insert(merging, trans_stops[k]) if k <= table.maxn(trans_stops) 

merged = deepcopy(merging)
table.sort(merged, sortStops)

-- we need positions to maintain order.
positions = {}
keyed_by_position  = {}
for i = 1,table.maxn(merged)
  original = merged[i]
  position = original.position

  if not table.contains(positions, position)
    table.insert(positions, position)
    keyed_by_position[position] = { position: position }

  if original.color
    keyed_by_position[position].color = original.color

  if original.opacity
    keyed_by_position[position].opacity = original.opacity

final = {}
for key,value in ipairs(positions)
  original = keyed_by_position[value]
  if not original.color  
    original.color = getColorForOpacityOnlyStop(key, positions, keyed_by_position) 
  if not original.opacity  
    original.opacity = getOpacityForColorOnlyStop(key, positions, keyed_by_position) 

  table.insert(final, original)   

pretty.dump(final)