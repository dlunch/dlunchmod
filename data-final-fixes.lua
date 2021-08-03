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

-- kr2 + ir2
if mods['Krastorio2'] and mods['IndustrialRevolution'] then
	krastorio.technologies.removePrerequisite("light-armor", "military")
	krastorio.technologies.addResearchUnitIngredient("light-armor", "automation-science-pack", 1)
	krastorio.technologies.removeResearchUnitIngredient("light-armor", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("heavy-armor", "logistic-science-pack", 1)
	krastorio.technologies.removeUnlockRecipe("logistics", "inserter")
	krastorio.technologies.removeUnlockRecipe("logistics", "long-handed-inserter")

	krastorio.technologies.removePrerequisite("light-armor", "military")
	krastorio.technologies.addPrerequisite("ir2-steambot", "light-armor")
	krastorio.technologies.addResearchUnitIngredient("light-armor", "automation-science-pack", 1)
	krastorio.technologies.removeResearchUnitIngredient("light-armor", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("heavy-armor", "logistic-science-pack", 1)
	krastorio.technologies.removePrerequisite("stone-wall", "military")

	krastorio.technologies.addResearchUnitIngredient("fluid-handling", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-fluids-chemistry", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-fluids-chemistry", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("oil-processing", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("plastics", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-containers", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-radar", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("logistic-2", "logistic-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("logistic-2", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-silicon-processing", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("kr-fluid-excess-handling", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("automobilism", "chemical-science-pack", 1)
	krastorio.technologies.addResearchUnitIngredient("advanced-radar", "chemical-science-pack", 1)
end
