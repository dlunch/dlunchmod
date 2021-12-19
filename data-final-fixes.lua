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
