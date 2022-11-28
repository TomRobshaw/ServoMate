# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Car.destroy_all
Booking.destroy_all
Garage.destroy_all
ServiceHistory.destroy_all

puts "seeding..."

user = User.create(
  email: "test@email.com",
  password: "secret",
  first_name: "steve",
  last_name: "house",
  address: "Richmond, Melbourne, Victoria, 3121"
)

Car.create(
  make: "Audi",
  model: "A3",
  year: "2020",
  kilometers: "30000",
  user: user
)

puts "seeding completed"
