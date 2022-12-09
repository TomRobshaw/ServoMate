require "open-uri"
ServiceHistory.destroy_all
Garage.destroy_all
Car.destroy_all
User.destroy_all
Chatroom.destroy_all

puts "seeding..."

tom = User.create(
  email: "test@email.com",
  password: "secret",
  first_name: "Tom",
  last_name: "Robshaw",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U044M2SK67Q-d6806bbba71f-72")
tom.image.attach(io: file, filename: "Profile Image", content_type: "image/jpg")
tom.save

mike = User.create(
  email: "garage@email.com",
  password: "secret",
  first_name: "Mike",
  last_name: "Haigh",
  address: "10 Bridge Road, Richmond, Victoria, 3121"
)

puts "users created"

tom_car = Car.create!(
  make: "Audi",
  model: "A3",
  year: "2020",
  kilometers: "30000",
  user: tom,
  tyres: "0",
  oil_and_filter: "25000",
  spark_plugs_and_ignition: "15000",
  brakes: "30000"
)

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1669951944/remy-lovesy-19M7TbSch2U-unsplash_xgqmxu.jpg")
tom_car.image.attach(io: file, filename: "Audi A3", content_type: "image/jpg")
tom_car.save

puts "car created"

@new_garage = Garage.create(
  name: "Torque and Spanners",
  address: "2 Ellis St, Richmond VIC 3121",
  user: mike,
)

puts "garage created"

@new_garage = Garage.create(
  name: "The Vroom Vroom Car Room",
  address: "88 Firebell Ln, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Dodgy Daves Quick Fix Garage",
  address: "27a Hill St, Richmond VIC 3121",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Car Hooraah",
  address: "21 Third St, Black Rock VIC 3193",
  user: mike
)

puts "garage created"

@new_garage = Garage.create(
  name: "Oiled up Machanics",
  address: "42-44 Aylesbury Dr, Altona VIC 3018",
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
  name: "Mario Car repair",
  address: "1 Carey Ct, Keysborough VIC 3173",
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

first_service = ServiceHistory.create(
  service_date: "12.02.2020",
  title: "First Service",
  car_id: 1,
  description: "Filters need changing soon"
)

second_service = ServiceHistory.create(
  service_date: "26.07.2020",
  title: "Oil and filters",
  car_id: 1,
  description: "Oil changed no issues"
)

third_service = ServiceHistory.create(
  service_date: "19.05.2021",
  title: "Annual Service",
  car_id: 1,
  description: " Some ignition issues, good for now"
)

forth_service = ServiceHistory.create(
  service_date: "21.09.2021",
  title: "Spark Plugs",
  car_id: 1,
  description: "Spark-plugs replaced"
)

fifth_service = ServiceHistory.create(
  service_date: "30.11.2022",
  title: "Annual service",
  car_id: 1,
  description: "Running great, no problems"
)

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1670454845/Screen_Shot_2022-12-06_at_8.09.05_pm_erb3g0.png")
first_service.image.attach(io: file, filename: "Service History", content_type: "image/jpg")
first_service.save

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1670454845/Screen_Shot_2022-12-06_at_8.09.05_pm_erb3g0.png")
second_service.image.attach(io: file, filename: "Service History", content_type: "image/jpg")
second_service.save

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1670557585/Screen_Shot_2022-12-06_at_8.25.13_pm_1_qxcuol.png")
third_service.image.attach(io: file, filename: "Service History", content_type: "image/jpg")
third_service.save

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1670454845/Screen_Shot_2022-12-06_at_8.09.05_pm_erb3g0.png")
forth_service.image.attach(io: file, filename: "Service History", content_type: "image/jpg")
forth_service.save

file = URI.open("https://res.cloudinary.com/dapgryo75/image/upload/v1670557585/Screen_Shot_2022-12-06_at_8.25.13_pm_1_qxcuol.png")
fifth_service.image.attach(io: file, filename: "Service History", content_type: "image/jpg")
fifth_service.save

puts "seeding completed"
