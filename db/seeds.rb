# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb

@review_count = Review.count
if @review_count.zero?
  puts "Creating reviews..."
  Listing.find_each do |listing|
    (1..5).to_a.sample.times do
      Review.create!(
       review: listing,
       rating: (1..5).to_a.sample,
       title: Faker::Lorem.word,
       body: Faker::Lorem.paragraph,
       user_id: User.all.sample.id
      )
    end
  end
  puts "Finished!"
end

@listing_count = Listing.count
if @listing_count.zero?
  puts "Creating listings..."
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
      price: Faker::Number.number(digits: 3)
    )
  end
  puts "Finished!"
end

@user_count = User.count
if @user_count.zero?
  puts "Creating users..."
  4.times do
    User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
  puts "Finished!"
end

@listing_images_count = ListingImage.count
if @listing_images_count.zero?
  puts "Creating listing_images..."
  listing_all = Listing.all
  listing_all.each_with_index do |element, index|
    for j in 0..3
      ListingImage.create!(
        listing_image_secondary_url: "/images/secondary/#{index}/#{j}.webp",
        listing: element,
      )
    end
  end
  puts "Finished!"
end

@category_count = Category.count
if @category_count.zero?
  puts "Creating categories..."
  Category.create!(
    category_name: "Bathroom",
  )
  Category.create!(
    category_name: "Bedroom and laundry",
  )
  Category.create!(
    category_name: "Family",
  )
  Category.create!(
    category_name: "Heating and cooling",
  )
  Category.create!(
    category_name: "Home safety",
  )
  Category.create!(
    category_name: "Internet and office",
  )
  Category.create!(
    category_name: "Kitchen and dining",
  )
  Category.create!(
    category_name: "Location features",
  )
  Category.create!(
    category_name: "Outdoor",
  )
  Category.create!(
    category_name: "Parking and facilities",
  )
  Category.create!(
    category_name: "Services",
  )
  puts "Finished!"
end

@bathroom = Category.find_by(category_name: 'Bathroom')
@bedroom_and_laundry = Category.find_by(category_name: 'Bedroom and laundry')
@family = Category.find_by(category_name: 'Family')
@home_safety = Category.find_by(category_name: 'Home safety')
@internet_and_office = Category.find_by(category_name: 'Internet and office')
@kitchen_and_dining = Category.find_by(category_name: 'Kitchen and dining')
@location_features = Category.find_by(category_name: 'Location features')
@outdoor = Category.find_by(category_name: 'Outdoor')
@parking_and_facilities = Category.find_by(category_name: 'Parking and facilities')
@services = Category.find_by(category_name: 'Services')

@sub_category_count = SubCategory.count
if @sub_category_count.zero?
  puts "Creating sub_categories..."

  SubCategory.create!(
    sub_category_name: "Hair dryer",
    category: @bathroom
  )
  SubCategory.create!(
    sub_category_name: "Shampoo",
    category: @bathroom
  )
  SubCategory.create!(
    sub_category_name: "Hot water",
    category: @bathroom
  )
  SubCategory.create!(
    sub_category_name: "Essentials",
    category: @bedroom_and_laundry
  )

  SubCategory.create!(
    sub_category_name: "Hangers",
    category: @bedroom_and_laundry
  )
  SubCategory.create!(
    sub_category_name: "Cot",
    category: @family
  )
  SubCategory.create!(
    sub_category_name: "First aid kit",
    category: @home_safety
  )
  SubCategory.create!(
    sub_category_name: "Wifi",
    category: @internet_and_office
  )
  SubCategory.create!(
    sub_category_name: "Dedicated workspace",
    category: @internet_and_office
  )
  SubCategory.create!(
    sub_category_name: "Kitchen",
    category: @kitchen_and_dining
  )
  SubCategory.create!(
    sub_category_name: "Refrigerator",
    category: @kitchen_and_dining
  )
  SubCategory.create!(
    sub_category_name: "Cooking basics",
    category: @kitchen_and_dining
  )
  SubCategory.create!(
    sub_category_name: "Dishes and silverware",
    category: @kitchen_and_dining
  )
  SubCategory.create!(
    sub_category_name: "Private entrance",
    category: @location_features
  )
  SubCategory.create!(
    sub_category_name: "Private patio or balcony",
    category: @outdoor
  )
  SubCategory.create!(
    sub_category_name: "Garden",
    category: @outdoor
  )
  SubCategory.create!(
    sub_category_name: "Free parking on premises",
    category: @parking_and_facilities
  )
  SubCategory.create!(
    sub_category_name: "Private pool",
    category: @parking_and_facilities
  )
  SubCategory.create!(
    sub_category_name: "Long-term stays allowed",
    category: @services
  )
end
puts "Finished!"



@listing_sub_category_count = ListingSubCategory.count
if @listing_sub_category_count.zero?
  puts "Creating listing_sub_categories..."
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 1),
    sub_category: SubCategory.find_by(sub_category_name: 'Shampoo')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 1),
    sub_category: SubCategory.find_by(sub_category_name: 'Long-term stays allowed')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 1),
    sub_category: SubCategory.find_by(sub_category_name: 'Hot water')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 2),
    sub_category: SubCategory.find_by(sub_category_name: 'Hangers')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 2),
    sub_category: SubCategory.find_by(sub_category_name: 'Cot')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 3),
    sub_category: SubCategory.find_by(sub_category_name: 'First aid kit')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 3),
    sub_category: SubCategory.find_by(sub_category_name: 'Wifi')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 3),
    sub_category: SubCategory.find_by(sub_category_name: 'Dedicated workspace')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 4),
    sub_category: SubCategory.find_by(sub_category_name: 'Kitchen')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 4),
    sub_category: SubCategory.find_by(sub_category_name: 'Refrigerator')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 5),
    sub_category: SubCategory.find_by(sub_category_name: 'Cooking basics')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 5),
    sub_category: SubCategory.find_by(sub_category_name: 'Dishes and silverware')
  )


  ListingSubCategory.create!(
    listing: Listing.find_by(id: 6),
    sub_category: SubCategory.find_by(sub_category_name: 'Private entrance')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 6),
    sub_category: SubCategory.find_by(sub_category_name: 'Private patio or balcony')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 7) ,
    sub_category: SubCategory.find_by(sub_category_name: 'Garden')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 7) ,
    sub_category: SubCategory.find_by(sub_category_name: 'Free parking on premises')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 7) ,
    sub_category: SubCategory.find_by(sub_category_name: 'Private pool')
  )

  ListingSubCategory.create!(
    listing: Listing.find_by(id: 8) ,
    sub_category: SubCategory.find_by(sub_category_name: 'Long-term stays allowed')
  )
  ListingSubCategory.create!(
    listing: Listing.find_by(id: 8) ,
    sub_category: SubCategory.find_by(sub_category_name: 'Hair dryer')
  )

end
puts 'Finished!'
