

local function createRocketPart(name, order)
  local rocketPart =
  {
    type = "item",
    name = name,
    icon = "__MoreScience__/graphics/rocket/" .. name .. ".png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "a[rocket-part]-a[" .. order .. "]-a[" .. name .. "]",
    stack_size = 100
  }

  data:extend({
    rocketPart,
  })
end

createRocketPart("hull-component", "a")

createRocketPart("ion-thruster", "b1")
createRocketPart("ion-booster", "b2")

createRocketPart("fusion-reactor", "c")

createRocketPart("shield-array", "d1")
createRocketPart("laser-array", "d2")