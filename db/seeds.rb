require "open-uri"
ServiceHistory.destroy_all
Booking.destroy_all
Garage.destroy_all
Car.destroy_all
User.destroy_all
Chatroom.destroy_all

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

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1669951944/remy-lovesy-19M7TbSch2U-unsplash_xgqmxu.jpg")
chris_car.image.attach(io: file, filename: "Audi A3", content_type: "image/jpg")
chris_car.save

puts "car created"

new_garage2 = Garage.create(
  name: "Torque and Spanners",
  address: "7 Stewart Place, Richmond, Victoria, 3121",
  user: mike,
)

puts "garage created"

new_garage1 = Garage.create(
  name: "The Vroom Vroom Car Room",
  address: "88 Firebell Ln, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Dodgy Daves Quick Fix Garage",
  address: "7 Stewart Street, Richmond, Victoria, 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Car Hooraah",
  address: "14 McCrae Mews, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Oiled up Machanics",
  address: "1A Gordon Grove, South Yarra VIC 3141",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Take a Brakes Garage",
  address: "14 Mary St, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Hash Tag just Filters Garage",
  address: "53 Surrey Rd, South Yarra VIC 3141",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Nut And Bolt Machanics",
  address: "11 Cunningham St, South Yarra VIC 3141",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Mind Over Motor Garage",
  address: "113 Richmond Terrace, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Mario Car repair",
  address: "100 Lennox St, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Wheel Be Alright Auto Shop",
  address: "29 Cromwell St, Collingwood VIC 3066",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Spanner In The Works",
  address: "30 Vaughan Cres, Kew VIC 3101",
  user: mike
)

puts "garage created"

# first_booking = Booking.create(
#   car: chris_car,
#   garage: @new_garage
# )

# puts "booking created"

ServiceHistory.create(
  booking: first_booking,
  service_date: "30.11.2022",
  description: "Annual service",
  car_id: 1
)

# Chatroom.create(
#   name: "chat",
#   user_id: 3,
#   garage_id: 13
# )

# Chatroom.create(
#   name: "chat",
#   user: chris,
#   garage: new_garage2
# )

puts "seeding completed"
