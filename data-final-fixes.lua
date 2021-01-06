require('./lib.lua')

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
