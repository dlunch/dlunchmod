require('./lib.lua')

-- add omnic waste disposal recipe on clarifier
if data.raw.item['omnite'] then
  angelsmods.functions.make_void("omnic-waste", "water")
end

-- RealisticReactor compatibility for angel
remove_tech_prerequisite("landfill", "nuclear-power")

-- add omnite to rubyte, bobomnium recipes
-- run only if angel's industries overhaul enabled
if angelsmod ~= nil and angelsmods.industries.tech and data.raw.item['omnite'] then
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