# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
@listing_count = Listing.count
if @listing_count.zero?
  puts 'Creating listings...'
  8.times do |index|
    Listing.create!(
      name: Faker::Lorem.word,
      headline: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      address_line_1: Faker::Address.building_number,
      address_line_2: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      primary_image_url: "/images/primary/front#{index}.webp",
      price: Faker::Number.number(digits: 3),
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

@listing_images_count = ListingImage.count
if @listing_images_count.zero?
  puts 'Creating listing_images...'
  listing_all = Listing.all
  listing_all.each_with_index do |element, index|
    for j in 0..3 do
      ListingImage.create!(
        listing_image_secondary_url: "/images/secondary/#{index}/#{j}.webp",
        listing: element
      )
      end
  end
  puts 'Finished!'
end
