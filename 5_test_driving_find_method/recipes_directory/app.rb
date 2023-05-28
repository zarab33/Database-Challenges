require_relative 'lib/database_connection'
require_relative 'lib/recipes_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipes_repository = RecipeRepository.new

recipe = recipes_repository.find(1)

puts recipe.id
puts recipe.name
puts recipe.cooking_time_min
puts recipe.rating