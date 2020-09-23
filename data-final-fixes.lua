function replace_recipe_ingredient(recipe_name, ingredient, to_ingredient)
  for i, item in pairs(data.raw.recipe[recipe_name].ingredients) do
    if item.name == ingredient then
      data.raw.recipe[recipe_name].ingredients[i].name = to_ingredient
    elseif item[1] == ingredient then
      item[1] = to_ingredient
    end
  end
end

-- omnimatter + AngelBobExtended
log(serpent.block(data.raw.recipe["tech-component-red"]))
replace_recipe_ingredient("tech-component-red", "coal", "omnite")
log(serpent.block(data.raw.recipe["tech-component-red"]))