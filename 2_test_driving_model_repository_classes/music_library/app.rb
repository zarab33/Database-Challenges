require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.

artist_repository = ArtistRepository.new
album_repository = AlbumRepository.new

album = album_repository.find(6)

puts album.id
puts album.title
puts album.release_year
