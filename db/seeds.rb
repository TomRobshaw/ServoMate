ServiceHistory.destroy_all
Booking.destroy_all
Garage.destroy_all
Car.destroy_all
User.destroy_all

puts "seeding..."

chris = User.create(
  email: "test@email.com",
  password: "secret",
  first_name: "Chris",
  last_name: "Shaw",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)

mike = User.create(
  email: "garage@email.com",
  password: "secret",
  first_name: "Mike",
  last_name: "Haigh",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)

puts "users created"

chris_car = Car.create!(
  make: "Audi",
  model: "A3",
  year: "2020",
  kilometers: "30000",
  user: chris
)

puts "car created"

first_garage = Garage.create(
  name: "Torque and Spanners",
  address: "7 Stewart Street, Richmond, Victoria, 3121",
  user: mike
)

puts "garage created"

first_booking = Booking.create(
  car: chris_car,
  garage: first_garage
)

puts "booking created"

ServiceHistory.create(
  booking: first_booking
)

puts "seeding completed"
