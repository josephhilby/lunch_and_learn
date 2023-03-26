# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title = "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)"
url = "http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9"

user = User.create(name: 'test', email: 'test@test', api_key: 'test_key', password: 'test', password_confirmation: 'test')
favorite_1 = Favorite.create(country: 'test_country', recipe_link: 'test_link', recipe_title: 'test_title')
favorite_2 = Favorite.create(country: 'Thailand', recipe_link: url, recipe_title: title)
UsersFavorite.create(user_id: user.id, favorite_id: favorite_1.id)
UsersFavorite.create(user_id: user.id, favorite_id: favorite_2.id)