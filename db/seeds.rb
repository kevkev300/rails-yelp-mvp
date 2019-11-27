require 'faker'

# destroy all

Restaurant.destroy_all

# create all
categories = %w[chinese italian japanese french belgian]
5.times do
  rest = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, category: categories.sample, phone_number: Faker::PhoneNumber)
  3.times do
    Review.create(content: Faker::ChuckNorris.fact, rating: (1..5).to_a.sample, restaurant: rest)
  end
end

# count all

p Restaurant.count
p Review.count
