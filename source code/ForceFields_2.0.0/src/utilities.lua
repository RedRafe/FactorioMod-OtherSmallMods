
function throwError(what)
  for _,player in pairs(game.players) do
    player.print(what)
  end
end



function tableIsEmpty(t)
  if t then
    for k in pairs(t) do
      return false
    end
  end
  return true
end



function directionToString(direction)
  if direction == defines.direction.north then
    return "north"
  end
  if direction == defines.direction.south then
    return "south"
  end
  if direction == defines.direction.east then
    return "east"
  end
  if direction == defines.direction.west then
    return "west"
  end
end



function transferToPlayer(player, dropStack)
  local countBefore = player.get_item_count(dropStack.name)
  local countAfter

  player.insert(dropStack)
  countAfter = player.get_item_count(dropStack.name)
  if countAfter < (countBefore + dropStack.count) then
    dropOnGround(player.surface, player.position, {name = dropStack.name, count = (countBefore + dropStack.count) - countAfter})
  end
end



function dropOnGround(surface, position, dropStack, markForDeconstruction, force)
  local dropPos
  local entity
  for n=1,dropStack.count do
    dropPos = surface.find_non_colliding_position("item-on-ground", position, 50, 0.5)
    if dropPos then
      entity = surface.create_entity({name = "item-on-ground", position = dropPos, stack = {name = dropStack.name, count = 1}})
      if entity.valid and markForDeconstruction then
        entity.order_deconstruction(force)
      end
    end
  end
end