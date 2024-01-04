require("./lib.lua")

-- add omnic waste disposal recipe on clarifier
if data.raw.item["omnite"] then
  angelsmods.functions.make_void("omnic-waste", "water")
end

-- RealisticReactor compatibility for angel
remove_tech_prerequisite("landfill", "nuclear-power")

-- Ribbon Maze + SCTM
if data.raw.technology["water-washing-2"] then
  remove_tech_prerequisite("water-washing-2", "landfill")
end

-- add omnite to rubyte, bobomnium recipes
-- run only if angel"s industries overhaul enabled
if angelsmod ~= nil and angelsmods.industries.tech and data.raw.item["omnite"] then
  -- copied from omnimatter/prototypes/omniore.lua
  local initial_recipes = {}
  local inputs = {}
  initial_recipes[#initial_recipes + 1] = {
    {
      type = "item",
      name = "angels-ore5",
      amount = 1
    },
    {
      type = "item",
      name = "stone-crushed",
      amount = 5
    },
  }
  inputs[#inputs + 1] = 6
  initial_recipes[#initial_recipes + 1] = {
    {
      type = "item",
      name = "angels-ore6",
      amount = 1
    },
    {
      type = "item",
      name = "stone-crushed",
      amount = 5
    },
  }
  inputs[#inputs + 1] = 6

  for index, result in pairs(initial_recipes) do
    RecGen:create("omnimatter","initial-omnitraction-" .. result[1].name):
    setCategory("omnite-extraction-burner"):
    setEnergy(5):
    setEnabled():
    noItem():
    setSubgroup("omni-basic"):
    setIngredients({"omnite", inputs[index]}):
    setResults(result):
    setIcons(result[1].name):
    marathon():
    setLocName("recipe-name.initial-omni","item-name."..result[1].name):
    addSmallIcon(result[2].name, 3):extend()
  end
end

if mods["Krastorio2"] and mods["RealisticFusionPower"] then
  -- remove duplicate electrolyser
  data.raw["item"]["rfp-electrolyser"] = nil
  data.raw["assembling-machine"]["rfp-electrolyser"] = nil
  data.raw["recipe"]["rfp-electrolyser"] = nil
  data.raw["recipe"]["kr-vc-rfp-electrolyser"] = nil
  if mods["248k"] then
      data.raw["recipe"]["gr_white_hole_cycle_rfp-electrolyser_recipe"] = nil
  end
end


if mods["Krastorio2"] and mods["RampantArsenal"] then
  -- disable rampant arsenal nuclear locomotive if k2 loaded
  data.raw["recipe"]["kr-vc-nuclear-train-vehicle-rampant-arsenal"] = nil
  data.raw["recipe"]["nuclear-train-vehicle-rampant-arsenal"] = nil
  data.raw["item-with-entity-data"]["nuclear-train-vehicle-rampant-arsenal"] = nil
  data.raw.locomotive["nuclear-train-vehicle-rampant-arsenal"] = nil
  data.raw.technology["rampant-arsenal-technology-nuclear-railway"] = nil

  -- disable rampant arsenal power armor mk3 if k2 loaded
  data.raw.technology["rampant-arsenal-technology-power-armor-mk3"] = nil
end
