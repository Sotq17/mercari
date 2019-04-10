# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
    name = Faker::JapaneseMedia::OnePiece.akuma_no_mi
    description = Faker::TvShows::Friends.quote
    size = "A"
    state = "A"
    fee_side = "A"
    method = "A"
    region = "A"
    date = "A"
    price = Faker::Number.between(500, 10000)
    user_id = 1
    Item.create!(name: name,
                description: description,
                size: size,
                state: state,
                fee_side: fee_side,
                method: method,
                region: region,
                date: date,
                price: price,
                user_id: user_id,
                 )
  end
