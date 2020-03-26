# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Set default restaurant data
# *** DO NOT REMOVE ***
restaurant = Restaurant.new
restaurant.name = "Your Restaurant"
restaurant.open_at = 600
restaurant.close_at = 2400
restaurant.capacity = 100
restaurant.save


# Seed reservations for demo (* Remove for production *)
namesArray = [ "Hamed M", "Erin D", "Ray M", "Kevin L", "Connor D", 'Maureen H', "Karen L", "Bob L", "Meaghan B", "Luke B", "Paxton B", "Isla B" ]
phonenumbersArray = [905, 416, 705, 647, 519]
testPhoneNum = "#{phonenumbersArray[rand(5)]}-#{rand(100...1000)}-#{rand(1000...10000)}"
timeArray = [1700, 1800, 1900, 2000, 2100]
dateArray = []

# create 150 days in the future
x = 0
150.times do
  date = (Date.today + x.days)
  dateArray << date
  x += 1
end

dateArray.length.times do
  dateIndex = 0
  3.times do
    reservation = Reservation.new
    reservation.name = namesArray[rand(0...namesArray.length)]
    reservation.phonenumber = "#{phonenumbersArray[rand(5)]}-#{rand(100...1000)}-#{rand(1000...10000)}"
    reservation.partysize = rand(0...6)
    reservation.date = dateArray[dateIndex]
    reservation.time = timeArray[rand(0...timeArray.length)]
    reservation.save
  end
  dateIndex += 1
end
