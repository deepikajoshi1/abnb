class Listing < ApplicationRecord
  has_many :listing_images
  has_many :reviews
  has_many :listing_sub_categories
end
