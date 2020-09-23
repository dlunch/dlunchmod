require('./lib.lua')

-- omnimatter + AngelBobExtended
if data.raw.recipe["tech-component-red"] then
  replace_recipe_ingredient("tech-component-red", "coal", "omnite")
end

-- omnienergy + sctm
remove_tech_prerequisite("sct-lab-t1", "omnitech-anbaricity")
remove_tech_prerequisite("sct-lab-t2", "electronics")
