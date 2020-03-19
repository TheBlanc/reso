# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


restaurant = Restaurant.new

restaurant.name = "Your Restaurant"
restaurant.open_at = 600
restaurant.close_at = 2400
restaurant.capacity = 100

restaurant.save
