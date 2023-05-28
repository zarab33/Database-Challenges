require_relative 'lib/database_connection'
require_relative 'lib/recipes_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')
