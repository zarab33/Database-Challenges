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

   def find(id)
        sql = 'SELECT id, name, cooking_time_min, rating FROM recipes WHERE id = $1;'
        sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, sql_params)
        record = result_set[0]

        
            recipe = Recipe.new
            recipe.id = record['id']
            recipe.name = record['name']
            recipe.cooking_time_min = record['cooking_time_min']
            recipe.rating = record['rating']

        return recipe
  end
end