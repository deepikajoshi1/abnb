# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require 'faker'

@listing_count = Listing.count
if @listing_count.zero?
  puts 'Creating listings...'
  8.times do
    Listing.create!(
      name: Faker::Lorem.word,
      headline: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      address_line1: Faker::Address.building_number,
      address_line2: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      image_url: Faker::LoremFlickr.image(size: "250x250", search_terms: ['Hotels', 'Villas'], match_all: true),
      price: Faker::Number.number(digits: 3)
    )
  end
  puts 'Finished!'
end

@user_count = User.count
if @user_count.zero?
  puts 'Creating users...'
  4.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
  puts 'Finished!'
end
