require_relative './recipes'

class RecipeRepository
 
  def all
  
    sql = 'SELECT id, name, cooking_time_min, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    recipes = []

    result_set.each do |record|
        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time_min = record['cooking_time_min']
        recipe.rating = record['rating']

      recipes << recipe
    end

    return recipes
    # Returns an array of Recipe objects.
  end
end