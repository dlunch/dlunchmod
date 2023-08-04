require('./lib.lua')

-- extendedangels + yuoki
local recipe_list = {
    "pellet-tungsten-smelting",
    "tungsten-carbide",
    "tungsten-carbide-2",
    "copper-tungsten-alloy"
}


for _, recipe in pairs(recipe_list) do
	for _, module in pairs(data.raw.module) do
		if module.limitation then
			for i, limit in pairs(module.limitation) do
				if limit == recipe then
					table.remove(module.limitation, i)
				end
			end
		end
	end
end

-- ir2 + jetpack duplicate
if data.raw.technology["jetpack-4"] then
  remove_tech_prerequisite("jetpack-4", "ir2-modules-3")
end

-- omnimatter + AngelBobExtended
if data.raw.recipe["tech-component-red"] and data.raw.item["omnite"] then
  replace_recipe_ingredient("tech-component-red", "coal", "omnite")
end

-- omnienergy + sctm
if data.raw.technology["omnitech-anbaricity"] and data.raw.lab["sct-lab-t1"] then
  remove_tech_prerequisite("sct-lab-t1", "omnitech-anbaricity")
  remove_tech_prerequisite("sct-lab-t2", "electronics")
end

-- sctm without aai fuel
if data.raw.technology["sct-aai-basic-fuel-processing"] and not data.raw.technology["fuel-processing"] then
  data.raw.technology["sct-aai-basic-fuel-processing"] = nil
  data.raw.technology["sct-aai-advanced-fuel-processing"] = nil
  data.raw.technology["sct-aai-rocket-fuel-processing"] = nil
  data.raw.technology["sct-aai-nuclear-fuel-processing"] = nil
end

-- disable survelliance 2
if data.raw.technology["surveillance-2"] then
	data.raw.technology["surveillance-2"].hidden = true
	data.raw.technology["surveillance-2"].enabled = false
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

if mods["Krastorio2"] and mods["RealisticFusionPower"] then
  -- remove duplicate electrolyser
  data.raw["item"]["rfp-electrolyser"] = nil
  data.raw["assembling-machine"]["rfp-electrolyser"] = nil
  data.raw["recipe"]["rfp-electrolyser"] = nil
  data.raw["recipe"]["kr-vc-rfp-electrolyser"] = nil
end


if mods["Atomic_Overhaul"] and mods["RealisticFusionPower"] then
  -- remove tritium output
  for i, item in ipairs(data.raw.recipe["uranium-without-research-data"].results) do
    if item["name"] == "tritium" then
      table.remove(data.raw.recipe["uranium-without-research-data"].results, i)
      break
    end
  end

  if data.raw.recipe["ao-nuclear-fuel-reprocessing"] then
    for i, item in ipairs(data.raw.recipe["ao-nuclear-fuel-reprocessing"].results) do
      if item["name"] == "tritium" then
        table.remove(data.raw.recipe["ao-nuclear-fuel-reprocessing"].results, i)
        break
      end
    end
  end
end