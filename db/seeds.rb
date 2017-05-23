# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Friend.destroy_all

url = 'henry.jpg'

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
    friend = Friend.create(
      remote_photo_url: 'http://files.gamebanana.com/img/ico/sprays/54b226bbd6e42.png',
      # photo: Faker::Avatar.image,
      last_name: Faker::Name.last_name,
      first_name: Faker::Name.first_name,
      city: Faker::Address.city,
      age: rand(18..90),
      gender: ["male", "female"].sample,
      user: user
    )
  end

end




# email lastname firstname username phonenumber password


# product = Product.new(name: 'NES')
# product.remote_photo_url = url
# product.save

