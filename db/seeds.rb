# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"



require 'faker'

puts 'Creating 10 fake movies...'
10.times do
  movie = Movie.new(
    title:    Faker::Movie.unique.title,
    overview: Faker::Movie.quote,
    poster_url: LoremFlickr.image(size: "50x60"),
    rating:  rand(0..10)
  )
  movie.save!
end
puts 'Finished!'






# require 'open-uri'
# require 'json'



# url = "http://tmdb.lewagon.com/movie/top_rated"
# 10.times do |i|
#   puts "Importing movies from page #{i + 1}"
#   movies = JSON.parse(URI.open("#{url}?page=#{i + 1}").read)['results']
#   movies.each do |movie|
#     puts "Creating #{movie['title']}"
#     base_poster_url = "https://image.tmdb.org/t/p/original"
#     Movie.create(
#       title: movie['title'],
#       overview: movie['overview'],
#       poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#       rating: movie['vote_average']
#     )
#   end
# end
# puts "Movies created"
