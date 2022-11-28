Car.destroy_all
Booking.destroy_all
Garage.destroy_all
ServiceHistory.destroy_all

puts "seeding..."

User.create(
  email: "test@email.com",
  password: "secret",
  first_name: "Chris",
  last_name: "Shaw",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)

User.create(
  email: "garage@email.com",
  password: "secret",
  first_name: "Mike",
  last_name: "Haigh",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)

puts "users created"

Car.create(
  make: "Audi",
  model: "A3",
  year: "2020",
  kilometers: "30000",
  user_id: 1
)

puts "car created"

Garage.create(
  name: "Torque and Spanners",
  address: "7 Stewart Street, Richmond, Victoria, 3121",
  user_id: 2
)

puts "garage created"

Booking.create(
  car_id: 1,
  garage_id: 1
)

puts "booking created"

# ServiceHistory.create(
#   booking_id: 1
# )

puts "seeding completed"
