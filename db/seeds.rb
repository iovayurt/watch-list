# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
Movie.create(title: "The Godfather", overview: "Michael, the young and idealistic son of Vito Corleone, the head of the most powerful Mafia clan in New York, returns home as a war hero and is determined to live his own life. But tragic circumstances make him face the legacy of his family.", poster_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.netflix.com%2Ftr-en%2Ftitle%2F60011152&psig=AOvVaw0402AtXOURcfZIMJ5_yNa5&ust=1631274076215000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCKCi5MPn8fICFQAAAAAdAAAAABAI", rating: 9.2)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Goodfellas", overview: "The story of Irish-Italian American, Henry Hill, and how he lives day-to-day life as a member of the Mafia.", poster_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.imdb.com%2Ftitle%2Ftt0099685%2F&psig=AOvVaw0KrHTIa29e0F9kJ4dxZPVV&ust=1631274759108000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCKjoxonq8fICFQAAAAAdAAAAABAS", rating: 8.7)
Movie.create(title: "Scarface", overview: "In 1980 Miami, a determined Cuban immigrant takes over a drug cartel and succumbs to greed.", poster_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fplaytusu.com%2Fhaber%2F2016%2F08%2Fyeni-scarface-filminin-ayak-sesleri%2F&psig=AOvVaw0breS_hahS0lS4AHA8kkJJ&ust=1631274721544000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCNDamPjp8fICFQAAAAAdAAAAABAD", rating: 8.2)



puts 'Clearing db'
Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'

movies = JSON.parse(URI.open(url).read)['results']

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  )
end

puts "Created #{Movie.count} movie(s)"
