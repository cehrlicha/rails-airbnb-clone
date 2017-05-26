# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Friend.destroy_all


puts "Creating Users"
user1 = User.create(
  password: "123456",
  email: "annakin@gmail.com",
  last_name: "Skywalker",
  first_name: "Annakin",
  username: "askywalker",
  phone_number: "0475447014",
  image: "http://res.cloudinary.com/cehrlicha/image/upload/v1495797061/annakin_dogbcx.jpg"
)

user2 = User.create(
  password: "123456",
  email: "luke@gmail.com",
  last_name: "Skywalker",
  first_name: "Luke",
  username: "lskywalker",
  phone_number: "0477372777",
  image: "http://res.cloudinary.com/cehrlicha/image/upload/v1495797061/luke_jm790u.jpg"
)

user3 = User.create(
  password: "123456",
  email: "dark@gmail.com",
  last_name: "Vador",
  first_name: "Dark",
  username: "dvador",
  phone_number: "0485102063",
  image: "http://res.cloudinary.com/cehrlicha/image/upload/v1495797061/darkvador_udk6nw.jpg"
)

puts "Creating Friends"
friend1 = Friend.create(
  remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1495706341/benoit_pw94em.png",
  last_name: "Habfast",
  first_name: "Benoit",
  age: 23,
  gender: "male",
  description: "Nice french guy. His goal in life: develop a friend bot application and love shoes",
  user: user1,
  price: rand(5..20),
  city: "Lisbon",
  address: "Av. da Liberdade 127, 1269-038 Lisboa"
)

friend2 = Friend.create(
  remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1495706342/gauthier_kaiwuz.jpg",
  last_name: "Lagae",
  first_name: "Gauthier",
  age: 26,
  gender: "male",
  description: "Belgian common guy, give him a beer and he will rate you well! Cheap!",
  user: user1,
  price: 3,
  city: "Lisbon",
  address: "Av. Almirante Reis nº1 - H, 1150-007 Lisboa"
)

friend3 = Friend.create(
  remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1495706341/marianna_dpfhiu.jpg",
  last_name: "de la Muerte",
  first_name: "Marianna",
  age: 30,
  gender: "female",
  description: "For god sake, accept her dinner invitation! Ok, she's expensive..",
  user: user2,
  price: 20,
  city: "Lisbon",
  address: "R. do Teixeira 35, 1200-459 Lisboa"
)

friend4 = Friend.create(
  remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1495706341/daniel_cvbzyf.jpg",
  last_name: "Silvesteriano",
  first_name: "Daniel",
  age: 27,
  gender: "male",
  description: "Good quality price! Just avoid dinner, might take several hours..",
  user: user3,
  price: 12,
  city: "Lisbon",
  address: "Largo de São Carlos 10, 1200-410 Lisboa"
)

friend5 = Friend.create(
  remote_photo_url: "http://res.cloudinary.com/cehrlicha/image/upload/v1495706342/viola_tqrjv9.png",
  last_name: "Stockli",
  first_name: "Viola",
  age: 26,
  gender: "female",
  description: "Watch out for your money!",
  user: user3,
  price: 15,
  city: "Lisbon",
  address: "R. Portas de Santo Antão 150, 1150-048 Lisboa"
)

puts "Database updated with 3 users and 5 friends"



puts "Create availibity"
available1 = FriendAvailability.create(
  start_daytime: DateTime.new(2017,6,8),
  end_daytime: DateTime.new(2017,6,8),
  friend: friend1
  )

available2 = FriendAvailability.create(
  start_daytime: DateTime.new(2017,6,10),
  end_daytime: DateTime.new(2017,6,10),
  friend: friend2
  )

available3 = FriendAvailability.create(
  start_daytime: DateTime.new(2017,6,15),
  end_daytime: DateTime.new(2017,6,15),
  friend: friend3
  )

available4 = FriendAvailability.create(
  start_daytime: DateTime.new(2017,6,1),
  end_daytime: DateTime.new(2017,6,1),
  friend: friend4
  )

available5 = FriendAvailability.create(
  start_daytime: DateTime.new(2017,6,25),
  end_daytime: DateTime.new(2017,6,25),
  friend: friend5
  )

puts "Create Sales"
sale1 = Sale.create(
  start_daytime: DateTime.new(2017,4,rand(1..10)),
  end_daytime: DateTime.new(2017,4,rand(10..20)),
  location: "Portugal",
  friend: friend1,
  buyer: user2,
  )

sale2 = Sale.create(
  start_daytime: DateTime.new(2017,4,rand(1..10)),
  end_daytime: DateTime.new(2017,4,rand(10..20)),
  location: "Portugal",
  friend: friend5,
  buyer: user2,
  )

sale3 = Sale.create(
  start_daytime: DateTime.new(2017,4,rand(1..10)),
  end_daytime: DateTime.new(2017,4,rand(10..20)),
  location: "Portugal",
  friend: friend3,
  buyer: user1,
  )

sale4 = Sale.create(
  start_daytime: DateTime.new(2017,4,rand(1..10)),
  end_daytime: DateTime.new(2017,4,rand(10..20)),
  location: "Portugal",
  friend: friend4,
  buyer: user1,
  )

sale5 = Sale.create(
  start_daytime: DateTime.new(2017,4,rand(1..10)),
  end_daytime: DateTime.new(2017,4,rand(10..20)),
  location: "Portugal",
  friend: friend2,
  buyer: user3,
  )


puts "Seed success! Well done Motha faackerrr!"




# email lastname firstname username phonenumber password


# product = Product.new(name: 'NES')
# product.remote_photo_url = url
# product.save

