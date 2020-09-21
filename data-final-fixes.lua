function replace_recipe_ingredient(recipe_name, ingredient, to_ingredient)
  for i, item in pairs(data.raw.recipe[recipe_name].ingredients) do
    if item.name == ingredient then
      data.raw.recipe[recipe_name].ingredients[i].name = to_ingredient
    end
  end
end

-- omnimatter + AngelBobExtended
replace_recipe_ingredient("tech-component-red", "coal", "omnite")