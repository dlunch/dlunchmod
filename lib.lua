function remove_tech_prerequisite(tech_name, prerequisite)
  if not data.raw.technology[tech_name] or not data.raw.technology[tech_name].prerequisites then
    return
  end
  for i, name in ipairs(data.raw.technology[tech_name].prerequisites) do
    if name == prerequisite then
      table.remove(data.raw.technology[tech_name].prerequisites, i)
	  return
    end
  end
end

function replace_recipe_ingredient(recipe_name, ingredient, to_ingredient)
  for i, item in ipairs(data.raw.recipe[recipe_name].ingredients) do
    if item.name == ingredient then
      data.raw.recipe[recipe_name].ingredients[i].name = to_ingredient
    elseif item[1] == ingredient then
      item[1] = to_ingredient
    end
  end
end
