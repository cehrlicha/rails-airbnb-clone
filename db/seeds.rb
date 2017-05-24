# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Friend.destroy_all

cities = ["Lisbon", "Paris", "Vienna", "London", "Barcelona", "Lima", "Quito", "Bangkok"]
faces = ["http://faceresearch.org/images/examples/masc/fem_male.jpg", "http://www.face-painting-fun.com/images/xhosa-face.jpg",
"https://s-media-cache-ak0.pinimg.com/736x/f1/85/34/f18534b1b5633d8d70fcec906a950f8a.jpg", "http://media.dead-frog.com/comics/corey_holcomb.jpg?mtime=1446326127",
'http://files.gamebanana.com/img/ico/sprays/54b226bbd6e42.png']

start = rand(1..30)
final = 1
until final > start
  final = rand(1..30)
end


10.times do
  user = User.create(
    password: "123456789",
    email: Faker::Internet.email,
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    username: Faker::Internet.user_name,
    phone_number: Faker::PhoneNumber.phone_number,
    image: Faker::Avatar.image
  )


    rand(1..5).times do
    friend = Friend.new(
      remote_photo_url: faces.sample,
      # photo: Faker::Avatar.image,
      last_name: Faker::Ancient.god,
      first_name: Faker::Superhero.prefix,
      age: rand(18..30),
      gender: ["male", "female"].sample,
      user: user,
      price: rand(5..20)
    )
    friend.city = cities.sample
    friend.save

    rand(1..3).times do
      available = FriendAvailability.create(
        start_daytime: DateTime.new(2017,5,start),
        end_daytime: DateTime.new(2017,5,final),
        friend: friend
        )
    end
  end

end

product = Friend.all.sample
buyer = User.all.sample
while buyer == Friend.all.sample.user
  buyer = User.all.sample
end

15.times do
  sale = Sale.create(
    start_daytime: DateTime.new(2017,4,start),
    end_daytime: DateTime.new(2017,4,final),
    location: Faker::Address.country,
    friend: product,
    buyer: buyer
    )
end




# email lastname firstname username phonenumber password


# product = Product.new(name: 'NES')
# product.remote_photo_url = url
# product.save

